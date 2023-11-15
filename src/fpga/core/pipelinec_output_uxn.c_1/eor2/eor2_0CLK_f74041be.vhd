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
-- BIN_OP_EQ[uxn_opcodes_h_l1059_c6_6db4]
signal BIN_OP_EQ_uxn_opcodes_h_l1059_c6_6db4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1059_c6_6db4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1059_c6_6db4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1059_c1_87e0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_87e0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_87e0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_87e0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_87e0_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1059_c2_7091]
signal n16_MUX_uxn_opcodes_h_l1059_c2_7091_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1059_c2_7091_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1059_c2_7091_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1059_c2_7091_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1059_c2_7091]
signal tmp16_MUX_uxn_opcodes_h_l1059_c2_7091_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1059_c2_7091_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1059_c2_7091_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1059_c2_7091_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1059_c2_7091]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1059_c2_7091_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1059_c2_7091_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1059_c2_7091_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1059_c2_7091_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1059_c2_7091]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c2_7091_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c2_7091_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c2_7091_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c2_7091_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1059_c2_7091]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c2_7091_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c2_7091_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c2_7091_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c2_7091_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1059_c2_7091]
signal result_u8_value_MUX_uxn_opcodes_h_l1059_c2_7091_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1059_c2_7091_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1059_c2_7091_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1059_c2_7091_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1059_c2_7091]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1059_c2_7091_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1059_c2_7091_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1059_c2_7091_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1059_c2_7091_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1059_c2_7091]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1059_c2_7091_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1059_c2_7091_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1059_c2_7091_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1059_c2_7091_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1059_c2_7091]
signal t16_MUX_uxn_opcodes_h_l1059_c2_7091_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1059_c2_7091_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1059_c2_7091_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1059_c2_7091_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1060_c3_8804[uxn_opcodes_h_l1060_c3_8804]
signal printf_uxn_opcodes_h_l1060_c3_8804_uxn_opcodes_h_l1060_c3_8804_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1064_c11_76d2]
signal BIN_OP_EQ_uxn_opcodes_h_l1064_c11_76d2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1064_c11_76d2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1064_c11_76d2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1064_c7_9c09]
signal n16_MUX_uxn_opcodes_h_l1064_c7_9c09_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1064_c7_9c09_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1064_c7_9c09_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1064_c7_9c09]
signal tmp16_MUX_uxn_opcodes_h_l1064_c7_9c09_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1064_c7_9c09_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1064_c7_9c09_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1064_c7_9c09]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_9c09_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_9c09_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_9c09_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1064_c7_9c09]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_9c09_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_9c09_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_9c09_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1064_c7_9c09]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_9c09_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_9c09_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_9c09_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1064_c7_9c09]
signal result_u8_value_MUX_uxn_opcodes_h_l1064_c7_9c09_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1064_c7_9c09_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1064_c7_9c09_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1064_c7_9c09]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_9c09_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_9c09_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_9c09_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1064_c7_9c09]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1064_c7_9c09_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1064_c7_9c09_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1064_c7_9c09_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1064_c7_9c09]
signal t16_MUX_uxn_opcodes_h_l1064_c7_9c09_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1064_c7_9c09_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1064_c7_9c09_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1067_c11_506f]
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c11_506f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c11_506f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c11_506f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1067_c7_1992]
signal n16_MUX_uxn_opcodes_h_l1067_c7_1992_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1067_c7_1992_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1067_c7_1992_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1067_c7_1992_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1067_c7_1992]
signal tmp16_MUX_uxn_opcodes_h_l1067_c7_1992_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1067_c7_1992_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1067_c7_1992_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1067_c7_1992_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1067_c7_1992]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_1992_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_1992_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_1992_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_1992_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1067_c7_1992]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_1992_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_1992_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_1992_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_1992_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1067_c7_1992]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_1992_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_1992_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_1992_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_1992_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1067_c7_1992]
signal result_u8_value_MUX_uxn_opcodes_h_l1067_c7_1992_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1067_c7_1992_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1067_c7_1992_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1067_c7_1992_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1067_c7_1992]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_1992_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_1992_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_1992_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_1992_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1067_c7_1992]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_1992_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_1992_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_1992_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_1992_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1067_c7_1992]
signal t16_MUX_uxn_opcodes_h_l1067_c7_1992_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1067_c7_1992_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1067_c7_1992_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1067_c7_1992_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1072_c11_b711]
signal BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b711_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b711_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b711_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1072_c7_1814]
signal n16_MUX_uxn_opcodes_h_l1072_c7_1814_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1072_c7_1814_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1072_c7_1814_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1072_c7_1814_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1072_c7_1814]
signal tmp16_MUX_uxn_opcodes_h_l1072_c7_1814_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1072_c7_1814_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1072_c7_1814_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1072_c7_1814_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1072_c7_1814]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_1814_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_1814_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_1814_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_1814_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1072_c7_1814]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_1814_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_1814_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_1814_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_1814_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1072_c7_1814]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_1814_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_1814_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_1814_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_1814_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1072_c7_1814]
signal result_u8_value_MUX_uxn_opcodes_h_l1072_c7_1814_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1072_c7_1814_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1072_c7_1814_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1072_c7_1814_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1072_c7_1814]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_1814_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_1814_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_1814_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_1814_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1072_c7_1814]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_1814_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_1814_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_1814_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_1814_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1072_c7_1814]
signal t16_MUX_uxn_opcodes_h_l1072_c7_1814_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1072_c7_1814_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1072_c7_1814_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1072_c7_1814_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1073_c3_32d1]
signal BIN_OP_OR_uxn_opcodes_h_l1073_c3_32d1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1073_c3_32d1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1073_c3_32d1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1076_c11_02ed]
signal BIN_OP_EQ_uxn_opcodes_h_l1076_c11_02ed_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1076_c11_02ed_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1076_c11_02ed_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1076_c7_e4e3]
signal n16_MUX_uxn_opcodes_h_l1076_c7_e4e3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1076_c7_e4e3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1076_c7_e4e3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1076_c7_e4e3]
signal tmp16_MUX_uxn_opcodes_h_l1076_c7_e4e3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1076_c7_e4e3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1076_c7_e4e3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1076_c7_e4e3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1076_c7_e4e3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1076_c7_e4e3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1076_c7_e4e3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1076_c7_e4e3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c7_e4e3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c7_e4e3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c7_e4e3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1076_c7_e4e3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c7_e4e3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c7_e4e3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c7_e4e3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1076_c7_e4e3]
signal result_u8_value_MUX_uxn_opcodes_h_l1076_c7_e4e3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1076_c7_e4e3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1076_c7_e4e3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1076_c7_e4e3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1076_c7_e4e3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1076_c7_e4e3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1076_c7_e4e3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1076_c7_e4e3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c7_e4e3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c7_e4e3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c7_e4e3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1080_c11_617e]
signal BIN_OP_EQ_uxn_opcodes_h_l1080_c11_617e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1080_c11_617e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1080_c11_617e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1080_c7_b42e]
signal n16_MUX_uxn_opcodes_h_l1080_c7_b42e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1080_c7_b42e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1080_c7_b42e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1080_c7_b42e]
signal tmp16_MUX_uxn_opcodes_h_l1080_c7_b42e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1080_c7_b42e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1080_c7_b42e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1080_c7_b42e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_b42e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_b42e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_b42e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1080_c7_b42e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_b42e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_b42e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_b42e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1080_c7_b42e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_b42e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_b42e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_b42e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1080_c7_b42e]
signal result_u8_value_MUX_uxn_opcodes_h_l1080_c7_b42e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1080_c7_b42e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1080_c7_b42e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1080_c7_b42e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_b42e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_b42e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_b42e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1080_c7_b42e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_b42e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_b42e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_b42e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1081_c3_9348]
signal BIN_OP_OR_uxn_opcodes_h_l1081_c3_9348_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1081_c3_9348_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1081_c3_9348_return_output : unsigned(15 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l1082_c11_50b3]
signal BIN_OP_XOR_uxn_opcodes_h_l1082_c11_50b3_left : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1082_c11_50b3_right : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1082_c11_50b3_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1084_c30_e856]
signal sp_relative_shift_uxn_opcodes_h_l1084_c30_e856_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1084_c30_e856_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1084_c30_e856_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1084_c30_e856_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1089_c11_47d3]
signal BIN_OP_EQ_uxn_opcodes_h_l1089_c11_47d3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1089_c11_47d3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1089_c11_47d3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1089_c7_2160]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_2160_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_2160_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_2160_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_2160_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1089_c7_2160]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_2160_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_2160_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_2160_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_2160_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1089_c7_2160]
signal result_u8_value_MUX_uxn_opcodes_h_l1089_c7_2160_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1089_c7_2160_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1089_c7_2160_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1089_c7_2160_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1089_c7_2160]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_2160_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_2160_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_2160_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_2160_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1089_c7_2160]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_2160_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_2160_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_2160_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_2160_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1092_c31_c1a5]
signal CONST_SR_8_uxn_opcodes_h_l1092_c31_c1a5_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1092_c31_c1a5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1094_c11_8e75]
signal BIN_OP_EQ_uxn_opcodes_h_l1094_c11_8e75_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1094_c11_8e75_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1094_c11_8e75_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1094_c7_1743]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1094_c7_1743_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1094_c7_1743_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1094_c7_1743_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1094_c7_1743_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1094_c7_1743]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1094_c7_1743_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1094_c7_1743_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1094_c7_1743_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1094_c7_1743_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1069_l1078_DUPLICATE_2d68
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1069_l1078_DUPLICATE_2d68_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1069_l1078_DUPLICATE_2d68_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_c551( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.is_sp_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1059_c6_6db4
BIN_OP_EQ_uxn_opcodes_h_l1059_c6_6db4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1059_c6_6db4_left,
BIN_OP_EQ_uxn_opcodes_h_l1059_c6_6db4_right,
BIN_OP_EQ_uxn_opcodes_h_l1059_c6_6db4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_87e0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_87e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_87e0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_87e0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_87e0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_87e0_return_output);

