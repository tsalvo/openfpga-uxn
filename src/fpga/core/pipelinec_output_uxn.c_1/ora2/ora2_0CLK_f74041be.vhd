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
entity ora2_0CLK_f74041be is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ora2_0CLK_f74041be;
architecture arch of ora2_0CLK_f74041be is
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
-- BIN_OP_EQ[uxn_opcodes_h_l980_c6_3cf7]
signal BIN_OP_EQ_uxn_opcodes_h_l980_c6_3cf7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l980_c6_3cf7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l980_c6_3cf7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l980_c1_3cf5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l980_c1_3cf5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l980_c1_3cf5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l980_c1_3cf5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l980_c1_3cf5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l980_c2_4bd9]
signal n16_MUX_uxn_opcodes_h_l980_c2_4bd9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l980_c2_4bd9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l980_c2_4bd9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l980_c2_4bd9]
signal tmp16_MUX_uxn_opcodes_h_l980_c2_4bd9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l980_c2_4bd9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l980_c2_4bd9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l980_c2_4bd9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l980_c2_4bd9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l980_c2_4bd9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l980_c2_4bd9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l980_c2_4bd9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c2_4bd9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c2_4bd9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c2_4bd9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l980_c2_4bd9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c2_4bd9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c2_4bd9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c2_4bd9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l980_c2_4bd9]
signal result_u8_value_MUX_uxn_opcodes_h_l980_c2_4bd9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l980_c2_4bd9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l980_c2_4bd9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l980_c2_4bd9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l980_c2_4bd9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l980_c2_4bd9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l980_c2_4bd9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l980_c2_4bd9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l980_c2_4bd9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l980_c2_4bd9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l980_c2_4bd9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l980_c2_4bd9]
signal t16_MUX_uxn_opcodes_h_l980_c2_4bd9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l980_c2_4bd9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l980_c2_4bd9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l981_c3_01bd[uxn_opcodes_h_l981_c3_01bd]
signal printf_uxn_opcodes_h_l981_c3_01bd_uxn_opcodes_h_l981_c3_01bd_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l985_c11_c5ea]
signal BIN_OP_EQ_uxn_opcodes_h_l985_c11_c5ea_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l985_c11_c5ea_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l985_c11_c5ea_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l985_c7_fc54]
signal n16_MUX_uxn_opcodes_h_l985_c7_fc54_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l985_c7_fc54_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l985_c7_fc54_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l985_c7_fc54_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l985_c7_fc54]
signal tmp16_MUX_uxn_opcodes_h_l985_c7_fc54_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l985_c7_fc54_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l985_c7_fc54_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l985_c7_fc54_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l985_c7_fc54]
signal result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_fc54_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_fc54_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_fc54_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_fc54_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l985_c7_fc54]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_fc54_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_fc54_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_fc54_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_fc54_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l985_c7_fc54]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_fc54_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_fc54_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_fc54_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_fc54_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l985_c7_fc54]
signal result_u8_value_MUX_uxn_opcodes_h_l985_c7_fc54_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l985_c7_fc54_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l985_c7_fc54_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l985_c7_fc54_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l985_c7_fc54]
signal result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_fc54_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_fc54_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_fc54_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_fc54_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l985_c7_fc54]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l985_c7_fc54_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l985_c7_fc54_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l985_c7_fc54_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l985_c7_fc54_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l985_c7_fc54]
signal t16_MUX_uxn_opcodes_h_l985_c7_fc54_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l985_c7_fc54_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l985_c7_fc54_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l985_c7_fc54_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l988_c11_e96f]
signal BIN_OP_EQ_uxn_opcodes_h_l988_c11_e96f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l988_c11_e96f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l988_c11_e96f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l988_c7_03cc]
signal n16_MUX_uxn_opcodes_h_l988_c7_03cc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l988_c7_03cc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l988_c7_03cc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l988_c7_03cc_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l988_c7_03cc]
signal tmp16_MUX_uxn_opcodes_h_l988_c7_03cc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l988_c7_03cc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l988_c7_03cc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l988_c7_03cc_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l988_c7_03cc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_03cc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_03cc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_03cc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_03cc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l988_c7_03cc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_03cc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_03cc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_03cc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_03cc_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l988_c7_03cc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_03cc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_03cc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_03cc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_03cc_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l988_c7_03cc]
signal result_u8_value_MUX_uxn_opcodes_h_l988_c7_03cc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l988_c7_03cc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l988_c7_03cc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l988_c7_03cc_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l988_c7_03cc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_03cc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_03cc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_03cc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_03cc_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l988_c7_03cc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_03cc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_03cc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_03cc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_03cc_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l988_c7_03cc]
signal t16_MUX_uxn_opcodes_h_l988_c7_03cc_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l988_c7_03cc_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l988_c7_03cc_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l988_c7_03cc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l993_c11_c096]
signal BIN_OP_EQ_uxn_opcodes_h_l993_c11_c096_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l993_c11_c096_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l993_c11_c096_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l993_c7_852a]
signal n16_MUX_uxn_opcodes_h_l993_c7_852a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l993_c7_852a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l993_c7_852a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l993_c7_852a_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l993_c7_852a]
signal tmp16_MUX_uxn_opcodes_h_l993_c7_852a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l993_c7_852a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l993_c7_852a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l993_c7_852a_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l993_c7_852a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_852a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_852a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_852a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_852a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l993_c7_852a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_852a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_852a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_852a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_852a_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l993_c7_852a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_852a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_852a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_852a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_852a_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l993_c7_852a]
signal result_u8_value_MUX_uxn_opcodes_h_l993_c7_852a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l993_c7_852a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l993_c7_852a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l993_c7_852a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l993_c7_852a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_852a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_852a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_852a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_852a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l993_c7_852a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_852a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_852a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_852a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_852a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l993_c7_852a]
signal t16_MUX_uxn_opcodes_h_l993_c7_852a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l993_c7_852a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l993_c7_852a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l993_c7_852a_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l994_c3_2ece]
signal BIN_OP_OR_uxn_opcodes_h_l994_c3_2ece_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l994_c3_2ece_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l994_c3_2ece_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l997_c11_165c]
signal BIN_OP_EQ_uxn_opcodes_h_l997_c11_165c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l997_c11_165c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l997_c11_165c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l997_c7_41ad]
signal n16_MUX_uxn_opcodes_h_l997_c7_41ad_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l997_c7_41ad_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l997_c7_41ad_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l997_c7_41ad_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l997_c7_41ad]
signal tmp16_MUX_uxn_opcodes_h_l997_c7_41ad_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l997_c7_41ad_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l997_c7_41ad_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l997_c7_41ad_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l997_c7_41ad]
signal result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_41ad_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_41ad_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_41ad_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_41ad_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l997_c7_41ad]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_41ad_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_41ad_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_41ad_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_41ad_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l997_c7_41ad]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l997_c7_41ad_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l997_c7_41ad_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l997_c7_41ad_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l997_c7_41ad_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l997_c7_41ad]
signal result_u8_value_MUX_uxn_opcodes_h_l997_c7_41ad_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l997_c7_41ad_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l997_c7_41ad_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l997_c7_41ad_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l997_c7_41ad]
signal result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_41ad_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_41ad_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_41ad_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_41ad_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l997_c7_41ad]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_41ad_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_41ad_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_41ad_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_41ad_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1001_c11_c139]
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c11_c139_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c11_c139_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c11_c139_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1001_c7_5321]
signal n16_MUX_uxn_opcodes_h_l1001_c7_5321_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1001_c7_5321_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1001_c7_5321_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1001_c7_5321_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1001_c7_5321]
signal tmp16_MUX_uxn_opcodes_h_l1001_c7_5321_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1001_c7_5321_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1001_c7_5321_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1001_c7_5321_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1001_c7_5321]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_5321_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_5321_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_5321_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_5321_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1001_c7_5321]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_5321_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_5321_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_5321_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_5321_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1001_c7_5321]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_5321_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_5321_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_5321_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_5321_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1001_c7_5321]
signal result_u8_value_MUX_uxn_opcodes_h_l1001_c7_5321_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1001_c7_5321_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1001_c7_5321_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1001_c7_5321_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1001_c7_5321]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_5321_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_5321_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_5321_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_5321_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1001_c7_5321]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_5321_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_5321_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_5321_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_5321_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1002_c3_73f0]
signal BIN_OP_OR_uxn_opcodes_h_l1002_c3_73f0_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1002_c3_73f0_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1002_c3_73f0_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1003_c11_89b7]
signal BIN_OP_OR_uxn_opcodes_h_l1003_c11_89b7_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1003_c11_89b7_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1003_c11_89b7_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1005_c30_8704]
signal sp_relative_shift_uxn_opcodes_h_l1005_c30_8704_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1005_c30_8704_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1005_c30_8704_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1005_c30_8704_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1010_c11_cd0e]
signal BIN_OP_EQ_uxn_opcodes_h_l1010_c11_cd0e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1010_c11_cd0e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1010_c11_cd0e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1010_c7_0063]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_0063_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_0063_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_0063_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_0063_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1010_c7_0063]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_0063_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_0063_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_0063_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_0063_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1010_c7_0063]
signal result_u8_value_MUX_uxn_opcodes_h_l1010_c7_0063_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1010_c7_0063_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1010_c7_0063_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1010_c7_0063_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1010_c7_0063]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_0063_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_0063_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_0063_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_0063_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1010_c7_0063]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_0063_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_0063_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_0063_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_0063_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1013_c31_cab9]
signal CONST_SR_8_uxn_opcodes_h_l1013_c31_cab9_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1013_c31_cab9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1015_c11_7e4d]
signal BIN_OP_EQ_uxn_opcodes_h_l1015_c11_7e4d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1015_c11_7e4d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1015_c11_7e4d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1015_c7_55ae]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_55ae_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_55ae_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_55ae_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_55ae_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1015_c7_55ae]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_55ae_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_55ae_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_55ae_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_55ae_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l990_l999_DUPLICATE_8af1
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l990_l999_DUPLICATE_8af1_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l990_l999_DUPLICATE_8af1_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l980_c6_3cf7
BIN_OP_EQ_uxn_opcodes_h_l980_c6_3cf7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l980_c6_3cf7_left,
BIN_OP_EQ_uxn_opcodes_h_l980_c6_3cf7_right,
BIN_OP_EQ_uxn_opcodes_h_l980_c6_3cf7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l980_c1_3cf5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l980_c1_3cf5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l980_c1_3cf5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l980_c1_3cf5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l980_c1_3cf5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l980_c1_3cf5_return_output);

