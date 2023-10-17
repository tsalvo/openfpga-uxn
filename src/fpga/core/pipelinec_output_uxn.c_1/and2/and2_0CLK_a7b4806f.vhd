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
entity and2_0CLK_a7b4806f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end and2_0CLK_a7b4806f;
architecture arch of and2_0CLK_a7b4806f is
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
-- BIN_OP_EQ[uxn_opcodes_h_l983_c6_0c4c]
signal BIN_OP_EQ_uxn_opcodes_h_l983_c6_0c4c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l983_c6_0c4c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l983_c6_0c4c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l983_c1_1381]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l983_c1_1381_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l983_c1_1381_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l983_c1_1381_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l983_c1_1381_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l983_c2_eafc]
signal n16_MUX_uxn_opcodes_h_l983_c2_eafc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l983_c2_eafc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l983_c2_eafc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l983_c2_eafc_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l983_c2_eafc]
signal tmp16_MUX_uxn_opcodes_h_l983_c2_eafc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l983_c2_eafc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l983_c2_eafc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l983_c2_eafc_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l983_c2_eafc]
signal result_u8_value_MUX_uxn_opcodes_h_l983_c2_eafc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l983_c2_eafc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l983_c2_eafc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l983_c2_eafc_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l983_c2_eafc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l983_c2_eafc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l983_c2_eafc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l983_c2_eafc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l983_c2_eafc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l983_c2_eafc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c2_eafc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c2_eafc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c2_eafc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c2_eafc_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l983_c2_eafc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l983_c2_eafc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l983_c2_eafc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l983_c2_eafc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l983_c2_eafc_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l983_c2_eafc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l983_c2_eafc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l983_c2_eafc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l983_c2_eafc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l983_c2_eafc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l983_c2_eafc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c2_eafc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c2_eafc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c2_eafc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c2_eafc_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l983_c2_eafc]
signal t16_MUX_uxn_opcodes_h_l983_c2_eafc_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l983_c2_eafc_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l983_c2_eafc_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l983_c2_eafc_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l984_c3_754b[uxn_opcodes_h_l984_c3_754b]
signal printf_uxn_opcodes_h_l984_c3_754b_uxn_opcodes_h_l984_c3_754b_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l988_c11_c08c]
signal BIN_OP_EQ_uxn_opcodes_h_l988_c11_c08c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l988_c11_c08c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l988_c11_c08c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l988_c7_14bf]
signal n16_MUX_uxn_opcodes_h_l988_c7_14bf_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l988_c7_14bf_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l988_c7_14bf_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l988_c7_14bf_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l988_c7_14bf]
signal tmp16_MUX_uxn_opcodes_h_l988_c7_14bf_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l988_c7_14bf_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l988_c7_14bf_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l988_c7_14bf_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l988_c7_14bf]
signal result_u8_value_MUX_uxn_opcodes_h_l988_c7_14bf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l988_c7_14bf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l988_c7_14bf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l988_c7_14bf_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l988_c7_14bf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_14bf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_14bf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_14bf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_14bf_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l988_c7_14bf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_14bf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_14bf_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_14bf_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_14bf_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l988_c7_14bf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_14bf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_14bf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_14bf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_14bf_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l988_c7_14bf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_14bf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_14bf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_14bf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_14bf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l988_c7_14bf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_14bf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_14bf_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_14bf_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_14bf_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l988_c7_14bf]
signal t16_MUX_uxn_opcodes_h_l988_c7_14bf_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l988_c7_14bf_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l988_c7_14bf_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l988_c7_14bf_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l991_c11_41b7]
signal BIN_OP_EQ_uxn_opcodes_h_l991_c11_41b7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l991_c11_41b7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l991_c11_41b7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l991_c7_7a15]
signal n16_MUX_uxn_opcodes_h_l991_c7_7a15_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l991_c7_7a15_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l991_c7_7a15_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l991_c7_7a15_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l991_c7_7a15]
signal tmp16_MUX_uxn_opcodes_h_l991_c7_7a15_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l991_c7_7a15_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l991_c7_7a15_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l991_c7_7a15_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l991_c7_7a15]
signal result_u8_value_MUX_uxn_opcodes_h_l991_c7_7a15_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l991_c7_7a15_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l991_c7_7a15_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l991_c7_7a15_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l991_c7_7a15]
signal result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_7a15_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_7a15_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_7a15_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_7a15_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l991_c7_7a15]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_7a15_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_7a15_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_7a15_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_7a15_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l991_c7_7a15]
signal result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_7a15_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_7a15_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_7a15_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_7a15_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l991_c7_7a15]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_7a15_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_7a15_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_7a15_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_7a15_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l991_c7_7a15]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_7a15_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_7a15_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_7a15_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_7a15_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l991_c7_7a15]
signal t16_MUX_uxn_opcodes_h_l991_c7_7a15_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l991_c7_7a15_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l991_c7_7a15_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l991_c7_7a15_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l996_c11_ae5c]
signal BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae5c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae5c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae5c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l996_c7_1b1c]
signal n16_MUX_uxn_opcodes_h_l996_c7_1b1c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l996_c7_1b1c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l996_c7_1b1c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l996_c7_1b1c]
signal tmp16_MUX_uxn_opcodes_h_l996_c7_1b1c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l996_c7_1b1c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l996_c7_1b1c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l996_c7_1b1c]
signal result_u8_value_MUX_uxn_opcodes_h_l996_c7_1b1c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l996_c7_1b1c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l996_c7_1b1c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l996_c7_1b1c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_1b1c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_1b1c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_1b1c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l996_c7_1b1c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_1b1c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_1b1c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_1b1c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l996_c7_1b1c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_1b1c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_1b1c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_1b1c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l996_c7_1b1c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_1b1c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_1b1c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_1b1c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l996_c7_1b1c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_1b1c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_1b1c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_1b1c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l996_c7_1b1c]
signal t16_MUX_uxn_opcodes_h_l996_c7_1b1c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l996_c7_1b1c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l996_c7_1b1c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l999_c11_ec19]
signal BIN_OP_EQ_uxn_opcodes_h_l999_c11_ec19_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l999_c11_ec19_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l999_c11_ec19_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l999_c7_4974]
signal n16_MUX_uxn_opcodes_h_l999_c7_4974_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l999_c7_4974_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l999_c7_4974_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l999_c7_4974_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l999_c7_4974]
signal tmp16_MUX_uxn_opcodes_h_l999_c7_4974_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l999_c7_4974_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l999_c7_4974_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l999_c7_4974_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l999_c7_4974]
signal result_u8_value_MUX_uxn_opcodes_h_l999_c7_4974_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l999_c7_4974_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l999_c7_4974_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l999_c7_4974_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l999_c7_4974]
signal result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_4974_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_4974_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_4974_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_4974_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l999_c7_4974]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_4974_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_4974_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_4974_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_4974_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l999_c7_4974]
signal result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_4974_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_4974_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_4974_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_4974_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l999_c7_4974]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_4974_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_4974_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_4974_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_4974_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l999_c7_4974]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_4974_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_4974_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_4974_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_4974_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l999_c7_4974]
signal t16_MUX_uxn_opcodes_h_l999_c7_4974_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l999_c7_4974_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l999_c7_4974_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l999_c7_4974_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1000_c3_93b9]
signal BIN_OP_OR_uxn_opcodes_h_l1000_c3_93b9_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1000_c3_93b9_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1000_c3_93b9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1003_c11_b5c8]
signal BIN_OP_EQ_uxn_opcodes_h_l1003_c11_b5c8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1003_c11_b5c8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1003_c11_b5c8_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1003_c7_173c]
signal n16_MUX_uxn_opcodes_h_l1003_c7_173c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1003_c7_173c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1003_c7_173c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1003_c7_173c_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1003_c7_173c]
signal tmp16_MUX_uxn_opcodes_h_l1003_c7_173c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1003_c7_173c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1003_c7_173c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1003_c7_173c_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1003_c7_173c]
signal result_u8_value_MUX_uxn_opcodes_h_l1003_c7_173c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1003_c7_173c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1003_c7_173c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1003_c7_173c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1003_c7_173c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_173c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_173c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_173c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_173c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1003_c7_173c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_173c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_173c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_173c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_173c_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1003_c7_173c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_173c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_173c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_173c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_173c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1003_c7_173c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_173c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_173c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_173c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_173c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1003_c7_173c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_173c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_173c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_173c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_173c_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1006_c11_3666]
signal BIN_OP_EQ_uxn_opcodes_h_l1006_c11_3666_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1006_c11_3666_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1006_c11_3666_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1006_c7_a652]
signal n16_MUX_uxn_opcodes_h_l1006_c7_a652_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1006_c7_a652_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1006_c7_a652_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1006_c7_a652_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1006_c7_a652]
signal tmp16_MUX_uxn_opcodes_h_l1006_c7_a652_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1006_c7_a652_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1006_c7_a652_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1006_c7_a652_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1006_c7_a652]
signal result_u8_value_MUX_uxn_opcodes_h_l1006_c7_a652_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1006_c7_a652_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1006_c7_a652_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1006_c7_a652_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1006_c7_a652]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_a652_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_a652_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_a652_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_a652_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1006_c7_a652]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_a652_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_a652_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_a652_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_a652_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1006_c7_a652]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_a652_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_a652_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_a652_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_a652_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1006_c7_a652]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_a652_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_a652_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_a652_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_a652_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1006_c7_a652]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_a652_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_a652_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_a652_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_a652_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1011_c11_7495]
signal BIN_OP_EQ_uxn_opcodes_h_l1011_c11_7495_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1011_c11_7495_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1011_c11_7495_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1011_c7_29bd]
signal n16_MUX_uxn_opcodes_h_l1011_c7_29bd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1011_c7_29bd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1011_c7_29bd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1011_c7_29bd]
signal tmp16_MUX_uxn_opcodes_h_l1011_c7_29bd_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1011_c7_29bd_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1011_c7_29bd_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1011_c7_29bd]
signal result_u8_value_MUX_uxn_opcodes_h_l1011_c7_29bd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1011_c7_29bd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1011_c7_29bd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1011_c7_29bd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_29bd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_29bd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_29bd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1011_c7_29bd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_29bd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_29bd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_29bd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1011_c7_29bd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_29bd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_29bd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_29bd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1011_c7_29bd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_29bd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_29bd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_29bd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1011_c7_29bd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_29bd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_29bd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_29bd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1014_c11_60fb]
signal BIN_OP_EQ_uxn_opcodes_h_l1014_c11_60fb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1014_c11_60fb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1014_c11_60fb_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1014_c7_2f95]
signal n16_MUX_uxn_opcodes_h_l1014_c7_2f95_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1014_c7_2f95_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1014_c7_2f95_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1014_c7_2f95]
signal tmp16_MUX_uxn_opcodes_h_l1014_c7_2f95_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1014_c7_2f95_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1014_c7_2f95_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1014_c7_2f95]
signal result_u8_value_MUX_uxn_opcodes_h_l1014_c7_2f95_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1014_c7_2f95_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1014_c7_2f95_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1014_c7_2f95]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_2f95_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_2f95_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_2f95_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1014_c7_2f95]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_2f95_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_2f95_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_2f95_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1014_c7_2f95]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_2f95_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_2f95_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_2f95_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1014_c7_2f95]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_2f95_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_2f95_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_2f95_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1014_c7_2f95]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_2f95_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_2f95_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_2f95_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1015_c3_788d]
signal BIN_OP_OR_uxn_opcodes_h_l1015_c3_788d_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1015_c3_788d_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1015_c3_788d_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1016_c11_2446]
signal BIN_OP_AND_uxn_opcodes_h_l1016_c11_2446_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1016_c11_2446_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1016_c11_2446_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1018_c30_1224]
signal sp_relative_shift_uxn_opcodes_h_l1018_c30_1224_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1018_c30_1224_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1018_c30_1224_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1018_c30_1224_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1023_c11_8243]
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_8243_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_8243_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_8243_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1023_c7_e158]
signal result_u8_value_MUX_uxn_opcodes_h_l1023_c7_e158_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1023_c7_e158_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1023_c7_e158_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1023_c7_e158_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1023_c7_e158]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e158_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e158_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e158_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e158_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1023_c7_e158]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e158_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e158_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e158_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e158_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1023_c7_e158]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_e158_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_e158_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_e158_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_e158_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1023_c7_e158]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e158_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e158_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e158_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e158_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1026_c31_32a8]
signal CONST_SR_8_uxn_opcodes_h_l1026_c31_32a8_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1026_c31_32a8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1028_c11_172e]
signal BIN_OP_EQ_uxn_opcodes_h_l1028_c11_172e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1028_c11_172e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1028_c11_172e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1028_c7_fa5d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_fa5d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_fa5d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_fa5d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_fa5d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1028_c7_fa5d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_fa5d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_fa5d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_fa5d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_fa5d_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l993_l1008_DUPLICATE_a330
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l993_l1008_DUPLICATE_a330_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l993_l1008_DUPLICATE_a330_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l983_c6_0c4c
BIN_OP_EQ_uxn_opcodes_h_l983_c6_0c4c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l983_c6_0c4c_left,
BIN_OP_EQ_uxn_opcodes_h_l983_c6_0c4c_right,
BIN_OP_EQ_uxn_opcodes_h_l983_c6_0c4c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l983_c1_1381
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l983_c1_1381 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l983_c1_1381_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l983_c1_1381_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l983_c1_1381_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l983_c1_1381_return_output);