-- n16_MUX_uxn_opcodes_h_l1059_c2_7091
n16_MUX_uxn_opcodes_h_l1059_c2_7091 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1059_c2_7091_cond,
n16_MUX_uxn_opcodes_h_l1059_c2_7091_iftrue,
n16_MUX_uxn_opcodes_h_l1059_c2_7091_iffalse,
n16_MUX_uxn_opcodes_h_l1059_c2_7091_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1059_c2_7091
tmp16_MUX_uxn_opcodes_h_l1059_c2_7091 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1059_c2_7091_cond,
tmp16_MUX_uxn_opcodes_h_l1059_c2_7091_iftrue,
tmp16_MUX_uxn_opcodes_h_l1059_c2_7091_iffalse,
tmp16_MUX_uxn_opcodes_h_l1059_c2_7091_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1059_c2_7091
result_is_stack_write_MUX_uxn_opcodes_h_l1059_c2_7091 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1059_c2_7091_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1059_c2_7091_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1059_c2_7091_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1059_c2_7091_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c2_7091
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c2_7091 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c2_7091_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c2_7091_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c2_7091_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c2_7091_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c2_7091
result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c2_7091 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c2_7091_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c2_7091_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c2_7091_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c2_7091_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1059_c2_7091
result_u8_value_MUX_uxn_opcodes_h_l1059_c2_7091 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1059_c2_7091_cond,
result_u8_value_MUX_uxn_opcodes_h_l1059_c2_7091_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1059_c2_7091_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1059_c2_7091_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1059_c2_7091
result_is_opc_done_MUX_uxn_opcodes_h_l1059_c2_7091 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1059_c2_7091_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1059_c2_7091_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1059_c2_7091_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1059_c2_7091_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1059_c2_7091
result_is_sp_shift_MUX_uxn_opcodes_h_l1059_c2_7091 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1059_c2_7091_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1059_c2_7091_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1059_c2_7091_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1059_c2_7091_return_output);

-- t16_MUX_uxn_opcodes_h_l1059_c2_7091
t16_MUX_uxn_opcodes_h_l1059_c2_7091 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1059_c2_7091_cond,
t16_MUX_uxn_opcodes_h_l1059_c2_7091_iftrue,
t16_MUX_uxn_opcodes_h_l1059_c2_7091_iffalse,
t16_MUX_uxn_opcodes_h_l1059_c2_7091_return_output);

-- printf_uxn_opcodes_h_l1060_c3_8804_uxn_opcodes_h_l1060_c3_8804
printf_uxn_opcodes_h_l1060_c3_8804_uxn_opcodes_h_l1060_c3_8804 : entity work.printf_uxn_opcodes_h_l1060_c3_8804_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1060_c3_8804_uxn_opcodes_h_l1060_c3_8804_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1064_c11_76d2
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_76d2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_76d2_left,
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_76d2_right,
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_76d2_return_output);

-- n16_MUX_uxn_opcodes_h_l1064_c7_9c09
n16_MUX_uxn_opcodes_h_l1064_c7_9c09 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1064_c7_9c09_cond,
n16_MUX_uxn_opcodes_h_l1064_c7_9c09_iftrue,
n16_MUX_uxn_opcodes_h_l1064_c7_9c09_iffalse,
n16_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1064_c7_9c09
tmp16_MUX_uxn_opcodes_h_l1064_c7_9c09 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1064_c7_9c09_cond,
tmp16_MUX_uxn_opcodes_h_l1064_c7_9c09_iftrue,
tmp16_MUX_uxn_opcodes_h_l1064_c7_9c09_iffalse,
tmp16_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_9c09
result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_9c09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_9c09_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_9c09_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_9c09_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_9c09
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_9c09 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_9c09_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_9c09_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_9c09_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_9c09
result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_9c09 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_9c09_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_9c09_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_9c09_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1064_c7_9c09
result_u8_value_MUX_uxn_opcodes_h_l1064_c7_9c09 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1064_c7_9c09_cond,
result_u8_value_MUX_uxn_opcodes_h_l1064_c7_9c09_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1064_c7_9c09_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_9c09
result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_9c09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_9c09_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_9c09_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_9c09_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1064_c7_9c09
result_is_sp_shift_MUX_uxn_opcodes_h_l1064_c7_9c09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1064_c7_9c09_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1064_c7_9c09_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1064_c7_9c09_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output);

-- t16_MUX_uxn_opcodes_h_l1064_c7_9c09
t16_MUX_uxn_opcodes_h_l1064_c7_9c09 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1064_c7_9c09_cond,
t16_MUX_uxn_opcodes_h_l1064_c7_9c09_iftrue,
t16_MUX_uxn_opcodes_h_l1064_c7_9c09_iffalse,
t16_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1067_c11_506f
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_506f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_506f_left,
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_506f_right,
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_506f_return_output);