-- n16_MUX_uxn_opcodes_h_l980_c2_4bd9
n16_MUX_uxn_opcodes_h_l980_c2_4bd9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l980_c2_4bd9_cond,
n16_MUX_uxn_opcodes_h_l980_c2_4bd9_iftrue,
n16_MUX_uxn_opcodes_h_l980_c2_4bd9_iffalse,
n16_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l980_c2_4bd9
tmp16_MUX_uxn_opcodes_h_l980_c2_4bd9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l980_c2_4bd9_cond,
tmp16_MUX_uxn_opcodes_h_l980_c2_4bd9_iftrue,
tmp16_MUX_uxn_opcodes_h_l980_c2_4bd9_iffalse,
tmp16_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l980_c2_4bd9
result_is_stack_write_MUX_uxn_opcodes_h_l980_c2_4bd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l980_c2_4bd9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l980_c2_4bd9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l980_c2_4bd9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c2_4bd9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c2_4bd9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c2_4bd9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c2_4bd9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c2_4bd9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c2_4bd9
result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c2_4bd9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c2_4bd9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c2_4bd9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c2_4bd9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l980_c2_4bd9
result_u8_value_MUX_uxn_opcodes_h_l980_c2_4bd9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l980_c2_4bd9_cond,
result_u8_value_MUX_uxn_opcodes_h_l980_c2_4bd9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l980_c2_4bd9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l980_c2_4bd9
result_is_opc_done_MUX_uxn_opcodes_h_l980_c2_4bd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l980_c2_4bd9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l980_c2_4bd9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l980_c2_4bd9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l980_c2_4bd9
result_is_sp_shift_MUX_uxn_opcodes_h_l980_c2_4bd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l980_c2_4bd9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l980_c2_4bd9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l980_c2_4bd9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output);

-- t16_MUX_uxn_opcodes_h_l980_c2_4bd9
t16_MUX_uxn_opcodes_h_l980_c2_4bd9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l980_c2_4bd9_cond,
t16_MUX_uxn_opcodes_h_l980_c2_4bd9_iftrue,
t16_MUX_uxn_opcodes_h_l980_c2_4bd9_iffalse,
t16_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output);

-- printf_uxn_opcodes_h_l981_c3_01bd_uxn_opcodes_h_l981_c3_01bd
printf_uxn_opcodes_h_l981_c3_01bd_uxn_opcodes_h_l981_c3_01bd : entity work.printf_uxn_opcodes_h_l981_c3_01bd_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l981_c3_01bd_uxn_opcodes_h_l981_c3_01bd_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l985_c11_c5ea
BIN_OP_EQ_uxn_opcodes_h_l985_c11_c5ea : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l985_c11_c5ea_left,
BIN_OP_EQ_uxn_opcodes_h_l985_c11_c5ea_right,
BIN_OP_EQ_uxn_opcodes_h_l985_c11_c5ea_return_output);

-- n16_MUX_uxn_opcodes_h_l985_c7_fc54
n16_MUX_uxn_opcodes_h_l985_c7_fc54 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l985_c7_fc54_cond,
n16_MUX_uxn_opcodes_h_l985_c7_fc54_iftrue,
n16_MUX_uxn_opcodes_h_l985_c7_fc54_iffalse,
n16_MUX_uxn_opcodes_h_l985_c7_fc54_return_output);

-- tmp16_MUX_uxn_opcodes_h_l985_c7_fc54
tmp16_MUX_uxn_opcodes_h_l985_c7_fc54 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l985_c7_fc54_cond,
tmp16_MUX_uxn_opcodes_h_l985_c7_fc54_iftrue,
tmp16_MUX_uxn_opcodes_h_l985_c7_fc54_iffalse,
tmp16_MUX_uxn_opcodes_h_l985_c7_fc54_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_fc54
result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_fc54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_fc54_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_fc54_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_fc54_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_fc54_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_fc54
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_fc54 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_fc54_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_fc54_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_fc54_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_fc54_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_fc54
result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_fc54 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_fc54_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_fc54_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_fc54_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_fc54_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l985_c7_fc54
result_u8_value_MUX_uxn_opcodes_h_l985_c7_fc54 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l985_c7_fc54_cond,
result_u8_value_MUX_uxn_opcodes_h_l985_c7_fc54_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l985_c7_fc54_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l985_c7_fc54_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_fc54
result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_fc54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_fc54_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_fc54_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_fc54_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_fc54_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l985_c7_fc54
result_is_sp_shift_MUX_uxn_opcodes_h_l985_c7_fc54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l985_c7_fc54_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l985_c7_fc54_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l985_c7_fc54_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l985_c7_fc54_return_output);

-- t16_MUX_uxn_opcodes_h_l985_c7_fc54
t16_MUX_uxn_opcodes_h_l985_c7_fc54 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l985_c7_fc54_cond,
t16_MUX_uxn_opcodes_h_l985_c7_fc54_iftrue,
t16_MUX_uxn_opcodes_h_l985_c7_fc54_iffalse,
t16_MUX_uxn_opcodes_h_l985_c7_fc54_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l988_c11_e96f
BIN_OP_EQ_uxn_opcodes_h_l988_c11_e96f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l988_c11_e96f_left,
BIN_OP_EQ_uxn_opcodes_h_l988_c11_e96f_right,
BIN_OP_EQ_uxn_opcodes_h_l988_c11_e96f_return_output);

