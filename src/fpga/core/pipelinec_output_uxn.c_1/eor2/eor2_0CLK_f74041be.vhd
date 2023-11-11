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
entity eor2_0CLK_f74041be is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end eor2_0CLK_f74041be;
architecture arch of eor2_0CLK_f74041be is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1067_c6_0cc8]
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c6_0cc8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c6_0cc8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c6_0cc8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1067_c1_f76e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_f76e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_f76e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_f76e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_f76e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1067_c2_4702]
signal tmp16_MUX_uxn_opcodes_h_l1067_c2_4702_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1067_c2_4702_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1067_c2_4702_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1067_c2_4702_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1067_c2_4702]
signal n16_MUX_uxn_opcodes_h_l1067_c2_4702_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1067_c2_4702_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1067_c2_4702_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1067_c2_4702_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1067_c2_4702]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_4702_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_4702_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_4702_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_4702_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1067_c2_4702]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_4702_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_4702_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_4702_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_4702_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1067_c2_4702]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_4702_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_4702_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_4702_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_4702_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1067_c2_4702]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_4702_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_4702_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_4702_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_4702_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1067_c2_4702]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_4702_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_4702_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_4702_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_4702_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1067_c2_4702]
signal result_u8_value_MUX_uxn_opcodes_h_l1067_c2_4702_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1067_c2_4702_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1067_c2_4702_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1067_c2_4702_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1067_c2_4702]
signal t16_MUX_uxn_opcodes_h_l1067_c2_4702_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1067_c2_4702_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1067_c2_4702_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1067_c2_4702_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1068_c3_9e62[uxn_opcodes_h_l1068_c3_9e62]
signal printf_uxn_opcodes_h_l1068_c3_9e62_uxn_opcodes_h_l1068_c3_9e62_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1072_c11_ff8f]
signal BIN_OP_EQ_uxn_opcodes_h_l1072_c11_ff8f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1072_c11_ff8f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1072_c11_ff8f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1072_c7_0417]
signal tmp16_MUX_uxn_opcodes_h_l1072_c7_0417_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1072_c7_0417_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1072_c7_0417_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1072_c7_0417_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1072_c7_0417]
signal n16_MUX_uxn_opcodes_h_l1072_c7_0417_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1072_c7_0417_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1072_c7_0417_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1072_c7_0417_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1072_c7_0417]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_0417_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_0417_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_0417_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_0417_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1072_c7_0417]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_0417_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_0417_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_0417_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_0417_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1072_c7_0417]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_0417_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_0417_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_0417_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_0417_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1072_c7_0417]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_0417_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_0417_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_0417_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_0417_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1072_c7_0417]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_0417_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_0417_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_0417_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_0417_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1072_c7_0417]
signal result_u8_value_MUX_uxn_opcodes_h_l1072_c7_0417_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1072_c7_0417_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1072_c7_0417_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1072_c7_0417_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1072_c7_0417]
signal t16_MUX_uxn_opcodes_h_l1072_c7_0417_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1072_c7_0417_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1072_c7_0417_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1072_c7_0417_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1075_c11_d982]
signal BIN_OP_EQ_uxn_opcodes_h_l1075_c11_d982_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1075_c11_d982_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1075_c11_d982_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1075_c7_cde6]
signal tmp16_MUX_uxn_opcodes_h_l1075_c7_cde6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1075_c7_cde6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1075_c7_cde6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1075_c7_cde6]
signal n16_MUX_uxn_opcodes_h_l1075_c7_cde6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1075_c7_cde6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1075_c7_cde6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1075_c7_cde6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_cde6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_cde6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_cde6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1075_c7_cde6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_cde6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_cde6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_cde6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1075_c7_cde6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_cde6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_cde6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_cde6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1075_c7_cde6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_cde6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_cde6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_cde6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1075_c7_cde6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_cde6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_cde6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_cde6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1075_c7_cde6]
signal result_u8_value_MUX_uxn_opcodes_h_l1075_c7_cde6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1075_c7_cde6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1075_c7_cde6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1075_c7_cde6]
signal t16_MUX_uxn_opcodes_h_l1075_c7_cde6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1075_c7_cde6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1075_c7_cde6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1080_c11_bc2a]
signal BIN_OP_EQ_uxn_opcodes_h_l1080_c11_bc2a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1080_c11_bc2a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1080_c11_bc2a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1080_c7_7882]
signal tmp16_MUX_uxn_opcodes_h_l1080_c7_7882_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1080_c7_7882_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1080_c7_7882_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1080_c7_7882_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1080_c7_7882]
signal n16_MUX_uxn_opcodes_h_l1080_c7_7882_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1080_c7_7882_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1080_c7_7882_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1080_c7_7882_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1080_c7_7882]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_7882_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_7882_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_7882_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_7882_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1080_c7_7882]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_7882_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_7882_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_7882_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_7882_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1080_c7_7882]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_7882_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_7882_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_7882_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_7882_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1080_c7_7882]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_7882_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_7882_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_7882_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_7882_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1080_c7_7882]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_7882_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_7882_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_7882_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_7882_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1080_c7_7882]
signal result_u8_value_MUX_uxn_opcodes_h_l1080_c7_7882_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1080_c7_7882_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1080_c7_7882_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1080_c7_7882_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1080_c7_7882]
signal t16_MUX_uxn_opcodes_h_l1080_c7_7882_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1080_c7_7882_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1080_c7_7882_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1080_c7_7882_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1081_c3_1dcc]
signal BIN_OP_OR_uxn_opcodes_h_l1081_c3_1dcc_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1081_c3_1dcc_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1081_c3_1dcc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1084_c11_d675]
signal BIN_OP_EQ_uxn_opcodes_h_l1084_c11_d675_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1084_c11_d675_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1084_c11_d675_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1084_c7_12ee]
signal tmp16_MUX_uxn_opcodes_h_l1084_c7_12ee_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1084_c7_12ee_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1084_c7_12ee_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1084_c7_12ee]
signal n16_MUX_uxn_opcodes_h_l1084_c7_12ee_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1084_c7_12ee_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1084_c7_12ee_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1084_c7_12ee]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_12ee_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_12ee_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_12ee_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1084_c7_12ee]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_12ee_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_12ee_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_12ee_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1084_c7_12ee]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_12ee_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_12ee_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_12ee_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1084_c7_12ee]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_12ee_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_12ee_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_12ee_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1084_c7_12ee]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_12ee_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_12ee_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_12ee_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1084_c7_12ee]
signal result_u8_value_MUX_uxn_opcodes_h_l1084_c7_12ee_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1084_c7_12ee_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1084_c7_12ee_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1088_c11_c69c]
signal BIN_OP_EQ_uxn_opcodes_h_l1088_c11_c69c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1088_c11_c69c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1088_c11_c69c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1088_c7_8d56]
signal tmp16_MUX_uxn_opcodes_h_l1088_c7_8d56_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1088_c7_8d56_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1088_c7_8d56_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1088_c7_8d56]
signal n16_MUX_uxn_opcodes_h_l1088_c7_8d56_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1088_c7_8d56_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1088_c7_8d56_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1088_c7_8d56]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_8d56_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_8d56_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_8d56_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1088_c7_8d56]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_8d56_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_8d56_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_8d56_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1088_c7_8d56]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_8d56_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_8d56_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_8d56_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1088_c7_8d56]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_8d56_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_8d56_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_8d56_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1088_c7_8d56]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_8d56_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_8d56_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_8d56_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1088_c7_8d56]
signal result_u8_value_MUX_uxn_opcodes_h_l1088_c7_8d56_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1088_c7_8d56_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1088_c7_8d56_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1089_c3_6da6]
signal BIN_OP_OR_uxn_opcodes_h_l1089_c3_6da6_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1089_c3_6da6_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1089_c3_6da6_return_output : unsigned(15 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l1090_c11_a6bf]
signal BIN_OP_XOR_uxn_opcodes_h_l1090_c11_a6bf_left : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1090_c11_a6bf_right : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1090_c11_a6bf_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1092_c30_8330]
signal sp_relative_shift_uxn_opcodes_h_l1092_c30_8330_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1092_c30_8330_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1092_c30_8330_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1092_c30_8330_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1097_c11_5985]
signal BIN_OP_EQ_uxn_opcodes_h_l1097_c11_5985_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1097_c11_5985_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1097_c11_5985_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1097_c7_69f8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_69f8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_69f8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_69f8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_69f8_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1097_c7_69f8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_69f8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_69f8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_69f8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_69f8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1097_c7_69f8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_69f8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_69f8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_69f8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_69f8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1097_c7_69f8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_69f8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_69f8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_69f8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_69f8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1097_c7_69f8]
signal result_u8_value_MUX_uxn_opcodes_h_l1097_c7_69f8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1097_c7_69f8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1097_c7_69f8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1097_c7_69f8_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1100_c31_98d4]
signal CONST_SR_8_uxn_opcodes_h_l1100_c31_98d4_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1100_c31_98d4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1102_c11_9d23]
signal BIN_OP_EQ_uxn_opcodes_h_l1102_c11_9d23_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1102_c11_9d23_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1102_c11_9d23_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1102_c7_bdeb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_bdeb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_bdeb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_bdeb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_bdeb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1102_c7_bdeb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_bdeb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_bdeb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_bdeb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_bdeb_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1086_l1077_DUPLICATE_ef9a
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1086_l1077_DUPLICATE_ef9a_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1086_l1077_DUPLICATE_ef9a_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1067_c6_0cc8
BIN_OP_EQ_uxn_opcodes_h_l1067_c6_0cc8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1067_c6_0cc8_left,
BIN_OP_EQ_uxn_opcodes_h_l1067_c6_0cc8_right,
BIN_OP_EQ_uxn_opcodes_h_l1067_c6_0cc8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_f76e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_f76e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_f76e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_f76e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_f76e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_f76e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1067_c2_4702
tmp16_MUX_uxn_opcodes_h_l1067_c2_4702 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1067_c2_4702_cond,
tmp16_MUX_uxn_opcodes_h_l1067_c2_4702_iftrue,
tmp16_MUX_uxn_opcodes_h_l1067_c2_4702_iffalse,
tmp16_MUX_uxn_opcodes_h_l1067_c2_4702_return_output);