-- n16_MUX_uxn_opcodes_h_l1067_c7_1992
n16_MUX_uxn_opcodes_h_l1067_c7_1992 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1067_c7_1992_cond,
n16_MUX_uxn_opcodes_h_l1067_c7_1992_iftrue,
n16_MUX_uxn_opcodes_h_l1067_c7_1992_iffalse,
n16_MUX_uxn_opcodes_h_l1067_c7_1992_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1067_c7_1992
tmp16_MUX_uxn_opcodes_h_l1067_c7_1992 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1067_c7_1992_cond,
tmp16_MUX_uxn_opcodes_h_l1067_c7_1992_iftrue,
tmp16_MUX_uxn_opcodes_h_l1067_c7_1992_iffalse,
tmp16_MUX_uxn_opcodes_h_l1067_c7_1992_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_1992
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_1992 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_1992_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_1992_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_1992_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_1992_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_1992
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_1992 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_1992_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_1992_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_1992_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_1992_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_1992
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_1992 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_1992_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_1992_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_1992_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_1992_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1067_c7_1992
result_u8_value_MUX_uxn_opcodes_h_l1067_c7_1992 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1067_c7_1992_cond,
result_u8_value_MUX_uxn_opcodes_h_l1067_c7_1992_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1067_c7_1992_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1067_c7_1992_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_1992
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_1992 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_1992_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_1992_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_1992_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_1992_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_1992
result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_1992 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_1992_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_1992_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_1992_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_1992_return_output);

-- t16_MUX_uxn_opcodes_h_l1067_c7_1992
t16_MUX_uxn_opcodes_h_l1067_c7_1992 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1067_c7_1992_cond,
t16_MUX_uxn_opcodes_h_l1067_c7_1992_iftrue,
t16_MUX_uxn_opcodes_h_l1067_c7_1992_iffalse,
t16_MUX_uxn_opcodes_h_l1067_c7_1992_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b711
BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b711 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b711_left,
BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b711_right,
BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b711_return_output);

-- n16_MUX_uxn_opcodes_h_l1072_c7_1814
n16_MUX_uxn_opcodes_h_l1072_c7_1814 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1072_c7_1814_cond,
n16_MUX_uxn_opcodes_h_l1072_c7_1814_iftrue,
n16_MUX_uxn_opcodes_h_l1072_c7_1814_iffalse,
n16_MUX_uxn_opcodes_h_l1072_c7_1814_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1072_c7_1814
tmp16_MUX_uxn_opcodes_h_l1072_c7_1814 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1072_c7_1814_cond,
tmp16_MUX_uxn_opcodes_h_l1072_c7_1814_iftrue,
tmp16_MUX_uxn_opcodes_h_l1072_c7_1814_iffalse,
tmp16_MUX_uxn_opcodes_h_l1072_c7_1814_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_1814
result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_1814 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_1814_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_1814_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_1814_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_1814_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_1814
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_1814 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_1814_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_1814_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_1814_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_1814_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_1814
result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_1814 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_1814_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_1814_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_1814_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_1814_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1072_c7_1814
result_u8_value_MUX_uxn_opcodes_h_l1072_c7_1814 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1072_c7_1814_cond,
result_u8_value_MUX_uxn_opcodes_h_l1072_c7_1814_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1072_c7_1814_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1072_c7_1814_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_1814
result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_1814 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_1814_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_1814_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_1814_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_1814_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_1814
result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_1814 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_1814_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_1814_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_1814_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_1814_return_output);

-- t16_MUX_uxn_opcodes_h_l1072_c7_1814
t16_MUX_uxn_opcodes_h_l1072_c7_1814 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1072_c7_1814_cond,
t16_MUX_uxn_opcodes_h_l1072_c7_1814_iftrue,
t16_MUX_uxn_opcodes_h_l1072_c7_1814_iffalse,
t16_MUX_uxn_opcodes_h_l1072_c7_1814_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1073_c3_32d1
BIN_OP_OR_uxn_opcodes_h_l1073_c3_32d1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1073_c3_32d1_left,
BIN_OP_OR_uxn_opcodes_h_l1073_c3_32d1_right,
BIN_OP_OR_uxn_opcodes_h_l1073_c3_32d1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1076_c11_02ed
BIN_OP_EQ_uxn_opcodes_h_l1076_c11_02ed : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1076_c11_02ed_left,
BIN_OP_EQ_uxn_opcodes_h_l1076_c11_02ed_right,
BIN_OP_EQ_uxn_opcodes_h_l1076_c11_02ed_return_output);

-- n16_MUX_uxn_opcodes_h_l1076_c7_e4e3
n16_MUX_uxn_opcodes_h_l1076_c7_e4e3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1076_c7_e4e3_cond,
n16_MUX_uxn_opcodes_h_l1076_c7_e4e3_iftrue,
n16_MUX_uxn_opcodes_h_l1076_c7_e4e3_iffalse,
n16_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1076_c7_e4e3
tmp16_MUX_uxn_opcodes_h_l1076_c7_e4e3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1076_c7_e4e3_cond,
tmp16_MUX_uxn_opcodes_h_l1076_c7_e4e3_iftrue,
tmp16_MUX_uxn_opcodes_h_l1076_c7_e4e3_iffalse,
tmp16_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1076_c7_e4e3
result_is_stack_write_MUX_uxn_opcodes_h_l1076_c7_e4e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1076_c7_e4e3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1076_c7_e4e3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1076_c7_e4e3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c7_e4e3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c7_e4e3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c7_e4e3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c7_e4e3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c7_e4e3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c7_e4e3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c7_e4e3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c7_e4e3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c7_e4e3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c7_e4e3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1076_c7_e4e3
result_u8_value_MUX_uxn_opcodes_h_l1076_c7_e4e3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1076_c7_e4e3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1076_c7_e4e3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1076_c7_e4e3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1076_c7_e4e3
result_is_opc_done_MUX_uxn_opcodes_h_l1076_c7_e4e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1076_c7_e4e3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1076_c7_e4e3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1076_c7_e4e3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c7_e4e3
result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c7_e4e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c7_e4e3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c7_e4e3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c7_e4e3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1080_c11_617e
BIN_OP_EQ_uxn_opcodes_h_l1080_c11_617e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1080_c11_617e_left,
BIN_OP_EQ_uxn_opcodes_h_l1080_c11_617e_right,
BIN_OP_EQ_uxn_opcodes_h_l1080_c11_617e_return_output);