-- n16_MUX_uxn_opcodes_h_l988_c7_03cc
n16_MUX_uxn_opcodes_h_l988_c7_03cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l988_c7_03cc_cond,
n16_MUX_uxn_opcodes_h_l988_c7_03cc_iftrue,
n16_MUX_uxn_opcodes_h_l988_c7_03cc_iffalse,
n16_MUX_uxn_opcodes_h_l988_c7_03cc_return_output);

-- tmp16_MUX_uxn_opcodes_h_l988_c7_03cc
tmp16_MUX_uxn_opcodes_h_l988_c7_03cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l988_c7_03cc_cond,
tmp16_MUX_uxn_opcodes_h_l988_c7_03cc_iftrue,
tmp16_MUX_uxn_opcodes_h_l988_c7_03cc_iffalse,
tmp16_MUX_uxn_opcodes_h_l988_c7_03cc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_03cc
result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_03cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_03cc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_03cc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_03cc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_03cc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_03cc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_03cc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_03cc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_03cc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_03cc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_03cc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_03cc
result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_03cc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_03cc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_03cc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_03cc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_03cc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l988_c7_03cc
result_u8_value_MUX_uxn_opcodes_h_l988_c7_03cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l988_c7_03cc_cond,
result_u8_value_MUX_uxn_opcodes_h_l988_c7_03cc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l988_c7_03cc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l988_c7_03cc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_03cc
result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_03cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_03cc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_03cc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_03cc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_03cc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_03cc
result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_03cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_03cc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_03cc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_03cc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_03cc_return_output);

-- t16_MUX_uxn_opcodes_h_l988_c7_03cc
t16_MUX_uxn_opcodes_h_l988_c7_03cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l988_c7_03cc_cond,
t16_MUX_uxn_opcodes_h_l988_c7_03cc_iftrue,
t16_MUX_uxn_opcodes_h_l988_c7_03cc_iffalse,
t16_MUX_uxn_opcodes_h_l988_c7_03cc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l993_c11_c096
BIN_OP_EQ_uxn_opcodes_h_l993_c11_c096 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l993_c11_c096_left,
BIN_OP_EQ_uxn_opcodes_h_l993_c11_c096_right,
BIN_OP_EQ_uxn_opcodes_h_l993_c11_c096_return_output);

-- n16_MUX_uxn_opcodes_h_l993_c7_852a
n16_MUX_uxn_opcodes_h_l993_c7_852a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l993_c7_852a_cond,
n16_MUX_uxn_opcodes_h_l993_c7_852a_iftrue,
n16_MUX_uxn_opcodes_h_l993_c7_852a_iffalse,
n16_MUX_uxn_opcodes_h_l993_c7_852a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l993_c7_852a
tmp16_MUX_uxn_opcodes_h_l993_c7_852a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l993_c7_852a_cond,
tmp16_MUX_uxn_opcodes_h_l993_c7_852a_iftrue,
tmp16_MUX_uxn_opcodes_h_l993_c7_852a_iffalse,
tmp16_MUX_uxn_opcodes_h_l993_c7_852a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_852a
result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_852a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_852a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_852a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_852a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_852a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_852a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_852a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_852a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_852a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_852a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_852a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_852a
result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_852a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_852a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_852a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_852a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_852a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l993_c7_852a
result_u8_value_MUX_uxn_opcodes_h_l993_c7_852a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l993_c7_852a_cond,
result_u8_value_MUX_uxn_opcodes_h_l993_c7_852a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l993_c7_852a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l993_c7_852a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_852a
result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_852a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_852a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_852a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_852a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_852a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_852a
result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_852a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_852a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_852a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_852a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_852a_return_output);

-- t16_MUX_uxn_opcodes_h_l993_c7_852a
t16_MUX_uxn_opcodes_h_l993_c7_852a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l993_c7_852a_cond,
t16_MUX_uxn_opcodes_h_l993_c7_852a_iftrue,
t16_MUX_uxn_opcodes_h_l993_c7_852a_iffalse,
t16_MUX_uxn_opcodes_h_l993_c7_852a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l994_c3_2ece
BIN_OP_OR_uxn_opcodes_h_l994_c3_2ece : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l994_c3_2ece_left,
BIN_OP_OR_uxn_opcodes_h_l994_c3_2ece_right,
BIN_OP_OR_uxn_opcodes_h_l994_c3_2ece_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l997_c11_165c
BIN_OP_EQ_uxn_opcodes_h_l997_c11_165c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l997_c11_165c_left,
BIN_OP_EQ_uxn_opcodes_h_l997_c11_165c_right,
BIN_OP_EQ_uxn_opcodes_h_l997_c11_165c_return_output);

-- n16_MUX_uxn_opcodes_h_l997_c7_41ad
n16_MUX_uxn_opcodes_h_l997_c7_41ad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l997_c7_41ad_cond,
n16_MUX_uxn_opcodes_h_l997_c7_41ad_iftrue,
n16_MUX_uxn_opcodes_h_l997_c7_41ad_iffalse,
n16_MUX_uxn_opcodes_h_l997_c7_41ad_return_output);

-- tmp16_MUX_uxn_opcodes_h_l997_c7_41ad
tmp16_MUX_uxn_opcodes_h_l997_c7_41ad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l997_c7_41ad_cond,
tmp16_MUX_uxn_opcodes_h_l997_c7_41ad_iftrue,
tmp16_MUX_uxn_opcodes_h_l997_c7_41ad_iffalse,
tmp16_MUX_uxn_opcodes_h_l997_c7_41ad_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_41ad
result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_41ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_41ad_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_41ad_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_41ad_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_41ad_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_41ad
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_41ad : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_41ad_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_41ad_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_41ad_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_41ad_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l997_c7_41ad
result_sp_relative_shift_MUX_uxn_opcodes_h_l997_c7_41ad : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l997_c7_41ad_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l997_c7_41ad_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l997_c7_41ad_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l997_c7_41ad_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l997_c7_41ad
result_u8_value_MUX_uxn_opcodes_h_l997_c7_41ad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l997_c7_41ad_cond,
result_u8_value_MUX_uxn_opcodes_h_l997_c7_41ad_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l997_c7_41ad_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l997_c7_41ad_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_41ad
result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_41ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_41ad_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_41ad_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_41ad_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_41ad_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_41ad
result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_41ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_41ad_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_41ad_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_41ad_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_41ad_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1001_c11_c139
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_c139 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_c139_left,
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_c139_right,
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_c139_return_output);