-- n16_MUX_uxn_opcodes_h_l1067_c2_4702
n16_MUX_uxn_opcodes_h_l1067_c2_4702 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1067_c2_4702_cond,
n16_MUX_uxn_opcodes_h_l1067_c2_4702_iftrue,
n16_MUX_uxn_opcodes_h_l1067_c2_4702_iffalse,
n16_MUX_uxn_opcodes_h_l1067_c2_4702_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_4702
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_4702 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_4702_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_4702_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_4702_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_4702_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_4702
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_4702 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_4702_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_4702_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_4702_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_4702_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_4702
result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_4702 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_4702_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_4702_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_4702_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_4702_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_4702
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_4702 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_4702_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_4702_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_4702_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_4702_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_4702
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_4702 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_4702_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_4702_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_4702_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_4702_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1067_c2_4702
result_u8_value_MUX_uxn_opcodes_h_l1067_c2_4702 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1067_c2_4702_cond,
result_u8_value_MUX_uxn_opcodes_h_l1067_c2_4702_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1067_c2_4702_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1067_c2_4702_return_output);

-- t16_MUX_uxn_opcodes_h_l1067_c2_4702
t16_MUX_uxn_opcodes_h_l1067_c2_4702 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1067_c2_4702_cond,
t16_MUX_uxn_opcodes_h_l1067_c2_4702_iftrue,
t16_MUX_uxn_opcodes_h_l1067_c2_4702_iffalse,
t16_MUX_uxn_opcodes_h_l1067_c2_4702_return_output);

-- printf_uxn_opcodes_h_l1068_c3_9e62_uxn_opcodes_h_l1068_c3_9e62
printf_uxn_opcodes_h_l1068_c3_9e62_uxn_opcodes_h_l1068_c3_9e62 : entity work.printf_uxn_opcodes_h_l1068_c3_9e62_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1068_c3_9e62_uxn_opcodes_h_l1068_c3_9e62_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1072_c11_ff8f
BIN_OP_EQ_uxn_opcodes_h_l1072_c11_ff8f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1072_c11_ff8f_left,
BIN_OP_EQ_uxn_opcodes_h_l1072_c11_ff8f_right,
BIN_OP_EQ_uxn_opcodes_h_l1072_c11_ff8f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1072_c7_0417
tmp16_MUX_uxn_opcodes_h_l1072_c7_0417 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1072_c7_0417_cond,
tmp16_MUX_uxn_opcodes_h_l1072_c7_0417_iftrue,
tmp16_MUX_uxn_opcodes_h_l1072_c7_0417_iffalse,
tmp16_MUX_uxn_opcodes_h_l1072_c7_0417_return_output);

-- n16_MUX_uxn_opcodes_h_l1072_c7_0417
n16_MUX_uxn_opcodes_h_l1072_c7_0417 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1072_c7_0417_cond,
n16_MUX_uxn_opcodes_h_l1072_c7_0417_iftrue,
n16_MUX_uxn_opcodes_h_l1072_c7_0417_iffalse,
n16_MUX_uxn_opcodes_h_l1072_c7_0417_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_0417
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_0417 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_0417_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_0417_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_0417_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_0417_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_0417
result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_0417 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_0417_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_0417_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_0417_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_0417_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_0417
result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_0417 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_0417_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_0417_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_0417_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_0417_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_0417
result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_0417 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_0417_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_0417_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_0417_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_0417_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_0417
result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_0417 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_0417_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_0417_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_0417_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_0417_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1072_c7_0417
result_u8_value_MUX_uxn_opcodes_h_l1072_c7_0417 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1072_c7_0417_cond,
result_u8_value_MUX_uxn_opcodes_h_l1072_c7_0417_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1072_c7_0417_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1072_c7_0417_return_output);

-- t16_MUX_uxn_opcodes_h_l1072_c7_0417
t16_MUX_uxn_opcodes_h_l1072_c7_0417 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1072_c7_0417_cond,
t16_MUX_uxn_opcodes_h_l1072_c7_0417_iftrue,
t16_MUX_uxn_opcodes_h_l1072_c7_0417_iffalse,
t16_MUX_uxn_opcodes_h_l1072_c7_0417_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1075_c11_d982
BIN_OP_EQ_uxn_opcodes_h_l1075_c11_d982 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1075_c11_d982_left,
BIN_OP_EQ_uxn_opcodes_h_l1075_c11_d982_right,
BIN_OP_EQ_uxn_opcodes_h_l1075_c11_d982_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1075_c7_cde6
tmp16_MUX_uxn_opcodes_h_l1075_c7_cde6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1075_c7_cde6_cond,
tmp16_MUX_uxn_opcodes_h_l1075_c7_cde6_iftrue,
tmp16_MUX_uxn_opcodes_h_l1075_c7_cde6_iffalse,
tmp16_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output);