-- n16_MUX_uxn_opcodes_h_l983_c2_eafc
n16_MUX_uxn_opcodes_h_l983_c2_eafc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l983_c2_eafc_cond,
n16_MUX_uxn_opcodes_h_l983_c2_eafc_iftrue,
n16_MUX_uxn_opcodes_h_l983_c2_eafc_iffalse,
n16_MUX_uxn_opcodes_h_l983_c2_eafc_return_output);

-- tmp16_MUX_uxn_opcodes_h_l983_c2_eafc
tmp16_MUX_uxn_opcodes_h_l983_c2_eafc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l983_c2_eafc_cond,
tmp16_MUX_uxn_opcodes_h_l983_c2_eafc_iftrue,
tmp16_MUX_uxn_opcodes_h_l983_c2_eafc_iffalse,
tmp16_MUX_uxn_opcodes_h_l983_c2_eafc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l983_c2_eafc
result_u8_value_MUX_uxn_opcodes_h_l983_c2_eafc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l983_c2_eafc_cond,
result_u8_value_MUX_uxn_opcodes_h_l983_c2_eafc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l983_c2_eafc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l983_c2_eafc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l983_c2_eafc
result_is_opc_done_MUX_uxn_opcodes_h_l983_c2_eafc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l983_c2_eafc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l983_c2_eafc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l983_c2_eafc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l983_c2_eafc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c2_eafc
result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c2_eafc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c2_eafc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c2_eafc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c2_eafc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c2_eafc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l983_c2_eafc
result_is_stack_write_MUX_uxn_opcodes_h_l983_c2_eafc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l983_c2_eafc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l983_c2_eafc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l983_c2_eafc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l983_c2_eafc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l983_c2_eafc
result_is_sp_shift_MUX_uxn_opcodes_h_l983_c2_eafc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l983_c2_eafc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l983_c2_eafc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l983_c2_eafc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l983_c2_eafc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c2_eafc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c2_eafc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c2_eafc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c2_eafc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c2_eafc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c2_eafc_return_output);

-- t16_MUX_uxn_opcodes_h_l983_c2_eafc
t16_MUX_uxn_opcodes_h_l983_c2_eafc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l983_c2_eafc_cond,
t16_MUX_uxn_opcodes_h_l983_c2_eafc_iftrue,
t16_MUX_uxn_opcodes_h_l983_c2_eafc_iffalse,
t16_MUX_uxn_opcodes_h_l983_c2_eafc_return_output);

-- printf_uxn_opcodes_h_l984_c3_754b_uxn_opcodes_h_l984_c3_754b
printf_uxn_opcodes_h_l984_c3_754b_uxn_opcodes_h_l984_c3_754b : entity work.printf_uxn_opcodes_h_l984_c3_754b_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l984_c3_754b_uxn_opcodes_h_l984_c3_754b_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l988_c11_c08c
BIN_OP_EQ_uxn_opcodes_h_l988_c11_c08c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l988_c11_c08c_left,
BIN_OP_EQ_uxn_opcodes_h_l988_c11_c08c_right,
BIN_OP_EQ_uxn_opcodes_h_l988_c11_c08c_return_output);

-- n16_MUX_uxn_opcodes_h_l988_c7_14bf
n16_MUX_uxn_opcodes_h_l988_c7_14bf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l988_c7_14bf_cond,
n16_MUX_uxn_opcodes_h_l988_c7_14bf_iftrue,
n16_MUX_uxn_opcodes_h_l988_c7_14bf_iffalse,
n16_MUX_uxn_opcodes_h_l988_c7_14bf_return_output);

-- tmp16_MUX_uxn_opcodes_h_l988_c7_14bf
tmp16_MUX_uxn_opcodes_h_l988_c7_14bf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l988_c7_14bf_cond,
tmp16_MUX_uxn_opcodes_h_l988_c7_14bf_iftrue,
tmp16_MUX_uxn_opcodes_h_l988_c7_14bf_iffalse,
tmp16_MUX_uxn_opcodes_h_l988_c7_14bf_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l988_c7_14bf
result_u8_value_MUX_uxn_opcodes_h_l988_c7_14bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l988_c7_14bf_cond,
result_u8_value_MUX_uxn_opcodes_h_l988_c7_14bf_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l988_c7_14bf_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l988_c7_14bf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_14bf
result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_14bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_14bf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_14bf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_14bf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_14bf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_14bf
result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_14bf : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_14bf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_14bf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_14bf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_14bf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_14bf
result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_14bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_14bf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_14bf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_14bf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_14bf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_14bf
result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_14bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_14bf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_14bf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_14bf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_14bf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_14bf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_14bf : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_14bf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_14bf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_14bf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_14bf_return_output);

-- t16_MUX_uxn_opcodes_h_l988_c7_14bf
t16_MUX_uxn_opcodes_h_l988_c7_14bf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l988_c7_14bf_cond,
t16_MUX_uxn_opcodes_h_l988_c7_14bf_iftrue,
t16_MUX_uxn_opcodes_h_l988_c7_14bf_iffalse,
t16_MUX_uxn_opcodes_h_l988_c7_14bf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l991_c11_41b7
BIN_OP_EQ_uxn_opcodes_h_l991_c11_41b7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l991_c11_41b7_left,
BIN_OP_EQ_uxn_opcodes_h_l991_c11_41b7_right,
BIN_OP_EQ_uxn_opcodes_h_l991_c11_41b7_return_output);

-- n16_MUX_uxn_opcodes_h_l991_c7_7a15
n16_MUX_uxn_opcodes_h_l991_c7_7a15 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l991_c7_7a15_cond,
n16_MUX_uxn_opcodes_h_l991_c7_7a15_iftrue,
n16_MUX_uxn_opcodes_h_l991_c7_7a15_iffalse,
n16_MUX_uxn_opcodes_h_l991_c7_7a15_return_output);

-- tmp16_MUX_uxn_opcodes_h_l991_c7_7a15
tmp16_MUX_uxn_opcodes_h_l991_c7_7a15 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l991_c7_7a15_cond,
tmp16_MUX_uxn_opcodes_h_l991_c7_7a15_iftrue,
tmp16_MUX_uxn_opcodes_h_l991_c7_7a15_iffalse,
tmp16_MUX_uxn_opcodes_h_l991_c7_7a15_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l991_c7_7a15
result_u8_value_MUX_uxn_opcodes_h_l991_c7_7a15 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l991_c7_7a15_cond,
result_u8_value_MUX_uxn_opcodes_h_l991_c7_7a15_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l991_c7_7a15_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l991_c7_7a15_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_7a15
result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_7a15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_7a15_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_7a15_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_7a15_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_7a15_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_7a15
result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_7a15 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_7a15_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_7a15_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_7a15_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_7a15_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_7a15
result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_7a15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_7a15_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_7a15_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_7a15_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_7a15_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_7a15
result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_7a15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_7a15_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_7a15_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_7a15_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_7a15_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_7a15
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_7a15 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_7a15_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_7a15_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_7a15_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_7a15_return_output);

-- t16_MUX_uxn_opcodes_h_l991_c7_7a15
t16_MUX_uxn_opcodes_h_l991_c7_7a15 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l991_c7_7a15_cond,
t16_MUX_uxn_opcodes_h_l991_c7_7a15_iftrue,
t16_MUX_uxn_opcodes_h_l991_c7_7a15_iffalse,
t16_MUX_uxn_opcodes_h_l991_c7_7a15_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae5c
BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae5c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae5c_left,
BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae5c_right,
BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae5c_return_output);