-- n16_MUX_uxn_opcodes_h_l1001_c7_5321
n16_MUX_uxn_opcodes_h_l1001_c7_5321 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1001_c7_5321_cond,
n16_MUX_uxn_opcodes_h_l1001_c7_5321_iftrue,
n16_MUX_uxn_opcodes_h_l1001_c7_5321_iffalse,
n16_MUX_uxn_opcodes_h_l1001_c7_5321_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1001_c7_5321
tmp16_MUX_uxn_opcodes_h_l1001_c7_5321 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1001_c7_5321_cond,
tmp16_MUX_uxn_opcodes_h_l1001_c7_5321_iftrue,
tmp16_MUX_uxn_opcodes_h_l1001_c7_5321_iffalse,
tmp16_MUX_uxn_opcodes_h_l1001_c7_5321_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_5321
result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_5321 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_5321_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_5321_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_5321_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_5321_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_5321
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_5321 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_5321_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_5321_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_5321_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_5321_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_5321
result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_5321 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_5321_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_5321_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_5321_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_5321_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1001_c7_5321
result_u8_value_MUX_uxn_opcodes_h_l1001_c7_5321 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1001_c7_5321_cond,
result_u8_value_MUX_uxn_opcodes_h_l1001_c7_5321_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1001_c7_5321_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1001_c7_5321_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_5321
result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_5321 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_5321_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_5321_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_5321_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_5321_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_5321
result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_5321 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_5321_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_5321_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_5321_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_5321_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1002_c3_73f0
BIN_OP_OR_uxn_opcodes_h_l1002_c3_73f0 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1002_c3_73f0_left,
BIN_OP_OR_uxn_opcodes_h_l1002_c3_73f0_right,
BIN_OP_OR_uxn_opcodes_h_l1002_c3_73f0_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1003_c11_89b7
BIN_OP_OR_uxn_opcodes_h_l1003_c11_89b7 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1003_c11_89b7_left,
BIN_OP_OR_uxn_opcodes_h_l1003_c11_89b7_right,
BIN_OP_OR_uxn_opcodes_h_l1003_c11_89b7_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1005_c30_8704
sp_relative_shift_uxn_opcodes_h_l1005_c30_8704 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1005_c30_8704_ins,
sp_relative_shift_uxn_opcodes_h_l1005_c30_8704_x,
sp_relative_shift_uxn_opcodes_h_l1005_c30_8704_y,
sp_relative_shift_uxn_opcodes_h_l1005_c30_8704_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1010_c11_cd0e
BIN_OP_EQ_uxn_opcodes_h_l1010_c11_cd0e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1010_c11_cd0e_left,
BIN_OP_EQ_uxn_opcodes_h_l1010_c11_cd0e_right,
BIN_OP_EQ_uxn_opcodes_h_l1010_c11_cd0e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_0063
result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_0063 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_0063_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_0063_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_0063_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_0063_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_0063
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_0063 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_0063_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_0063_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_0063_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_0063_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1010_c7_0063
result_u8_value_MUX_uxn_opcodes_h_l1010_c7_0063 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1010_c7_0063_cond,
result_u8_value_MUX_uxn_opcodes_h_l1010_c7_0063_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1010_c7_0063_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1010_c7_0063_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_0063
result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_0063 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_0063_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_0063_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_0063_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_0063_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_0063
result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_0063 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_0063_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_0063_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_0063_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_0063_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1013_c31_cab9
CONST_SR_8_uxn_opcodes_h_l1013_c31_cab9 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1013_c31_cab9_x,
CONST_SR_8_uxn_opcodes_h_l1013_c31_cab9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1015_c11_7e4d
BIN_OP_EQ_uxn_opcodes_h_l1015_c11_7e4d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1015_c11_7e4d_left,
BIN_OP_EQ_uxn_opcodes_h_l1015_c11_7e4d_right,
BIN_OP_EQ_uxn_opcodes_h_l1015_c11_7e4d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_55ae
result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_55ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_55ae_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_55ae_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_55ae_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_55ae_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_55ae
result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_55ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_55ae_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_55ae_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_55ae_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_55ae_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l990_l999_DUPLICATE_8af1
CONST_SL_8_uint16_t_uxn_opcodes_h_l990_l999_DUPLICATE_8af1 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l990_l999_DUPLICATE_8af1_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l990_l999_DUPLICATE_8af1_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l980_c6_3cf7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l980_c1_3cf5_return_output,
 n16_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output,
 tmp16_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output,
 t16_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l985_c11_c5ea_return_output,
 n16_MUX_uxn_opcodes_h_l985_c7_fc54_return_output,
 tmp16_MUX_uxn_opcodes_h_l985_c7_fc54_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_fc54_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_fc54_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_fc54_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l985_c7_fc54_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_fc54_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l985_c7_fc54_return_output,
 t16_MUX_uxn_opcodes_h_l985_c7_fc54_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l988_c11_e96f_return_output,
 n16_MUX_uxn_opcodes_h_l988_c7_03cc_return_output,
 tmp16_MUX_uxn_opcodes_h_l988_c7_03cc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_03cc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_03cc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_03cc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l988_c7_03cc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_03cc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_03cc_return_output,
 t16_MUX_uxn_opcodes_h_l988_c7_03cc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l993_c11_c096_return_output,
 n16_MUX_uxn_opcodes_h_l993_c7_852a_return_output,
 tmp16_MUX_uxn_opcodes_h_l993_c7_852a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_852a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_852a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_852a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l993_c7_852a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_852a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_852a_return_output,
 t16_MUX_uxn_opcodes_h_l993_c7_852a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l994_c3_2ece_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l997_c11_165c_return_output,
 n16_MUX_uxn_opcodes_h_l997_c7_41ad_return_output,
 tmp16_MUX_uxn_opcodes_h_l997_c7_41ad_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_41ad_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_41ad_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l997_c7_41ad_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l997_c7_41ad_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_41ad_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_41ad_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1001_c11_c139_return_output,
 n16_MUX_uxn_opcodes_h_l1001_c7_5321_return_output,
 tmp16_MUX_uxn_opcodes_h_l1001_c7_5321_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_5321_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_5321_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_5321_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1001_c7_5321_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_5321_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_5321_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1002_c3_73f0_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1003_c11_89b7_return_output,
 sp_relative_shift_uxn_opcodes_h_l1005_c30_8704_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1010_c11_cd0e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_0063_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_0063_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1010_c7_0063_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_0063_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_0063_return_output,
 CONST_SR_8_uxn_opcodes_h_l1013_c31_cab9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1015_c11_7e4d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_55ae_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_55ae_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l990_l999_DUPLICATE_8af1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l980_c6_3cf7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l980_c6_3cf7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l980_c6_3cf7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l980_c1_3cf5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l980_c1_3cf5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l980_c1_3cf5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l980_c1_3cf5_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l980_c2_4bd9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l980_c2_4bd9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l985_c7_fc54_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l980_c2_4bd9_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l980_c2_4bd9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l980_c2_4bd9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l985_c7_fc54_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l980_c2_4bd9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l980_c2_4bd9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l980_c2_4bd9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_fc54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l980_c2_4bd9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c2_4bd9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l982_c3_2c73 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c2_4bd9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_fc54_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c2_4bd9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c2_4bd9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c2_4bd9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_fc54_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c2_4bd9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l980_c2_4bd9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l980_c2_4bd9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l985_c7_fc54_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l980_c2_4bd9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l980_c2_4bd9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l980_c2_4bd9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_fc54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l980_c2_4bd9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l980_c2_4bd9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l980_c2_4bd9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l985_c7_fc54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l980_c2_4bd9_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l980_c2_4bd9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l980_c2_4bd9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l985_c7_fc54_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l980_c2_4bd9_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l981_c3_01bd_uxn_opcodes_h_l981_c3_01bd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_c5ea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_c5ea_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_c5ea_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l985_c7_fc54_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l985_c7_fc54_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l988_c7_03cc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l985_c7_fc54_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l985_c7_fc54_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l985_c7_fc54_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l988_c7_03cc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l985_c7_fc54_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_fc54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_fc54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_03cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_fc54_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_fc54_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l986_c3_6f62 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_fc54_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_03cc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_fc54_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_fc54_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_fc54_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_03cc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_fc54_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l985_c7_fc54_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l985_c7_fc54_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c7_03cc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l985_c7_fc54_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_fc54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_fc54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_03cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_fc54_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l985_c7_fc54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l985_c7_fc54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_03cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l985_c7_fc54_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l985_c7_fc54_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l985_c7_fc54_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l988_c7_03cc_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l985_c7_fc54_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_e96f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_e96f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_e96f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l988_c7_03cc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l988_c7_03cc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l993_c7_852a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l988_c7_03cc_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l988_c7_03cc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l988_c7_03cc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_852a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l988_c7_03cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_03cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_03cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_852a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_03cc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_03cc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l991_c3_3130 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_03cc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_852a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_03cc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_03cc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_03cc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_852a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_03cc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c7_03cc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c7_03cc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_852a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c7_03cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_03cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_03cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_852a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_03cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_03cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_03cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_852a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_03cc_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l988_c7_03cc_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l988_c7_03cc_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l993_c7_852a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l988_c7_03cc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_c096_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_c096_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_c096_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l993_c7_852a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l993_c7_852a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l997_c7_41ad_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l993_c7_852a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_852a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_852a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l997_c7_41ad_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_852a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_852a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_852a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_41ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_852a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_852a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l995_c3_3322 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_852a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_41ad_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_852a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_852a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_852a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l997_c7_41ad_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_852a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_852a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_852a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l997_c7_41ad_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_852a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_852a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_852a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_41ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_852a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_852a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_852a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_41ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_852a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l993_c7_852a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l993_c7_852a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l993_c7_852a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l994_c3_2ece_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l994_c3_2ece_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l994_c3_2ece_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_165c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_165c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_165c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l997_c7_41ad_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l997_c7_41ad_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1001_c7_5321_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l997_c7_41ad_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l997_c7_41ad_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l997_c7_41ad_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_5321_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l997_c7_41ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_41ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_41ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_5321_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_41ad_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_41ad_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_41ad_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_5321_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_41ad_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l997_c7_41ad_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l997_c7_41ad_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_5321_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l997_c7_41ad_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l997_c7_41ad_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l997_c7_41ad_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_5321_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l997_c7_41ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_41ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_41ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_5321_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_41ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_41ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_41ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_5321_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_41ad_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_c139_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_c139_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_c139_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1001_c7_5321_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1001_c7_5321_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1001_c7_5321_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_5321_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_5321_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_5321_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_5321_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_5321_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_0063_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_5321_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_5321_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1007_c3_36bc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_5321_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_0063_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_5321_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_5321_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_5321_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_5321_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_5321_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_5321_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1010_c7_0063_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_5321_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_5321_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_5321_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_0063_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_5321_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_5321_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_5321_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_0063_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_5321_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1002_c3_73f0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1002_c3_73f0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1002_c3_73f0_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1003_c11_89b7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1003_c11_89b7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1003_c11_89b7_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1005_c30_8704_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1005_c30_8704_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1005_c30_8704_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1005_c30_8704_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1008_c21_1823_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_cd0e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_cd0e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_cd0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_0063_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_0063_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_55ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_0063_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_0063_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1012_c3_4acc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_0063_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_0063_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1010_c7_0063_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1010_c7_0063_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1010_c7_0063_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_0063_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_0063_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_55ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_0063_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_0063_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_0063_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_0063_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1013_c31_cab9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1013_c31_cab9_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1013_c21_110f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_7e4d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_7e4d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_7e4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_55ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_55ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_55ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_55ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_55ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_55ae_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l997_l993_l988_l985_l1015_l980_l1010_DUPLICATE_e219_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1001_l997_l993_l988_l985_l980_DUPLICATE_342e_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l997_l993_l988_l985_l980_l1010_DUPLICATE_358e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l997_l993_l988_l985_l980_l1010_DUPLICATE_e05b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1001_l997_l993_l988_l985_l1015_l1010_DUPLICATE_19d7_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1002_l994_l998_l989_DUPLICATE_a49a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l990_l999_DUPLICATE_8af1_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l990_l999_DUPLICATE_8af1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1010_l997_DUPLICATE_3076_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l1020_l976_DUPLICATE_fd84_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l982_c3_2c73 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c2_4bd9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l982_c3_2c73;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1007_c3_36bc := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_5321_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1007_c3_36bc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_cd0e_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_55ae_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l980_c2_4bd9_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_55ae_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l991_c3_3130 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_03cc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l991_c3_3130;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_5321_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_5321_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1005_c30_8704_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_e96f_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_0063_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l995_c3_3322 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_852a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l995_c3_3322;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1012_c3_4acc := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_0063_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1012_c3_4acc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_c5ea_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_165c_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1005_c30_8704_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l980_c6_3cf7_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_c139_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_c096_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l986_c3_6f62 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_fc54_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l986_c3_6f62;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l980_c1_3cf5_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_7e4d_right := to_unsigned(7, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l980_c1_3cf5_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1005_c30_8704_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1002_c3_73f0_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1001_c7_5321_iffalse := n16;
     VAR_n16_MUX_uxn_opcodes_h_l980_c2_4bd9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l985_c7_fc54_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l988_c7_03cc_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l993_c7_852a_iftrue := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_c139_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_cd0e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_7e4d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l980_c6_3cf7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_c5ea_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_e96f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_c096_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_165c_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1003_c11_89b7_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l994_c3_2ece_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l980_c2_4bd9_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l985_c7_fc54_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l993_c7_852a_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1013_c31_cab9_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_5321_iffalse := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l980_c2_4bd9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l985_c7_fc54_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l988_c7_03cc_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_852a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l997_c7_41ad_iftrue := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l997_l993_l988_l985_l1015_l980_l1010_DUPLICATE_e219 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l997_l993_l988_l985_l1015_l980_l1010_DUPLICATE_e219_return_output := result.is_stack_write;

     -- sp_relative_shift[uxn_opcodes_h_l1005_c30_8704] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1005_c30_8704_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1005_c30_8704_ins;
     sp_relative_shift_uxn_opcodes_h_l1005_c30_8704_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1005_c30_8704_x;
     sp_relative_shift_uxn_opcodes_h_l1005_c30_8704_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1005_c30_8704_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1005_c30_8704_return_output := sp_relative_shift_uxn_opcodes_h_l1005_c30_8704_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l993_c11_c096] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l993_c11_c096_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_c096_left;
     BIN_OP_EQ_uxn_opcodes_h_l993_c11_c096_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_c096_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_c096_return_output := BIN_OP_EQ_uxn_opcodes_h_l993_c11_c096_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l985_c11_c5ea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l985_c11_c5ea_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_c5ea_left;
     BIN_OP_EQ_uxn_opcodes_h_l985_c11_c5ea_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_c5ea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_c5ea_return_output := BIN_OP_EQ_uxn_opcodes_h_l985_c11_c5ea_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1001_c11_c139] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1001_c11_c139_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_c139_left;
     BIN_OP_EQ_uxn_opcodes_h_l1001_c11_c139_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_c139_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_c139_return_output := BIN_OP_EQ_uxn_opcodes_h_l1001_c11_c139_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1015_c11_7e4d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1015_c11_7e4d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_7e4d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1015_c11_7e4d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_7e4d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_7e4d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1015_c11_7e4d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l997_c11_165c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l997_c11_165c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_165c_left;
     BIN_OP_EQ_uxn_opcodes_h_l997_c11_165c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_165c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_165c_return_output := BIN_OP_EQ_uxn_opcodes_h_l997_c11_165c_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1010_l997_DUPLICATE_3076 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1010_l997_DUPLICATE_3076_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l980_c6_3cf7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l980_c6_3cf7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l980_c6_3cf7_left;
     BIN_OP_EQ_uxn_opcodes_h_l980_c6_3cf7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l980_c6_3cf7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l980_c6_3cf7_return_output := BIN_OP_EQ_uxn_opcodes_h_l980_c6_3cf7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1010_c11_cd0e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1010_c11_cd0e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_cd0e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1010_c11_cd0e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_cd0e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_cd0e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1010_c11_cd0e_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1001_l997_l993_l988_l985_l980_DUPLICATE_342e LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1001_l997_l993_l988_l985_l980_DUPLICATE_342e_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l997_l993_l988_l985_l980_l1010_DUPLICATE_e05b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l997_l993_l988_l985_l980_l1010_DUPLICATE_e05b_return_output := result.is_sp_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1002_l994_l998_l989_DUPLICATE_a49a LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1002_l994_l998_l989_DUPLICATE_a49a_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l997_l993_l988_l985_l980_l1010_DUPLICATE_358e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l997_l993_l988_l985_l980_l1010_DUPLICATE_358e_return_output := result.u8_value;

     -- CONST_SR_8[uxn_opcodes_h_l1013_c31_cab9] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1013_c31_cab9_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1013_c31_cab9_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1013_c31_cab9_return_output := CONST_SR_8_uxn_opcodes_h_l1013_c31_cab9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l988_c11_e96f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l988_c11_e96f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_e96f_left;
     BIN_OP_EQ_uxn_opcodes_h_l988_c11_e96f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_e96f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_e96f_return_output := BIN_OP_EQ_uxn_opcodes_h_l988_c11_e96f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1001_l997_l993_l988_l985_l1015_l1010_DUPLICATE_19d7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1001_l997_l993_l988_l985_l1015_l1010_DUPLICATE_19d7_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1001_c7_5321_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_c139_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_5321_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_c139_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_5321_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_c139_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_5321_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_c139_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_5321_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_c139_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_5321_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_c139_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_5321_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_c139_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_5321_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_c139_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_0063_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_cd0e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_0063_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_cd0e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_0063_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_cd0e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_0063_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_cd0e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1010_c7_0063_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_cd0e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_55ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_7e4d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_55ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1015_c11_7e4d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l980_c1_3cf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l980_c6_3cf7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l980_c2_4bd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l980_c6_3cf7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l980_c2_4bd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l980_c6_3cf7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l980_c2_4bd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l980_c6_3cf7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l980_c2_4bd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l980_c6_3cf7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c2_4bd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l980_c6_3cf7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c2_4bd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l980_c6_3cf7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l980_c2_4bd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l980_c6_3cf7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l980_c2_4bd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l980_c6_3cf7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l980_c2_4bd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l980_c6_3cf7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l985_c7_fc54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_c5ea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_fc54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_c5ea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l985_c7_fc54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_c5ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_fc54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_c5ea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_fc54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_c5ea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_fc54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_c5ea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l985_c7_fc54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_c5ea_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l985_c7_fc54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_c5ea_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l985_c7_fc54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_c5ea_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l988_c7_03cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_e96f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_03cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_e96f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_03cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_e96f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_03cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_e96f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_03cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_e96f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_03cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_e96f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c7_03cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_e96f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l988_c7_03cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_e96f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l988_c7_03cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_e96f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l993_c7_852a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_c096_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_852a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_c096_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_852a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_c096_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_852a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_c096_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_852a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_c096_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_852a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_c096_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_852a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_c096_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l993_c7_852a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_c096_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_852a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_c096_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l997_c7_41ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_165c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_41ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_165c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_41ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_165c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_41ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_165c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l997_c7_41ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_165c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_41ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_165c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l997_c7_41ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_165c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l997_c7_41ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l997_c11_165c_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1002_c3_73f0_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1002_l994_l998_l989_DUPLICATE_a49a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l994_c3_2ece_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1002_l994_l998_l989_DUPLICATE_a49a_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l990_l999_DUPLICATE_8af1_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1002_l994_l998_l989_DUPLICATE_a49a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_5321_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1001_l997_l993_l988_l985_l980_DUPLICATE_342e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c2_4bd9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1001_l997_l993_l988_l985_l980_DUPLICATE_342e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_fc54_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1001_l997_l993_l988_l985_l980_DUPLICATE_342e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_03cc_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1001_l997_l993_l988_l985_l980_DUPLICATE_342e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_852a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1001_l997_l993_l988_l985_l980_DUPLICATE_342e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l997_c7_41ad_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1001_l997_l993_l988_l985_l980_DUPLICATE_342e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_5321_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1001_l997_l993_l988_l985_l1015_l1010_DUPLICATE_19d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_0063_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1001_l997_l993_l988_l985_l1015_l1010_DUPLICATE_19d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_55ae_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1001_l997_l993_l988_l985_l1015_l1010_DUPLICATE_19d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_fc54_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1001_l997_l993_l988_l985_l1015_l1010_DUPLICATE_19d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_03cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1001_l997_l993_l988_l985_l1015_l1010_DUPLICATE_19d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_852a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1001_l997_l993_l988_l985_l1015_l1010_DUPLICATE_19d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_41ad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1001_l997_l993_l988_l985_l1015_l1010_DUPLICATE_19d7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_0063_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l997_l993_l988_l985_l980_l1010_DUPLICATE_e05b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l980_c2_4bd9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l997_l993_l988_l985_l980_l1010_DUPLICATE_e05b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l985_c7_fc54_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l997_l993_l988_l985_l980_l1010_DUPLICATE_e05b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_03cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l997_l993_l988_l985_l980_l1010_DUPLICATE_e05b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_852a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l997_l993_l988_l985_l980_l1010_DUPLICATE_e05b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_41ad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l997_l993_l988_l985_l980_l1010_DUPLICATE_e05b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_0063_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l997_l993_l988_l985_l1015_l980_l1010_DUPLICATE_e219_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_55ae_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l997_l993_l988_l985_l1015_l980_l1010_DUPLICATE_e219_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l980_c2_4bd9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l997_l993_l988_l985_l1015_l980_l1010_DUPLICATE_e219_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_fc54_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l997_l993_l988_l985_l1015_l980_l1010_DUPLICATE_e219_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_03cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l997_l993_l988_l985_l1015_l980_l1010_DUPLICATE_e219_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_852a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l997_l993_l988_l985_l1015_l980_l1010_DUPLICATE_e219_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_41ad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l997_l993_l988_l985_l1015_l980_l1010_DUPLICATE_e219_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_0063_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1010_l997_DUPLICATE_3076_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_41ad_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1010_l997_DUPLICATE_3076_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1010_c7_0063_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l997_l993_l988_l985_l980_l1010_DUPLICATE_358e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l980_c2_4bd9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l997_l993_l988_l985_l980_l1010_DUPLICATE_358e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l985_c7_fc54_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l997_l993_l988_l985_l980_l1010_DUPLICATE_358e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c7_03cc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l997_l993_l988_l985_l980_l1010_DUPLICATE_358e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_852a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l997_l993_l988_l985_l980_l1010_DUPLICATE_358e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l997_c7_41ad_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l997_l993_l988_l985_l980_l1010_DUPLICATE_358e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_5321_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1005_c30_8704_return_output;
     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l990_l999_DUPLICATE_8af1 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l990_l999_DUPLICATE_8af1_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l990_l999_DUPLICATE_8af1_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l990_l999_DUPLICATE_8af1_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l990_l999_DUPLICATE_8af1_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1002_c3_73f0] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1002_c3_73f0_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1002_c3_73f0_left;
     BIN_OP_OR_uxn_opcodes_h_l1002_c3_73f0_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1002_c3_73f0_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1002_c3_73f0_return_output := BIN_OP_OR_uxn_opcodes_h_l1002_c3_73f0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l980_c1_3cf5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l980_c1_3cf5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l980_c1_3cf5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l980_c1_3cf5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l980_c1_3cf5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l980_c1_3cf5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l980_c1_3cf5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l980_c1_3cf5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l980_c1_3cf5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1010_c7_0063] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_0063_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_0063_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_0063_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_0063_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_0063_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_0063_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_0063_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_0063_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1013_c21_110f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1013_c21_110f_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1013_c31_cab9_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1001_c7_5321] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_5321_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_5321_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_5321_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_5321_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_5321_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_5321_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_5321_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_5321_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1010_c7_0063] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_0063_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_0063_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_0063_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_0063_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_0063_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_0063_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_0063_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_0063_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1015_c7_55ae] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_55ae_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_55ae_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_55ae_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_55ae_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_55ae_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_55ae_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_55ae_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_55ae_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1015_c7_55ae] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_55ae_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_55ae_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_55ae_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_55ae_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_55ae_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_55ae_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_55ae_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_55ae_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l994_c3_2ece] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l994_c3_2ece_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l994_c3_2ece_left;
     BIN_OP_OR_uxn_opcodes_h_l994_c3_2ece_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l994_c3_2ece_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l994_c3_2ece_return_output := BIN_OP_OR_uxn_opcodes_h_l994_c3_2ece_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_opcodes_h_l1003_c11_89b7_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1002_c3_73f0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1001_c7_5321_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1002_c3_73f0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l993_c7_852a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l994_c3_2ece_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1010_c7_0063_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1013_c21_110f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l997_c7_41ad_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l990_l999_DUPLICATE_8af1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l988_c7_03cc_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l990_l999_DUPLICATE_8af1_return_output;
     VAR_printf_uxn_opcodes_h_l981_c3_01bd_uxn_opcodes_h_l981_c3_01bd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l980_c1_3cf5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_0063_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1015_c7_55ae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_5321_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_0063_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_0063_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1015_c7_55ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l997_c7_41ad_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_5321_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_5321_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_0063_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1001_c7_5321] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_5321_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_5321_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_5321_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_5321_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_5321_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_5321_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_5321_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_5321_return_output;

     -- printf_uxn_opcodes_h_l981_c3_01bd[uxn_opcodes_h_l981_c3_01bd] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l981_c3_01bd_uxn_opcodes_h_l981_c3_01bd_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l981_c3_01bd_uxn_opcodes_h_l981_c3_01bd_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1010_c7_0063] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_0063_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_0063_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_0063_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_0063_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_0063_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_0063_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_0063_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_0063_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l997_c7_41ad] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l997_c7_41ad_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l997_c7_41ad_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l997_c7_41ad_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l997_c7_41ad_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l997_c7_41ad_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l997_c7_41ad_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l997_c7_41ad_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l997_c7_41ad_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1001_c7_5321] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_5321_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_5321_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_5321_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_5321_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_5321_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_5321_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_5321_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_5321_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1010_c7_0063] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1010_c7_0063_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1010_c7_0063_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1010_c7_0063_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1010_c7_0063_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1010_c7_0063_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1010_c7_0063_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1010_c7_0063_return_output := result_u8_value_MUX_uxn_opcodes_h_l1010_c7_0063_return_output;

     -- n16_MUX[uxn_opcodes_h_l1001_c7_5321] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1001_c7_5321_cond <= VAR_n16_MUX_uxn_opcodes_h_l1001_c7_5321_cond;
     n16_MUX_uxn_opcodes_h_l1001_c7_5321_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1001_c7_5321_iftrue;
     n16_MUX_uxn_opcodes_h_l1001_c7_5321_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1001_c7_5321_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1001_c7_5321_return_output := n16_MUX_uxn_opcodes_h_l1001_c7_5321_return_output;

     -- t16_MUX[uxn_opcodes_h_l993_c7_852a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l993_c7_852a_cond <= VAR_t16_MUX_uxn_opcodes_h_l993_c7_852a_cond;
     t16_MUX_uxn_opcodes_h_l993_c7_852a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l993_c7_852a_iftrue;
     t16_MUX_uxn_opcodes_h_l993_c7_852a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l993_c7_852a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l993_c7_852a_return_output := t16_MUX_uxn_opcodes_h_l993_c7_852a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1010_c7_0063] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_0063_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_0063_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_0063_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_0063_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_0063_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_0063_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_0063_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_0063_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1003_c11_89b7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1003_c11_89b7_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1003_c11_89b7_left;
     BIN_OP_OR_uxn_opcodes_h_l1003_c11_89b7_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1003_c11_89b7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1003_c11_89b7_return_output := BIN_OP_OR_uxn_opcodes_h_l1003_c11_89b7_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_5321_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1003_c11_89b7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l997_c7_41ad_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1001_c7_5321_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_5321_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_0063_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_41ad_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_5321_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_5321_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_0063_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_852a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l997_c7_41ad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_41ad_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_5321_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_5321_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1010_c7_0063_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l988_c7_03cc_iffalse := VAR_t16_MUX_uxn_opcodes_h_l993_c7_852a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1001_c7_5321] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_5321_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_5321_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_5321_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_5321_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_5321_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_5321_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_5321_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_5321_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1001_c7_5321] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1001_c7_5321_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_5321_cond;
     tmp16_MUX_uxn_opcodes_h_l1001_c7_5321_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_5321_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1001_c7_5321_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_5321_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_5321_return_output := tmp16_MUX_uxn_opcodes_h_l1001_c7_5321_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l997_c7_41ad] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_41ad_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_41ad_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_41ad_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_41ad_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_41ad_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_41ad_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_41ad_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_41ad_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l993_c7_852a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_852a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_852a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_852a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_852a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_852a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_852a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_852a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_852a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1001_c7_5321] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_5321_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_5321_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_5321_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_5321_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_5321_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_5321_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_5321_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_5321_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1008_c21_1823] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1008_c21_1823_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1003_c11_89b7_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l997_c7_41ad] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_41ad_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_41ad_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_41ad_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_41ad_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_41ad_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_41ad_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_41ad_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_41ad_return_output;

     -- t16_MUX[uxn_opcodes_h_l988_c7_03cc] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l988_c7_03cc_cond <= VAR_t16_MUX_uxn_opcodes_h_l988_c7_03cc_cond;
     t16_MUX_uxn_opcodes_h_l988_c7_03cc_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l988_c7_03cc_iftrue;
     t16_MUX_uxn_opcodes_h_l988_c7_03cc_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l988_c7_03cc_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l988_c7_03cc_return_output := t16_MUX_uxn_opcodes_h_l988_c7_03cc_return_output;

     -- n16_MUX[uxn_opcodes_h_l997_c7_41ad] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l997_c7_41ad_cond <= VAR_n16_MUX_uxn_opcodes_h_l997_c7_41ad_cond;
     n16_MUX_uxn_opcodes_h_l997_c7_41ad_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l997_c7_41ad_iftrue;
     n16_MUX_uxn_opcodes_h_l997_c7_41ad_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l997_c7_41ad_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l997_c7_41ad_return_output := n16_MUX_uxn_opcodes_h_l997_c7_41ad_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_5321_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1008_c21_1823_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l993_c7_852a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l997_c7_41ad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_41ad_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_5321_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_852a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l997_c7_41ad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_41ad_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_5321_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_03cc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_852a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_852a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l997_c7_41ad_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l985_c7_fc54_iffalse := VAR_t16_MUX_uxn_opcodes_h_l988_c7_03cc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l997_c7_41ad_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_5321_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l997_c7_41ad] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_41ad_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_41ad_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_41ad_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_41ad_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_41ad_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_41ad_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_41ad_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_41ad_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l993_c7_852a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_852a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_852a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_852a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_852a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_852a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_852a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_852a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_852a_return_output;

     -- n16_MUX[uxn_opcodes_h_l993_c7_852a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l993_c7_852a_cond <= VAR_n16_MUX_uxn_opcodes_h_l993_c7_852a_cond;
     n16_MUX_uxn_opcodes_h_l993_c7_852a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l993_c7_852a_iftrue;
     n16_MUX_uxn_opcodes_h_l993_c7_852a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l993_c7_852a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l993_c7_852a_return_output := n16_MUX_uxn_opcodes_h_l993_c7_852a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l993_c7_852a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_852a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_852a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_852a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_852a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_852a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_852a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_852a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_852a_return_output;

     -- t16_MUX[uxn_opcodes_h_l985_c7_fc54] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l985_c7_fc54_cond <= VAR_t16_MUX_uxn_opcodes_h_l985_c7_fc54_cond;
     t16_MUX_uxn_opcodes_h_l985_c7_fc54_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l985_c7_fc54_iftrue;
     t16_MUX_uxn_opcodes_h_l985_c7_fc54_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l985_c7_fc54_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l985_c7_fc54_return_output := t16_MUX_uxn_opcodes_h_l985_c7_fc54_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l997_c7_41ad] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l997_c7_41ad_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l997_c7_41ad_cond;
     tmp16_MUX_uxn_opcodes_h_l997_c7_41ad_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l997_c7_41ad_iftrue;
     tmp16_MUX_uxn_opcodes_h_l997_c7_41ad_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l997_c7_41ad_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l997_c7_41ad_return_output := tmp16_MUX_uxn_opcodes_h_l997_c7_41ad_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1001_c7_5321] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1001_c7_5321_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_5321_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1001_c7_5321_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_5321_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1001_c7_5321_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_5321_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_5321_return_output := result_u8_value_MUX_uxn_opcodes_h_l1001_c7_5321_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l988_c7_03cc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_03cc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_03cc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_03cc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_03cc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_03cc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_03cc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_03cc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_03cc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l997_c7_41ad] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_41ad_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_41ad_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_41ad_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_41ad_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_41ad_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_41ad_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_41ad_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_41ad_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l988_c7_03cc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l993_c7_852a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_852a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l997_c7_41ad_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_03cc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_852a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_852a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l997_c7_41ad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_fc54_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_03cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_03cc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_852a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l997_c7_41ad_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_5321_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l980_c2_4bd9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l985_c7_fc54_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_852a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l997_c7_41ad_return_output;
     -- t16_MUX[uxn_opcodes_h_l980_c2_4bd9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l980_c2_4bd9_cond <= VAR_t16_MUX_uxn_opcodes_h_l980_c2_4bd9_cond;
     t16_MUX_uxn_opcodes_h_l980_c2_4bd9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l980_c2_4bd9_iftrue;
     t16_MUX_uxn_opcodes_h_l980_c2_4bd9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l980_c2_4bd9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output := t16_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l988_c7_03cc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_03cc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_03cc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_03cc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_03cc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_03cc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_03cc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_03cc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_03cc_return_output;

     -- n16_MUX[uxn_opcodes_h_l988_c7_03cc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l988_c7_03cc_cond <= VAR_n16_MUX_uxn_opcodes_h_l988_c7_03cc_cond;
     n16_MUX_uxn_opcodes_h_l988_c7_03cc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l988_c7_03cc_iftrue;
     n16_MUX_uxn_opcodes_h_l988_c7_03cc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l988_c7_03cc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l988_c7_03cc_return_output := n16_MUX_uxn_opcodes_h_l988_c7_03cc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l988_c7_03cc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_03cc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_03cc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_03cc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_03cc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_03cc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_03cc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_03cc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_03cc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l985_c7_fc54] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_fc54_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_fc54_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_fc54_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_fc54_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_fc54_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_fc54_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_fc54_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_fc54_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l997_c7_41ad] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l997_c7_41ad_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l997_c7_41ad_cond;
     result_u8_value_MUX_uxn_opcodes_h_l997_c7_41ad_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l997_c7_41ad_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l997_c7_41ad_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l997_c7_41ad_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l997_c7_41ad_return_output := result_u8_value_MUX_uxn_opcodes_h_l997_c7_41ad_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l993_c7_852a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_852a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_852a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_852a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_852a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_852a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_852a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_852a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_852a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l993_c7_852a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_852a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_852a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_852a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_852a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_852a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_852a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_852a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_852a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l993_c7_852a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l993_c7_852a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_852a_cond;
     tmp16_MUX_uxn_opcodes_h_l993_c7_852a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_852a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l993_c7_852a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_852a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_852a_return_output := tmp16_MUX_uxn_opcodes_h_l993_c7_852a_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l985_c7_fc54_iffalse := VAR_n16_MUX_uxn_opcodes_h_l988_c7_03cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_03cc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_852a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l985_c7_fc54_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_03cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_03cc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_852a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c2_4bd9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_fc54_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_fc54_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_03cc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_852a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l997_c7_41ad_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l988_c7_03cc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_852a_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l985_c7_fc54] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l985_c7_fc54_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l985_c7_fc54_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l985_c7_fc54_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l985_c7_fc54_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l985_c7_fc54_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l985_c7_fc54_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l985_c7_fc54_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l985_c7_fc54_return_output;

     -- n16_MUX[uxn_opcodes_h_l985_c7_fc54] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l985_c7_fc54_cond <= VAR_n16_MUX_uxn_opcodes_h_l985_c7_fc54_cond;
     n16_MUX_uxn_opcodes_h_l985_c7_fc54_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l985_c7_fc54_iftrue;
     n16_MUX_uxn_opcodes_h_l985_c7_fc54_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l985_c7_fc54_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l985_c7_fc54_return_output := n16_MUX_uxn_opcodes_h_l985_c7_fc54_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l988_c7_03cc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_03cc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_03cc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_03cc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_03cc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_03cc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_03cc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_03cc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_03cc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l980_c2_4bd9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c2_4bd9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c2_4bd9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c2_4bd9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c2_4bd9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c2_4bd9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c2_4bd9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l985_c7_fc54] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_fc54_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_fc54_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_fc54_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_fc54_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_fc54_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_fc54_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_fc54_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_fc54_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l993_c7_852a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l993_c7_852a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_852a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l993_c7_852a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_852a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l993_c7_852a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_852a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_852a_return_output := result_u8_value_MUX_uxn_opcodes_h_l993_c7_852a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l988_c7_03cc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_03cc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_03cc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_03cc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_03cc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_03cc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_03cc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_03cc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_03cc_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l988_c7_03cc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l988_c7_03cc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l988_c7_03cc_cond;
     tmp16_MUX_uxn_opcodes_h_l988_c7_03cc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l988_c7_03cc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l988_c7_03cc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l988_c7_03cc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l988_c7_03cc_return_output := tmp16_MUX_uxn_opcodes_h_l988_c7_03cc_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l980_c2_4bd9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l985_c7_fc54_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_fc54_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_03cc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l980_c2_4bd9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l985_c7_fc54_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_fc54_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_03cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c2_4bd9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_fc54_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c7_03cc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_852a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l985_c7_fc54_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l988_c7_03cc_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l988_c7_03cc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l988_c7_03cc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c7_03cc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l988_c7_03cc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c7_03cc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l988_c7_03cc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c7_03cc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c7_03cc_return_output := result_u8_value_MUX_uxn_opcodes_h_l988_c7_03cc_return_output;

     -- n16_MUX[uxn_opcodes_h_l980_c2_4bd9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l980_c2_4bd9_cond <= VAR_n16_MUX_uxn_opcodes_h_l980_c2_4bd9_cond;
     n16_MUX_uxn_opcodes_h_l980_c2_4bd9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l980_c2_4bd9_iftrue;
     n16_MUX_uxn_opcodes_h_l980_c2_4bd9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l980_c2_4bd9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output := n16_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l980_c2_4bd9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l980_c2_4bd9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l980_c2_4bd9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l980_c2_4bd9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l980_c2_4bd9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l980_c2_4bd9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l980_c2_4bd9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l985_c7_fc54] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l985_c7_fc54_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l985_c7_fc54_cond;
     tmp16_MUX_uxn_opcodes_h_l985_c7_fc54_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l985_c7_fc54_iftrue;
     tmp16_MUX_uxn_opcodes_h_l985_c7_fc54_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l985_c7_fc54_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l985_c7_fc54_return_output := tmp16_MUX_uxn_opcodes_h_l985_c7_fc54_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l985_c7_fc54] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_fc54_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_fc54_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_fc54_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_fc54_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_fc54_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_fc54_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_fc54_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_fc54_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l980_c2_4bd9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c2_4bd9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c2_4bd9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c2_4bd9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c2_4bd9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c2_4bd9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c2_4bd9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l985_c7_fc54] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_fc54_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_fc54_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_fc54_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_fc54_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_fc54_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_fc54_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_fc54_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_fc54_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l980_c2_4bd9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_fc54_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l980_c2_4bd9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_fc54_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l985_c7_fc54_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c7_03cc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l980_c2_4bd9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l985_c7_fc54_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l980_c2_4bd9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l980_c2_4bd9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l980_c2_4bd9_cond;
     tmp16_MUX_uxn_opcodes_h_l980_c2_4bd9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l980_c2_4bd9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l980_c2_4bd9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l980_c2_4bd9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output := tmp16_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l980_c2_4bd9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l980_c2_4bd9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l980_c2_4bd9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l980_c2_4bd9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l980_c2_4bd9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l980_c2_4bd9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l980_c2_4bd9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l980_c2_4bd9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l980_c2_4bd9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l980_c2_4bd9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l980_c2_4bd9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l980_c2_4bd9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l980_c2_4bd9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l980_c2_4bd9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l985_c7_fc54] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l985_c7_fc54_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l985_c7_fc54_cond;
     result_u8_value_MUX_uxn_opcodes_h_l985_c7_fc54_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l985_c7_fc54_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l985_c7_fc54_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l985_c7_fc54_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l985_c7_fc54_return_output := result_u8_value_MUX_uxn_opcodes_h_l985_c7_fc54_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l980_c2_4bd9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l985_c7_fc54_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l980_c2_4bd9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l980_c2_4bd9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l980_c2_4bd9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l980_c2_4bd9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l980_c2_4bd9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l980_c2_4bd9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l980_c2_4bd9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output := result_u8_value_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l1020_l976_DUPLICATE_fd84 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l1020_l976_DUPLICATE_fd84_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c551(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l980_c2_4bd9_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l1020_l976_DUPLICATE_fd84_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l1020_l976_DUPLICATE_fd84_return_output;
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