-- n16_MUX_uxn_opcodes_h_l1080_c7_b42e
n16_MUX_uxn_opcodes_h_l1080_c7_b42e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1080_c7_b42e_cond,
n16_MUX_uxn_opcodes_h_l1080_c7_b42e_iftrue,
n16_MUX_uxn_opcodes_h_l1080_c7_b42e_iffalse,
n16_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1080_c7_b42e
tmp16_MUX_uxn_opcodes_h_l1080_c7_b42e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1080_c7_b42e_cond,
tmp16_MUX_uxn_opcodes_h_l1080_c7_b42e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1080_c7_b42e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_b42e
result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_b42e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_b42e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_b42e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_b42e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_b42e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_b42e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_b42e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_b42e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_b42e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_b42e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_b42e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_b42e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_b42e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_b42e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1080_c7_b42e
result_u8_value_MUX_uxn_opcodes_h_l1080_c7_b42e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1080_c7_b42e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1080_c7_b42e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1080_c7_b42e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_b42e
result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_b42e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_b42e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_b42e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_b42e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_b42e
result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_b42e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_b42e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_b42e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_b42e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1081_c3_9348
BIN_OP_OR_uxn_opcodes_h_l1081_c3_9348 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1081_c3_9348_left,
BIN_OP_OR_uxn_opcodes_h_l1081_c3_9348_right,
BIN_OP_OR_uxn_opcodes_h_l1081_c3_9348_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l1082_c11_50b3
BIN_OP_XOR_uxn_opcodes_h_l1082_c11_50b3 : entity work.BIN_OP_XOR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l1082_c11_50b3_left,
BIN_OP_XOR_uxn_opcodes_h_l1082_c11_50b3_right,
BIN_OP_XOR_uxn_opcodes_h_l1082_c11_50b3_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1084_c30_e856
sp_relative_shift_uxn_opcodes_h_l1084_c30_e856 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1084_c30_e856_ins,
sp_relative_shift_uxn_opcodes_h_l1084_c30_e856_x,
sp_relative_shift_uxn_opcodes_h_l1084_c30_e856_y,
sp_relative_shift_uxn_opcodes_h_l1084_c30_e856_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1089_c11_47d3
BIN_OP_EQ_uxn_opcodes_h_l1089_c11_47d3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1089_c11_47d3_left,
BIN_OP_EQ_uxn_opcodes_h_l1089_c11_47d3_right,
BIN_OP_EQ_uxn_opcodes_h_l1089_c11_47d3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_2160
result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_2160 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_2160_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_2160_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_2160_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_2160_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_2160
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_2160 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_2160_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_2160_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_2160_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_2160_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1089_c7_2160
result_u8_value_MUX_uxn_opcodes_h_l1089_c7_2160 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1089_c7_2160_cond,
result_u8_value_MUX_uxn_opcodes_h_l1089_c7_2160_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1089_c7_2160_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1089_c7_2160_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_2160
result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_2160 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_2160_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_2160_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_2160_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_2160_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_2160
result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_2160 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_2160_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_2160_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_2160_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_2160_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1092_c31_c1a5
CONST_SR_8_uxn_opcodes_h_l1092_c31_c1a5 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1092_c31_c1a5_x,
CONST_SR_8_uxn_opcodes_h_l1092_c31_c1a5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1094_c11_8e75
BIN_OP_EQ_uxn_opcodes_h_l1094_c11_8e75 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1094_c11_8e75_left,
BIN_OP_EQ_uxn_opcodes_h_l1094_c11_8e75_right,
BIN_OP_EQ_uxn_opcodes_h_l1094_c11_8e75_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1094_c7_1743
result_is_stack_write_MUX_uxn_opcodes_h_l1094_c7_1743 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1094_c7_1743_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1094_c7_1743_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1094_c7_1743_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1094_c7_1743_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1094_c7_1743
result_is_opc_done_MUX_uxn_opcodes_h_l1094_c7_1743 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1094_c7_1743_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1094_c7_1743_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1094_c7_1743_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1094_c7_1743_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1069_l1078_DUPLICATE_2d68
CONST_SL_8_uint16_t_uxn_opcodes_h_l1069_l1078_DUPLICATE_2d68 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1069_l1078_DUPLICATE_2d68_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1069_l1078_DUPLICATE_2d68_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1059_c6_6db4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_87e0_return_output,
 n16_MUX_uxn_opcodes_h_l1059_c2_7091_return_output,
 tmp16_MUX_uxn_opcodes_h_l1059_c2_7091_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1059_c2_7091_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c2_7091_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c2_7091_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1059_c2_7091_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1059_c2_7091_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1059_c2_7091_return_output,
 t16_MUX_uxn_opcodes_h_l1059_c2_7091_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1064_c11_76d2_return_output,
 n16_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output,
 tmp16_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output,
 t16_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1067_c11_506f_return_output,
 n16_MUX_uxn_opcodes_h_l1067_c7_1992_return_output,
 tmp16_MUX_uxn_opcodes_h_l1067_c7_1992_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_1992_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_1992_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_1992_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1067_c7_1992_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_1992_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_1992_return_output,
 t16_MUX_uxn_opcodes_h_l1067_c7_1992_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b711_return_output,
 n16_MUX_uxn_opcodes_h_l1072_c7_1814_return_output,
 tmp16_MUX_uxn_opcodes_h_l1072_c7_1814_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_1814_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_1814_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_1814_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1072_c7_1814_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_1814_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_1814_return_output,
 t16_MUX_uxn_opcodes_h_l1072_c7_1814_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1073_c3_32d1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1076_c11_02ed_return_output,
 n16_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output,
 tmp16_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1080_c11_617e_return_output,
 n16_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1081_c3_9348_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l1082_c11_50b3_return_output,
 sp_relative_shift_uxn_opcodes_h_l1084_c30_e856_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1089_c11_47d3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_2160_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_2160_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1089_c7_2160_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_2160_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_2160_return_output,
 CONST_SR_8_uxn_opcodes_h_l1092_c31_c1a5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1094_c11_8e75_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1094_c7_1743_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1094_c7_1743_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1069_l1078_DUPLICATE_2d68_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c6_6db4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c6_6db4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c6_6db4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_87e0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_87e0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_87e0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_87e0_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1059_c2_7091_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1059_c2_7091_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1059_c2_7091_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1059_c2_7091_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1059_c2_7091_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1059_c2_7091_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1059_c2_7091_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1059_c2_7091_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1059_c2_7091_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1059_c2_7091_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1059_c2_7091_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1059_c2_7091_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c2_7091_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1061_c3_b353 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c2_7091_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c2_7091_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c2_7091_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c2_7091_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c2_7091_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c2_7091_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c2_7091_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1059_c2_7091_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1059_c2_7091_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1059_c2_7091_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1059_c2_7091_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1059_c2_7091_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1059_c2_7091_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1059_c2_7091_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1059_c2_7091_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1059_c2_7091_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1059_c2_7091_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1059_c2_7091_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1059_c2_7091_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1059_c2_7091_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1059_c2_7091_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1059_c2_7091_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1059_c2_7091_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1060_c3_8804_uxn_opcodes_h_l1060_c3_8804_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_76d2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_76d2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_76d2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1064_c7_9c09_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1064_c7_9c09_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1067_c7_1992_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1064_c7_9c09_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1064_c7_9c09_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1064_c7_9c09_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1067_c7_1992_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1064_c7_9c09_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_9c09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_9c09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_1992_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_9c09_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_9c09_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1065_c3_e383 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_9c09_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_1992_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_9c09_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_9c09_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_9c09_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_1992_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_9c09_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1064_c7_9c09_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1064_c7_9c09_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c7_1992_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1064_c7_9c09_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_9c09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_9c09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_1992_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_9c09_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1064_c7_9c09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1064_c7_9c09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_1992_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1064_c7_9c09_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1064_c7_9c09_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1064_c7_9c09_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1067_c7_1992_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1064_c7_9c09_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_506f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_506f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_506f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1067_c7_1992_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1067_c7_1992_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1072_c7_1814_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1067_c7_1992_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1067_c7_1992_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1067_c7_1992_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_1814_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1067_c7_1992_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_1992_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_1992_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_1814_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_1992_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_1992_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1070_c3_07b2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_1992_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_1814_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_1992_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_1992_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_1992_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_1814_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_1992_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c7_1992_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c7_1992_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_1814_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c7_1992_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_1992_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_1992_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_1814_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_1992_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_1992_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_1992_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_1814_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_1992_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1067_c7_1992_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1067_c7_1992_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1072_c7_1814_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1067_c7_1992_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b711_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b711_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b711_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1072_c7_1814_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1072_c7_1814_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1072_c7_1814_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_1814_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_1814_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_1814_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_1814_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_1814_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_1814_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_1814_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1074_c3_8743 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_1814_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_1814_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_1814_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_1814_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_1814_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_1814_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_1814_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_1814_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_1814_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_1814_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_1814_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_1814_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_1814_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_1814_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1072_c7_1814_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1072_c7_1814_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1072_c7_1814_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1073_c3_32d1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1073_c3_32d1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1073_c3_32d1_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c11_02ed_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c11_02ed_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c11_02ed_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1076_c7_e4e3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1076_c7_e4e3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1076_c7_e4e3_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1076_c7_e4e3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1076_c7_e4e3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1076_c7_e4e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1076_c7_e4e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1076_c7_e4e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1076_c7_e4e3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c7_e4e3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c7_e4e3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c7_e4e3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c7_e4e3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c7_e4e3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c7_e4e3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1076_c7_e4e3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1076_c7_e4e3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1076_c7_e4e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1076_c7_e4e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1076_c7_e4e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1076_c7_e4e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c7_e4e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c7_e4e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c7_e4e3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_617e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_617e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_617e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1080_c7_b42e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1080_c7_b42e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1080_c7_b42e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_b42e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_b42e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_b42e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_b42e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_b42e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_2160_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_b42e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_b42e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1086_c3_6ddf : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_b42e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_2160_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_b42e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_b42e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_b42e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_b42e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_b42e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_b42e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1089_c7_2160_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_b42e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_b42e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_b42e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_2160_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_b42e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_b42e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_b42e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_2160_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_b42e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1081_c3_9348_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1081_c3_9348_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1081_c3_9348_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1082_c11_50b3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1082_c11_50b3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1082_c11_50b3_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1084_c30_e856_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1084_c30_e856_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1084_c30_e856_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1084_c30_e856_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1087_c21_8aec_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_47d3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_47d3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_47d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_2160_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_2160_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1094_c7_1743_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_2160_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_2160_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1091_c3_7caa : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_2160_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_2160_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1089_c7_2160_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1089_c7_2160_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1089_c7_2160_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_2160_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_2160_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1094_c7_1743_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_2160_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_2160_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_2160_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_2160_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1092_c31_c1a5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1092_c31_c1a5_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1092_c21_f1ff_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1094_c11_8e75_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1094_c11_8e75_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1094_c11_8e75_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1094_c7_1743_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1094_c7_1743_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1094_c7_1743_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1094_c7_1743_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1094_c7_1743_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1094_c7_1743_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1076_l1072_l1067_l1064_l1094_l1059_l1089_DUPLICATE_f145_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1076_l1072_l1067_l1064_l1059_l1080_DUPLICATE_eee1_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1076_l1072_l1067_l1064_l1059_l1089_DUPLICATE_3003_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1076_l1072_l1067_l1064_l1059_l1089_DUPLICATE_d285_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1076_l1072_l1067_l1064_l1094_l1089_l1080_DUPLICATE_a7a3_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1068_l1073_l1077_l1081_DUPLICATE_c0c0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1069_l1078_DUPLICATE_2d68_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1069_l1078_DUPLICATE_2d68_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1089_l1076_DUPLICATE_142f_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l1055_l1099_DUPLICATE_0843_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_617e_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c6_6db4_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1065_c3_e383 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_9c09_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1065_c3_e383;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1094_c7_1743_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1074_c3_8743 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_1814_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1074_c3_8743;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_47d3_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1094_c7_1743_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1084_c30_e856_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_b42e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_76d2_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_506f_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1091_c3_7caa := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_2160_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1091_c3_7caa;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1086_c3_6ddf := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_b42e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1086_c3_6ddf;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1059_c2_7091_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1061_c3_b353 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c2_7091_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1061_c3_b353;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b711_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_b42e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c11_02ed_right := to_unsigned(4, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_87e0_iffalse := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1084_c30_e856_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1070_c3_07b2 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_1992_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1070_c3_07b2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1094_c11_8e75_right := to_unsigned(7, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_2160_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_87e0_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1084_c30_e856_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1081_c3_9348_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1059_c2_7091_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1064_c7_9c09_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1067_c7_1992_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1072_c7_1814_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1080_c7_b42e_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c6_6db4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_76d2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_506f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b711_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c11_02ed_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_617e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_47d3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1094_c11_8e75_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1073_c3_32d1_left := t16;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1082_c11_50b3_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1059_c2_7091_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1064_c7_9c09_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1072_c7_1814_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1092_c31_c1a5_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1059_c2_7091_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1064_c7_9c09_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1067_c7_1992_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_1814_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1076_c7_e4e3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_b42e_iffalse := tmp16;
     -- CONST_SR_8[uxn_opcodes_h_l1092_c31_c1a5] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1092_c31_c1a5_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1092_c31_c1a5_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1092_c31_c1a5_return_output := CONST_SR_8_uxn_opcodes_h_l1092_c31_c1a5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1076_l1072_l1067_l1064_l1094_l1059_l1089_DUPLICATE_f145 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1076_l1072_l1067_l1064_l1094_l1059_l1089_DUPLICATE_f145_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1064_c11_76d2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1064_c11_76d2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_76d2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1064_c11_76d2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_76d2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_76d2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1064_c11_76d2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1076_c11_02ed] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1076_c11_02ed_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c11_02ed_left;
     BIN_OP_EQ_uxn_opcodes_h_l1076_c11_02ed_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c11_02ed_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c11_02ed_return_output := BIN_OP_EQ_uxn_opcodes_h_l1076_c11_02ed_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1094_c11_8e75] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1094_c11_8e75_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1094_c11_8e75_left;
     BIN_OP_EQ_uxn_opcodes_h_l1094_c11_8e75_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1094_c11_8e75_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1094_c11_8e75_return_output := BIN_OP_EQ_uxn_opcodes_h_l1094_c11_8e75_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1067_c11_506f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1067_c11_506f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_506f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1067_c11_506f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_506f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_506f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1067_c11_506f_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1076_l1072_l1067_l1064_l1059_l1089_DUPLICATE_3003 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1076_l1072_l1067_l1064_l1059_l1089_DUPLICATE_3003_return_output := result.u8_value;

     -- sp_relative_shift[uxn_opcodes_h_l1084_c30_e856] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1084_c30_e856_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1084_c30_e856_ins;
     sp_relative_shift_uxn_opcodes_h_l1084_c30_e856_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1084_c30_e856_x;
     sp_relative_shift_uxn_opcodes_h_l1084_c30_e856_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1084_c30_e856_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1084_c30_e856_return_output := sp_relative_shift_uxn_opcodes_h_l1084_c30_e856_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1072_c11_b711] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b711_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b711_left;
     BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b711_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b711_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b711_return_output := BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b711_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1076_l1072_l1067_l1064_l1059_l1080_DUPLICATE_eee1 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1076_l1072_l1067_l1064_l1059_l1080_DUPLICATE_eee1_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1076_l1072_l1067_l1064_l1059_l1089_DUPLICATE_d285 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1076_l1072_l1067_l1064_l1059_l1089_DUPLICATE_d285_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1076_l1072_l1067_l1064_l1094_l1089_l1080_DUPLICATE_a7a3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1076_l1072_l1067_l1064_l1094_l1089_l1080_DUPLICATE_a7a3_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1089_l1076_DUPLICATE_142f LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1089_l1076_DUPLICATE_142f_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1059_c6_6db4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1059_c6_6db4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c6_6db4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1059_c6_6db4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c6_6db4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c6_6db4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1059_c6_6db4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1089_c11_47d3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1089_c11_47d3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_47d3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1089_c11_47d3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_47d3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_47d3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1089_c11_47d3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1080_c11_617e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1080_c11_617e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_617e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1080_c11_617e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_617e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_617e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1080_c11_617e_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1068_l1073_l1077_l1081_DUPLICATE_c0c0 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1068_l1073_l1077_l1081_DUPLICATE_c0c0_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_87e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c6_6db4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1059_c2_7091_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c6_6db4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1059_c2_7091_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c6_6db4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1059_c2_7091_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c6_6db4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1059_c2_7091_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c6_6db4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c2_7091_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c6_6db4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c2_7091_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c6_6db4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1059_c2_7091_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c6_6db4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1059_c2_7091_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c6_6db4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1059_c2_7091_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c6_6db4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1064_c7_9c09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_76d2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_9c09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_76d2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1064_c7_9c09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_76d2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_9c09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_76d2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_9c09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_76d2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_9c09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_76d2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1064_c7_9c09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_76d2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1064_c7_9c09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_76d2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1064_c7_9c09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_76d2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1067_c7_1992_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_506f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_1992_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_506f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_1992_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_506f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_1992_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_506f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_1992_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_506f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_1992_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_506f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c7_1992_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_506f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1067_c7_1992_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_506f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1067_c7_1992_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_506f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1072_c7_1814_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b711_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_1814_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b711_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_1814_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b711_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_1814_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b711_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_1814_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b711_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_1814_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b711_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_1814_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b711_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1072_c7_1814_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b711_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_1814_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_b711_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1076_c7_e4e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c11_02ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1076_c7_e4e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c11_02ed_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c7_e4e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c11_02ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1076_c7_e4e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c11_02ed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c7_e4e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c11_02ed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c7_e4e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c11_02ed_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1076_c7_e4e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c11_02ed_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1076_c7_e4e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c11_02ed_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1080_c7_b42e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_617e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_b42e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_617e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_b42e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_617e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_b42e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_617e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_b42e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_617e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_b42e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_617e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_b42e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_617e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_b42e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_617e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_2160_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_47d3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_2160_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_47d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_2160_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_47d3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_2160_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_47d3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1089_c7_2160_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_47d3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1094_c7_1743_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1094_c11_8e75_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1094_c7_1743_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1094_c11_8e75_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1073_c3_32d1_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1068_l1073_l1077_l1081_DUPLICATE_c0c0_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1081_c3_9348_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1068_l1073_l1077_l1081_DUPLICATE_c0c0_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1069_l1078_DUPLICATE_2d68_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1068_l1073_l1077_l1081_DUPLICATE_c0c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c2_7091_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1076_l1072_l1067_l1064_l1059_l1080_DUPLICATE_eee1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_9c09_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1076_l1072_l1067_l1064_l1059_l1080_DUPLICATE_eee1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_1992_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1076_l1072_l1067_l1064_l1059_l1080_DUPLICATE_eee1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_1814_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1076_l1072_l1067_l1064_l1059_l1080_DUPLICATE_eee1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c7_e4e3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1076_l1072_l1067_l1064_l1059_l1080_DUPLICATE_eee1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_b42e_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1076_l1072_l1067_l1064_l1059_l1080_DUPLICATE_eee1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_9c09_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1076_l1072_l1067_l1064_l1094_l1089_l1080_DUPLICATE_a7a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_1992_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1076_l1072_l1067_l1064_l1094_l1089_l1080_DUPLICATE_a7a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_1814_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1076_l1072_l1067_l1064_l1094_l1089_l1080_DUPLICATE_a7a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1076_c7_e4e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1076_l1072_l1067_l1064_l1094_l1089_l1080_DUPLICATE_a7a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_b42e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1076_l1072_l1067_l1064_l1094_l1089_l1080_DUPLICATE_a7a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_2160_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1076_l1072_l1067_l1064_l1094_l1089_l1080_DUPLICATE_a7a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1094_c7_1743_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1076_l1072_l1067_l1064_l1094_l1089_l1080_DUPLICATE_a7a3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1059_c2_7091_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1076_l1072_l1067_l1064_l1059_l1089_DUPLICATE_d285_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1064_c7_9c09_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1076_l1072_l1067_l1064_l1059_l1089_DUPLICATE_d285_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_1992_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1076_l1072_l1067_l1064_l1059_l1089_DUPLICATE_d285_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_1814_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1076_l1072_l1067_l1064_l1059_l1089_DUPLICATE_d285_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c7_e4e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1076_l1072_l1067_l1064_l1059_l1089_DUPLICATE_d285_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_2160_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1076_l1072_l1067_l1064_l1059_l1089_DUPLICATE_d285_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1059_c2_7091_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1076_l1072_l1067_l1064_l1094_l1059_l1089_DUPLICATE_f145_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_9c09_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1076_l1072_l1067_l1064_l1094_l1059_l1089_DUPLICATE_f145_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_1992_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1076_l1072_l1067_l1064_l1094_l1059_l1089_DUPLICATE_f145_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_1814_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1076_l1072_l1067_l1064_l1094_l1059_l1089_DUPLICATE_f145_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1076_c7_e4e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1076_l1072_l1067_l1064_l1094_l1059_l1089_DUPLICATE_f145_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_2160_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1076_l1072_l1067_l1064_l1094_l1059_l1089_DUPLICATE_f145_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1094_c7_1743_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1076_l1072_l1067_l1064_l1094_l1059_l1089_DUPLICATE_f145_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c7_e4e3_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1089_l1076_DUPLICATE_142f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_2160_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1089_l1076_DUPLICATE_142f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1059_c2_7091_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1076_l1072_l1067_l1064_l1059_l1089_DUPLICATE_3003_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1064_c7_9c09_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1076_l1072_l1067_l1064_l1059_l1089_DUPLICATE_3003_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c7_1992_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1076_l1072_l1067_l1064_l1059_l1089_DUPLICATE_3003_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_1814_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1076_l1072_l1067_l1064_l1059_l1089_DUPLICATE_3003_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1076_c7_e4e3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1076_l1072_l1067_l1064_l1059_l1089_DUPLICATE_3003_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1089_c7_2160_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1076_l1072_l1067_l1064_l1059_l1089_DUPLICATE_3003_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_b42e_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1084_c30_e856_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1094_c7_1743] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1094_c7_1743_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1094_c7_1743_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1094_c7_1743_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1094_c7_1743_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1094_c7_1743_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1094_c7_1743_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1094_c7_1743_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1094_c7_1743_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1081_c3_9348] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1081_c3_9348_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1081_c3_9348_left;
     BIN_OP_OR_uxn_opcodes_h_l1081_c3_9348_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1081_c3_9348_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1081_c3_9348_return_output := BIN_OP_OR_uxn_opcodes_h_l1081_c3_9348_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1089_c7_2160] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_2160_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_2160_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_2160_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_2160_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_2160_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_2160_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_2160_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_2160_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1089_c7_2160] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_2160_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_2160_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_2160_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_2160_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_2160_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_2160_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_2160_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_2160_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1073_c3_32d1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1073_c3_32d1_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1073_c3_32d1_left;
     BIN_OP_OR_uxn_opcodes_h_l1073_c3_32d1_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1073_c3_32d1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1073_c3_32d1_return_output := BIN_OP_OR_uxn_opcodes_h_l1073_c3_32d1_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1069_l1078_DUPLICATE_2d68 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1069_l1078_DUPLICATE_2d68_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1069_l1078_DUPLICATE_2d68_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1069_l1078_DUPLICATE_2d68_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1069_l1078_DUPLICATE_2d68_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1092_c21_f1ff] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1092_c21_f1ff_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1092_c31_c1a5_return_output);

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1059_c1_87e0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_87e0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_87e0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_87e0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_87e0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_87e0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_87e0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_87e0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_87e0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1080_c7_b42e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_b42e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_b42e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_b42e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_b42e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_b42e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_b42e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1094_c7_1743] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1094_c7_1743_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1094_c7_1743_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1094_c7_1743_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1094_c7_1743_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1094_c7_1743_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1094_c7_1743_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1094_c7_1743_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1094_c7_1743_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1072_c7_1814_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1073_c3_32d1_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1082_c11_50b3_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1081_c3_9348_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1080_c7_b42e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1081_c3_9348_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1089_c7_2160_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1092_c21_f1ff_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1076_c7_e4e3_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1069_l1078_DUPLICATE_2d68_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1067_c7_1992_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1069_l1078_DUPLICATE_2d68_return_output;
     VAR_printf_uxn_opcodes_h_l1060_c3_8804_uxn_opcodes_h_l1060_c3_8804_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1059_c1_87e0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_2160_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1094_c7_1743_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_b42e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_2160_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_2160_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1094_c7_1743_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c7_e4e3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_b42e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_2160_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1080_c7_b42e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_b42e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_b42e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_b42e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_b42e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_b42e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_b42e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output;

     -- printf_uxn_opcodes_h_l1060_c3_8804[uxn_opcodes_h_l1060_c3_8804] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1060_c3_8804_uxn_opcodes_h_l1060_c3_8804_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1060_c3_8804_uxn_opcodes_h_l1060_c3_8804_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n16_MUX[uxn_opcodes_h_l1080_c7_b42e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1080_c7_b42e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1080_c7_b42e_cond;
     n16_MUX_uxn_opcodes_h_l1080_c7_b42e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1080_c7_b42e_iftrue;
     n16_MUX_uxn_opcodes_h_l1080_c7_b42e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1080_c7_b42e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output := n16_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output;

     -- t16_MUX[uxn_opcodes_h_l1072_c7_1814] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1072_c7_1814_cond <= VAR_t16_MUX_uxn_opcodes_h_l1072_c7_1814_cond;
     t16_MUX_uxn_opcodes_h_l1072_c7_1814_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1072_c7_1814_iftrue;
     t16_MUX_uxn_opcodes_h_l1072_c7_1814_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1072_c7_1814_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1072_c7_1814_return_output := t16_MUX_uxn_opcodes_h_l1072_c7_1814_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1089_c7_2160] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1089_c7_2160_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1089_c7_2160_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1089_c7_2160_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1089_c7_2160_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1089_c7_2160_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1089_c7_2160_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1089_c7_2160_return_output := result_u8_value_MUX_uxn_opcodes_h_l1089_c7_2160_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1076_c7_e4e3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c7_e4e3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c7_e4e3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c7_e4e3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c7_e4e3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c7_e4e3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c7_e4e3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1080_c7_b42e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_b42e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_b42e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_b42e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_b42e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_b42e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_b42e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output;

     -- BIN_OP_XOR[uxn_opcodes_h_l1082_c11_50b3] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l1082_c11_50b3_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1082_c11_50b3_left;
     BIN_OP_XOR_uxn_opcodes_h_l1082_c11_50b3_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1082_c11_50b3_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1082_c11_50b3_return_output := BIN_OP_XOR_uxn_opcodes_h_l1082_c11_50b3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1089_c7_2160] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_2160_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_2160_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_2160_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_2160_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_2160_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_2160_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_2160_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_2160_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1089_c7_2160] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_2160_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_2160_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_2160_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_2160_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_2160_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_2160_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_2160_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_2160_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_b42e_iftrue := VAR_BIN_OP_XOR_uxn_opcodes_h_l1082_c11_50b3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1076_c7_e4e3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_b42e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_2160_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c7_e4e3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_b42e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_2160_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_1814_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c7_e4e3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_b42e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1089_c7_2160_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1067_c7_1992_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1072_c7_1814_return_output;
     -- t16_MUX[uxn_opcodes_h_l1067_c7_1992] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1067_c7_1992_cond <= VAR_t16_MUX_uxn_opcodes_h_l1067_c7_1992_cond;
     t16_MUX_uxn_opcodes_h_l1067_c7_1992_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1067_c7_1992_iftrue;
     t16_MUX_uxn_opcodes_h_l1067_c7_1992_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1067_c7_1992_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1067_c7_1992_return_output := t16_MUX_uxn_opcodes_h_l1067_c7_1992_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1076_c7_e4e3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c7_e4e3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c7_e4e3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c7_e4e3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c7_e4e3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c7_e4e3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c7_e4e3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1080_c7_b42e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_b42e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_b42e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_b42e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_b42e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_b42e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_b42e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1076_c7_e4e3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c7_e4e3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c7_e4e3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c7_e4e3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c7_e4e3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c7_e4e3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c7_e4e3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1087_c21_8aec] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1087_c21_8aec_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1082_c11_50b3_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1072_c7_1814] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_1814_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_1814_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_1814_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_1814_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_1814_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_1814_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_1814_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_1814_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1080_c7_b42e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1080_c7_b42e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_b42e_cond;
     tmp16_MUX_uxn_opcodes_h_l1080_c7_b42e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_b42e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1080_c7_b42e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_b42e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output := tmp16_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1080_c7_b42e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_b42e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_b42e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_b42e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_b42e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_b42e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_b42e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1076_c7_e4e3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1076_c7_e4e3_cond <= VAR_n16_MUX_uxn_opcodes_h_l1076_c7_e4e3_cond;
     n16_MUX_uxn_opcodes_h_l1076_c7_e4e3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1076_c7_e4e3_iftrue;
     n16_MUX_uxn_opcodes_h_l1076_c7_e4e3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1076_c7_e4e3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output := n16_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_b42e_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1087_c21_8aec_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1072_c7_1814_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1076_c7_e4e3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_1814_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1076_c7_e4e3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_1992_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_1814_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_1814_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1064_c7_9c09_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1067_c7_1992_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1076_c7_e4e3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1080_c7_b42e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1080_c7_b42e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_b42e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1080_c7_b42e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_b42e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1080_c7_b42e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_b42e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1076_c7_e4e3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1076_c7_e4e3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1076_c7_e4e3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1076_c7_e4e3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1076_c7_e4e3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1076_c7_e4e3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1076_c7_e4e3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1076_c7_e4e3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1076_c7_e4e3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1076_c7_e4e3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1076_c7_e4e3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1076_c7_e4e3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1076_c7_e4e3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1076_c7_e4e3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1072_c7_1814] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_1814_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_1814_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_1814_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_1814_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_1814_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_1814_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_1814_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_1814_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1072_c7_1814] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_1814_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_1814_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_1814_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_1814_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_1814_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_1814_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_1814_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_1814_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1067_c7_1992] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_1992_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_1992_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_1992_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_1992_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_1992_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_1992_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_1992_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_1992_return_output;

     -- t16_MUX[uxn_opcodes_h_l1064_c7_9c09] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1064_c7_9c09_cond <= VAR_t16_MUX_uxn_opcodes_h_l1064_c7_9c09_cond;
     t16_MUX_uxn_opcodes_h_l1064_c7_9c09_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1064_c7_9c09_iftrue;
     t16_MUX_uxn_opcodes_h_l1064_c7_9c09_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1064_c7_9c09_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output := t16_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1076_c7_e4e3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1076_c7_e4e3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1076_c7_e4e3_cond;
     tmp16_MUX_uxn_opcodes_h_l1076_c7_e4e3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1076_c7_e4e3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1076_c7_e4e3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1076_c7_e4e3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output := tmp16_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output;

     -- n16_MUX[uxn_opcodes_h_l1072_c7_1814] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1072_c7_1814_cond <= VAR_n16_MUX_uxn_opcodes_h_l1072_c7_1814_cond;
     n16_MUX_uxn_opcodes_h_l1072_c7_1814_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1072_c7_1814_iftrue;
     n16_MUX_uxn_opcodes_h_l1072_c7_1814_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1072_c7_1814_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1072_c7_1814_return_output := n16_MUX_uxn_opcodes_h_l1072_c7_1814_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1067_c7_1992_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1072_c7_1814_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_1814_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_1992_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_1814_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_1814_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_9c09_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_1992_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_1992_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_1814_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1076_c7_e4e3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_b42e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1059_c2_7091_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_1814_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1072_c7_1814] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1072_c7_1814_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_1814_cond;
     tmp16_MUX_uxn_opcodes_h_l1072_c7_1814_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_1814_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1072_c7_1814_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_1814_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_1814_return_output := tmp16_MUX_uxn_opcodes_h_l1072_c7_1814_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1072_c7_1814] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_1814_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_1814_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_1814_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_1814_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_1814_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_1814_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_1814_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_1814_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1076_c7_e4e3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1076_c7_e4e3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1076_c7_e4e3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1076_c7_e4e3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1076_c7_e4e3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1076_c7_e4e3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1076_c7_e4e3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output;

     -- t16_MUX[uxn_opcodes_h_l1059_c2_7091] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1059_c2_7091_cond <= VAR_t16_MUX_uxn_opcodes_h_l1059_c2_7091_cond;
     t16_MUX_uxn_opcodes_h_l1059_c2_7091_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1059_c2_7091_iftrue;
     t16_MUX_uxn_opcodes_h_l1059_c2_7091_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1059_c2_7091_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1059_c2_7091_return_output := t16_MUX_uxn_opcodes_h_l1059_c2_7091_return_output;

     -- n16_MUX[uxn_opcodes_h_l1067_c7_1992] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1067_c7_1992_cond <= VAR_n16_MUX_uxn_opcodes_h_l1067_c7_1992_cond;
     n16_MUX_uxn_opcodes_h_l1067_c7_1992_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1067_c7_1992_iftrue;
     n16_MUX_uxn_opcodes_h_l1067_c7_1992_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1067_c7_1992_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1067_c7_1992_return_output := n16_MUX_uxn_opcodes_h_l1067_c7_1992_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1067_c7_1992] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_1992_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_1992_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_1992_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_1992_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_1992_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_1992_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_1992_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_1992_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1064_c7_9c09] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_9c09_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_9c09_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_9c09_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_9c09_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_9c09_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_9c09_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1067_c7_1992] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_1992_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_1992_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_1992_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_1992_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_1992_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_1992_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_1992_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_1992_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1072_c7_1814] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_1814_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_1814_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_1814_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_1814_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_1814_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_1814_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_1814_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_1814_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1064_c7_9c09_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1067_c7_1992_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_1992_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_1814_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1064_c7_9c09_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_1992_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_1992_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_1814_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c2_7091_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_9c09_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_1992_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_1814_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1076_c7_e4e3_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1059_c2_7091_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1067_c7_1992_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_1814_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1064_c7_9c09] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_9c09_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_9c09_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_9c09_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_9c09_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_9c09_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_9c09_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1067_c7_1992] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_1992_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_1992_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_1992_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_1992_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_1992_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_1992_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_1992_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_1992_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1064_c7_9c09] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1064_c7_9c09_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1064_c7_9c09_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1064_c7_9c09_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1064_c7_9c09_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1064_c7_9c09_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1064_c7_9c09_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1059_c2_7091] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c2_7091_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c2_7091_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c2_7091_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c2_7091_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c2_7091_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c2_7091_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c2_7091_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c2_7091_return_output;

     -- n16_MUX[uxn_opcodes_h_l1064_c7_9c09] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1064_c7_9c09_cond <= VAR_n16_MUX_uxn_opcodes_h_l1064_c7_9c09_cond;
     n16_MUX_uxn_opcodes_h_l1064_c7_9c09_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1064_c7_9c09_iftrue;
     n16_MUX_uxn_opcodes_h_l1064_c7_9c09_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1064_c7_9c09_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output := n16_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1072_c7_1814] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1072_c7_1814_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_1814_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1072_c7_1814_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_1814_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1072_c7_1814_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_1814_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_1814_return_output := result_u8_value_MUX_uxn_opcodes_h_l1072_c7_1814_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1067_c7_1992] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1067_c7_1992_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1067_c7_1992_cond;
     tmp16_MUX_uxn_opcodes_h_l1067_c7_1992_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1067_c7_1992_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1067_c7_1992_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1067_c7_1992_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1067_c7_1992_return_output := tmp16_MUX_uxn_opcodes_h_l1067_c7_1992_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1067_c7_1992] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_1992_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_1992_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_1992_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_1992_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_1992_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_1992_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_1992_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_1992_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1059_c2_7091_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_9c09_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_1992_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1059_c2_7091_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_9c09_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_1992_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c2_7091_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c7_1992_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_1814_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1064_c7_9c09_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1067_c7_1992_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1067_c7_1992] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1067_c7_1992_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c7_1992_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1067_c7_1992_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c7_1992_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1067_c7_1992_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c7_1992_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c7_1992_return_output := result_u8_value_MUX_uxn_opcodes_h_l1067_c7_1992_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1064_c7_9c09] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_9c09_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_9c09_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_9c09_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_9c09_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_9c09_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_9c09_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output;

     -- n16_MUX[uxn_opcodes_h_l1059_c2_7091] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1059_c2_7091_cond <= VAR_n16_MUX_uxn_opcodes_h_l1059_c2_7091_cond;
     n16_MUX_uxn_opcodes_h_l1059_c2_7091_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1059_c2_7091_iftrue;
     n16_MUX_uxn_opcodes_h_l1059_c2_7091_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1059_c2_7091_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1059_c2_7091_return_output := n16_MUX_uxn_opcodes_h_l1059_c2_7091_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1064_c7_9c09] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_9c09_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_9c09_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_9c09_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_9c09_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_9c09_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_9c09_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1059_c2_7091] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c2_7091_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c2_7091_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c2_7091_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c2_7091_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c2_7091_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c2_7091_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c2_7091_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c2_7091_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1064_c7_9c09] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1064_c7_9c09_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1064_c7_9c09_cond;
     tmp16_MUX_uxn_opcodes_h_l1064_c7_9c09_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1064_c7_9c09_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1064_c7_9c09_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1064_c7_9c09_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output := tmp16_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1059_c2_7091] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1059_c2_7091_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1059_c2_7091_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1059_c2_7091_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1059_c2_7091_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1059_c2_7091_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1059_c2_7091_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1059_c2_7091_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1059_c2_7091_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1059_c2_7091_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1059_c2_7091_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1059_c2_7091_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1064_c7_9c09_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c7_1992_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1059_c2_7091_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1059_c2_7091] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1059_c2_7091_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1059_c2_7091_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1059_c2_7091_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1059_c2_7091_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1059_c2_7091_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1059_c2_7091_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1059_c2_7091_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1059_c2_7091_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1059_c2_7091] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1059_c2_7091_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1059_c2_7091_cond;
     tmp16_MUX_uxn_opcodes_h_l1059_c2_7091_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1059_c2_7091_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1059_c2_7091_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1059_c2_7091_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1059_c2_7091_return_output := tmp16_MUX_uxn_opcodes_h_l1059_c2_7091_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1059_c2_7091] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1059_c2_7091_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1059_c2_7091_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1059_c2_7091_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1059_c2_7091_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1059_c2_7091_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1059_c2_7091_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1059_c2_7091_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1059_c2_7091_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1064_c7_9c09] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1064_c7_9c09_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1064_c7_9c09_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1064_c7_9c09_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1064_c7_9c09_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1064_c7_9c09_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1064_c7_9c09_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output := result_u8_value_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1059_c2_7091_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1064_c7_9c09_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1059_c2_7091_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1059_c2_7091] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1059_c2_7091_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1059_c2_7091_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1059_c2_7091_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1059_c2_7091_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1059_c2_7091_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1059_c2_7091_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1059_c2_7091_return_output := result_u8_value_MUX_uxn_opcodes_h_l1059_c2_7091_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l1055_l1099_DUPLICATE_0843 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l1055_l1099_DUPLICATE_0843_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c551(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1059_c2_7091_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c2_7091_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c2_7091_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1059_c2_7091_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1059_c2_7091_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1059_c2_7091_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l1055_l1099_DUPLICATE_0843_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l1055_l1099_DUPLICATE_0843_return_output;
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