-- n16_MUX_uxn_opcodes_h_l996_c7_1b1c
n16_MUX_uxn_opcodes_h_l996_c7_1b1c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l996_c7_1b1c_cond,
n16_MUX_uxn_opcodes_h_l996_c7_1b1c_iftrue,
n16_MUX_uxn_opcodes_h_l996_c7_1b1c_iffalse,
n16_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l996_c7_1b1c
tmp16_MUX_uxn_opcodes_h_l996_c7_1b1c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l996_c7_1b1c_cond,
tmp16_MUX_uxn_opcodes_h_l996_c7_1b1c_iftrue,
tmp16_MUX_uxn_opcodes_h_l996_c7_1b1c_iffalse,
tmp16_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l996_c7_1b1c
result_u8_value_MUX_uxn_opcodes_h_l996_c7_1b1c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l996_c7_1b1c_cond,
result_u8_value_MUX_uxn_opcodes_h_l996_c7_1b1c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l996_c7_1b1c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_1b1c
result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_1b1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_1b1c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_1b1c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_1b1c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_1b1c
result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_1b1c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_1b1c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_1b1c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_1b1c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_1b1c
result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_1b1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_1b1c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_1b1c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_1b1c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_1b1c
result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_1b1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_1b1c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_1b1c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_1b1c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_1b1c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_1b1c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_1b1c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_1b1c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_1b1c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output);

-- t16_MUX_uxn_opcodes_h_l996_c7_1b1c
t16_MUX_uxn_opcodes_h_l996_c7_1b1c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l996_c7_1b1c_cond,
t16_MUX_uxn_opcodes_h_l996_c7_1b1c_iftrue,
t16_MUX_uxn_opcodes_h_l996_c7_1b1c_iffalse,
t16_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l999_c11_ec19
BIN_OP_EQ_uxn_opcodes_h_l999_c11_ec19 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l999_c11_ec19_left,
BIN_OP_EQ_uxn_opcodes_h_l999_c11_ec19_right,
BIN_OP_EQ_uxn_opcodes_h_l999_c11_ec19_return_output);

-- n16_MUX_uxn_opcodes_h_l999_c7_4974
n16_MUX_uxn_opcodes_h_l999_c7_4974 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l999_c7_4974_cond,
n16_MUX_uxn_opcodes_h_l999_c7_4974_iftrue,
n16_MUX_uxn_opcodes_h_l999_c7_4974_iffalse,
n16_MUX_uxn_opcodes_h_l999_c7_4974_return_output);

-- tmp16_MUX_uxn_opcodes_h_l999_c7_4974
tmp16_MUX_uxn_opcodes_h_l999_c7_4974 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l999_c7_4974_cond,
tmp16_MUX_uxn_opcodes_h_l999_c7_4974_iftrue,
tmp16_MUX_uxn_opcodes_h_l999_c7_4974_iffalse,
tmp16_MUX_uxn_opcodes_h_l999_c7_4974_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l999_c7_4974
result_u8_value_MUX_uxn_opcodes_h_l999_c7_4974 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l999_c7_4974_cond,
result_u8_value_MUX_uxn_opcodes_h_l999_c7_4974_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l999_c7_4974_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l999_c7_4974_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_4974
result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_4974 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_4974_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_4974_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_4974_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_4974_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_4974
result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_4974 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_4974_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_4974_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_4974_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_4974_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_4974
result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_4974 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_4974_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_4974_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_4974_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_4974_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_4974
result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_4974 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_4974_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_4974_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_4974_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_4974_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_4974
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_4974 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_4974_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_4974_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_4974_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_4974_return_output);

-- t16_MUX_uxn_opcodes_h_l999_c7_4974
t16_MUX_uxn_opcodes_h_l999_c7_4974 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l999_c7_4974_cond,
t16_MUX_uxn_opcodes_h_l999_c7_4974_iftrue,
t16_MUX_uxn_opcodes_h_l999_c7_4974_iffalse,
t16_MUX_uxn_opcodes_h_l999_c7_4974_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1000_c3_93b9
BIN_OP_OR_uxn_opcodes_h_l1000_c3_93b9 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1000_c3_93b9_left,
BIN_OP_OR_uxn_opcodes_h_l1000_c3_93b9_right,
BIN_OP_OR_uxn_opcodes_h_l1000_c3_93b9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1003_c11_b5c8
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_b5c8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_b5c8_left,
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_b5c8_right,
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_b5c8_return_output);

-- n16_MUX_uxn_opcodes_h_l1003_c7_173c
n16_MUX_uxn_opcodes_h_l1003_c7_173c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1003_c7_173c_cond,
n16_MUX_uxn_opcodes_h_l1003_c7_173c_iftrue,
n16_MUX_uxn_opcodes_h_l1003_c7_173c_iffalse,
n16_MUX_uxn_opcodes_h_l1003_c7_173c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1003_c7_173c
tmp16_MUX_uxn_opcodes_h_l1003_c7_173c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1003_c7_173c_cond,
tmp16_MUX_uxn_opcodes_h_l1003_c7_173c_iftrue,
tmp16_MUX_uxn_opcodes_h_l1003_c7_173c_iffalse,
tmp16_MUX_uxn_opcodes_h_l1003_c7_173c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1003_c7_173c
result_u8_value_MUX_uxn_opcodes_h_l1003_c7_173c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1003_c7_173c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1003_c7_173c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1003_c7_173c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1003_c7_173c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_173c
result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_173c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_173c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_173c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_173c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_173c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_173c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_173c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_173c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_173c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_173c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_173c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_173c
result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_173c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_173c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_173c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_173c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_173c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_173c
result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_173c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_173c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_173c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_173c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_173c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_173c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_173c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_173c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_173c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_173c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_173c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1006_c11_3666
BIN_OP_EQ_uxn_opcodes_h_l1006_c11_3666 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1006_c11_3666_left,
BIN_OP_EQ_uxn_opcodes_h_l1006_c11_3666_right,
BIN_OP_EQ_uxn_opcodes_h_l1006_c11_3666_return_output);

-- n16_MUX_uxn_opcodes_h_l1006_c7_a652
n16_MUX_uxn_opcodes_h_l1006_c7_a652 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1006_c7_a652_cond,
n16_MUX_uxn_opcodes_h_l1006_c7_a652_iftrue,
n16_MUX_uxn_opcodes_h_l1006_c7_a652_iffalse,
n16_MUX_uxn_opcodes_h_l1006_c7_a652_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1006_c7_a652
tmp16_MUX_uxn_opcodes_h_l1006_c7_a652 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1006_c7_a652_cond,
tmp16_MUX_uxn_opcodes_h_l1006_c7_a652_iftrue,
tmp16_MUX_uxn_opcodes_h_l1006_c7_a652_iffalse,
tmp16_MUX_uxn_opcodes_h_l1006_c7_a652_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1006_c7_a652
result_u8_value_MUX_uxn_opcodes_h_l1006_c7_a652 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1006_c7_a652_cond,
result_u8_value_MUX_uxn_opcodes_h_l1006_c7_a652_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1006_c7_a652_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1006_c7_a652_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_a652
result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_a652 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_a652_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_a652_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_a652_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_a652_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_a652
result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_a652 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_a652_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_a652_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_a652_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_a652_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_a652
result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_a652 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_a652_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_a652_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_a652_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_a652_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_a652
result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_a652 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_a652_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_a652_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_a652_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_a652_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_a652
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_a652 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_a652_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_a652_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_a652_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_a652_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1011_c11_7495
BIN_OP_EQ_uxn_opcodes_h_l1011_c11_7495 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1011_c11_7495_left,
BIN_OP_EQ_uxn_opcodes_h_l1011_c11_7495_right,
BIN_OP_EQ_uxn_opcodes_h_l1011_c11_7495_return_output);

-- n16_MUX_uxn_opcodes_h_l1011_c7_29bd
n16_MUX_uxn_opcodes_h_l1011_c7_29bd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1011_c7_29bd_cond,
n16_MUX_uxn_opcodes_h_l1011_c7_29bd_iftrue,
n16_MUX_uxn_opcodes_h_l1011_c7_29bd_iffalse,
n16_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1011_c7_29bd
tmp16_MUX_uxn_opcodes_h_l1011_c7_29bd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1011_c7_29bd_cond,
tmp16_MUX_uxn_opcodes_h_l1011_c7_29bd_iftrue,
tmp16_MUX_uxn_opcodes_h_l1011_c7_29bd_iffalse,
tmp16_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1011_c7_29bd
result_u8_value_MUX_uxn_opcodes_h_l1011_c7_29bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1011_c7_29bd_cond,
result_u8_value_MUX_uxn_opcodes_h_l1011_c7_29bd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1011_c7_29bd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_29bd
result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_29bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_29bd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_29bd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_29bd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_29bd
result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_29bd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_29bd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_29bd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_29bd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_29bd
result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_29bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_29bd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_29bd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_29bd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_29bd
result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_29bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_29bd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_29bd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_29bd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_29bd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_29bd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_29bd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_29bd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_29bd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1014_c11_60fb
BIN_OP_EQ_uxn_opcodes_h_l1014_c11_60fb : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1014_c11_60fb_left,
BIN_OP_EQ_uxn_opcodes_h_l1014_c11_60fb_right,
BIN_OP_EQ_uxn_opcodes_h_l1014_c11_60fb_return_output);