-- n16_MUX_uxn_opcodes_h_l1075_c7_cde6
n16_MUX_uxn_opcodes_h_l1075_c7_cde6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1075_c7_cde6_cond,
n16_MUX_uxn_opcodes_h_l1075_c7_cde6_iftrue,
n16_MUX_uxn_opcodes_h_l1075_c7_cde6_iffalse,
n16_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_cde6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_cde6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_cde6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_cde6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_cde6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_cde6
result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_cde6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_cde6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_cde6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_cde6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_cde6
result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_cde6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_cde6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_cde6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_cde6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_cde6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_cde6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_cde6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_cde6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_cde6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_cde6
result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_cde6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_cde6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_cde6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_cde6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1075_c7_cde6
result_u8_value_MUX_uxn_opcodes_h_l1075_c7_cde6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1075_c7_cde6_cond,
result_u8_value_MUX_uxn_opcodes_h_l1075_c7_cde6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1075_c7_cde6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output);

-- t16_MUX_uxn_opcodes_h_l1075_c7_cde6
t16_MUX_uxn_opcodes_h_l1075_c7_cde6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1075_c7_cde6_cond,
t16_MUX_uxn_opcodes_h_l1075_c7_cde6_iftrue,
t16_MUX_uxn_opcodes_h_l1075_c7_cde6_iffalse,
t16_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1080_c11_bc2a
BIN_OP_EQ_uxn_opcodes_h_l1080_c11_bc2a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1080_c11_bc2a_left,
BIN_OP_EQ_uxn_opcodes_h_l1080_c11_bc2a_right,
BIN_OP_EQ_uxn_opcodes_h_l1080_c11_bc2a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1080_c7_7882
tmp16_MUX_uxn_opcodes_h_l1080_c7_7882 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1080_c7_7882_cond,
tmp16_MUX_uxn_opcodes_h_l1080_c7_7882_iftrue,
tmp16_MUX_uxn_opcodes_h_l1080_c7_7882_iffalse,
tmp16_MUX_uxn_opcodes_h_l1080_c7_7882_return_output);

-- n16_MUX_uxn_opcodes_h_l1080_c7_7882
n16_MUX_uxn_opcodes_h_l1080_c7_7882 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1080_c7_7882_cond,
n16_MUX_uxn_opcodes_h_l1080_c7_7882_iftrue,
n16_MUX_uxn_opcodes_h_l1080_c7_7882_iffalse,
n16_MUX_uxn_opcodes_h_l1080_c7_7882_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_7882
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_7882 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_7882_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_7882_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_7882_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_7882_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_7882
result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_7882 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_7882_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_7882_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_7882_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_7882_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_7882
result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_7882 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_7882_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_7882_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_7882_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_7882_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_7882
result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_7882 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_7882_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_7882_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_7882_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_7882_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_7882
result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_7882 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_7882_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_7882_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_7882_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_7882_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1080_c7_7882
result_u8_value_MUX_uxn_opcodes_h_l1080_c7_7882 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1080_c7_7882_cond,
result_u8_value_MUX_uxn_opcodes_h_l1080_c7_7882_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1080_c7_7882_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1080_c7_7882_return_output);

-- t16_MUX_uxn_opcodes_h_l1080_c7_7882
t16_MUX_uxn_opcodes_h_l1080_c7_7882 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1080_c7_7882_cond,
t16_MUX_uxn_opcodes_h_l1080_c7_7882_iftrue,
t16_MUX_uxn_opcodes_h_l1080_c7_7882_iffalse,
t16_MUX_uxn_opcodes_h_l1080_c7_7882_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1081_c3_1dcc
BIN_OP_OR_uxn_opcodes_h_l1081_c3_1dcc : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1081_c3_1dcc_left,
BIN_OP_OR_uxn_opcodes_h_l1081_c3_1dcc_right,
BIN_OP_OR_uxn_opcodes_h_l1081_c3_1dcc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1084_c11_d675
BIN_OP_EQ_uxn_opcodes_h_l1084_c11_d675 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1084_c11_d675_left,
BIN_OP_EQ_uxn_opcodes_h_l1084_c11_d675_right,
BIN_OP_EQ_uxn_opcodes_h_l1084_c11_d675_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1084_c7_12ee
tmp16_MUX_uxn_opcodes_h_l1084_c7_12ee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1084_c7_12ee_cond,
tmp16_MUX_uxn_opcodes_h_l1084_c7_12ee_iftrue,
tmp16_MUX_uxn_opcodes_h_l1084_c7_12ee_iffalse,
tmp16_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output);

-- n16_MUX_uxn_opcodes_h_l1084_c7_12ee
n16_MUX_uxn_opcodes_h_l1084_c7_12ee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1084_c7_12ee_cond,
n16_MUX_uxn_opcodes_h_l1084_c7_12ee_iftrue,
n16_MUX_uxn_opcodes_h_l1084_c7_12ee_iffalse,
n16_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_12ee
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_12ee : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_12ee_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_12ee_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_12ee_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_12ee
result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_12ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_12ee_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_12ee_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_12ee_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_12ee
result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_12ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_12ee_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_12ee_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_12ee_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_12ee
result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_12ee : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_12ee_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_12ee_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_12ee_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_12ee
result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_12ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_12ee_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_12ee_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_12ee_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1084_c7_12ee
result_u8_value_MUX_uxn_opcodes_h_l1084_c7_12ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1084_c7_12ee_cond,
result_u8_value_MUX_uxn_opcodes_h_l1084_c7_12ee_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1084_c7_12ee_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1088_c11_c69c
BIN_OP_EQ_uxn_opcodes_h_l1088_c11_c69c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1088_c11_c69c_left,
BIN_OP_EQ_uxn_opcodes_h_l1088_c11_c69c_right,
BIN_OP_EQ_uxn_opcodes_h_l1088_c11_c69c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1088_c7_8d56
tmp16_MUX_uxn_opcodes_h_l1088_c7_8d56 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1088_c7_8d56_cond,
tmp16_MUX_uxn_opcodes_h_l1088_c7_8d56_iftrue,
tmp16_MUX_uxn_opcodes_h_l1088_c7_8d56_iffalse,
tmp16_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output);