-- n16_MUX_uxn_opcodes_h_l1014_c7_2f95
n16_MUX_uxn_opcodes_h_l1014_c7_2f95 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1014_c7_2f95_cond,
n16_MUX_uxn_opcodes_h_l1014_c7_2f95_iftrue,
n16_MUX_uxn_opcodes_h_l1014_c7_2f95_iffalse,
n16_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1014_c7_2f95
tmp16_MUX_uxn_opcodes_h_l1014_c7_2f95 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1014_c7_2f95_cond,
tmp16_MUX_uxn_opcodes_h_l1014_c7_2f95_iftrue,
tmp16_MUX_uxn_opcodes_h_l1014_c7_2f95_iffalse,
tmp16_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1014_c7_2f95
result_u8_value_MUX_uxn_opcodes_h_l1014_c7_2f95 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1014_c7_2f95_cond,
result_u8_value_MUX_uxn_opcodes_h_l1014_c7_2f95_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1014_c7_2f95_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_2f95
result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_2f95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_2f95_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_2f95_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_2f95_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_2f95
result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_2f95 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_2f95_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_2f95_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_2f95_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_2f95
result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_2f95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_2f95_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_2f95_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_2f95_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_2f95
result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_2f95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_2f95_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_2f95_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_2f95_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_2f95
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_2f95 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_2f95_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_2f95_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_2f95_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1015_c3_788d
BIN_OP_OR_uxn_opcodes_h_l1015_c3_788d : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1015_c3_788d_left,
BIN_OP_OR_uxn_opcodes_h_l1015_c3_788d_right,
BIN_OP_OR_uxn_opcodes_h_l1015_c3_788d_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1016_c11_2446
BIN_OP_AND_uxn_opcodes_h_l1016_c11_2446 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1016_c11_2446_left,
BIN_OP_AND_uxn_opcodes_h_l1016_c11_2446_right,
BIN_OP_AND_uxn_opcodes_h_l1016_c11_2446_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1018_c30_1224
sp_relative_shift_uxn_opcodes_h_l1018_c30_1224 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1018_c30_1224_ins,
sp_relative_shift_uxn_opcodes_h_l1018_c30_1224_x,
sp_relative_shift_uxn_opcodes_h_l1018_c30_1224_y,
sp_relative_shift_uxn_opcodes_h_l1018_c30_1224_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1023_c11_8243
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_8243 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_8243_left,
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_8243_right,
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_8243_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1023_c7_e158
result_u8_value_MUX_uxn_opcodes_h_l1023_c7_e158 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1023_c7_e158_cond,
result_u8_value_MUX_uxn_opcodes_h_l1023_c7_e158_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1023_c7_e158_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1023_c7_e158_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e158
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e158 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e158_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e158_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e158_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e158_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e158
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e158 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e158_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e158_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e158_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e158_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_e158
result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_e158 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_e158_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_e158_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_e158_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_e158_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e158
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e158 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e158_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e158_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e158_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e158_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1026_c31_32a8
CONST_SR_8_uxn_opcodes_h_l1026_c31_32a8 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1026_c31_32a8_x,
CONST_SR_8_uxn_opcodes_h_l1026_c31_32a8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1028_c11_172e
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_172e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_172e_left,
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_172e_right,
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_172e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_fa5d
result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_fa5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_fa5d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_fa5d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_fa5d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_fa5d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_fa5d
result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_fa5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_fa5d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_fa5d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_fa5d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_fa5d_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l993_l1008_DUPLICATE_a330
CONST_SL_8_uint16_t_uxn_opcodes_h_l993_l1008_DUPLICATE_a330 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l993_l1008_DUPLICATE_a330_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l993_l1008_DUPLICATE_a330_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l983_c6_0c4c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l983_c1_1381_return_output,
 n16_MUX_uxn_opcodes_h_l983_c2_eafc_return_output,
 tmp16_MUX_uxn_opcodes_h_l983_c2_eafc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l983_c2_eafc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l983_c2_eafc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c2_eafc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l983_c2_eafc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l983_c2_eafc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c2_eafc_return_output,
 t16_MUX_uxn_opcodes_h_l983_c2_eafc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l988_c11_c08c_return_output,
 n16_MUX_uxn_opcodes_h_l988_c7_14bf_return_output,
 tmp16_MUX_uxn_opcodes_h_l988_c7_14bf_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l988_c7_14bf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_14bf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_14bf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_14bf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_14bf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_14bf_return_output,
 t16_MUX_uxn_opcodes_h_l988_c7_14bf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l991_c11_41b7_return_output,
 n16_MUX_uxn_opcodes_h_l991_c7_7a15_return_output,
 tmp16_MUX_uxn_opcodes_h_l991_c7_7a15_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l991_c7_7a15_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_7a15_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_7a15_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_7a15_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_7a15_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_7a15_return_output,
 t16_MUX_uxn_opcodes_h_l991_c7_7a15_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae5c_return_output,
 n16_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output,
 tmp16_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output,
 t16_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l999_c11_ec19_return_output,
 n16_MUX_uxn_opcodes_h_l999_c7_4974_return_output,
 tmp16_MUX_uxn_opcodes_h_l999_c7_4974_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l999_c7_4974_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_4974_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_4974_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_4974_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_4974_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_4974_return_output,
 t16_MUX_uxn_opcodes_h_l999_c7_4974_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1000_c3_93b9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1003_c11_b5c8_return_output,
 n16_MUX_uxn_opcodes_h_l1003_c7_173c_return_output,
 tmp16_MUX_uxn_opcodes_h_l1003_c7_173c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1003_c7_173c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_173c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_173c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_173c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_173c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_173c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1006_c11_3666_return_output,
 n16_MUX_uxn_opcodes_h_l1006_c7_a652_return_output,
 tmp16_MUX_uxn_opcodes_h_l1006_c7_a652_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1006_c7_a652_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_a652_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_a652_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_a652_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_a652_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_a652_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1011_c11_7495_return_output,
 n16_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output,
 tmp16_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1014_c11_60fb_return_output,
 n16_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output,
 tmp16_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1015_c3_788d_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1016_c11_2446_return_output,
 sp_relative_shift_uxn_opcodes_h_l1018_c30_1224_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1023_c11_8243_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1023_c7_e158_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e158_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e158_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_e158_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e158_return_output,
 CONST_SR_8_uxn_opcodes_h_l1026_c31_32a8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1028_c11_172e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_fa5d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_fa5d_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l993_l1008_DUPLICATE_a330_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c6_0c4c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c6_0c4c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c6_0c4c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l983_c1_1381_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l983_c1_1381_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l983_c1_1381_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l983_c1_1381_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l983_c2_eafc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l983_c2_eafc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l988_c7_14bf_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l983_c2_eafc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l983_c2_eafc_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l983_c2_eafc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l983_c2_eafc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l988_c7_14bf_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l983_c2_eafc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l983_c2_eafc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l983_c2_eafc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l983_c2_eafc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c7_14bf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l983_c2_eafc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l983_c2_eafc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c2_eafc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c2_eafc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_14bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c2_eafc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c2_eafc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c2_eafc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c2_eafc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_14bf_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c2_eafc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c2_eafc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c2_eafc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c2_eafc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_14bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c2_eafc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c2_eafc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l983_c2_eafc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l983_c2_eafc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_14bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l983_c2_eafc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l983_c2_eafc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c2_eafc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l985_c3_8cd4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c2_eafc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_14bf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c2_eafc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c2_eafc_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l983_c2_eafc_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l983_c2_eafc_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l988_c7_14bf_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l983_c2_eafc_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l983_c2_eafc_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l984_c3_754b_uxn_opcodes_h_l984_c3_754b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_c08c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_c08c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_c08c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l988_c7_14bf_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l988_c7_14bf_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l991_c7_7a15_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l988_c7_14bf_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l988_c7_14bf_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l988_c7_14bf_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_7a15_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l988_c7_14bf_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c7_14bf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c7_14bf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_7a15_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c7_14bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_14bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_14bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_7a15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_14bf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_14bf_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_14bf_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_7a15_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_14bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_14bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_14bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_7a15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_14bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_14bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_14bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_7a15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_14bf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_14bf_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l989_c3_04db : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_14bf_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_7a15_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_14bf_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l988_c7_14bf_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l988_c7_14bf_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l991_c7_7a15_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l988_c7_14bf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_41b7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_41b7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_41b7_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l991_c7_7a15_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l991_c7_7a15_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l991_c7_7a15_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_7a15_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_7a15_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_7a15_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_7a15_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_7a15_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_7a15_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_7a15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_7a15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_7a15_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_7a15_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_7a15_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_7a15_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_7a15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_7a15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_7a15_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_7a15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_7a15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_7a15_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_7a15_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l994_c3_6f12 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_7a15_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_7a15_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l991_c7_7a15_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l991_c7_7a15_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l991_c7_7a15_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae5c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae5c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae5c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l996_c7_1b1c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l996_c7_1b1c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l999_c7_4974_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l996_c7_1b1c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_1b1c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_1b1c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l999_c7_4974_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_1b1c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_1b1c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_1b1c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_4974_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_1b1c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_1b1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_1b1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_4974_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_1b1c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_1b1c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_1b1c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_4974_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_1b1c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_1b1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_1b1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_4974_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_1b1c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_1b1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_1b1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_4974_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_1b1c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_1b1c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l997_c3_b00a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_1b1c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_4974_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_1b1c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l996_c7_1b1c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l996_c7_1b1c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l999_c7_4974_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l996_c7_1b1c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_ec19_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_ec19_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_ec19_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l999_c7_4974_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l999_c7_4974_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1003_c7_173c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l999_c7_4974_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l999_c7_4974_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l999_c7_4974_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1003_c7_173c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l999_c7_4974_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_4974_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_4974_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1003_c7_173c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_4974_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_4974_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_4974_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_173c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_4974_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_4974_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_4974_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_173c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_4974_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_4974_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_4974_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_173c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_4974_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_4974_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_4974_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_173c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_4974_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_4974_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1001_c3_4013 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_4974_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_173c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_4974_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l999_c7_4974_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l999_c7_4974_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l999_c7_4974_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1000_c3_93b9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1000_c3_93b9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1000_c3_93b9_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_b5c8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_b5c8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_b5c8_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1003_c7_173c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1003_c7_173c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1006_c7_a652_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1003_c7_173c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1003_c7_173c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1003_c7_173c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1006_c7_a652_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1003_c7_173c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1003_c7_173c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1003_c7_173c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1006_c7_a652_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1003_c7_173c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_173c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_173c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_a652_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_173c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_173c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_173c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_a652_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_173c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_173c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_173c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_a652_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_173c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_173c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_173c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_a652_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_173c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_173c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1004_c3_f2b5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_173c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_a652_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_173c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_3666_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_3666_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_3666_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1006_c7_a652_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1006_c7_a652_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1006_c7_a652_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1006_c7_a652_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1006_c7_a652_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1006_c7_a652_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1006_c7_a652_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1006_c7_a652_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1006_c7_a652_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_a652_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_a652_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_a652_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_a652_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_a652_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_a652_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_a652_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_a652_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_a652_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_a652_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_a652_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_a652_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_a652_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1009_c3_918d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_a652_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_a652_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_7495_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_7495_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_7495_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1011_c7_29bd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1011_c7_29bd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1011_c7_29bd_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1011_c7_29bd_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1011_c7_29bd_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1011_c7_29bd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1011_c7_29bd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1011_c7_29bd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1011_c7_29bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_29bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_29bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_29bd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_29bd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_29bd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_29bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_29bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_29bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_29bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_29bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_29bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_29bd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_29bd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1012_c3_5118 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_29bd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_29bd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_60fb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_60fb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_60fb_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1014_c7_2f95_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1014_c7_2f95_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1014_c7_2f95_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1014_c7_2f95_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1014_c7_2f95_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1014_c7_2f95_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1014_c7_2f95_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1014_c7_2f95_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1023_c7_e158_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1014_c7_2f95_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_2f95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_2f95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e158_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_2f95_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_2f95_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_2f95_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_2f95_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_2f95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_2f95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e158_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_2f95_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_2f95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_2f95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_e158_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_2f95_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_2f95_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1020_c3_575c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_2f95_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e158_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_2f95_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1015_c3_788d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1015_c3_788d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1015_c3_788d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1016_c11_2446_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1016_c11_2446_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1016_c11_2446_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1018_c30_1224_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1018_c30_1224_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1018_c30_1224_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1018_c30_1224_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1021_c21_845b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_8243_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_8243_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_8243_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1023_c7_e158_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1023_c7_e158_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1023_c7_e158_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e158_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e158_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_fa5d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e158_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e158_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e158_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_fa5d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e158_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_e158_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_e158_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_e158_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e158_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1025_c3_c992 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e158_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1023_c7_e158_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e158_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1026_c31_32a8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1026_c31_32a8_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1026_c21_10c7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_172e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_172e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_172e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_fa5d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_fa5d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_fa5d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_fa5d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_fa5d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_fa5d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l988_l1011_l983_l1006_l1003_l999_l996_l1023_l991_DUPLICATE_f949_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1014_l988_l1011_l983_l1006_l1003_l999_l996_l991_DUPLICATE_ad04_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l988_l1011_l983_l1006_l1003_l999_l1028_l996_l1023_l991_DUPLICATE_2363_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l988_l1011_l983_l1006_l1003_l999_l996_l1023_l991_DUPLICATE_1fd9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1014_l988_l1011_l1006_l1003_l999_l1028_l996_l1023_l991_DUPLICATE_1795_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1000_l1015_l992_l1007_DUPLICATE_d6c6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l993_l1008_DUPLICATE_a330_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l993_l1008_DUPLICATE_a330_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l1033_l979_DUPLICATE_cf14_return_output : opcode_result_t;
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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l983_c1_1381_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_172e_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1001_c3_4013 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_4974_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1001_c3_4013;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae5c_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_c08c_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_8243_right := to_unsigned(9, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_2f95_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l989_c3_04db := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_14bf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l989_c3_04db;
     VAR_sp_relative_shift_uxn_opcodes_h_l1018_c30_1224_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_fa5d_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c2_eafc_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_e158_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l985_c3_8cd4 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c2_eafc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l985_c3_8cd4;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1009_c3_918d := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_a652_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1009_c3_918d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l997_c3_b00a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_1b1c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l997_c3_b00a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_7495_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c6_0c4c_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_2f95_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_fa5d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_60fb_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_ec19_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l994_c3_6f12 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_7a15_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l994_c3_6f12;
     VAR_sp_relative_shift_uxn_opcodes_h_l1018_c30_1224_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_41b7_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_b5c8_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1025_c3_c992 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e158_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1025_c3_c992;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1020_c3_575c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_2f95_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1020_c3_575c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_3666_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1004_c3_f2b5 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_173c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1004_c3_f2b5;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1012_c3_5118 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_29bd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1012_c3_5118;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l983_c1_1381_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1018_c30_1224_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1015_c3_788d_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1003_c7_173c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1011_c7_29bd_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1014_c7_2f95_iffalse := n16;
     VAR_n16_MUX_uxn_opcodes_h_l983_c2_eafc_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l988_c7_14bf_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l991_c7_7a15_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l996_c7_1b1c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l999_c7_4974_iftrue := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_b5c8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_3666_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_7495_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_60fb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_8243_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_172e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c6_0c4c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_c08c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_41b7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae5c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_ec19_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1016_c11_2446_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1000_c3_93b9_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l983_c2_eafc_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l988_c7_14bf_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l996_c7_1b1c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l999_c7_4974_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1026_c31_32a8_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1003_c7_173c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1006_c7_a652_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1011_c7_29bd_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1014_c7_2f95_iffalse := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l983_c2_eafc_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l988_c7_14bf_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_7a15_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_1b1c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l999_c7_4974_iftrue := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l999_c11_ec19] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l999_c11_ec19_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_ec19_left;
     BIN_OP_EQ_uxn_opcodes_h_l999_c11_ec19_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_ec19_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_ec19_return_output := BIN_OP_EQ_uxn_opcodes_h_l999_c11_ec19_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1006_c11_3666] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1006_c11_3666_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_3666_left;
     BIN_OP_EQ_uxn_opcodes_h_l1006_c11_3666_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_3666_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_3666_return_output := BIN_OP_EQ_uxn_opcodes_h_l1006_c11_3666_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1014_l988_l1011_l983_l1006_l1003_l999_l996_l991_DUPLICATE_ad04 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1014_l988_l1011_l983_l1006_l1003_l999_l996_l991_DUPLICATE_ad04_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1023_c11_8243] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1023_c11_8243_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_8243_left;
     BIN_OP_EQ_uxn_opcodes_h_l1023_c11_8243_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_8243_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_8243_return_output := BIN_OP_EQ_uxn_opcodes_h_l1023_c11_8243_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l983_c6_0c4c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l983_c6_0c4c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c6_0c4c_left;
     BIN_OP_EQ_uxn_opcodes_h_l983_c6_0c4c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c6_0c4c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c6_0c4c_return_output := BIN_OP_EQ_uxn_opcodes_h_l983_c6_0c4c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l996_c11_ae5c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae5c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae5c_left;
     BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae5c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae5c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae5c_return_output := BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae5c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1003_c11_b5c8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1003_c11_b5c8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_b5c8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1003_c11_b5c8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_b5c8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_b5c8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1003_c11_b5c8_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1000_l1015_l992_l1007_DUPLICATE_d6c6 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1000_l1015_l992_l1007_DUPLICATE_d6c6_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l988_l1011_l983_l1006_l1003_l999_l996_l1023_l991_DUPLICATE_1fd9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l988_l1011_l983_l1006_l1003_l999_l996_l1023_l991_DUPLICATE_1fd9_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1014_c11_60fb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1014_c11_60fb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_60fb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1014_c11_60fb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_60fb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_60fb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1014_c11_60fb_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l988_l1011_l983_l1006_l1003_l999_l996_l1023_l991_DUPLICATE_f949 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l988_l1011_l983_l1006_l1003_l999_l996_l1023_l991_DUPLICATE_f949_return_output := result.u8_value;

     -- sp_relative_shift[uxn_opcodes_h_l1018_c30_1224] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1018_c30_1224_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1018_c30_1224_ins;
     sp_relative_shift_uxn_opcodes_h_l1018_c30_1224_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1018_c30_1224_x;
     sp_relative_shift_uxn_opcodes_h_l1018_c30_1224_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1018_c30_1224_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1018_c30_1224_return_output := sp_relative_shift_uxn_opcodes_h_l1018_c30_1224_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l991_c11_41b7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l991_c11_41b7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_41b7_left;
     BIN_OP_EQ_uxn_opcodes_h_l991_c11_41b7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_41b7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_41b7_return_output := BIN_OP_EQ_uxn_opcodes_h_l991_c11_41b7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1011_c11_7495] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1011_c11_7495_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_7495_left;
     BIN_OP_EQ_uxn_opcodes_h_l1011_c11_7495_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_7495_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_7495_return_output := BIN_OP_EQ_uxn_opcodes_h_l1011_c11_7495_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l988_c11_c08c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l988_c11_c08c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_c08c_left;
     BIN_OP_EQ_uxn_opcodes_h_l988_c11_c08c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_c08c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_c08c_return_output := BIN_OP_EQ_uxn_opcodes_h_l988_c11_c08c_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1026_c31_32a8] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1026_c31_32a8_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1026_c31_32a8_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1026_c31_32a8_return_output := CONST_SR_8_uxn_opcodes_h_l1026_c31_32a8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l988_l1011_l983_l1006_l1003_l999_l1028_l996_l1023_l991_DUPLICATE_2363 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l988_l1011_l983_l1006_l1003_l999_l1028_l996_l1023_l991_DUPLICATE_2363_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1028_c11_172e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1028_c11_172e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_172e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1028_c11_172e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_172e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_172e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1028_c11_172e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1014_l988_l1011_l1006_l1003_l999_l1028_l996_l1023_l991_DUPLICATE_1795 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1014_l988_l1011_l1006_l1003_l999_l1028_l996_l1023_l991_DUPLICATE_1795_return_output := result.is_opc_done;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1023_c7_e158] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1023_c7_e158_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1003_c7_173c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_b5c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_173c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_b5c8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_173c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_b5c8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_173c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_b5c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_173c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_b5c8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_173c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_b5c8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1003_c7_173c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_b5c8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1003_c7_173c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_b5c8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1006_c7_a652_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_3666_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_a652_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_3666_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_a652_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_3666_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_a652_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_3666_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_a652_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_3666_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_a652_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_3666_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1006_c7_a652_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_3666_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1006_c7_a652_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_3666_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1011_c7_29bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_7495_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_29bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_7495_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_29bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_7495_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_29bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_7495_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_29bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_7495_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_29bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_7495_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1011_c7_29bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_7495_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1011_c7_29bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1011_c11_7495_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1014_c7_2f95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_60fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_2f95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_60fb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_2f95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_60fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_2f95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_60fb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_2f95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_60fb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_2f95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_60fb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1014_c7_2f95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_60fb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1014_c7_2f95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_60fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e158_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_8243_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_e158_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_8243_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e158_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_8243_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e158_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_8243_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1023_c7_e158_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_8243_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_fa5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_172e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_fa5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_172e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l983_c1_1381_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c6_0c4c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l983_c2_eafc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c6_0c4c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c2_eafc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c6_0c4c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l983_c2_eafc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c6_0c4c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c2_eafc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c6_0c4c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c2_eafc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c6_0c4c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c2_eafc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c6_0c4c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l983_c2_eafc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c6_0c4c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l983_c2_eafc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c6_0c4c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l983_c2_eafc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l983_c6_0c4c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l988_c7_14bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_c08c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_14bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_c08c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_14bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_c08c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_14bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_c08c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_14bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_c08c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_14bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_c08c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c7_14bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_c08c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l988_c7_14bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_c08c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l988_c7_14bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_c08c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l991_c7_7a15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_41b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_7a15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_41b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_7a15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_41b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_7a15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_41b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_7a15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_41b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_7a15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_41b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_7a15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_41b7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l991_c7_7a15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_41b7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_7a15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_41b7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l996_c7_1b1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae5c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_1b1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae5c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_1b1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae5c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_1b1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae5c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_1b1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae5c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_1b1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae5c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_1b1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae5c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l996_c7_1b1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae5c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_1b1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_ae5c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l999_c7_4974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_ec19_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_4974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_ec19_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_4974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_ec19_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_4974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_ec19_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_4974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_ec19_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_4974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_ec19_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_4974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_ec19_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l999_c7_4974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_ec19_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l999_c7_4974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_ec19_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1000_c3_93b9_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1000_l1015_l992_l1007_DUPLICATE_d6c6_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1015_c3_788d_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1000_l1015_l992_l1007_DUPLICATE_d6c6_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l993_l1008_DUPLICATE_a330_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1000_l1015_l992_l1007_DUPLICATE_d6c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_173c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1014_l988_l1011_l983_l1006_l1003_l999_l996_l991_DUPLICATE_ad04_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_a652_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1014_l988_l1011_l983_l1006_l1003_l999_l996_l991_DUPLICATE_ad04_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_29bd_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1014_l988_l1011_l983_l1006_l1003_l999_l996_l991_DUPLICATE_ad04_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_2f95_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1014_l988_l1011_l983_l1006_l1003_l999_l996_l991_DUPLICATE_ad04_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c2_eafc_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1014_l988_l1011_l983_l1006_l1003_l999_l996_l991_DUPLICATE_ad04_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_14bf_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1014_l988_l1011_l983_l1006_l1003_l999_l996_l991_DUPLICATE_ad04_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_7a15_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1014_l988_l1011_l983_l1006_l1003_l999_l996_l991_DUPLICATE_ad04_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_1b1c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1014_l988_l1011_l983_l1006_l1003_l999_l996_l991_DUPLICATE_ad04_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_4974_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1014_l988_l1011_l983_l1006_l1003_l999_l996_l991_DUPLICATE_ad04_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_173c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1014_l988_l1011_l1006_l1003_l999_l1028_l996_l1023_l991_DUPLICATE_1795_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_a652_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1014_l988_l1011_l1006_l1003_l999_l1028_l996_l1023_l991_DUPLICATE_1795_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_29bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1014_l988_l1011_l1006_l1003_l999_l1028_l996_l1023_l991_DUPLICATE_1795_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_2f95_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1014_l988_l1011_l1006_l1003_l999_l1028_l996_l1023_l991_DUPLICATE_1795_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e158_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1014_l988_l1011_l1006_l1003_l999_l1028_l996_l1023_l991_DUPLICATE_1795_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_fa5d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1014_l988_l1011_l1006_l1003_l999_l1028_l996_l1023_l991_DUPLICATE_1795_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_14bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1014_l988_l1011_l1006_l1003_l999_l1028_l996_l1023_l991_DUPLICATE_1795_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_7a15_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1014_l988_l1011_l1006_l1003_l999_l1028_l996_l1023_l991_DUPLICATE_1795_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_1b1c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1014_l988_l1011_l1006_l1003_l999_l1028_l996_l1023_l991_DUPLICATE_1795_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_4974_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1014_l988_l1011_l1006_l1003_l999_l1028_l996_l1023_l991_DUPLICATE_1795_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_173c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l988_l1011_l983_l1006_l1003_l999_l996_l1023_l991_DUPLICATE_1fd9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_a652_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l988_l1011_l983_l1006_l1003_l999_l996_l1023_l991_DUPLICATE_1fd9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_29bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l988_l1011_l983_l1006_l1003_l999_l996_l1023_l991_DUPLICATE_1fd9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_e158_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l988_l1011_l983_l1006_l1003_l999_l996_l1023_l991_DUPLICATE_1fd9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l983_c2_eafc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l988_l1011_l983_l1006_l1003_l999_l996_l1023_l991_DUPLICATE_1fd9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_14bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l988_l1011_l983_l1006_l1003_l999_l996_l1023_l991_DUPLICATE_1fd9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_7a15_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l988_l1011_l983_l1006_l1003_l999_l996_l1023_l991_DUPLICATE_1fd9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_1b1c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l988_l1011_l983_l1006_l1003_l999_l996_l1023_l991_DUPLICATE_1fd9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_4974_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l988_l1011_l983_l1006_l1003_l999_l996_l1023_l991_DUPLICATE_1fd9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_173c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l988_l1011_l983_l1006_l1003_l999_l1028_l996_l1023_l991_DUPLICATE_2363_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_a652_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l988_l1011_l983_l1006_l1003_l999_l1028_l996_l1023_l991_DUPLICATE_2363_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_29bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l988_l1011_l983_l1006_l1003_l999_l1028_l996_l1023_l991_DUPLICATE_2363_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e158_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l988_l1011_l983_l1006_l1003_l999_l1028_l996_l1023_l991_DUPLICATE_2363_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_fa5d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l988_l1011_l983_l1006_l1003_l999_l1028_l996_l1023_l991_DUPLICATE_2363_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c2_eafc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l988_l1011_l983_l1006_l1003_l999_l1028_l996_l1023_l991_DUPLICATE_2363_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_14bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l988_l1011_l983_l1006_l1003_l999_l1028_l996_l1023_l991_DUPLICATE_2363_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_7a15_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l988_l1011_l983_l1006_l1003_l999_l1028_l996_l1023_l991_DUPLICATE_2363_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_1b1c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l988_l1011_l983_l1006_l1003_l999_l1028_l996_l1023_l991_DUPLICATE_2363_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_4974_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l988_l1011_l983_l1006_l1003_l999_l1028_l996_l1023_l991_DUPLICATE_2363_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1003_c7_173c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l988_l1011_l983_l1006_l1003_l999_l996_l1023_l991_DUPLICATE_f949_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1006_c7_a652_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l988_l1011_l983_l1006_l1003_l999_l996_l1023_l991_DUPLICATE_f949_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1011_c7_29bd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l988_l1011_l983_l1006_l1003_l999_l996_l1023_l991_DUPLICATE_f949_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1023_c7_e158_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l988_l1011_l983_l1006_l1003_l999_l996_l1023_l991_DUPLICATE_f949_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l983_c2_eafc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l988_l1011_l983_l1006_l1003_l999_l996_l1023_l991_DUPLICATE_f949_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c7_14bf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l988_l1011_l983_l1006_l1003_l999_l996_l1023_l991_DUPLICATE_f949_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_7a15_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l988_l1011_l983_l1006_l1003_l999_l996_l1023_l991_DUPLICATE_f949_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_1b1c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l988_l1011_l983_l1006_l1003_l999_l996_l1023_l991_DUPLICATE_f949_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_4974_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l988_l1011_l983_l1006_l1003_l999_l996_l1023_l991_DUPLICATE_f949_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e158_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1023_c7_e158_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_2f95_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1018_c30_1224_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1015_c3_788d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1015_c3_788d_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1015_c3_788d_left;
     BIN_OP_OR_uxn_opcodes_h_l1015_c3_788d_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1015_c3_788d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1015_c3_788d_return_output := BIN_OP_OR_uxn_opcodes_h_l1015_c3_788d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1023_c7_e158] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_e158_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_e158_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_e158_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_e158_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_e158_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_e158_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_e158_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_e158_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l983_c1_1381] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l983_c1_1381_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l983_c1_1381_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l983_c1_1381_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l983_c1_1381_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l983_c1_1381_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l983_c1_1381_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l983_c1_1381_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l983_c1_1381_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1000_c3_93b9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1000_c3_93b9_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1000_c3_93b9_left;
     BIN_OP_OR_uxn_opcodes_h_l1000_c3_93b9_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1000_c3_93b9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1000_c3_93b9_return_output := BIN_OP_OR_uxn_opcodes_h_l1000_c3_93b9_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l993_l1008_DUPLICATE_a330 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l993_l1008_DUPLICATE_a330_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l993_l1008_DUPLICATE_a330_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l993_l1008_DUPLICATE_a330_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l993_l1008_DUPLICATE_a330_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1023_c7_e158] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e158_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e158_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e158_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e158_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e158_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e158_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e158_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e158_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1014_c7_2f95] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_2f95_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_2f95_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_2f95_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_2f95_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_2f95_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_2f95_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1028_c7_fa5d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_fa5d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_fa5d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_fa5d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_fa5d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_fa5d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_fa5d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_fa5d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_fa5d_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1026_c21_10c7] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1026_c21_10c7_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1026_c31_32a8_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1028_c7_fa5d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_fa5d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_fa5d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_fa5d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_fa5d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_fa5d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_fa5d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_fa5d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_fa5d_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l999_c7_4974_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1000_c3_93b9_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1016_c11_2446_right := VAR_BIN_OP_OR_uxn_opcodes_h_l1015_c3_788d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1014_c7_2f95_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1015_c3_788d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1023_c7_e158_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1026_c21_10c7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1006_c7_a652_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l993_l1008_DUPLICATE_a330_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l991_c7_7a15_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l993_l1008_DUPLICATE_a330_return_output;
     VAR_printf_uxn_opcodes_h_l984_c3_754b_uxn_opcodes_h_l984_c3_754b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l983_c1_1381_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e158_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_fa5d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_2f95_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_e158_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e158_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_fa5d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_29bd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_2f95_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_e158_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1014_c7_2f95] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_2f95_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_2f95_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_2f95_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_2f95_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_2f95_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_2f95_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output;

     -- n16_MUX[uxn_opcodes_h_l1014_c7_2f95] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1014_c7_2f95_cond <= VAR_n16_MUX_uxn_opcodes_h_l1014_c7_2f95_cond;
     n16_MUX_uxn_opcodes_h_l1014_c7_2f95_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1014_c7_2f95_iftrue;
     n16_MUX_uxn_opcodes_h_l1014_c7_2f95_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1014_c7_2f95_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output := n16_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output;

     -- printf_uxn_opcodes_h_l984_c3_754b[uxn_opcodes_h_l984_c3_754b] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l984_c3_754b_uxn_opcodes_h_l984_c3_754b_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l984_c3_754b_uxn_opcodes_h_l984_c3_754b_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1023_c7_e158] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e158_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e158_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e158_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e158_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e158_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e158_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e158_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e158_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1011_c7_29bd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_29bd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_29bd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_29bd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_29bd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_29bd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_29bd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1023_c7_e158] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1023_c7_e158_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1023_c7_e158_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1023_c7_e158_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1023_c7_e158_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1023_c7_e158_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1023_c7_e158_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1023_c7_e158_return_output := result_u8_value_MUX_uxn_opcodes_h_l1023_c7_e158_return_output;

     -- t16_MUX[uxn_opcodes_h_l999_c7_4974] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l999_c7_4974_cond <= VAR_t16_MUX_uxn_opcodes_h_l999_c7_4974_cond;
     t16_MUX_uxn_opcodes_h_l999_c7_4974_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l999_c7_4974_iftrue;
     t16_MUX_uxn_opcodes_h_l999_c7_4974_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l999_c7_4974_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l999_c7_4974_return_output := t16_MUX_uxn_opcodes_h_l999_c7_4974_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1016_c11_2446] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1016_c11_2446_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1016_c11_2446_left;
     BIN_OP_AND_uxn_opcodes_h_l1016_c11_2446_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1016_c11_2446_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1016_c11_2446_return_output := BIN_OP_AND_uxn_opcodes_h_l1016_c11_2446_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1014_c7_2f95] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_2f95_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_2f95_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_2f95_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_2f95_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_2f95_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_2f95_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1023_c7_e158] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e158_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e158_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e158_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e158_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e158_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e158_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e158_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e158_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1014_c7_2f95_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l1016_c11_2446_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1011_c7_29bd_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_2f95_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_e158_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_29bd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_2f95_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_e158_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_a652_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_29bd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1014_c7_2f95_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1023_c7_e158_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l996_c7_1b1c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l999_c7_4974_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1011_c7_29bd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_29bd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_29bd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_29bd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_29bd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_29bd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_29bd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1014_c7_2f95] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_2f95_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_2f95_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_2f95_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_2f95_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_2f95_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_2f95_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1021_c21_845b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1021_c21_845b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_AND_uxn_opcodes_h_l1016_c11_2446_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1014_c7_2f95] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_2f95_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_2f95_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_2f95_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_2f95_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_2f95_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_2f95_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output;

     -- n16_MUX[uxn_opcodes_h_l1011_c7_29bd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1011_c7_29bd_cond <= VAR_n16_MUX_uxn_opcodes_h_l1011_c7_29bd_cond;
     n16_MUX_uxn_opcodes_h_l1011_c7_29bd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1011_c7_29bd_iftrue;
     n16_MUX_uxn_opcodes_h_l1011_c7_29bd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1011_c7_29bd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output := n16_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1014_c7_2f95] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1014_c7_2f95_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1014_c7_2f95_cond;
     tmp16_MUX_uxn_opcodes_h_l1014_c7_2f95_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1014_c7_2f95_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1014_c7_2f95_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1014_c7_2f95_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output := tmp16_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1006_c7_a652] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_a652_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_a652_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_a652_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_a652_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_a652_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_a652_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_a652_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_a652_return_output;

     -- t16_MUX[uxn_opcodes_h_l996_c7_1b1c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l996_c7_1b1c_cond <= VAR_t16_MUX_uxn_opcodes_h_l996_c7_1b1c_cond;
     t16_MUX_uxn_opcodes_h_l996_c7_1b1c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l996_c7_1b1c_iftrue;
     t16_MUX_uxn_opcodes_h_l996_c7_1b1c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l996_c7_1b1c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output := t16_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1011_c7_29bd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_29bd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_29bd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_29bd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_29bd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_29bd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_29bd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1014_c7_2f95_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1021_c21_845b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1006_c7_a652_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_29bd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_a652_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_29bd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_173c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_a652_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_a652_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l991_c7_7a15_iffalse := VAR_t16_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1011_c7_29bd_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1003_c7_173c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_173c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_173c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_173c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_173c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_173c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_173c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_173c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_173c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1011_c7_29bd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_29bd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_29bd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_29bd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_29bd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_29bd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_29bd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1006_c7_a652] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_a652_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_a652_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_a652_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_a652_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_a652_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_a652_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_a652_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_a652_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1006_c7_a652] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_a652_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_a652_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_a652_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_a652_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_a652_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_a652_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_a652_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_a652_return_output;

     -- n16_MUX[uxn_opcodes_h_l1006_c7_a652] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1006_c7_a652_cond <= VAR_n16_MUX_uxn_opcodes_h_l1006_c7_a652_cond;
     n16_MUX_uxn_opcodes_h_l1006_c7_a652_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1006_c7_a652_iftrue;
     n16_MUX_uxn_opcodes_h_l1006_c7_a652_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1006_c7_a652_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1006_c7_a652_return_output := n16_MUX_uxn_opcodes_h_l1006_c7_a652_return_output;

     -- t16_MUX[uxn_opcodes_h_l991_c7_7a15] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l991_c7_7a15_cond <= VAR_t16_MUX_uxn_opcodes_h_l991_c7_7a15_cond;
     t16_MUX_uxn_opcodes_h_l991_c7_7a15_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l991_c7_7a15_iftrue;
     t16_MUX_uxn_opcodes_h_l991_c7_7a15_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l991_c7_7a15_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l991_c7_7a15_return_output := t16_MUX_uxn_opcodes_h_l991_c7_7a15_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1011_c7_29bd] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1011_c7_29bd_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1011_c7_29bd_cond;
     tmp16_MUX_uxn_opcodes_h_l1011_c7_29bd_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1011_c7_29bd_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1011_c7_29bd_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1011_c7_29bd_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output := tmp16_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1011_c7_29bd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_29bd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_29bd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_29bd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_29bd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_29bd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_29bd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1014_c7_2f95] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1014_c7_2f95_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1014_c7_2f95_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1014_c7_2f95_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1014_c7_2f95_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1014_c7_2f95_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1014_c7_2f95_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output := result_u8_value_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1003_c7_173c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1006_c7_a652_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_a652_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_173c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_a652_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_a652_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_4974_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_173c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_173c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_a652_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1011_c7_29bd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1014_c7_2f95_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l988_c7_14bf_iffalse := VAR_t16_MUX_uxn_opcodes_h_l991_c7_7a15_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1006_c7_a652_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output;
     -- n16_MUX[uxn_opcodes_h_l1003_c7_173c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1003_c7_173c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1003_c7_173c_cond;
     n16_MUX_uxn_opcodes_h_l1003_c7_173c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1003_c7_173c_iftrue;
     n16_MUX_uxn_opcodes_h_l1003_c7_173c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1003_c7_173c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1003_c7_173c_return_output := n16_MUX_uxn_opcodes_h_l1003_c7_173c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1003_c7_173c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_173c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_173c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_173c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_173c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_173c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_173c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_173c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_173c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1006_c7_a652] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_a652_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_a652_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_a652_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_a652_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_a652_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_a652_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_a652_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_a652_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1006_c7_a652] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_a652_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_a652_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_a652_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_a652_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_a652_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_a652_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_a652_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_a652_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1011_c7_29bd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1011_c7_29bd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1011_c7_29bd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1011_c7_29bd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1011_c7_29bd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1011_c7_29bd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1011_c7_29bd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output := result_u8_value_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l999_c7_4974] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_4974_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_4974_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_4974_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_4974_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_4974_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_4974_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_4974_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_4974_return_output;

     -- t16_MUX[uxn_opcodes_h_l988_c7_14bf] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l988_c7_14bf_cond <= VAR_t16_MUX_uxn_opcodes_h_l988_c7_14bf_cond;
     t16_MUX_uxn_opcodes_h_l988_c7_14bf_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l988_c7_14bf_iftrue;
     t16_MUX_uxn_opcodes_h_l988_c7_14bf_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l988_c7_14bf_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l988_c7_14bf_return_output := t16_MUX_uxn_opcodes_h_l988_c7_14bf_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1006_c7_a652] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1006_c7_a652_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1006_c7_a652_cond;
     tmp16_MUX_uxn_opcodes_h_l1006_c7_a652_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1006_c7_a652_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1006_c7_a652_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1006_c7_a652_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1006_c7_a652_return_output := tmp16_MUX_uxn_opcodes_h_l1006_c7_a652_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1003_c7_173c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_173c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_173c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_173c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_173c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_173c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_173c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_173c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_173c_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l999_c7_4974_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1003_c7_173c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_173c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_a652_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_4974_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_173c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_173c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_a652_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_1b1c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_4974_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_4974_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_173c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1006_c7_a652_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1011_c7_29bd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l983_c2_eafc_iffalse := VAR_t16_MUX_uxn_opcodes_h_l988_c7_14bf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1003_c7_173c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1006_c7_a652_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l999_c7_4974] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_4974_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_4974_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_4974_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_4974_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_4974_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_4974_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_4974_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_4974_return_output;

     -- t16_MUX[uxn_opcodes_h_l983_c2_eafc] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l983_c2_eafc_cond <= VAR_t16_MUX_uxn_opcodes_h_l983_c2_eafc_cond;
     t16_MUX_uxn_opcodes_h_l983_c2_eafc_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l983_c2_eafc_iftrue;
     t16_MUX_uxn_opcodes_h_l983_c2_eafc_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l983_c2_eafc_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l983_c2_eafc_return_output := t16_MUX_uxn_opcodes_h_l983_c2_eafc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1006_c7_a652] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1006_c7_a652_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1006_c7_a652_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1006_c7_a652_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1006_c7_a652_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1006_c7_a652_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1006_c7_a652_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1006_c7_a652_return_output := result_u8_value_MUX_uxn_opcodes_h_l1006_c7_a652_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1003_c7_173c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1003_c7_173c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1003_c7_173c_cond;
     tmp16_MUX_uxn_opcodes_h_l1003_c7_173c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1003_c7_173c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1003_c7_173c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1003_c7_173c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1003_c7_173c_return_output := tmp16_MUX_uxn_opcodes_h_l1003_c7_173c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l999_c7_4974] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_4974_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_4974_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_4974_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_4974_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_4974_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_4974_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_4974_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_4974_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1003_c7_173c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_173c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_173c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_173c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_173c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_173c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_173c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_173c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_173c_return_output;

     -- n16_MUX[uxn_opcodes_h_l999_c7_4974] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l999_c7_4974_cond <= VAR_n16_MUX_uxn_opcodes_h_l999_c7_4974_cond;
     n16_MUX_uxn_opcodes_h_l999_c7_4974_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l999_c7_4974_iftrue;
     n16_MUX_uxn_opcodes_h_l999_c7_4974_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l999_c7_4974_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l999_c7_4974_return_output := n16_MUX_uxn_opcodes_h_l999_c7_4974_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l996_c7_1b1c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_1b1c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_1b1c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_1b1c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_1b1c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_1b1c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_1b1c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1003_c7_173c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_173c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_173c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_173c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_173c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_173c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_173c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_173c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_173c_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l996_c7_1b1c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l999_c7_4974_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_4974_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_173c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_1b1c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_4974_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_4974_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_173c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_7a15_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_1b1c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_4974_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1003_c7_173c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1006_c7_a652_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l983_c2_eafc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l999_c7_4974_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1003_c7_173c_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l999_c7_4974] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l999_c7_4974_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l999_c7_4974_cond;
     tmp16_MUX_uxn_opcodes_h_l999_c7_4974_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l999_c7_4974_iftrue;
     tmp16_MUX_uxn_opcodes_h_l999_c7_4974_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l999_c7_4974_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l999_c7_4974_return_output := tmp16_MUX_uxn_opcodes_h_l999_c7_4974_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1003_c7_173c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1003_c7_173c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1003_c7_173c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1003_c7_173c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1003_c7_173c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1003_c7_173c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1003_c7_173c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1003_c7_173c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1003_c7_173c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l991_c7_7a15] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_7a15_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_7a15_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_7a15_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_7a15_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_7a15_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_7a15_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_7a15_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_7a15_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l996_c7_1b1c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_1b1c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_1b1c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_1b1c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_1b1c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_1b1c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_1b1c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l999_c7_4974] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_4974_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_4974_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_4974_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_4974_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_4974_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_4974_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_4974_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_4974_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l996_c7_1b1c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_1b1c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_1b1c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_1b1c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_1b1c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_1b1c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_1b1c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l999_c7_4974] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_4974_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_4974_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_4974_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_4974_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_4974_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_4974_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_4974_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_4974_return_output;

     -- n16_MUX[uxn_opcodes_h_l996_c7_1b1c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l996_c7_1b1c_cond <= VAR_n16_MUX_uxn_opcodes_h_l996_c7_1b1c_cond;
     n16_MUX_uxn_opcodes_h_l996_c7_1b1c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l996_c7_1b1c_iftrue;
     n16_MUX_uxn_opcodes_h_l996_c7_1b1c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l996_c7_1b1c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output := n16_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l991_c7_7a15_iffalse := VAR_n16_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_1b1c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_4974_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_7a15_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_1b1c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_4974_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_14bf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_7a15_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_7a15_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_4974_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1003_c7_173c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_1b1c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l999_c7_4974_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l996_c7_1b1c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l996_c7_1b1c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_1b1c_cond;
     tmp16_MUX_uxn_opcodes_h_l996_c7_1b1c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_1b1c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l996_c7_1b1c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_1b1c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output := tmp16_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l991_c7_7a15] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_7a15_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_7a15_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_7a15_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_7a15_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_7a15_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_7a15_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_7a15_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_7a15_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l988_c7_14bf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_14bf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_14bf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_14bf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_14bf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_14bf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_14bf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_14bf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_14bf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l996_c7_1b1c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_1b1c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_1b1c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_1b1c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_1b1c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_1b1c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_1b1c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l991_c7_7a15] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_7a15_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_7a15_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_7a15_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_7a15_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_7a15_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_7a15_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_7a15_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_7a15_return_output;

     -- n16_MUX[uxn_opcodes_h_l991_c7_7a15] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l991_c7_7a15_cond <= VAR_n16_MUX_uxn_opcodes_h_l991_c7_7a15_cond;
     n16_MUX_uxn_opcodes_h_l991_c7_7a15_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l991_c7_7a15_iftrue;
     n16_MUX_uxn_opcodes_h_l991_c7_7a15_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l991_c7_7a15_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l991_c7_7a15_return_output := n16_MUX_uxn_opcodes_h_l991_c7_7a15_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l996_c7_1b1c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_1b1c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_1b1c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_1b1c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_1b1c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_1b1c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_1b1c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l999_c7_4974] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l999_c7_4974_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_4974_cond;
     result_u8_value_MUX_uxn_opcodes_h_l999_c7_4974_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_4974_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l999_c7_4974_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_4974_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_4974_return_output := result_u8_value_MUX_uxn_opcodes_h_l999_c7_4974_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l988_c7_14bf_iffalse := VAR_n16_MUX_uxn_opcodes_h_l991_c7_7a15_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_7a15_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_14bf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_7a15_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_7a15_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c2_eafc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_14bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_14bf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_7a15_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_1b1c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_4974_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_7a15_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l991_c7_7a15] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l991_c7_7a15_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_7a15_cond;
     tmp16_MUX_uxn_opcodes_h_l991_c7_7a15_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_7a15_iftrue;
     tmp16_MUX_uxn_opcodes_h_l991_c7_7a15_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_7a15_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_7a15_return_output := tmp16_MUX_uxn_opcodes_h_l991_c7_7a15_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l991_c7_7a15] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_7a15_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_7a15_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_7a15_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_7a15_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_7a15_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_7a15_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_7a15_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_7a15_return_output;

     -- n16_MUX[uxn_opcodes_h_l988_c7_14bf] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l988_c7_14bf_cond <= VAR_n16_MUX_uxn_opcodes_h_l988_c7_14bf_cond;
     n16_MUX_uxn_opcodes_h_l988_c7_14bf_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l988_c7_14bf_iftrue;
     n16_MUX_uxn_opcodes_h_l988_c7_14bf_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l988_c7_14bf_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l988_c7_14bf_return_output := n16_MUX_uxn_opcodes_h_l988_c7_14bf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l991_c7_7a15] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_7a15_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_7a15_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_7a15_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_7a15_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_7a15_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_7a15_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_7a15_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_7a15_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l988_c7_14bf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_14bf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_14bf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_14bf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_14bf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_14bf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_14bf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_14bf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_14bf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l983_c2_eafc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c2_eafc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c2_eafc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c2_eafc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c2_eafc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c2_eafc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c2_eafc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c2_eafc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c2_eafc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l996_c7_1b1c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l996_c7_1b1c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_1b1c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l996_c7_1b1c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_1b1c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l996_c7_1b1c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_1b1c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output := result_u8_value_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l988_c7_14bf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_14bf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_14bf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_14bf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_14bf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_14bf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_14bf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_14bf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_14bf_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l983_c2_eafc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l988_c7_14bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_14bf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_7a15_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l983_c2_eafc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_14bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_14bf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_7a15_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c2_eafc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_14bf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_7a15_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_1b1c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l988_c7_14bf_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_7a15_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l983_c2_eafc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c2_eafc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c2_eafc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c2_eafc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c2_eafc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c2_eafc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c2_eafc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c2_eafc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c2_eafc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l988_c7_14bf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_14bf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_14bf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_14bf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_14bf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_14bf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_14bf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_14bf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_14bf_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l983_c2_eafc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l983_c2_eafc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l983_c2_eafc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l983_c2_eafc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l983_c2_eafc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l983_c2_eafc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l983_c2_eafc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l983_c2_eafc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l983_c2_eafc_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l988_c7_14bf] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l988_c7_14bf_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l988_c7_14bf_cond;
     tmp16_MUX_uxn_opcodes_h_l988_c7_14bf_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l988_c7_14bf_iftrue;
     tmp16_MUX_uxn_opcodes_h_l988_c7_14bf_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l988_c7_14bf_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l988_c7_14bf_return_output := tmp16_MUX_uxn_opcodes_h_l988_c7_14bf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l988_c7_14bf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_14bf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_14bf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_14bf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_14bf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_14bf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_14bf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_14bf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_14bf_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l991_c7_7a15] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l991_c7_7a15_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_7a15_cond;
     result_u8_value_MUX_uxn_opcodes_h_l991_c7_7a15_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_7a15_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l991_c7_7a15_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_7a15_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_7a15_return_output := result_u8_value_MUX_uxn_opcodes_h_l991_c7_7a15_return_output;

     -- n16_MUX[uxn_opcodes_h_l983_c2_eafc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l983_c2_eafc_cond <= VAR_n16_MUX_uxn_opcodes_h_l983_c2_eafc_cond;
     n16_MUX_uxn_opcodes_h_l983_c2_eafc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l983_c2_eafc_iftrue;
     n16_MUX_uxn_opcodes_h_l983_c2_eafc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l983_c2_eafc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l983_c2_eafc_return_output := n16_MUX_uxn_opcodes_h_l983_c2_eafc_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l983_c2_eafc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c2_eafc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_14bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c2_eafc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_14bf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c7_14bf_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_7a15_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l983_c2_eafc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l988_c7_14bf_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l983_c2_eafc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l983_c2_eafc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l983_c2_eafc_cond;
     tmp16_MUX_uxn_opcodes_h_l983_c2_eafc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l983_c2_eafc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l983_c2_eafc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l983_c2_eafc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l983_c2_eafc_return_output := tmp16_MUX_uxn_opcodes_h_l983_c2_eafc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l983_c2_eafc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l983_c2_eafc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c2_eafc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l983_c2_eafc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c2_eafc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l983_c2_eafc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c2_eafc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c2_eafc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l983_c2_eafc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l988_c7_14bf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l988_c7_14bf_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c7_14bf_cond;
     result_u8_value_MUX_uxn_opcodes_h_l988_c7_14bf_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c7_14bf_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l988_c7_14bf_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c7_14bf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c7_14bf_return_output := result_u8_value_MUX_uxn_opcodes_h_l988_c7_14bf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l983_c2_eafc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l983_c2_eafc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c2_eafc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l983_c2_eafc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c2_eafc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l983_c2_eafc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c2_eafc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c2_eafc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l983_c2_eafc_return_output;

     -- Submodule level 12
     VAR_result_u8_value_MUX_uxn_opcodes_h_l983_c2_eafc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c7_14bf_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l983_c2_eafc_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l983_c2_eafc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l983_c2_eafc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l983_c2_eafc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l983_c2_eafc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l983_c2_eafc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l983_c2_eafc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l983_c2_eafc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l983_c2_eafc_return_output := result_u8_value_MUX_uxn_opcodes_h_l983_c2_eafc_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l1033_l979_DUPLICATE_cf14 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l1033_l979_DUPLICATE_cf14_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_25e8(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l983_c2_eafc_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l983_c2_eafc_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l983_c2_eafc_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l983_c2_eafc_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l983_c2_eafc_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l983_c2_eafc_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l1033_l979_DUPLICATE_cf14_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l1033_l979_DUPLICATE_cf14_return_output;
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