-- n16_MUX_uxn_opcodes_h_l1088_c7_8d56
n16_MUX_uxn_opcodes_h_l1088_c7_8d56 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1088_c7_8d56_cond,
n16_MUX_uxn_opcodes_h_l1088_c7_8d56_iftrue,
n16_MUX_uxn_opcodes_h_l1088_c7_8d56_iffalse,
n16_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_8d56
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_8d56 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_8d56_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_8d56_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_8d56_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_8d56
result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_8d56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_8d56_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_8d56_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_8d56_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_8d56
result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_8d56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_8d56_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_8d56_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_8d56_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_8d56
result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_8d56 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_8d56_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_8d56_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_8d56_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_8d56
result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_8d56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_8d56_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_8d56_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_8d56_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1088_c7_8d56
result_u8_value_MUX_uxn_opcodes_h_l1088_c7_8d56 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1088_c7_8d56_cond,
result_u8_value_MUX_uxn_opcodes_h_l1088_c7_8d56_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1088_c7_8d56_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1089_c3_6da6
BIN_OP_OR_uxn_opcodes_h_l1089_c3_6da6 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1089_c3_6da6_left,
BIN_OP_OR_uxn_opcodes_h_l1089_c3_6da6_right,
BIN_OP_OR_uxn_opcodes_h_l1089_c3_6da6_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l1090_c11_a6bf
BIN_OP_XOR_uxn_opcodes_h_l1090_c11_a6bf : entity work.BIN_OP_XOR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l1090_c11_a6bf_left,
BIN_OP_XOR_uxn_opcodes_h_l1090_c11_a6bf_right,
BIN_OP_XOR_uxn_opcodes_h_l1090_c11_a6bf_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1092_c30_8330
sp_relative_shift_uxn_opcodes_h_l1092_c30_8330 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1092_c30_8330_ins,
sp_relative_shift_uxn_opcodes_h_l1092_c30_8330_x,
sp_relative_shift_uxn_opcodes_h_l1092_c30_8330_y,
sp_relative_shift_uxn_opcodes_h_l1092_c30_8330_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1097_c11_5985
BIN_OP_EQ_uxn_opcodes_h_l1097_c11_5985 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1097_c11_5985_left,
BIN_OP_EQ_uxn_opcodes_h_l1097_c11_5985_right,
BIN_OP_EQ_uxn_opcodes_h_l1097_c11_5985_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_69f8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_69f8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_69f8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_69f8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_69f8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_69f8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_69f8
result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_69f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_69f8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_69f8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_69f8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_69f8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_69f8
result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_69f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_69f8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_69f8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_69f8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_69f8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_69f8
result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_69f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_69f8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_69f8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_69f8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_69f8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1097_c7_69f8
result_u8_value_MUX_uxn_opcodes_h_l1097_c7_69f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1097_c7_69f8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1097_c7_69f8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1097_c7_69f8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1097_c7_69f8_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1100_c31_98d4
CONST_SR_8_uxn_opcodes_h_l1100_c31_98d4 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1100_c31_98d4_x,
CONST_SR_8_uxn_opcodes_h_l1100_c31_98d4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1102_c11_9d23
BIN_OP_EQ_uxn_opcodes_h_l1102_c11_9d23 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1102_c11_9d23_left,
BIN_OP_EQ_uxn_opcodes_h_l1102_c11_9d23_right,
BIN_OP_EQ_uxn_opcodes_h_l1102_c11_9d23_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_bdeb
result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_bdeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_bdeb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_bdeb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_bdeb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_bdeb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_bdeb
result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_bdeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_bdeb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_bdeb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_bdeb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_bdeb_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1086_l1077_DUPLICATE_ef9a
CONST_SL_8_uint16_t_uxn_opcodes_h_l1086_l1077_DUPLICATE_ef9a : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1086_l1077_DUPLICATE_ef9a_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1086_l1077_DUPLICATE_ef9a_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1067_c6_0cc8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_f76e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1067_c2_4702_return_output,
 n16_MUX_uxn_opcodes_h_l1067_c2_4702_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_4702_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_4702_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_4702_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_4702_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_4702_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1067_c2_4702_return_output,
 t16_MUX_uxn_opcodes_h_l1067_c2_4702_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1072_c11_ff8f_return_output,
 tmp16_MUX_uxn_opcodes_h_l1072_c7_0417_return_output,
 n16_MUX_uxn_opcodes_h_l1072_c7_0417_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_0417_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_0417_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_0417_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_0417_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_0417_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1072_c7_0417_return_output,
 t16_MUX_uxn_opcodes_h_l1072_c7_0417_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1075_c11_d982_return_output,
 tmp16_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output,
 n16_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output,
 t16_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1080_c11_bc2a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1080_c7_7882_return_output,
 n16_MUX_uxn_opcodes_h_l1080_c7_7882_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_7882_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_7882_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_7882_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_7882_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_7882_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1080_c7_7882_return_output,
 t16_MUX_uxn_opcodes_h_l1080_c7_7882_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1081_c3_1dcc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1084_c11_d675_return_output,
 tmp16_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output,
 n16_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1088_c11_c69c_return_output,
 tmp16_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output,
 n16_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1089_c3_6da6_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l1090_c11_a6bf_return_output,
 sp_relative_shift_uxn_opcodes_h_l1092_c30_8330_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1097_c11_5985_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_69f8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_69f8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_69f8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_69f8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1097_c7_69f8_return_output,
 CONST_SR_8_uxn_opcodes_h_l1100_c31_98d4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1102_c11_9d23_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_bdeb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_bdeb_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1086_l1077_DUPLICATE_ef9a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_0cc8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_0cc8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_0cc8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_f76e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_f76e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_f76e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_f76e_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_4702_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_4702_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_0417_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_4702_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_4702_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1067_c2_4702_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1067_c2_4702_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1072_c7_0417_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1067_c2_4702_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1067_c2_4702_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_4702_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1069_c3_4a56 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_4702_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_0417_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_4702_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_4702_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_4702_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_4702_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_0417_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_4702_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_4702_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_4702_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_4702_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_0417_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_4702_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_4702_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_4702_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_4702_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_0417_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_4702_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_4702_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_4702_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_4702_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_0417_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_4702_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_4702_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c2_4702_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c2_4702_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_0417_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c2_4702_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c2_4702_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1067_c2_4702_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1067_c2_4702_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1072_c7_0417_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1067_c2_4702_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1067_c2_4702_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1068_c3_9e62_uxn_opcodes_h_l1068_c3_9e62_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_ff8f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_ff8f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_ff8f_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_0417_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_0417_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_0417_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1072_c7_0417_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1072_c7_0417_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1072_c7_0417_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_0417_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1073_c3_c9a0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_0417_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_0417_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_0417_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_0417_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_0417_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_0417_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_0417_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_0417_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_0417_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_0417_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_0417_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_0417_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_0417_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_0417_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_0417_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_0417_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_0417_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1072_c7_0417_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1072_c7_0417_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1072_c7_0417_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_d982_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_d982_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_d982_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_cde6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_cde6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_7882_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_cde6_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1075_c7_cde6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1075_c7_cde6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1080_c7_7882_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1075_c7_cde6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_cde6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1078_c3_fd1e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_cde6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_7882_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_cde6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_cde6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_cde6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_7882_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_cde6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_cde6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_cde6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_7882_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_cde6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_cde6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_cde6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_7882_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_cde6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_cde6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_cde6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_7882_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_cde6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1075_c7_cde6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1075_c7_cde6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_7882_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1075_c7_cde6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1075_c7_cde6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1075_c7_cde6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1080_c7_7882_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1075_c7_cde6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_bc2a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_bc2a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_bc2a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_7882_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_7882_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_7882_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1080_c7_7882_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1080_c7_7882_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1080_c7_7882_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_7882_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1082_c3_5df8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_7882_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_7882_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_7882_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_7882_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_7882_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_7882_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_7882_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_7882_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_7882_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_7882_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_7882_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_7882_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_7882_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_7882_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_7882_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_7882_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_7882_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1080_c7_7882_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1080_c7_7882_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1080_c7_7882_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1081_c3_1dcc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1081_c3_1dcc_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1081_c3_1dcc_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_d675_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_d675_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_d675_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_12ee_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_12ee_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_12ee_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1084_c7_12ee_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1084_c7_12ee_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1084_c7_12ee_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_12ee_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_12ee_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_12ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_12ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_12ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_12ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_12ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_12ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_12ee_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_12ee_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_12ee_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_12ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_12ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_12ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_12ee_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_12ee_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_12ee_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_12ee_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_c69c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_c69c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_c69c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1088_c7_8d56_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1088_c7_8d56_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1088_c7_8d56_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1088_c7_8d56_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1088_c7_8d56_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1088_c7_8d56_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_8d56_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1094_c3_b6eb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_8d56_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_69f8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_8d56_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_8d56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_8d56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_69f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_8d56_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_8d56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_8d56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_69f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_8d56_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_8d56_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_8d56_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_8d56_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_8d56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_8d56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_69f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_8d56_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1088_c7_8d56_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1088_c7_8d56_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1097_c7_69f8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1088_c7_8d56_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1089_c3_6da6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1089_c3_6da6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1089_c3_6da6_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1090_c11_a6bf_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1090_c11_a6bf_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1090_c11_a6bf_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1092_c30_8330_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1092_c30_8330_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1092_c30_8330_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1092_c30_8330_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1095_c21_2290_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_5985_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_5985_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_5985_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_69f8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1099_c3_86a5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_69f8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_69f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_69f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_69f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_bdeb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_69f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_69f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_69f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_bdeb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_69f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_69f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_69f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_69f8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1097_c7_69f8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1097_c7_69f8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1097_c7_69f8_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1100_c31_98d4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1100_c31_98d4_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1100_c21_5d2f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_9d23_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_9d23_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_9d23_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_bdeb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_bdeb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_bdeb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_bdeb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_bdeb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_bdeb_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1084_l1080_l1075_l1102_l1072_l1097_l1067_DUPLICATE_4f09_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1084_l1080_l1075_l1072_l1097_l1067_DUPLICATE_3279_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1084_l1080_l1075_l1072_l1067_l1088_DUPLICATE_87b4_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1084_l1080_l1075_l1072_l1097_l1067_DUPLICATE_8027_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1084_l1080_l1075_l1102_l1072_l1097_l1088_DUPLICATE_81dc_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1076_l1081_l1085_l1089_DUPLICATE_767b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1086_l1077_DUPLICATE_ef9a_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1086_l1077_DUPLICATE_ef9a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1084_l1097_DUPLICATE_f0b9_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l1107_l1063_DUPLICATE_b6cd_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_d982_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_bdeb_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_8d56_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_4702_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_69f8_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1099_c3_86a5 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_69f8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1099_c3_86a5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_9d23_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_d675_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1073_c3_c9a0 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_0417_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1073_c3_c9a0;
     VAR_sp_relative_shift_uxn_opcodes_h_l1092_c30_8330_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_bdeb_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1092_c30_8330_y := resize(to_signed(-2, 3), 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_f76e_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_5985_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1069_c3_4a56 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_4702_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1069_c3_4a56;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_8d56_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_0cc8_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1094_c3_b6eb := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_8d56_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1094_c3_b6eb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_bc2a_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1082_c3_5df8 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_7882_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1082_c3_5df8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_ff8f_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1078_c3_fd1e := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_cde6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1078_c3_fd1e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_c69c_right := to_unsigned(5, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_f76e_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1092_c30_8330_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1089_c3_6da6_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1067_c2_4702_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1072_c7_0417_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1075_c7_cde6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1080_c7_7882_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1088_c7_8d56_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_0cc8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_ff8f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_d982_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_bc2a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_d675_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_c69c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_5985_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_9d23_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1081_c3_1dcc_left := t16;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1090_c11_a6bf_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1067_c2_4702_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1072_c7_0417_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1080_c7_7882_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1100_c31_98d4_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_4702_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_0417_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_cde6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_7882_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_12ee_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1088_c7_8d56_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1080_c11_bc2a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1080_c11_bc2a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_bc2a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1080_c11_bc2a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_bc2a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_bc2a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1080_c11_bc2a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1097_c11_5985] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1097_c11_5985_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_5985_left;
     BIN_OP_EQ_uxn_opcodes_h_l1097_c11_5985_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_5985_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_5985_return_output := BIN_OP_EQ_uxn_opcodes_h_l1097_c11_5985_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1084_l1080_l1075_l1072_l1097_l1067_DUPLICATE_3279 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1084_l1080_l1075_l1072_l1097_l1067_DUPLICATE_3279_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1084_c11_d675] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1084_c11_d675_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_d675_left;
     BIN_OP_EQ_uxn_opcodes_h_l1084_c11_d675_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_d675_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_d675_return_output := BIN_OP_EQ_uxn_opcodes_h_l1084_c11_d675_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1084_l1080_l1075_l1102_l1072_l1097_l1067_DUPLICATE_4f09 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1084_l1080_l1075_l1102_l1072_l1097_l1067_DUPLICATE_4f09_return_output := result.is_stack_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1084_l1080_l1075_l1072_l1067_l1088_DUPLICATE_87b4 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1084_l1080_l1075_l1072_l1067_l1088_DUPLICATE_87b4_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1084_l1080_l1075_l1072_l1097_l1067_DUPLICATE_8027 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1084_l1080_l1075_l1072_l1097_l1067_DUPLICATE_8027_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1067_c6_0cc8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1067_c6_0cc8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_0cc8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1067_c6_0cc8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_0cc8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_0cc8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1067_c6_0cc8_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1084_l1097_DUPLICATE_f0b9 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1084_l1097_DUPLICATE_f0b9_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1102_c11_9d23] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1102_c11_9d23_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_9d23_left;
     BIN_OP_EQ_uxn_opcodes_h_l1102_c11_9d23_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_9d23_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_9d23_return_output := BIN_OP_EQ_uxn_opcodes_h_l1102_c11_9d23_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1072_c11_ff8f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1072_c11_ff8f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_ff8f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1072_c11_ff8f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_ff8f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_ff8f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1072_c11_ff8f_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1076_l1081_l1085_l1089_DUPLICATE_767b LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1076_l1081_l1085_l1089_DUPLICATE_767b_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_SR_8[uxn_opcodes_h_l1100_c31_98d4] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1100_c31_98d4_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1100_c31_98d4_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1100_c31_98d4_return_output := CONST_SR_8_uxn_opcodes_h_l1100_c31_98d4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1075_c11_d982] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1075_c11_d982_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_d982_left;
     BIN_OP_EQ_uxn_opcodes_h_l1075_c11_d982_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_d982_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_d982_return_output := BIN_OP_EQ_uxn_opcodes_h_l1075_c11_d982_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1084_l1080_l1075_l1102_l1072_l1097_l1088_DUPLICATE_81dc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1084_l1080_l1075_l1102_l1072_l1097_l1088_DUPLICATE_81dc_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1088_c11_c69c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1088_c11_c69c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_c69c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1088_c11_c69c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_c69c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_c69c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1088_c11_c69c_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1092_c30_8330] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1092_c30_8330_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1092_c30_8330_ins;
     sp_relative_shift_uxn_opcodes_h_l1092_c30_8330_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1092_c30_8330_x;
     sp_relative_shift_uxn_opcodes_h_l1092_c30_8330_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1092_c30_8330_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1092_c30_8330_return_output := sp_relative_shift_uxn_opcodes_h_l1092_c30_8330_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_f76e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_0cc8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1067_c2_4702_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_0cc8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_4702_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_0cc8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_4702_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_0cc8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_4702_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_0cc8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_4702_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_0cc8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_4702_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_0cc8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c2_4702_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_0cc8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1067_c2_4702_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_0cc8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_4702_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_0cc8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1072_c7_0417_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_ff8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_0417_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_ff8f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_0417_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_ff8f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_0417_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_ff8f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_0417_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_ff8f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_0417_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_ff8f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_0417_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_ff8f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1072_c7_0417_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_ff8f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_0417_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_ff8f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1075_c7_cde6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_d982_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_cde6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_d982_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_cde6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_d982_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_cde6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_d982_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_cde6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_d982_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_cde6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_d982_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1075_c7_cde6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_d982_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1075_c7_cde6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_d982_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_cde6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_d982_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1080_c7_7882_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_bc2a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_7882_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_bc2a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_7882_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_bc2a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_7882_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_bc2a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_7882_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_bc2a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_7882_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_bc2a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_7882_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_bc2a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1080_c7_7882_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_bc2a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_7882_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_bc2a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1084_c7_12ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_d675_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_12ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_d675_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_12ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_d675_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_12ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_d675_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_12ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_d675_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_12ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_d675_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_12ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_d675_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_12ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_d675_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1088_c7_8d56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_c69c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_8d56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_c69c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_8d56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_c69c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_8d56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_c69c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_8d56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_c69c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_8d56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_c69c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1088_c7_8d56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_c69c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1088_c7_8d56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_c69c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_69f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_5985_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_69f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_5985_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_69f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_5985_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_69f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_5985_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1097_c7_69f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_5985_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_bdeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_9d23_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_bdeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_9d23_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1081_c3_1dcc_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1076_l1081_l1085_l1089_DUPLICATE_767b_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1089_c3_6da6_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1076_l1081_l1085_l1089_DUPLICATE_767b_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1086_l1077_DUPLICATE_ef9a_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1076_l1081_l1085_l1089_DUPLICATE_767b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_4702_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1084_l1080_l1075_l1072_l1067_l1088_DUPLICATE_87b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_0417_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1084_l1080_l1075_l1072_l1067_l1088_DUPLICATE_87b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_cde6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1084_l1080_l1075_l1072_l1067_l1088_DUPLICATE_87b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_7882_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1084_l1080_l1075_l1072_l1067_l1088_DUPLICATE_87b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_12ee_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1084_l1080_l1075_l1072_l1067_l1088_DUPLICATE_87b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_8d56_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1084_l1080_l1075_l1072_l1067_l1088_DUPLICATE_87b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_0417_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1084_l1080_l1075_l1102_l1072_l1097_l1088_DUPLICATE_81dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_cde6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1084_l1080_l1075_l1102_l1072_l1097_l1088_DUPLICATE_81dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_7882_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1084_l1080_l1075_l1102_l1072_l1097_l1088_DUPLICATE_81dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_12ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1084_l1080_l1075_l1102_l1072_l1097_l1088_DUPLICATE_81dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_8d56_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1084_l1080_l1075_l1102_l1072_l1097_l1088_DUPLICATE_81dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_69f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1084_l1080_l1075_l1102_l1072_l1097_l1088_DUPLICATE_81dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_bdeb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1084_l1080_l1075_l1102_l1072_l1097_l1088_DUPLICATE_81dc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_4702_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1084_l1080_l1075_l1072_l1097_l1067_DUPLICATE_3279_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_0417_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1084_l1080_l1075_l1072_l1097_l1067_DUPLICATE_3279_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_cde6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1084_l1080_l1075_l1072_l1097_l1067_DUPLICATE_3279_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_7882_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1084_l1080_l1075_l1072_l1097_l1067_DUPLICATE_3279_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_12ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1084_l1080_l1075_l1072_l1097_l1067_DUPLICATE_3279_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_69f8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1084_l1080_l1075_l1072_l1097_l1067_DUPLICATE_3279_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_4702_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1084_l1080_l1075_l1102_l1072_l1097_l1067_DUPLICATE_4f09_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_0417_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1084_l1080_l1075_l1102_l1072_l1097_l1067_DUPLICATE_4f09_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_cde6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1084_l1080_l1075_l1102_l1072_l1097_l1067_DUPLICATE_4f09_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_7882_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1084_l1080_l1075_l1102_l1072_l1097_l1067_DUPLICATE_4f09_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_12ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1084_l1080_l1075_l1102_l1072_l1097_l1067_DUPLICATE_4f09_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_69f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1084_l1080_l1075_l1102_l1072_l1097_l1067_DUPLICATE_4f09_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_bdeb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1084_l1080_l1075_l1102_l1072_l1097_l1067_DUPLICATE_4f09_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_12ee_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1084_l1097_DUPLICATE_f0b9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_69f8_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1084_l1097_DUPLICATE_f0b9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c2_4702_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1084_l1080_l1075_l1072_l1097_l1067_DUPLICATE_8027_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_0417_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1084_l1080_l1075_l1072_l1097_l1067_DUPLICATE_8027_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1075_c7_cde6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1084_l1080_l1075_l1072_l1097_l1067_DUPLICATE_8027_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_7882_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1084_l1080_l1075_l1072_l1097_l1067_DUPLICATE_8027_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_12ee_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1084_l1080_l1075_l1072_l1097_l1067_DUPLICATE_8027_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1097_c7_69f8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1084_l1080_l1075_l1072_l1097_l1067_DUPLICATE_8027_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_8d56_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1092_c30_8330_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1089_c3_6da6] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1089_c3_6da6_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1089_c3_6da6_left;
     BIN_OP_OR_uxn_opcodes_h_l1089_c3_6da6_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1089_c3_6da6_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1089_c3_6da6_return_output := BIN_OP_OR_uxn_opcodes_h_l1089_c3_6da6_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1086_l1077_DUPLICATE_ef9a LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1086_l1077_DUPLICATE_ef9a_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1086_l1077_DUPLICATE_ef9a_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1086_l1077_DUPLICATE_ef9a_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1086_l1077_DUPLICATE_ef9a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1097_c7_69f8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_69f8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_69f8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_69f8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_69f8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_69f8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_69f8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_69f8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_69f8_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1100_c21_5d2f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1100_c21_5d2f_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1100_c31_98d4_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1088_c7_8d56] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_8d56_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_8d56_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_8d56_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_8d56_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_8d56_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_8d56_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1067_c1_f76e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_f76e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_f76e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_f76e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_f76e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_f76e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_f76e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_f76e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_f76e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1102_c7_bdeb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_bdeb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_bdeb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_bdeb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_bdeb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_bdeb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_bdeb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_bdeb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_bdeb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1097_c7_69f8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_69f8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_69f8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_69f8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_69f8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_69f8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_69f8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_69f8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_69f8_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1081_c3_1dcc] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1081_c3_1dcc_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1081_c3_1dcc_left;
     BIN_OP_OR_uxn_opcodes_h_l1081_c3_1dcc_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1081_c3_1dcc_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1081_c3_1dcc_return_output := BIN_OP_OR_uxn_opcodes_h_l1081_c3_1dcc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1102_c7_bdeb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_bdeb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_bdeb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_bdeb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_bdeb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_bdeb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_bdeb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_bdeb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_bdeb_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1080_c7_7882_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1081_c3_1dcc_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1090_c11_a6bf_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1089_c3_6da6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1088_c7_8d56_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1089_c3_6da6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1097_c7_69f8_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1100_c21_5d2f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1084_c7_12ee_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1086_l1077_DUPLICATE_ef9a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1075_c7_cde6_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1086_l1077_DUPLICATE_ef9a_return_output;
     VAR_printf_uxn_opcodes_h_l1068_c3_9e62_uxn_opcodes_h_l1068_c3_9e62_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_f76e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_69f8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_bdeb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_8d56_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_69f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_69f8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_bdeb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_12ee_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_8d56_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_69f8_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1097_c7_69f8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1097_c7_69f8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1097_c7_69f8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1097_c7_69f8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1097_c7_69f8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1097_c7_69f8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1097_c7_69f8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1097_c7_69f8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1097_c7_69f8_return_output;

     -- BIN_OP_XOR[uxn_opcodes_h_l1090_c11_a6bf] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l1090_c11_a6bf_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1090_c11_a6bf_left;
     BIN_OP_XOR_uxn_opcodes_h_l1090_c11_a6bf_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1090_c11_a6bf_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1090_c11_a6bf_return_output := BIN_OP_XOR_uxn_opcodes_h_l1090_c11_a6bf_return_output;

     -- t16_MUX[uxn_opcodes_h_l1080_c7_7882] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1080_c7_7882_cond <= VAR_t16_MUX_uxn_opcodes_h_l1080_c7_7882_cond;
     t16_MUX_uxn_opcodes_h_l1080_c7_7882_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1080_c7_7882_iftrue;
     t16_MUX_uxn_opcodes_h_l1080_c7_7882_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1080_c7_7882_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1080_c7_7882_return_output := t16_MUX_uxn_opcodes_h_l1080_c7_7882_return_output;

     -- n16_MUX[uxn_opcodes_h_l1088_c7_8d56] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1088_c7_8d56_cond <= VAR_n16_MUX_uxn_opcodes_h_l1088_c7_8d56_cond;
     n16_MUX_uxn_opcodes_h_l1088_c7_8d56_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1088_c7_8d56_iftrue;
     n16_MUX_uxn_opcodes_h_l1088_c7_8d56_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1088_c7_8d56_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output := n16_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output;

     -- printf_uxn_opcodes_h_l1068_c3_9e62[uxn_opcodes_h_l1068_c3_9e62] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1068_c3_9e62_uxn_opcodes_h_l1068_c3_9e62_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1068_c3_9e62_uxn_opcodes_h_l1068_c3_9e62_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1097_c7_69f8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_69f8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_69f8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_69f8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_69f8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_69f8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_69f8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_69f8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_69f8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1088_c7_8d56] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_8d56_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_8d56_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_8d56_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_8d56_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_8d56_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_8d56_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1097_c7_69f8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_69f8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_69f8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_69f8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_69f8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_69f8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_69f8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_69f8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_69f8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1084_c7_12ee] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_12ee_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_12ee_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_12ee_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_12ee_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_12ee_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_12ee_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1088_c7_8d56] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_8d56_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_8d56_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_8d56_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_8d56_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_8d56_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_8d56_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1088_c7_8d56_iftrue := VAR_BIN_OP_XOR_uxn_opcodes_h_l1090_c11_a6bf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1084_c7_12ee_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_8d56_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_69f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_12ee_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_8d56_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_69f8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_7882_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_12ee_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1088_c7_8d56_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1097_c7_69f8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1075_c7_cde6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1080_c7_7882_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1088_c7_8d56] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_8d56_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_8d56_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_8d56_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_8d56_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_8d56_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_8d56_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output;

     -- t16_MUX[uxn_opcodes_h_l1075_c7_cde6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1075_c7_cde6_cond <= VAR_t16_MUX_uxn_opcodes_h_l1075_c7_cde6_cond;
     t16_MUX_uxn_opcodes_h_l1075_c7_cde6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1075_c7_cde6_iftrue;
     t16_MUX_uxn_opcodes_h_l1075_c7_cde6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1075_c7_cde6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output := t16_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1088_c7_8d56] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1088_c7_8d56_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1088_c7_8d56_cond;
     tmp16_MUX_uxn_opcodes_h_l1088_c7_8d56_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1088_c7_8d56_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1088_c7_8d56_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1088_c7_8d56_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output := tmp16_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1084_c7_12ee] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_12ee_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_12ee_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_12ee_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_12ee_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_12ee_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_12ee_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1084_c7_12ee] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_12ee_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_12ee_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_12ee_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_12ee_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_12ee_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_12ee_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1088_c7_8d56] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_8d56_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_8d56_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_8d56_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_8d56_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_8d56_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_8d56_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output;

     -- n16_MUX[uxn_opcodes_h_l1084_c7_12ee] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1084_c7_12ee_cond <= VAR_n16_MUX_uxn_opcodes_h_l1084_c7_12ee_cond;
     n16_MUX_uxn_opcodes_h_l1084_c7_12ee_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1084_c7_12ee_iftrue;
     n16_MUX_uxn_opcodes_h_l1084_c7_12ee_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1084_c7_12ee_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output := n16_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1080_c7_7882] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_7882_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_7882_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_7882_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_7882_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_7882_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_7882_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_7882_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_7882_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1095_c21_2290] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1095_c21_2290_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1090_c11_a6bf_return_output);

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1088_c7_8d56_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1095_c21_2290_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1080_c7_7882_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_12ee_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_7882_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_12ee_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_cde6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_7882_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_7882_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1072_c7_0417_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_12ee_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1080_c7_7882] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_7882_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_7882_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_7882_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_7882_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_7882_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_7882_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_7882_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_7882_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1084_c7_12ee] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1084_c7_12ee_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_12ee_cond;
     tmp16_MUX_uxn_opcodes_h_l1084_c7_12ee_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_12ee_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1084_c7_12ee_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_12ee_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output := tmp16_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1084_c7_12ee] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_12ee_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_12ee_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_12ee_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_12ee_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_12ee_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_12ee_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output;

     -- n16_MUX[uxn_opcodes_h_l1080_c7_7882] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1080_c7_7882_cond <= VAR_n16_MUX_uxn_opcodes_h_l1080_c7_7882_cond;
     n16_MUX_uxn_opcodes_h_l1080_c7_7882_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1080_c7_7882_iftrue;
     n16_MUX_uxn_opcodes_h_l1080_c7_7882_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1080_c7_7882_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1080_c7_7882_return_output := n16_MUX_uxn_opcodes_h_l1080_c7_7882_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1084_c7_12ee] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_12ee_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_12ee_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_12ee_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_12ee_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_12ee_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_12ee_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1075_c7_cde6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_cde6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_cde6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_cde6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_cde6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_cde6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_cde6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1080_c7_7882] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_7882_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_7882_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_7882_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_7882_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_7882_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_7882_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_7882_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_7882_return_output;

     -- t16_MUX[uxn_opcodes_h_l1072_c7_0417] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1072_c7_0417_cond <= VAR_t16_MUX_uxn_opcodes_h_l1072_c7_0417_cond;
     t16_MUX_uxn_opcodes_h_l1072_c7_0417_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1072_c7_0417_iftrue;
     t16_MUX_uxn_opcodes_h_l1072_c7_0417_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1072_c7_0417_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1072_c7_0417_return_output := t16_MUX_uxn_opcodes_h_l1072_c7_0417_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1088_c7_8d56] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1088_c7_8d56_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1088_c7_8d56_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1088_c7_8d56_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1088_c7_8d56_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1088_c7_8d56_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1088_c7_8d56_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output := result_u8_value_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1075_c7_cde6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1080_c7_7882_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_7882_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_cde6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_7882_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_7882_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_0417_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_cde6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_7882_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_12ee_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1088_c7_8d56_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1067_c2_4702_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1072_c7_0417_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_7882_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output;
     -- t16_MUX[uxn_opcodes_h_l1067_c2_4702] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1067_c2_4702_cond <= VAR_t16_MUX_uxn_opcodes_h_l1067_c2_4702_cond;
     t16_MUX_uxn_opcodes_h_l1067_c2_4702_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1067_c2_4702_iftrue;
     t16_MUX_uxn_opcodes_h_l1067_c2_4702_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1067_c2_4702_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1067_c2_4702_return_output := t16_MUX_uxn_opcodes_h_l1067_c2_4702_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1075_c7_cde6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_cde6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_cde6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_cde6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_cde6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_cde6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_cde6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output;

     -- n16_MUX[uxn_opcodes_h_l1075_c7_cde6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1075_c7_cde6_cond <= VAR_n16_MUX_uxn_opcodes_h_l1075_c7_cde6_cond;
     n16_MUX_uxn_opcodes_h_l1075_c7_cde6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1075_c7_cde6_iftrue;
     n16_MUX_uxn_opcodes_h_l1075_c7_cde6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1075_c7_cde6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output := n16_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1080_c7_7882] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_7882_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_7882_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_7882_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_7882_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_7882_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_7882_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_7882_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_7882_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1080_c7_7882] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1080_c7_7882_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_7882_cond;
     tmp16_MUX_uxn_opcodes_h_l1080_c7_7882_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_7882_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1080_c7_7882_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_7882_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_7882_return_output := tmp16_MUX_uxn_opcodes_h_l1080_c7_7882_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1075_c7_cde6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_cde6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_cde6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_cde6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_cde6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_cde6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_cde6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1080_c7_7882] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_7882_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_7882_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_7882_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_7882_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_7882_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_7882_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_7882_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_7882_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1084_c7_12ee] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1084_c7_12ee_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_12ee_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1084_c7_12ee_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_12ee_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1084_c7_12ee_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_12ee_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output := result_u8_value_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1072_c7_0417] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_0417_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_0417_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_0417_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_0417_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_0417_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_0417_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_0417_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_0417_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1072_c7_0417_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_cde6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_7882_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_0417_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_cde6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_7882_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_4702_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_0417_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_0417_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_7882_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_12ee_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1067_c2_4702_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_cde6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_7882_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1075_c7_cde6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_cde6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_cde6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_cde6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_cde6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_cde6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_cde6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output;

     -- n16_MUX[uxn_opcodes_h_l1072_c7_0417] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1072_c7_0417_cond <= VAR_n16_MUX_uxn_opcodes_h_l1072_c7_0417_cond;
     n16_MUX_uxn_opcodes_h_l1072_c7_0417_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1072_c7_0417_iftrue;
     n16_MUX_uxn_opcodes_h_l1072_c7_0417_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1072_c7_0417_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1072_c7_0417_return_output := n16_MUX_uxn_opcodes_h_l1072_c7_0417_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1067_c2_4702] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_4702_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_4702_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_4702_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_4702_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_4702_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_4702_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_4702_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_4702_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1075_c7_cde6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1075_c7_cde6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_cde6_cond;
     tmp16_MUX_uxn_opcodes_h_l1075_c7_cde6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_cde6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1075_c7_cde6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_cde6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output := tmp16_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1080_c7_7882] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1080_c7_7882_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_7882_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1080_c7_7882_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_7882_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1080_c7_7882_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_7882_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_7882_return_output := result_u8_value_MUX_uxn_opcodes_h_l1080_c7_7882_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1075_c7_cde6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_cde6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_cde6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_cde6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_cde6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_cde6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_cde6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1072_c7_0417] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_0417_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_0417_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_0417_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_0417_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_0417_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_0417_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_0417_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_0417_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1072_c7_0417] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_0417_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_0417_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_0417_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_0417_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_0417_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_0417_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_0417_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_0417_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1067_c2_4702_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1072_c7_0417_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_0417_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_4702_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_0417_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_0417_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_4702_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_0417_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1075_c7_cde6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_7882_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_0417_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1072_c7_0417] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1072_c7_0417_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_0417_cond;
     tmp16_MUX_uxn_opcodes_h_l1072_c7_0417_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_0417_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1072_c7_0417_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_0417_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_0417_return_output := tmp16_MUX_uxn_opcodes_h_l1072_c7_0417_return_output;

     -- n16_MUX[uxn_opcodes_h_l1067_c2_4702] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1067_c2_4702_cond <= VAR_n16_MUX_uxn_opcodes_h_l1067_c2_4702_cond;
     n16_MUX_uxn_opcodes_h_l1067_c2_4702_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1067_c2_4702_iftrue;
     n16_MUX_uxn_opcodes_h_l1067_c2_4702_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1067_c2_4702_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1067_c2_4702_return_output := n16_MUX_uxn_opcodes_h_l1067_c2_4702_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1072_c7_0417] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_0417_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_0417_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_0417_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_0417_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_0417_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_0417_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_0417_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_0417_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1072_c7_0417] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_0417_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_0417_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_0417_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_0417_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_0417_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_0417_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_0417_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_0417_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1075_c7_cde6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1075_c7_cde6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1075_c7_cde6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1075_c7_cde6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1075_c7_cde6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1075_c7_cde6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1075_c7_cde6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output := result_u8_value_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1067_c2_4702] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_4702_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_4702_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_4702_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_4702_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_4702_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_4702_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_4702_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_4702_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1067_c2_4702] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_4702_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_4702_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_4702_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_4702_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_4702_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_4702_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_4702_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_4702_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1067_c2_4702_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_4702_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_0417_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_4702_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_0417_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_0417_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1075_c7_cde6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_4702_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_0417_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1067_c2_4702] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_4702_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_4702_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_4702_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_4702_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_4702_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_4702_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_4702_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_4702_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1072_c7_0417] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1072_c7_0417_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_0417_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1072_c7_0417_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_0417_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1072_c7_0417_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_0417_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_0417_return_output := result_u8_value_MUX_uxn_opcodes_h_l1072_c7_0417_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1067_c2_4702] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1067_c2_4702_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_4702_cond;
     tmp16_MUX_uxn_opcodes_h_l1067_c2_4702_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_4702_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1067_c2_4702_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_4702_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_4702_return_output := tmp16_MUX_uxn_opcodes_h_l1067_c2_4702_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1067_c2_4702] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_4702_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_4702_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_4702_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_4702_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_4702_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_4702_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_4702_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_4702_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c2_4702_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_0417_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_4702_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1067_c2_4702] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1067_c2_4702_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c2_4702_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1067_c2_4702_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c2_4702_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1067_c2_4702_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c2_4702_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c2_4702_return_output := result_u8_value_MUX_uxn_opcodes_h_l1067_c2_4702_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l1107_l1063_DUPLICATE_b6cd LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l1107_l1063_DUPLICATE_b6cd_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4e73(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_4702_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_4702_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_4702_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_4702_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_4702_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c2_4702_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l1107_l1063_DUPLICATE_b6cd_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l1107_l1063_DUPLICATE_b6cd_return_output;
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
