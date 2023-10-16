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
entity ora2_0CLK_a7b4806f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ora2_0CLK_a7b4806f;
architecture arch of ora2_0CLK_a7b4806f is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1076_c6_116c]
signal BIN_OP_EQ_uxn_opcodes_h_l1076_c6_116c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1076_c6_116c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1076_c6_116c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1076_c1_bfc3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1076_c1_bfc3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1076_c1_bfc3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1076_c1_bfc3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1076_c1_bfc3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1076_c2_bb6f]
signal n16_MUX_uxn_opcodes_h_l1076_c2_bb6f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1076_c2_bb6f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1076_c2_bb6f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1076_c2_bb6f]
signal tmp16_MUX_uxn_opcodes_h_l1076_c2_bb6f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1076_c2_bb6f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1076_c2_bb6f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1076_c2_bb6f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c2_bb6f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c2_bb6f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c2_bb6f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1076_c2_bb6f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c2_bb6f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c2_bb6f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c2_bb6f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1076_c2_bb6f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c2_bb6f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c2_bb6f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c2_bb6f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1076_c2_bb6f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1076_c2_bb6f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1076_c2_bb6f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1076_c2_bb6f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1076_c2_bb6f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1076_c2_bb6f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1076_c2_bb6f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1076_c2_bb6f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1076_c2_bb6f]
signal result_u8_value_MUX_uxn_opcodes_h_l1076_c2_bb6f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1076_c2_bb6f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1076_c2_bb6f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1076_c2_bb6f]
signal t16_MUX_uxn_opcodes_h_l1076_c2_bb6f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1076_c2_bb6f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1076_c2_bb6f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1077_c3_2235[uxn_opcodes_h_l1077_c3_2235]
signal printf_uxn_opcodes_h_l1077_c3_2235_uxn_opcodes_h_l1077_c3_2235_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1081_c11_ab0c]
signal BIN_OP_EQ_uxn_opcodes_h_l1081_c11_ab0c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1081_c11_ab0c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1081_c11_ab0c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1081_c7_96e5]
signal n16_MUX_uxn_opcodes_h_l1081_c7_96e5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1081_c7_96e5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1081_c7_96e5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1081_c7_96e5]
signal tmp16_MUX_uxn_opcodes_h_l1081_c7_96e5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1081_c7_96e5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1081_c7_96e5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1081_c7_96e5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_96e5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_96e5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_96e5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1081_c7_96e5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_96e5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_96e5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_96e5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1081_c7_96e5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_96e5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_96e5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_96e5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1081_c7_96e5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_96e5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_96e5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_96e5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1081_c7_96e5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_96e5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_96e5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_96e5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1081_c7_96e5]
signal result_u8_value_MUX_uxn_opcodes_h_l1081_c7_96e5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1081_c7_96e5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1081_c7_96e5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1081_c7_96e5]
signal t16_MUX_uxn_opcodes_h_l1081_c7_96e5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1081_c7_96e5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1081_c7_96e5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1084_c11_5474]
signal BIN_OP_EQ_uxn_opcodes_h_l1084_c11_5474_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1084_c11_5474_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1084_c11_5474_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1084_c7_b494]
signal n16_MUX_uxn_opcodes_h_l1084_c7_b494_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1084_c7_b494_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1084_c7_b494_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1084_c7_b494_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1084_c7_b494]
signal tmp16_MUX_uxn_opcodes_h_l1084_c7_b494_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1084_c7_b494_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1084_c7_b494_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1084_c7_b494_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1084_c7_b494]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_b494_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_b494_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_b494_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_b494_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1084_c7_b494]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_b494_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_b494_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_b494_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_b494_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1084_c7_b494]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_b494_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_b494_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_b494_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_b494_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1084_c7_b494]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_b494_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_b494_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_b494_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_b494_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1084_c7_b494]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_b494_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_b494_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_b494_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_b494_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1084_c7_b494]
signal result_u8_value_MUX_uxn_opcodes_h_l1084_c7_b494_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1084_c7_b494_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1084_c7_b494_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1084_c7_b494_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1084_c7_b494]
signal t16_MUX_uxn_opcodes_h_l1084_c7_b494_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1084_c7_b494_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1084_c7_b494_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1084_c7_b494_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1089_c11_9e74]
signal BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9e74_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9e74_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9e74_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1089_c7_b8a9]
signal n16_MUX_uxn_opcodes_h_l1089_c7_b8a9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1089_c7_b8a9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1089_c7_b8a9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1089_c7_b8a9]
signal tmp16_MUX_uxn_opcodes_h_l1089_c7_b8a9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1089_c7_b8a9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1089_c7_b8a9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1089_c7_b8a9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_b8a9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_b8a9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_b8a9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1089_c7_b8a9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_b8a9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_b8a9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_b8a9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1089_c7_b8a9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_b8a9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_b8a9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_b8a9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1089_c7_b8a9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_b8a9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_b8a9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_b8a9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1089_c7_b8a9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_b8a9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_b8a9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_b8a9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1089_c7_b8a9]
signal result_u8_value_MUX_uxn_opcodes_h_l1089_c7_b8a9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1089_c7_b8a9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1089_c7_b8a9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1089_c7_b8a9]
signal t16_MUX_uxn_opcodes_h_l1089_c7_b8a9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1089_c7_b8a9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1089_c7_b8a9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1092_c11_281c]
signal BIN_OP_EQ_uxn_opcodes_h_l1092_c11_281c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1092_c11_281c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1092_c11_281c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1092_c7_8fac]
signal n16_MUX_uxn_opcodes_h_l1092_c7_8fac_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1092_c7_8fac_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1092_c7_8fac_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1092_c7_8fac]
signal tmp16_MUX_uxn_opcodes_h_l1092_c7_8fac_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1092_c7_8fac_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1092_c7_8fac_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1092_c7_8fac]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_8fac_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_8fac_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_8fac_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1092_c7_8fac]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_8fac_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_8fac_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_8fac_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1092_c7_8fac]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_8fac_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_8fac_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_8fac_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1092_c7_8fac]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_8fac_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_8fac_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_8fac_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1092_c7_8fac]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_8fac_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_8fac_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_8fac_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1092_c7_8fac]
signal result_u8_value_MUX_uxn_opcodes_h_l1092_c7_8fac_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1092_c7_8fac_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1092_c7_8fac_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1092_c7_8fac]
signal t16_MUX_uxn_opcodes_h_l1092_c7_8fac_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1092_c7_8fac_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1092_c7_8fac_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1093_c3_3ac2]
signal BIN_OP_OR_uxn_opcodes_h_l1093_c3_3ac2_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1093_c3_3ac2_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1093_c3_3ac2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1096_c11_af24]
signal BIN_OP_EQ_uxn_opcodes_h_l1096_c11_af24_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1096_c11_af24_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1096_c11_af24_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1096_c7_8b50]
signal n16_MUX_uxn_opcodes_h_l1096_c7_8b50_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1096_c7_8b50_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1096_c7_8b50_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1096_c7_8b50]
signal tmp16_MUX_uxn_opcodes_h_l1096_c7_8b50_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1096_c7_8b50_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1096_c7_8b50_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1096_c7_8b50]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_8b50_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_8b50_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_8b50_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1096_c7_8b50]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_8b50_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_8b50_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_8b50_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1096_c7_8b50]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_8b50_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_8b50_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_8b50_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1096_c7_8b50]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_8b50_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_8b50_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_8b50_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1096_c7_8b50]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_8b50_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_8b50_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_8b50_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1096_c7_8b50]
signal result_u8_value_MUX_uxn_opcodes_h_l1096_c7_8b50_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1096_c7_8b50_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1096_c7_8b50_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1099_c11_5fb3]
signal BIN_OP_EQ_uxn_opcodes_h_l1099_c11_5fb3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1099_c11_5fb3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1099_c11_5fb3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1099_c7_ab31]
signal n16_MUX_uxn_opcodes_h_l1099_c7_ab31_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1099_c7_ab31_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1099_c7_ab31_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1099_c7_ab31]
signal tmp16_MUX_uxn_opcodes_h_l1099_c7_ab31_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1099_c7_ab31_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1099_c7_ab31_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1099_c7_ab31]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_ab31_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_ab31_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_ab31_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1099_c7_ab31]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_ab31_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_ab31_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_ab31_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1099_c7_ab31]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_ab31_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_ab31_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_ab31_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1099_c7_ab31]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_ab31_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_ab31_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_ab31_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1099_c7_ab31]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_ab31_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_ab31_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_ab31_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1099_c7_ab31]
signal result_u8_value_MUX_uxn_opcodes_h_l1099_c7_ab31_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1099_c7_ab31_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1099_c7_ab31_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1104_c11_28bf]
signal BIN_OP_EQ_uxn_opcodes_h_l1104_c11_28bf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1104_c11_28bf_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1104_c11_28bf_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1104_c7_2309]
signal n16_MUX_uxn_opcodes_h_l1104_c7_2309_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1104_c7_2309_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1104_c7_2309_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1104_c7_2309_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1104_c7_2309]
signal tmp16_MUX_uxn_opcodes_h_l1104_c7_2309_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1104_c7_2309_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1104_c7_2309_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1104_c7_2309_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1104_c7_2309]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_2309_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_2309_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_2309_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_2309_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1104_c7_2309]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_2309_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_2309_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_2309_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_2309_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1104_c7_2309]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_2309_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_2309_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_2309_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_2309_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1104_c7_2309]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_2309_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_2309_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_2309_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_2309_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1104_c7_2309]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_2309_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_2309_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_2309_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_2309_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1104_c7_2309]
signal result_u8_value_MUX_uxn_opcodes_h_l1104_c7_2309_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1104_c7_2309_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1104_c7_2309_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1104_c7_2309_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1107_c11_5591]
signal BIN_OP_EQ_uxn_opcodes_h_l1107_c11_5591_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1107_c11_5591_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1107_c11_5591_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1107_c7_0ca0]
signal n16_MUX_uxn_opcodes_h_l1107_c7_0ca0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1107_c7_0ca0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1107_c7_0ca0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1107_c7_0ca0]
signal tmp16_MUX_uxn_opcodes_h_l1107_c7_0ca0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1107_c7_0ca0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1107_c7_0ca0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1107_c7_0ca0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_0ca0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_0ca0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_0ca0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1107_c7_0ca0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_0ca0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_0ca0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_0ca0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1107_c7_0ca0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_0ca0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_0ca0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_0ca0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1107_c7_0ca0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_0ca0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_0ca0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_0ca0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1107_c7_0ca0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_0ca0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_0ca0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_0ca0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1107_c7_0ca0]
signal result_u8_value_MUX_uxn_opcodes_h_l1107_c7_0ca0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1107_c7_0ca0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1107_c7_0ca0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1108_c3_0526]
signal BIN_OP_OR_uxn_opcodes_h_l1108_c3_0526_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1108_c3_0526_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1108_c3_0526_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1109_c11_9adc]
signal BIN_OP_OR_uxn_opcodes_h_l1109_c11_9adc_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1109_c11_9adc_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1109_c11_9adc_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1111_c30_5353]
signal sp_relative_shift_uxn_opcodes_h_l1111_c30_5353_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1111_c30_5353_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1111_c30_5353_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1111_c30_5353_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1116_c11_4fa0]
signal BIN_OP_EQ_uxn_opcodes_h_l1116_c11_4fa0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1116_c11_4fa0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1116_c11_4fa0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1116_c7_9357]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_9357_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_9357_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_9357_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_9357_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1116_c7_9357]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_9357_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_9357_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_9357_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_9357_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1116_c7_9357]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_9357_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_9357_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_9357_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_9357_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1116_c7_9357]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_9357_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_9357_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_9357_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_9357_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1116_c7_9357]
signal result_u8_value_MUX_uxn_opcodes_h_l1116_c7_9357_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1116_c7_9357_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1116_c7_9357_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1116_c7_9357_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1119_c31_9d4e]
signal CONST_SR_8_uxn_opcodes_h_l1119_c31_9d4e_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1119_c31_9d4e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1121_c11_db58]
signal BIN_OP_EQ_uxn_opcodes_h_l1121_c11_db58_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1121_c11_db58_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1121_c11_db58_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1121_c7_1d03]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_1d03_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_1d03_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_1d03_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_1d03_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1121_c7_1d03]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_1d03_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_1d03_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_1d03_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_1d03_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1101_l1086_DUPLICATE_16aa
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1101_l1086_DUPLICATE_16aa_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1101_l1086_DUPLICATE_16aa_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_8cda( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1076_c6_116c
BIN_OP_EQ_uxn_opcodes_h_l1076_c6_116c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1076_c6_116c_left,
BIN_OP_EQ_uxn_opcodes_h_l1076_c6_116c_right,
BIN_OP_EQ_uxn_opcodes_h_l1076_c6_116c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1076_c1_bfc3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1076_c1_bfc3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1076_c1_bfc3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1076_c1_bfc3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1076_c1_bfc3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1076_c1_bfc3_return_output);

-- n16_MUX_uxn_opcodes_h_l1076_c2_bb6f
n16_MUX_uxn_opcodes_h_l1076_c2_bb6f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1076_c2_bb6f_cond,
n16_MUX_uxn_opcodes_h_l1076_c2_bb6f_iftrue,
n16_MUX_uxn_opcodes_h_l1076_c2_bb6f_iffalse,
n16_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1076_c2_bb6f
tmp16_MUX_uxn_opcodes_h_l1076_c2_bb6f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1076_c2_bb6f_cond,
tmp16_MUX_uxn_opcodes_h_l1076_c2_bb6f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1076_c2_bb6f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c2_bb6f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c2_bb6f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c2_bb6f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c2_bb6f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c2_bb6f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c2_bb6f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c2_bb6f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c2_bb6f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c2_bb6f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c2_bb6f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c2_bb6f
result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c2_bb6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c2_bb6f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c2_bb6f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c2_bb6f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1076_c2_bb6f
result_is_opc_done_MUX_uxn_opcodes_h_l1076_c2_bb6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1076_c2_bb6f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1076_c2_bb6f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1076_c2_bb6f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1076_c2_bb6f
result_is_stack_write_MUX_uxn_opcodes_h_l1076_c2_bb6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1076_c2_bb6f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1076_c2_bb6f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1076_c2_bb6f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1076_c2_bb6f
result_u8_value_MUX_uxn_opcodes_h_l1076_c2_bb6f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1076_c2_bb6f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1076_c2_bb6f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1076_c2_bb6f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output);

-- t16_MUX_uxn_opcodes_h_l1076_c2_bb6f
t16_MUX_uxn_opcodes_h_l1076_c2_bb6f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1076_c2_bb6f_cond,
t16_MUX_uxn_opcodes_h_l1076_c2_bb6f_iftrue,
t16_MUX_uxn_opcodes_h_l1076_c2_bb6f_iffalse,
t16_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output);

-- printf_uxn_opcodes_h_l1077_c3_2235_uxn_opcodes_h_l1077_c3_2235
printf_uxn_opcodes_h_l1077_c3_2235_uxn_opcodes_h_l1077_c3_2235 : entity work.printf_uxn_opcodes_h_l1077_c3_2235_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1077_c3_2235_uxn_opcodes_h_l1077_c3_2235_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1081_c11_ab0c
BIN_OP_EQ_uxn_opcodes_h_l1081_c11_ab0c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1081_c11_ab0c_left,
BIN_OP_EQ_uxn_opcodes_h_l1081_c11_ab0c_right,
BIN_OP_EQ_uxn_opcodes_h_l1081_c11_ab0c_return_output);

-- n16_MUX_uxn_opcodes_h_l1081_c7_96e5
n16_MUX_uxn_opcodes_h_l1081_c7_96e5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1081_c7_96e5_cond,
n16_MUX_uxn_opcodes_h_l1081_c7_96e5_iftrue,
n16_MUX_uxn_opcodes_h_l1081_c7_96e5_iffalse,
n16_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1081_c7_96e5
tmp16_MUX_uxn_opcodes_h_l1081_c7_96e5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1081_c7_96e5_cond,
tmp16_MUX_uxn_opcodes_h_l1081_c7_96e5_iftrue,
tmp16_MUX_uxn_opcodes_h_l1081_c7_96e5_iffalse,
tmp16_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_96e5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_96e5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_96e5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_96e5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_96e5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_96e5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_96e5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_96e5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_96e5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_96e5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_96e5
result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_96e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_96e5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_96e5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_96e5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_96e5
result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_96e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_96e5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_96e5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_96e5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_96e5
result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_96e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_96e5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_96e5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_96e5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1081_c7_96e5
result_u8_value_MUX_uxn_opcodes_h_l1081_c7_96e5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1081_c7_96e5_cond,
result_u8_value_MUX_uxn_opcodes_h_l1081_c7_96e5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1081_c7_96e5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output);

-- t16_MUX_uxn_opcodes_h_l1081_c7_96e5
t16_MUX_uxn_opcodes_h_l1081_c7_96e5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1081_c7_96e5_cond,
t16_MUX_uxn_opcodes_h_l1081_c7_96e5_iftrue,
t16_MUX_uxn_opcodes_h_l1081_c7_96e5_iffalse,
t16_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1084_c11_5474
BIN_OP_EQ_uxn_opcodes_h_l1084_c11_5474 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1084_c11_5474_left,
BIN_OP_EQ_uxn_opcodes_h_l1084_c11_5474_right,
BIN_OP_EQ_uxn_opcodes_h_l1084_c11_5474_return_output);

-- n16_MUX_uxn_opcodes_h_l1084_c7_b494
n16_MUX_uxn_opcodes_h_l1084_c7_b494 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1084_c7_b494_cond,
n16_MUX_uxn_opcodes_h_l1084_c7_b494_iftrue,
n16_MUX_uxn_opcodes_h_l1084_c7_b494_iffalse,
n16_MUX_uxn_opcodes_h_l1084_c7_b494_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1084_c7_b494
tmp16_MUX_uxn_opcodes_h_l1084_c7_b494 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1084_c7_b494_cond,
tmp16_MUX_uxn_opcodes_h_l1084_c7_b494_iftrue,
tmp16_MUX_uxn_opcodes_h_l1084_c7_b494_iffalse,
tmp16_MUX_uxn_opcodes_h_l1084_c7_b494_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_b494
result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_b494 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_b494_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_b494_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_b494_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_b494_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_b494
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_b494 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_b494_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_b494_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_b494_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_b494_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_b494
result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_b494 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_b494_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_b494_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_b494_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_b494_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_b494
result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_b494 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_b494_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_b494_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_b494_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_b494_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_b494
result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_b494 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_b494_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_b494_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_b494_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_b494_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1084_c7_b494
result_u8_value_MUX_uxn_opcodes_h_l1084_c7_b494 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1084_c7_b494_cond,
result_u8_value_MUX_uxn_opcodes_h_l1084_c7_b494_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1084_c7_b494_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1084_c7_b494_return_output);

-- t16_MUX_uxn_opcodes_h_l1084_c7_b494
t16_MUX_uxn_opcodes_h_l1084_c7_b494 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1084_c7_b494_cond,
t16_MUX_uxn_opcodes_h_l1084_c7_b494_iftrue,
t16_MUX_uxn_opcodes_h_l1084_c7_b494_iffalse,
t16_MUX_uxn_opcodes_h_l1084_c7_b494_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9e74
BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9e74 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9e74_left,
BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9e74_right,
BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9e74_return_output);

-- n16_MUX_uxn_opcodes_h_l1089_c7_b8a9
n16_MUX_uxn_opcodes_h_l1089_c7_b8a9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1089_c7_b8a9_cond,
n16_MUX_uxn_opcodes_h_l1089_c7_b8a9_iftrue,
n16_MUX_uxn_opcodes_h_l1089_c7_b8a9_iffalse,
n16_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1089_c7_b8a9
tmp16_MUX_uxn_opcodes_h_l1089_c7_b8a9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1089_c7_b8a9_cond,
tmp16_MUX_uxn_opcodes_h_l1089_c7_b8a9_iftrue,
tmp16_MUX_uxn_opcodes_h_l1089_c7_b8a9_iffalse,
tmp16_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_b8a9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_b8a9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_b8a9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_b8a9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_b8a9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_b8a9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_b8a9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_b8a9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_b8a9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_b8a9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_b8a9
result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_b8a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_b8a9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_b8a9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_b8a9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_b8a9
result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_b8a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_b8a9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_b8a9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_b8a9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_b8a9
result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_b8a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_b8a9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_b8a9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_b8a9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1089_c7_b8a9
result_u8_value_MUX_uxn_opcodes_h_l1089_c7_b8a9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1089_c7_b8a9_cond,
result_u8_value_MUX_uxn_opcodes_h_l1089_c7_b8a9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1089_c7_b8a9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output);

-- t16_MUX_uxn_opcodes_h_l1089_c7_b8a9
t16_MUX_uxn_opcodes_h_l1089_c7_b8a9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1089_c7_b8a9_cond,
t16_MUX_uxn_opcodes_h_l1089_c7_b8a9_iftrue,
t16_MUX_uxn_opcodes_h_l1089_c7_b8a9_iffalse,
t16_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1092_c11_281c
BIN_OP_EQ_uxn_opcodes_h_l1092_c11_281c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1092_c11_281c_left,
BIN_OP_EQ_uxn_opcodes_h_l1092_c11_281c_right,
BIN_OP_EQ_uxn_opcodes_h_l1092_c11_281c_return_output);

-- n16_MUX_uxn_opcodes_h_l1092_c7_8fac
n16_MUX_uxn_opcodes_h_l1092_c7_8fac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1092_c7_8fac_cond,
n16_MUX_uxn_opcodes_h_l1092_c7_8fac_iftrue,
n16_MUX_uxn_opcodes_h_l1092_c7_8fac_iffalse,
n16_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1092_c7_8fac
tmp16_MUX_uxn_opcodes_h_l1092_c7_8fac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1092_c7_8fac_cond,
tmp16_MUX_uxn_opcodes_h_l1092_c7_8fac_iftrue,
tmp16_MUX_uxn_opcodes_h_l1092_c7_8fac_iffalse,
tmp16_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_8fac
result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_8fac : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_8fac_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_8fac_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_8fac_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_8fac
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_8fac : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_8fac_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_8fac_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_8fac_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_8fac
result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_8fac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_8fac_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_8fac_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_8fac_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_8fac
result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_8fac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_8fac_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_8fac_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_8fac_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_8fac
result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_8fac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_8fac_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_8fac_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_8fac_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1092_c7_8fac
result_u8_value_MUX_uxn_opcodes_h_l1092_c7_8fac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1092_c7_8fac_cond,
result_u8_value_MUX_uxn_opcodes_h_l1092_c7_8fac_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1092_c7_8fac_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output);

-- t16_MUX_uxn_opcodes_h_l1092_c7_8fac
t16_MUX_uxn_opcodes_h_l1092_c7_8fac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1092_c7_8fac_cond,
t16_MUX_uxn_opcodes_h_l1092_c7_8fac_iftrue,
t16_MUX_uxn_opcodes_h_l1092_c7_8fac_iffalse,
t16_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1093_c3_3ac2
BIN_OP_OR_uxn_opcodes_h_l1093_c3_3ac2 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1093_c3_3ac2_left,
BIN_OP_OR_uxn_opcodes_h_l1093_c3_3ac2_right,
BIN_OP_OR_uxn_opcodes_h_l1093_c3_3ac2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1096_c11_af24
BIN_OP_EQ_uxn_opcodes_h_l1096_c11_af24 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1096_c11_af24_left,
BIN_OP_EQ_uxn_opcodes_h_l1096_c11_af24_right,
BIN_OP_EQ_uxn_opcodes_h_l1096_c11_af24_return_output);

-- n16_MUX_uxn_opcodes_h_l1096_c7_8b50
n16_MUX_uxn_opcodes_h_l1096_c7_8b50 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1096_c7_8b50_cond,
n16_MUX_uxn_opcodes_h_l1096_c7_8b50_iftrue,
n16_MUX_uxn_opcodes_h_l1096_c7_8b50_iffalse,
n16_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1096_c7_8b50
tmp16_MUX_uxn_opcodes_h_l1096_c7_8b50 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1096_c7_8b50_cond,
tmp16_MUX_uxn_opcodes_h_l1096_c7_8b50_iftrue,
tmp16_MUX_uxn_opcodes_h_l1096_c7_8b50_iffalse,
tmp16_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_8b50
result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_8b50 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_8b50_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_8b50_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_8b50_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_8b50
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_8b50 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_8b50_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_8b50_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_8b50_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_8b50
result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_8b50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_8b50_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_8b50_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_8b50_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_8b50
result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_8b50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_8b50_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_8b50_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_8b50_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_8b50
result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_8b50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_8b50_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_8b50_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_8b50_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1096_c7_8b50
result_u8_value_MUX_uxn_opcodes_h_l1096_c7_8b50 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1096_c7_8b50_cond,
result_u8_value_MUX_uxn_opcodes_h_l1096_c7_8b50_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1096_c7_8b50_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1099_c11_5fb3
BIN_OP_EQ_uxn_opcodes_h_l1099_c11_5fb3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1099_c11_5fb3_left,
BIN_OP_EQ_uxn_opcodes_h_l1099_c11_5fb3_right,
BIN_OP_EQ_uxn_opcodes_h_l1099_c11_5fb3_return_output);

-- n16_MUX_uxn_opcodes_h_l1099_c7_ab31
n16_MUX_uxn_opcodes_h_l1099_c7_ab31 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1099_c7_ab31_cond,
n16_MUX_uxn_opcodes_h_l1099_c7_ab31_iftrue,
n16_MUX_uxn_opcodes_h_l1099_c7_ab31_iffalse,
n16_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1099_c7_ab31
tmp16_MUX_uxn_opcodes_h_l1099_c7_ab31 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1099_c7_ab31_cond,
tmp16_MUX_uxn_opcodes_h_l1099_c7_ab31_iftrue,
tmp16_MUX_uxn_opcodes_h_l1099_c7_ab31_iffalse,
tmp16_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_ab31
result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_ab31 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_ab31_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_ab31_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_ab31_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_ab31
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_ab31 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_ab31_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_ab31_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_ab31_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_ab31
result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_ab31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_ab31_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_ab31_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_ab31_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_ab31
result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_ab31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_ab31_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_ab31_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_ab31_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_ab31
result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_ab31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_ab31_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_ab31_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_ab31_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1099_c7_ab31
result_u8_value_MUX_uxn_opcodes_h_l1099_c7_ab31 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1099_c7_ab31_cond,
result_u8_value_MUX_uxn_opcodes_h_l1099_c7_ab31_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1099_c7_ab31_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1104_c11_28bf
BIN_OP_EQ_uxn_opcodes_h_l1104_c11_28bf : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1104_c11_28bf_left,
BIN_OP_EQ_uxn_opcodes_h_l1104_c11_28bf_right,
BIN_OP_EQ_uxn_opcodes_h_l1104_c11_28bf_return_output);

-- n16_MUX_uxn_opcodes_h_l1104_c7_2309
n16_MUX_uxn_opcodes_h_l1104_c7_2309 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1104_c7_2309_cond,
n16_MUX_uxn_opcodes_h_l1104_c7_2309_iftrue,
n16_MUX_uxn_opcodes_h_l1104_c7_2309_iffalse,
n16_MUX_uxn_opcodes_h_l1104_c7_2309_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1104_c7_2309
tmp16_MUX_uxn_opcodes_h_l1104_c7_2309 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1104_c7_2309_cond,
tmp16_MUX_uxn_opcodes_h_l1104_c7_2309_iftrue,
tmp16_MUX_uxn_opcodes_h_l1104_c7_2309_iffalse,
tmp16_MUX_uxn_opcodes_h_l1104_c7_2309_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_2309
result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_2309 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_2309_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_2309_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_2309_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_2309_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_2309
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_2309 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_2309_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_2309_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_2309_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_2309_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_2309
result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_2309 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_2309_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_2309_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_2309_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_2309_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_2309
result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_2309 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_2309_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_2309_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_2309_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_2309_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_2309
result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_2309 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_2309_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_2309_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_2309_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_2309_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1104_c7_2309
result_u8_value_MUX_uxn_opcodes_h_l1104_c7_2309 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1104_c7_2309_cond,
result_u8_value_MUX_uxn_opcodes_h_l1104_c7_2309_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1104_c7_2309_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1104_c7_2309_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1107_c11_5591
BIN_OP_EQ_uxn_opcodes_h_l1107_c11_5591 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1107_c11_5591_left,
BIN_OP_EQ_uxn_opcodes_h_l1107_c11_5591_right,
BIN_OP_EQ_uxn_opcodes_h_l1107_c11_5591_return_output);

-- n16_MUX_uxn_opcodes_h_l1107_c7_0ca0
n16_MUX_uxn_opcodes_h_l1107_c7_0ca0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1107_c7_0ca0_cond,
n16_MUX_uxn_opcodes_h_l1107_c7_0ca0_iftrue,
n16_MUX_uxn_opcodes_h_l1107_c7_0ca0_iffalse,
n16_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1107_c7_0ca0
tmp16_MUX_uxn_opcodes_h_l1107_c7_0ca0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1107_c7_0ca0_cond,
tmp16_MUX_uxn_opcodes_h_l1107_c7_0ca0_iftrue,
tmp16_MUX_uxn_opcodes_h_l1107_c7_0ca0_iffalse,
tmp16_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_0ca0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_0ca0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_0ca0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_0ca0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_0ca0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_0ca0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_0ca0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_0ca0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_0ca0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_0ca0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_0ca0
result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_0ca0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_0ca0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_0ca0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_0ca0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_0ca0
result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_0ca0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_0ca0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_0ca0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_0ca0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_0ca0
result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_0ca0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_0ca0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_0ca0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_0ca0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1107_c7_0ca0
result_u8_value_MUX_uxn_opcodes_h_l1107_c7_0ca0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1107_c7_0ca0_cond,
result_u8_value_MUX_uxn_opcodes_h_l1107_c7_0ca0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1107_c7_0ca0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1108_c3_0526
BIN_OP_OR_uxn_opcodes_h_l1108_c3_0526 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1108_c3_0526_left,
BIN_OP_OR_uxn_opcodes_h_l1108_c3_0526_right,
BIN_OP_OR_uxn_opcodes_h_l1108_c3_0526_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1109_c11_9adc
BIN_OP_OR_uxn_opcodes_h_l1109_c11_9adc : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1109_c11_9adc_left,
BIN_OP_OR_uxn_opcodes_h_l1109_c11_9adc_right,
BIN_OP_OR_uxn_opcodes_h_l1109_c11_9adc_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1111_c30_5353
sp_relative_shift_uxn_opcodes_h_l1111_c30_5353 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1111_c30_5353_ins,
sp_relative_shift_uxn_opcodes_h_l1111_c30_5353_x,
sp_relative_shift_uxn_opcodes_h_l1111_c30_5353_y,
sp_relative_shift_uxn_opcodes_h_l1111_c30_5353_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1116_c11_4fa0
BIN_OP_EQ_uxn_opcodes_h_l1116_c11_4fa0 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1116_c11_4fa0_left,
BIN_OP_EQ_uxn_opcodes_h_l1116_c11_4fa0_right,
BIN_OP_EQ_uxn_opcodes_h_l1116_c11_4fa0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_9357
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_9357 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_9357_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_9357_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_9357_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_9357_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_9357
result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_9357 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_9357_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_9357_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_9357_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_9357_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_9357
result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_9357 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_9357_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_9357_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_9357_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_9357_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_9357
result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_9357 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_9357_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_9357_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_9357_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_9357_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1116_c7_9357
result_u8_value_MUX_uxn_opcodes_h_l1116_c7_9357 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1116_c7_9357_cond,
result_u8_value_MUX_uxn_opcodes_h_l1116_c7_9357_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1116_c7_9357_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1116_c7_9357_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1119_c31_9d4e
CONST_SR_8_uxn_opcodes_h_l1119_c31_9d4e : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1119_c31_9d4e_x,
CONST_SR_8_uxn_opcodes_h_l1119_c31_9d4e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1121_c11_db58
BIN_OP_EQ_uxn_opcodes_h_l1121_c11_db58 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1121_c11_db58_left,
BIN_OP_EQ_uxn_opcodes_h_l1121_c11_db58_right,
BIN_OP_EQ_uxn_opcodes_h_l1121_c11_db58_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_1d03
result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_1d03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_1d03_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_1d03_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_1d03_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_1d03_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_1d03
result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_1d03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_1d03_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_1d03_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_1d03_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_1d03_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1101_l1086_DUPLICATE_16aa
CONST_SL_8_uint16_t_uxn_opcodes_h_l1101_l1086_DUPLICATE_16aa : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1101_l1086_DUPLICATE_16aa_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1101_l1086_DUPLICATE_16aa_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1076_c6_116c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1076_c1_bfc3_return_output,
 n16_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output,
 tmp16_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output,
 t16_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1081_c11_ab0c_return_output,
 n16_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output,
 tmp16_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output,
 t16_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1084_c11_5474_return_output,
 n16_MUX_uxn_opcodes_h_l1084_c7_b494_return_output,
 tmp16_MUX_uxn_opcodes_h_l1084_c7_b494_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_b494_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_b494_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_b494_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_b494_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_b494_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1084_c7_b494_return_output,
 t16_MUX_uxn_opcodes_h_l1084_c7_b494_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9e74_return_output,
 n16_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output,
 tmp16_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output,
 t16_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1092_c11_281c_return_output,
 n16_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output,
 tmp16_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output,
 t16_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1093_c3_3ac2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1096_c11_af24_return_output,
 n16_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output,
 tmp16_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1099_c11_5fb3_return_output,
 n16_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output,
 tmp16_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1104_c11_28bf_return_output,
 n16_MUX_uxn_opcodes_h_l1104_c7_2309_return_output,
 tmp16_MUX_uxn_opcodes_h_l1104_c7_2309_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_2309_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_2309_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_2309_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_2309_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_2309_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1104_c7_2309_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1107_c11_5591_return_output,
 n16_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output,
 tmp16_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1108_c3_0526_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1109_c11_9adc_return_output,
 sp_relative_shift_uxn_opcodes_h_l1111_c30_5353_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1116_c11_4fa0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_9357_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_9357_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_9357_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_9357_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1116_c7_9357_return_output,
 CONST_SR_8_uxn_opcodes_h_l1119_c31_9d4e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1121_c11_db58_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_1d03_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_1d03_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1101_l1086_DUPLICATE_16aa_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c6_116c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c6_116c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c6_116c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1076_c1_bfc3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1076_c1_bfc3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1076_c1_bfc3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1076_c1_bfc3_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1076_c2_bb6f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1076_c2_bb6f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1076_c2_bb6f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1076_c2_bb6f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1076_c2_bb6f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1076_c2_bb6f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c2_bb6f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c2_bb6f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c2_bb6f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c2_bb6f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1078_c3_ffee : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c2_bb6f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c2_bb6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c2_bb6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c2_bb6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c2_bb6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1076_c2_bb6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1076_c2_bb6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1076_c2_bb6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1076_c2_bb6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1076_c2_bb6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1076_c2_bb6f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1076_c2_bb6f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1076_c2_bb6f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1076_c2_bb6f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1076_c2_bb6f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1076_c2_bb6f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1076_c2_bb6f_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1077_c3_2235_uxn_opcodes_h_l1077_c3_2235_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_ab0c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_ab0c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_ab0c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1081_c7_96e5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1081_c7_96e5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1084_c7_b494_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1081_c7_96e5_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1081_c7_96e5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1081_c7_96e5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_b494_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1081_c7_96e5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_96e5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_96e5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_b494_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_96e5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_96e5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1082_c3_69fd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_96e5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_b494_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_96e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_96e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_96e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_b494_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_96e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_96e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_96e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_b494_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_96e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_96e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_96e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_b494_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_96e5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1081_c7_96e5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1081_c7_96e5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_b494_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1081_c7_96e5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1081_c7_96e5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1081_c7_96e5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1084_c7_b494_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1081_c7_96e5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_5474_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_5474_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_5474_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1084_c7_b494_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1084_c7_b494_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1084_c7_b494_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_b494_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_b494_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_b494_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_b494_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_b494_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_b494_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_b494_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1087_c3_544d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_b494_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_b494_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_b494_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_b494_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_b494_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_b494_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_b494_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_b494_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_b494_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_b494_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_b494_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_b494_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_b494_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_b494_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1084_c7_b494_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1084_c7_b494_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1084_c7_b494_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9e74_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9e74_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9e74_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1089_c7_b8a9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1089_c7_b8a9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1089_c7_b8a9_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_b8a9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_b8a9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_b8a9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_b8a9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_b8a9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_b8a9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_b8a9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1090_c3_df15 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_b8a9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_b8a9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_b8a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_b8a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_b8a9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_b8a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_b8a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_b8a9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_b8a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_b8a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_b8a9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1089_c7_b8a9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1089_c7_b8a9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1089_c7_b8a9_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1089_c7_b8a9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1089_c7_b8a9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1089_c7_b8a9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c11_281c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c11_281c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c11_281c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1092_c7_8fac_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1092_c7_8fac_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1092_c7_8fac_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1092_c7_8fac_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1092_c7_8fac_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1092_c7_8fac_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_8fac_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_8fac_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_8fac_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_8fac_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1094_c3_257b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_8fac_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_8fac_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_8fac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_8fac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_8fac_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_8fac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_8fac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_8fac_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_8fac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_8fac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_8fac_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1092_c7_8fac_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1092_c7_8fac_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1092_c7_8fac_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1092_c7_8fac_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1092_c7_8fac_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1092_c7_8fac_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1093_c3_3ac2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1093_c3_3ac2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1093_c3_3ac2_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_af24_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_af24_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_af24_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1096_c7_8b50_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1096_c7_8b50_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1096_c7_8b50_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1096_c7_8b50_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1096_c7_8b50_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1096_c7_8b50_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_8b50_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_8b50_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_8b50_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_8b50_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1097_c3_d9c1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_8b50_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_8b50_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_8b50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_8b50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_8b50_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_8b50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_8b50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_8b50_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_8b50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_8b50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_8b50_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1096_c7_8b50_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1096_c7_8b50_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1096_c7_8b50_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1099_c11_5fb3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1099_c11_5fb3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1099_c11_5fb3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1099_c7_ab31_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1099_c7_ab31_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1104_c7_2309_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1099_c7_ab31_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1099_c7_ab31_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1099_c7_ab31_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1104_c7_2309_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1099_c7_ab31_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_ab31_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_ab31_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_2309_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_ab31_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_ab31_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1102_c3_9c28 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_ab31_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_2309_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_ab31_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_ab31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_ab31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_2309_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_ab31_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_ab31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_ab31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_2309_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_ab31_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_ab31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_ab31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_2309_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_ab31_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1099_c7_ab31_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1099_c7_ab31_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1104_c7_2309_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1099_c7_ab31_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_28bf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_28bf_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_28bf_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1104_c7_2309_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1104_c7_2309_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1104_c7_2309_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1104_c7_2309_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1104_c7_2309_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1104_c7_2309_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_2309_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_2309_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_2309_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_2309_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1105_c3_e926 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_2309_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_2309_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_2309_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_2309_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_2309_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_2309_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_2309_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_2309_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_2309_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_2309_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_2309_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1104_c7_2309_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1104_c7_2309_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1104_c7_2309_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c11_5591_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c11_5591_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c11_5591_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1107_c7_0ca0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1107_c7_0ca0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1107_c7_0ca0_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1107_c7_0ca0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1107_c7_0ca0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1107_c7_0ca0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_0ca0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_0ca0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_0ca0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_0ca0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1113_c3_9815 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_0ca0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_9357_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_0ca0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_0ca0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_0ca0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_9357_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_0ca0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_0ca0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_0ca0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_9357_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_0ca0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_0ca0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_0ca0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_9357_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_0ca0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1107_c7_0ca0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1107_c7_0ca0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1116_c7_9357_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1107_c7_0ca0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1108_c3_0526_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1108_c3_0526_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1108_c3_0526_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1109_c11_9adc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1109_c11_9adc_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1109_c11_9adc_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1111_c30_5353_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1111_c30_5353_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1111_c30_5353_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1111_c30_5353_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1114_c21_ffcf_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_4fa0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_4fa0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_4fa0_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_9357_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1118_c3_418d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_9357_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1116_c7_9357_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_9357_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_9357_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_9357_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_9357_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_9357_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_9357_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_1d03_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_9357_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_9357_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_9357_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_1d03_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_9357_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1116_c7_9357_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1116_c7_9357_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1116_c7_9357_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1119_c31_9d4e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1119_c31_9d4e_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1119_c21_e3eb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_db58_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_db58_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_db58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_1d03_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_1d03_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_1d03_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_1d03_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_1d03_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_1d03_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1104_l1076_l1099_l1096_l1092_l1089_l1084_l1107_l1081_DUPLICATE_7179_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1104_l1076_l1099_l1096_l1092_l1089_l1116_l1084_l1081_DUPLICATE_f9df_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1104_l1076_l1099_l1096_l1092_l1121_l1089_l1116_l1084_l1081_DUPLICATE_4f69_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1104_l1076_l1099_l1096_l1092_l1089_l1116_l1084_l1081_DUPLICATE_cebb_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1104_l1099_l1096_l1092_l1121_l1089_l1116_l1084_l1107_l1081_DUPLICATE_eeec_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1085_l1100_l1093_l1108_DUPLICATE_9cb0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1101_l1086_DUPLICATE_16aa_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1101_l1086_DUPLICATE_16aa_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l1072_l1126_DUPLICATE_bc35_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1118_c3_418d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_9357_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1118_c3_418d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c11_281c_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_db58_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1078_c3_ffee := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c2_bb6f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1078_c3_ffee;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1076_c2_bb6f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_ab0c_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1097_c3_d9c1 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_8b50_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1097_c3_d9c1;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_1d03_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1094_c3_257b := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_8fac_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1094_c3_257b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1090_c3_df15 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_b8a9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1090_c3_df15;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1113_c3_9815 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_0ca0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1113_c3_9815;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1105_c3_e926 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_2309_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1105_c3_e926;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1099_c11_5fb3_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1087_c3_544d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_b494_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1087_c3_544d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9e74_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_4fa0_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_28bf_right := to_unsigned(7, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1111_c30_5353_y := resize(to_signed(-2, 3), 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1076_c1_bfc3_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c6_116c_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_9357_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1111_c30_5353_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_5474_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_0ca0_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c11_5591_right := to_unsigned(8, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_0ca0_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_af24_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1082_c3_69fd := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_96e5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1082_c3_69fd;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1102_c3_9c28 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_ab31_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1102_c3_9c28;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_1d03_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1076_c1_bfc3_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1111_c30_5353_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1108_c3_0526_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1076_c2_bb6f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1081_c7_96e5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1084_c7_b494_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1089_c7_b8a9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1092_c7_8fac_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1096_c7_8b50_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1104_c7_2309_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1107_c7_0ca0_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c6_116c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_ab0c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_5474_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9e74_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c11_281c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_af24_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1099_c11_5fb3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_28bf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c11_5591_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_4fa0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_db58_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1093_c3_3ac2_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1109_c11_9adc_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1076_c2_bb6f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1081_c7_96e5_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1089_c7_b8a9_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1092_c7_8fac_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1119_c31_9d4e_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1076_c2_bb6f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1081_c7_96e5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_b494_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_b8a9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1092_c7_8fac_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1096_c7_8b50_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1099_c7_ab31_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1104_c7_2309_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1107_c7_0ca0_iffalse := tmp16;
     -- sp_relative_shift[uxn_opcodes_h_l1111_c30_5353] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1111_c30_5353_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1111_c30_5353_ins;
     sp_relative_shift_uxn_opcodes_h_l1111_c30_5353_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1111_c30_5353_x;
     sp_relative_shift_uxn_opcodes_h_l1111_c30_5353_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1111_c30_5353_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1111_c30_5353_return_output := sp_relative_shift_uxn_opcodes_h_l1111_c30_5353_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1116_c11_4fa0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1116_c11_4fa0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_4fa0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1116_c11_4fa0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_4fa0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_4fa0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1116_c11_4fa0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1099_c11_5fb3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1099_c11_5fb3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1099_c11_5fb3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1099_c11_5fb3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1099_c11_5fb3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1099_c11_5fb3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1099_c11_5fb3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1104_c11_28bf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1104_c11_28bf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_28bf_left;
     BIN_OP_EQ_uxn_opcodes_h_l1104_c11_28bf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_28bf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_28bf_return_output := BIN_OP_EQ_uxn_opcodes_h_l1104_c11_28bf_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1104_l1099_l1096_l1092_l1121_l1089_l1116_l1084_l1107_l1081_DUPLICATE_eeec LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1104_l1099_l1096_l1092_l1121_l1089_l1116_l1084_l1107_l1081_DUPLICATE_eeec_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1104_l1076_l1099_l1096_l1092_l1089_l1116_l1084_l1081_DUPLICATE_f9df LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1104_l1076_l1099_l1096_l1092_l1089_l1116_l1084_l1081_DUPLICATE_f9df_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1121_c11_db58] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1121_c11_db58_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_db58_left;
     BIN_OP_EQ_uxn_opcodes_h_l1121_c11_db58_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_db58_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_db58_return_output := BIN_OP_EQ_uxn_opcodes_h_l1121_c11_db58_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1081_c11_ab0c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1081_c11_ab0c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_ab0c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1081_c11_ab0c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_ab0c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_ab0c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1081_c11_ab0c_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1085_l1100_l1093_l1108_DUPLICATE_9cb0 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1085_l1100_l1093_l1108_DUPLICATE_9cb0_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1084_c11_5474] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1084_c11_5474_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_5474_left;
     BIN_OP_EQ_uxn_opcodes_h_l1084_c11_5474_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_5474_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_5474_return_output := BIN_OP_EQ_uxn_opcodes_h_l1084_c11_5474_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1104_l1076_l1099_l1096_l1092_l1089_l1116_l1084_l1081_DUPLICATE_cebb LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1104_l1076_l1099_l1096_l1092_l1089_l1116_l1084_l1081_DUPLICATE_cebb_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1104_l1076_l1099_l1096_l1092_l1121_l1089_l1116_l1084_l1081_DUPLICATE_4f69 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1104_l1076_l1099_l1096_l1092_l1121_l1089_l1116_l1084_l1081_DUPLICATE_4f69_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1092_c11_281c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1092_c11_281c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c11_281c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1092_c11_281c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c11_281c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c11_281c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1092_c11_281c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1089_c11_9e74] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9e74_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9e74_left;
     BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9e74_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9e74_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9e74_return_output := BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9e74_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1107_c11_5591] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1107_c11_5591_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c11_5591_left;
     BIN_OP_EQ_uxn_opcodes_h_l1107_c11_5591_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c11_5591_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c11_5591_return_output := BIN_OP_EQ_uxn_opcodes_h_l1107_c11_5591_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1076_c6_116c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1076_c6_116c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c6_116c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1076_c6_116c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c6_116c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c6_116c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1076_c6_116c_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1116_c7_9357] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1116_c7_9357_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1096_c11_af24] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1096_c11_af24_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_af24_left;
     BIN_OP_EQ_uxn_opcodes_h_l1096_c11_af24_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_af24_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_af24_return_output := BIN_OP_EQ_uxn_opcodes_h_l1096_c11_af24_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1119_c31_9d4e] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1119_c31_9d4e_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1119_c31_9d4e_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1119_c31_9d4e_return_output := CONST_SR_8_uxn_opcodes_h_l1119_c31_9d4e_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1104_l1076_l1099_l1096_l1092_l1089_l1084_l1107_l1081_DUPLICATE_7179 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1104_l1076_l1099_l1096_l1092_l1089_l1084_l1107_l1081_DUPLICATE_7179_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1076_c1_bfc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c6_116c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1076_c2_bb6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c6_116c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1076_c2_bb6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c6_116c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c2_bb6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c6_116c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1076_c2_bb6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c6_116c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c2_bb6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c6_116c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c2_bb6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c6_116c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1076_c2_bb6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c6_116c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1076_c2_bb6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c6_116c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1076_c2_bb6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1076_c6_116c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1081_c7_96e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_ab0c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_96e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_ab0c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_96e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_ab0c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_96e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_ab0c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_96e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_ab0c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_96e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_ab0c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1081_c7_96e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_ab0c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1081_c7_96e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_ab0c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1081_c7_96e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_ab0c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1084_c7_b494_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_5474_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_b494_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_5474_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_b494_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_5474_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_b494_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_5474_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_b494_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_5474_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_b494_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_5474_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_b494_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_5474_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1084_c7_b494_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_5474_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_b494_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_5474_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1089_c7_b8a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9e74_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_b8a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9e74_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_b8a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9e74_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_b8a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9e74_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_b8a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9e74_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_b8a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9e74_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1089_c7_b8a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9e74_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1089_c7_b8a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9e74_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_b8a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9e74_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1092_c7_8fac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c11_281c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_8fac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c11_281c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_8fac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c11_281c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_8fac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c11_281c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_8fac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c11_281c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_8fac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c11_281c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1092_c7_8fac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c11_281c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1092_c7_8fac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c11_281c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1092_c7_8fac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1092_c11_281c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1096_c7_8b50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_af24_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_8b50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_af24_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_8b50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_af24_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_8b50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_af24_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_8b50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_af24_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_8b50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_af24_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1096_c7_8b50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_af24_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1096_c7_8b50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1096_c11_af24_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1099_c7_ab31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1099_c11_5fb3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_ab31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1099_c11_5fb3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_ab31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1099_c11_5fb3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_ab31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1099_c11_5fb3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_ab31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1099_c11_5fb3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_ab31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1099_c11_5fb3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1099_c7_ab31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1099_c11_5fb3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1099_c7_ab31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1099_c11_5fb3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1104_c7_2309_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_28bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_2309_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_28bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_2309_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_28bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_2309_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_28bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_2309_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_28bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_2309_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_28bf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1104_c7_2309_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_28bf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1104_c7_2309_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_28bf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1107_c7_0ca0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c11_5591_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_0ca0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c11_5591_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_0ca0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c11_5591_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_0ca0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c11_5591_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_0ca0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c11_5591_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_0ca0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c11_5591_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1107_c7_0ca0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c11_5591_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1107_c7_0ca0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c11_5591_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_9357_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_4fa0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_9357_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_4fa0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_9357_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_4fa0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_9357_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_4fa0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1116_c7_9357_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_4fa0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_1d03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_db58_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_1d03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1121_c11_db58_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1093_c3_3ac2_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1085_l1100_l1093_l1108_DUPLICATE_9cb0_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1108_c3_0526_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1085_l1100_l1093_l1108_DUPLICATE_9cb0_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1101_l1086_DUPLICATE_16aa_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1085_l1100_l1093_l1108_DUPLICATE_9cb0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c2_bb6f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1104_l1076_l1099_l1096_l1092_l1089_l1084_l1107_l1081_DUPLICATE_7179_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_96e5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1104_l1076_l1099_l1096_l1092_l1089_l1084_l1107_l1081_DUPLICATE_7179_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_b494_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1104_l1076_l1099_l1096_l1092_l1089_l1084_l1107_l1081_DUPLICATE_7179_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_b8a9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1104_l1076_l1099_l1096_l1092_l1089_l1084_l1107_l1081_DUPLICATE_7179_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_8fac_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1104_l1076_l1099_l1096_l1092_l1089_l1084_l1107_l1081_DUPLICATE_7179_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_8b50_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1104_l1076_l1099_l1096_l1092_l1089_l1084_l1107_l1081_DUPLICATE_7179_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_ab31_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1104_l1076_l1099_l1096_l1092_l1089_l1084_l1107_l1081_DUPLICATE_7179_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_2309_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1104_l1076_l1099_l1096_l1092_l1089_l1084_l1107_l1081_DUPLICATE_7179_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_0ca0_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1104_l1076_l1099_l1096_l1092_l1089_l1084_l1107_l1081_DUPLICATE_7179_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_96e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1104_l1099_l1096_l1092_l1121_l1089_l1116_l1084_l1107_l1081_DUPLICATE_eeec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_b494_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1104_l1099_l1096_l1092_l1121_l1089_l1116_l1084_l1107_l1081_DUPLICATE_eeec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_b8a9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1104_l1099_l1096_l1092_l1121_l1089_l1116_l1084_l1107_l1081_DUPLICATE_eeec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_8fac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1104_l1099_l1096_l1092_l1121_l1089_l1116_l1084_l1107_l1081_DUPLICATE_eeec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_8b50_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1104_l1099_l1096_l1092_l1121_l1089_l1116_l1084_l1107_l1081_DUPLICATE_eeec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_ab31_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1104_l1099_l1096_l1092_l1121_l1089_l1116_l1084_l1107_l1081_DUPLICATE_eeec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_2309_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1104_l1099_l1096_l1092_l1121_l1089_l1116_l1084_l1107_l1081_DUPLICATE_eeec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_0ca0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1104_l1099_l1096_l1092_l1121_l1089_l1116_l1084_l1107_l1081_DUPLICATE_eeec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_9357_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1104_l1099_l1096_l1092_l1121_l1089_l1116_l1084_l1107_l1081_DUPLICATE_eeec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_1d03_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1104_l1099_l1096_l1092_l1121_l1089_l1116_l1084_l1107_l1081_DUPLICATE_eeec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c2_bb6f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1104_l1076_l1099_l1096_l1092_l1089_l1116_l1084_l1081_DUPLICATE_f9df_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_96e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1104_l1076_l1099_l1096_l1092_l1089_l1116_l1084_l1081_DUPLICATE_f9df_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_b494_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1104_l1076_l1099_l1096_l1092_l1089_l1116_l1084_l1081_DUPLICATE_f9df_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_b8a9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1104_l1076_l1099_l1096_l1092_l1089_l1116_l1084_l1081_DUPLICATE_f9df_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_8fac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1104_l1076_l1099_l1096_l1092_l1089_l1116_l1084_l1081_DUPLICATE_f9df_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_8b50_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1104_l1076_l1099_l1096_l1092_l1089_l1116_l1084_l1081_DUPLICATE_f9df_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_ab31_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1104_l1076_l1099_l1096_l1092_l1089_l1116_l1084_l1081_DUPLICATE_f9df_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_2309_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1104_l1076_l1099_l1096_l1092_l1089_l1116_l1084_l1081_DUPLICATE_f9df_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_9357_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1104_l1076_l1099_l1096_l1092_l1089_l1116_l1084_l1081_DUPLICATE_f9df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1076_c2_bb6f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1104_l1076_l1099_l1096_l1092_l1121_l1089_l1116_l1084_l1081_DUPLICATE_4f69_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_96e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1104_l1076_l1099_l1096_l1092_l1121_l1089_l1116_l1084_l1081_DUPLICATE_4f69_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_b494_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1104_l1076_l1099_l1096_l1092_l1121_l1089_l1116_l1084_l1081_DUPLICATE_4f69_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_b8a9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1104_l1076_l1099_l1096_l1092_l1121_l1089_l1116_l1084_l1081_DUPLICATE_4f69_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_8fac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1104_l1076_l1099_l1096_l1092_l1121_l1089_l1116_l1084_l1081_DUPLICATE_4f69_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_8b50_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1104_l1076_l1099_l1096_l1092_l1121_l1089_l1116_l1084_l1081_DUPLICATE_4f69_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_ab31_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1104_l1076_l1099_l1096_l1092_l1121_l1089_l1116_l1084_l1081_DUPLICATE_4f69_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_2309_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1104_l1076_l1099_l1096_l1092_l1121_l1089_l1116_l1084_l1081_DUPLICATE_4f69_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_9357_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1104_l1076_l1099_l1096_l1092_l1121_l1089_l1116_l1084_l1081_DUPLICATE_4f69_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_1d03_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1104_l1076_l1099_l1096_l1092_l1121_l1089_l1116_l1084_l1081_DUPLICATE_4f69_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1076_c2_bb6f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1104_l1076_l1099_l1096_l1092_l1089_l1116_l1084_l1081_DUPLICATE_cebb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1081_c7_96e5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1104_l1076_l1099_l1096_l1092_l1089_l1116_l1084_l1081_DUPLICATE_cebb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_b494_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1104_l1076_l1099_l1096_l1092_l1089_l1116_l1084_l1081_DUPLICATE_cebb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1089_c7_b8a9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1104_l1076_l1099_l1096_l1092_l1089_l1116_l1084_l1081_DUPLICATE_cebb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1092_c7_8fac_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1104_l1076_l1099_l1096_l1092_l1089_l1116_l1084_l1081_DUPLICATE_cebb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1096_c7_8b50_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1104_l1076_l1099_l1096_l1092_l1089_l1116_l1084_l1081_DUPLICATE_cebb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1099_c7_ab31_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1104_l1076_l1099_l1096_l1092_l1089_l1116_l1084_l1081_DUPLICATE_cebb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1104_c7_2309_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1104_l1076_l1099_l1096_l1092_l1089_l1116_l1084_l1081_DUPLICATE_cebb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1116_c7_9357_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1104_l1076_l1099_l1096_l1092_l1089_l1116_l1084_l1081_DUPLICATE_cebb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_9357_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1116_c7_9357_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_0ca0_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1111_c30_5353_return_output;
     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1101_l1086_DUPLICATE_16aa LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1101_l1086_DUPLICATE_16aa_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1101_l1086_DUPLICATE_16aa_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1101_l1086_DUPLICATE_16aa_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1101_l1086_DUPLICATE_16aa_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1107_c7_0ca0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_0ca0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_0ca0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_0ca0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_0ca0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_0ca0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_0ca0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1121_c7_1d03] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_1d03_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_1d03_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_1d03_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_1d03_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_1d03_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_1d03_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_1d03_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_1d03_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1108_c3_0526] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1108_c3_0526_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1108_c3_0526_left;
     BIN_OP_OR_uxn_opcodes_h_l1108_c3_0526_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1108_c3_0526_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1108_c3_0526_return_output := BIN_OP_OR_uxn_opcodes_h_l1108_c3_0526_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1116_c7_9357] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_9357_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_9357_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_9357_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_9357_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_9357_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_9357_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_9357_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_9357_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1116_c7_9357] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_9357_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_9357_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_9357_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_9357_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_9357_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_9357_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_9357_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_9357_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1119_c21_e3eb] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1119_c21_e3eb_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1119_c31_9d4e_return_output);

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1076_c1_bfc3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1076_c1_bfc3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1076_c1_bfc3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1076_c1_bfc3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1076_c1_bfc3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1076_c1_bfc3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1076_c1_bfc3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1076_c1_bfc3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1076_c1_bfc3_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1093_c3_3ac2] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1093_c3_3ac2_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1093_c3_3ac2_left;
     BIN_OP_OR_uxn_opcodes_h_l1093_c3_3ac2_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1093_c3_3ac2_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1093_c3_3ac2_return_output := BIN_OP_OR_uxn_opcodes_h_l1093_c3_3ac2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1121_c7_1d03] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_1d03_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_1d03_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_1d03_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_1d03_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_1d03_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_1d03_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_1d03_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_1d03_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1092_c7_8fac_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1093_c3_3ac2_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1109_c11_9adc_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1108_c3_0526_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1107_c7_0ca0_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1108_c3_0526_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1116_c7_9357_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1119_c21_e3eb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1099_c7_ab31_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1101_l1086_DUPLICATE_16aa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1084_c7_b494_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1101_l1086_DUPLICATE_16aa_return_output;
     VAR_printf_uxn_opcodes_h_l1077_c3_2235_uxn_opcodes_h_l1077_c3_2235_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1076_c1_bfc3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_9357_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1121_c7_1d03_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_0ca0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_9357_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_9357_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1121_c7_1d03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_2309_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_0ca0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_9357_return_output;
     -- t16_MUX[uxn_opcodes_h_l1092_c7_8fac] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1092_c7_8fac_cond <= VAR_t16_MUX_uxn_opcodes_h_l1092_c7_8fac_cond;
     t16_MUX_uxn_opcodes_h_l1092_c7_8fac_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1092_c7_8fac_iftrue;
     t16_MUX_uxn_opcodes_h_l1092_c7_8fac_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1092_c7_8fac_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output := t16_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1107_c7_0ca0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_0ca0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_0ca0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_0ca0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_0ca0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_0ca0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_0ca0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1116_c7_9357] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1116_c7_9357_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1116_c7_9357_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1116_c7_9357_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1116_c7_9357_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1116_c7_9357_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1116_c7_9357_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1116_c7_9357_return_output := result_u8_value_MUX_uxn_opcodes_h_l1116_c7_9357_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1107_c7_0ca0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_0ca0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_0ca0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_0ca0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_0ca0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_0ca0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_0ca0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output;

     -- printf_uxn_opcodes_h_l1077_c3_2235[uxn_opcodes_h_l1077_c3_2235] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1077_c3_2235_uxn_opcodes_h_l1077_c3_2235_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1077_c3_2235_uxn_opcodes_h_l1077_c3_2235_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1116_c7_9357] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_9357_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_9357_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_9357_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_9357_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_9357_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_9357_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_9357_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_9357_return_output;

     -- n16_MUX[uxn_opcodes_h_l1107_c7_0ca0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1107_c7_0ca0_cond <= VAR_n16_MUX_uxn_opcodes_h_l1107_c7_0ca0_cond;
     n16_MUX_uxn_opcodes_h_l1107_c7_0ca0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1107_c7_0ca0_iftrue;
     n16_MUX_uxn_opcodes_h_l1107_c7_0ca0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1107_c7_0ca0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output := n16_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1109_c11_9adc] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1109_c11_9adc_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1109_c11_9adc_left;
     BIN_OP_OR_uxn_opcodes_h_l1109_c11_9adc_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1109_c11_9adc_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1109_c11_9adc_return_output := BIN_OP_OR_uxn_opcodes_h_l1109_c11_9adc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1116_c7_9357] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_9357_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_9357_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_9357_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_9357_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_9357_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_9357_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_9357_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_9357_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1104_c7_2309] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_2309_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_2309_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_2309_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_2309_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_2309_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_2309_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_2309_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_2309_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1107_c7_0ca0_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1109_c11_9adc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1104_c7_2309_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_0ca0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_9357_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_2309_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_0ca0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_9357_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_ab31_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_2309_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_2309_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1107_c7_0ca0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1116_c7_9357_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1089_c7_b8a9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1107_c7_0ca0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1107_c7_0ca0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1107_c7_0ca0_cond;
     tmp16_MUX_uxn_opcodes_h_l1107_c7_0ca0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1107_c7_0ca0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1107_c7_0ca0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1107_c7_0ca0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output := tmp16_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1104_c7_2309] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_2309_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_2309_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_2309_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_2309_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_2309_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_2309_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_2309_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_2309_return_output;

     -- t16_MUX[uxn_opcodes_h_l1089_c7_b8a9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1089_c7_b8a9_cond <= VAR_t16_MUX_uxn_opcodes_h_l1089_c7_b8a9_cond;
     t16_MUX_uxn_opcodes_h_l1089_c7_b8a9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1089_c7_b8a9_iftrue;
     t16_MUX_uxn_opcodes_h_l1089_c7_b8a9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1089_c7_b8a9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output := t16_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output;

     -- n16_MUX[uxn_opcodes_h_l1104_c7_2309] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1104_c7_2309_cond <= VAR_n16_MUX_uxn_opcodes_h_l1104_c7_2309_cond;
     n16_MUX_uxn_opcodes_h_l1104_c7_2309_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1104_c7_2309_iftrue;
     n16_MUX_uxn_opcodes_h_l1104_c7_2309_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1104_c7_2309_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1104_c7_2309_return_output := n16_MUX_uxn_opcodes_h_l1104_c7_2309_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1107_c7_0ca0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_0ca0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_0ca0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_0ca0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_0ca0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_0ca0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_0ca0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1107_c7_0ca0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_0ca0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_0ca0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_0ca0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_0ca0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_0ca0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_0ca0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1114_c21_ffcf] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1114_c21_ffcf_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1109_c11_9adc_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1099_c7_ab31] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_ab31_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_ab31_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_ab31_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_ab31_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_ab31_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_ab31_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1104_c7_2309] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_2309_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_2309_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_2309_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_2309_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_2309_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_2309_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_2309_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_2309_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1107_c7_0ca0_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1114_c21_ffcf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1099_c7_ab31_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1104_c7_2309_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_2309_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_ab31_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_2309_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_2309_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_8b50_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_ab31_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_2309_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1084_c7_b494_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1104_c7_2309_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output;
     -- n16_MUX[uxn_opcodes_h_l1099_c7_ab31] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1099_c7_ab31_cond <= VAR_n16_MUX_uxn_opcodes_h_l1099_c7_ab31_cond;
     n16_MUX_uxn_opcodes_h_l1099_c7_ab31_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1099_c7_ab31_iftrue;
     n16_MUX_uxn_opcodes_h_l1099_c7_ab31_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1099_c7_ab31_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output := n16_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1104_c7_2309] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_2309_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_2309_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_2309_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_2309_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_2309_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_2309_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_2309_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_2309_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1096_c7_8b50] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_8b50_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_8b50_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_8b50_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_8b50_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_8b50_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_8b50_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1099_c7_ab31] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_ab31_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_ab31_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_ab31_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_ab31_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_ab31_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_ab31_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1107_c7_0ca0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1107_c7_0ca0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1107_c7_0ca0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1107_c7_0ca0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1107_c7_0ca0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1107_c7_0ca0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1107_c7_0ca0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output := result_u8_value_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1099_c7_ab31] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_ab31_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_ab31_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_ab31_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_ab31_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_ab31_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_ab31_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1104_c7_2309] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_2309_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_2309_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_2309_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_2309_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_2309_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_2309_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_2309_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_2309_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1104_c7_2309] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1104_c7_2309_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1104_c7_2309_cond;
     tmp16_MUX_uxn_opcodes_h_l1104_c7_2309_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1104_c7_2309_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1104_c7_2309_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1104_c7_2309_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1104_c7_2309_return_output := tmp16_MUX_uxn_opcodes_h_l1104_c7_2309_return_output;

     -- t16_MUX[uxn_opcodes_h_l1084_c7_b494] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1084_c7_b494_cond <= VAR_t16_MUX_uxn_opcodes_h_l1084_c7_b494_cond;
     t16_MUX_uxn_opcodes_h_l1084_c7_b494_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1084_c7_b494_iftrue;
     t16_MUX_uxn_opcodes_h_l1084_c7_b494_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1084_c7_b494_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1084_c7_b494_return_output := t16_MUX_uxn_opcodes_h_l1084_c7_b494_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1096_c7_8b50_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_ab31_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_2309_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_8b50_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_ab31_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_2309_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_8fac_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_8b50_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1104_c7_2309_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1107_c7_0ca0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1081_c7_96e5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1084_c7_b494_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1099_c7_ab31_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1104_c7_2309_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1092_c7_8fac] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_8fac_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_8fac_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_8fac_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_8fac_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_8fac_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_8fac_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1096_c7_8b50] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_8b50_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_8b50_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_8b50_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_8b50_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_8b50_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_8b50_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output;

     -- t16_MUX[uxn_opcodes_h_l1081_c7_96e5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1081_c7_96e5_cond <= VAR_t16_MUX_uxn_opcodes_h_l1081_c7_96e5_cond;
     t16_MUX_uxn_opcodes_h_l1081_c7_96e5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1081_c7_96e5_iftrue;
     t16_MUX_uxn_opcodes_h_l1081_c7_96e5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1081_c7_96e5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output := t16_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1099_c7_ab31] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_ab31_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_ab31_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_ab31_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_ab31_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_ab31_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_ab31_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1096_c7_8b50] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_8b50_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_8b50_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_8b50_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_8b50_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_8b50_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_8b50_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1099_c7_ab31] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1099_c7_ab31_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1099_c7_ab31_cond;
     tmp16_MUX_uxn_opcodes_h_l1099_c7_ab31_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1099_c7_ab31_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1099_c7_ab31_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1099_c7_ab31_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output := tmp16_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1099_c7_ab31] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_ab31_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_ab31_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_ab31_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_ab31_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_ab31_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_ab31_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output;

     -- n16_MUX[uxn_opcodes_h_l1096_c7_8b50] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1096_c7_8b50_cond <= VAR_n16_MUX_uxn_opcodes_h_l1096_c7_8b50_cond;
     n16_MUX_uxn_opcodes_h_l1096_c7_8b50_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1096_c7_8b50_iftrue;
     n16_MUX_uxn_opcodes_h_l1096_c7_8b50_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1096_c7_8b50_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output := n16_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1104_c7_2309] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1104_c7_2309_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1104_c7_2309_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1104_c7_2309_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1104_c7_2309_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1104_c7_2309_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1104_c7_2309_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1104_c7_2309_return_output := result_u8_value_MUX_uxn_opcodes_h_l1104_c7_2309_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1092_c7_8fac_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_8b50_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_8fac_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_8b50_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_b8a9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_8fac_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1099_c7_ab31_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1104_c7_2309_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1076_c2_bb6f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1096_c7_8b50_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output;
     -- n16_MUX[uxn_opcodes_h_l1092_c7_8fac] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1092_c7_8fac_cond <= VAR_n16_MUX_uxn_opcodes_h_l1092_c7_8fac_cond;
     n16_MUX_uxn_opcodes_h_l1092_c7_8fac_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1092_c7_8fac_iftrue;
     n16_MUX_uxn_opcodes_h_l1092_c7_8fac_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1092_c7_8fac_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output := n16_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1092_c7_8fac] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_8fac_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_8fac_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_8fac_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_8fac_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_8fac_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_8fac_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1096_c7_8b50] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1096_c7_8b50_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1096_c7_8b50_cond;
     tmp16_MUX_uxn_opcodes_h_l1096_c7_8b50_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1096_c7_8b50_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1096_c7_8b50_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1096_c7_8b50_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output := tmp16_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1096_c7_8b50] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_8b50_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_8b50_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_8b50_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_8b50_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_8b50_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_8b50_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1099_c7_ab31] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1099_c7_ab31_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1099_c7_ab31_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1099_c7_ab31_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1099_c7_ab31_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1099_c7_ab31_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1099_c7_ab31_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output := result_u8_value_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1096_c7_8b50] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_8b50_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_8b50_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_8b50_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_8b50_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_8b50_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_8b50_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1089_c7_b8a9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_b8a9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_b8a9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_b8a9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_b8a9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_b8a9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_b8a9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output;

     -- t16_MUX[uxn_opcodes_h_l1076_c2_bb6f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1076_c2_bb6f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1076_c2_bb6f_cond;
     t16_MUX_uxn_opcodes_h_l1076_c2_bb6f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1076_c2_bb6f_iftrue;
     t16_MUX_uxn_opcodes_h_l1076_c2_bb6f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1076_c2_bb6f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output := t16_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1092_c7_8fac] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_8fac_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_8fac_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_8fac_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_8fac_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_8fac_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_8fac_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1089_c7_b8a9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_8fac_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_b8a9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_8fac_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_b494_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_b8a9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1096_c7_8b50_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1099_c7_ab31_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1092_c7_8fac_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1089_c7_b8a9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_b8a9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_b8a9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_b8a9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_b8a9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_b8a9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_b8a9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1084_c7_b494] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_b494_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_b494_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_b494_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_b494_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_b494_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_b494_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_b494_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_b494_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1092_c7_8fac] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1092_c7_8fac_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1092_c7_8fac_cond;
     tmp16_MUX_uxn_opcodes_h_l1092_c7_8fac_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1092_c7_8fac_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1092_c7_8fac_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1092_c7_8fac_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output := tmp16_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1096_c7_8b50] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1096_c7_8b50_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1096_c7_8b50_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1096_c7_8b50_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1096_c7_8b50_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1096_c7_8b50_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1096_c7_8b50_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output := result_u8_value_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1092_c7_8fac] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_8fac_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_8fac_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_8fac_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_8fac_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_8fac_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_8fac_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1089_c7_b8a9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_b8a9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_b8a9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_b8a9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_b8a9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_b8a9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_b8a9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output;

     -- n16_MUX[uxn_opcodes_h_l1089_c7_b8a9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1089_c7_b8a9_cond <= VAR_n16_MUX_uxn_opcodes_h_l1089_c7_b8a9_cond;
     n16_MUX_uxn_opcodes_h_l1089_c7_b8a9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1089_c7_b8a9_iftrue;
     n16_MUX_uxn_opcodes_h_l1089_c7_b8a9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1089_c7_b8a9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output := n16_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1092_c7_8fac] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_8fac_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_8fac_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_8fac_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_8fac_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_8fac_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_8fac_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1084_c7_b494_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_b8a9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_b494_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_b8a9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_96e5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_b494_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_b494_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1092_c7_8fac_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1096_c7_8b50_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_b8a9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1089_c7_b8a9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_b8a9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_b8a9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_b8a9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_b8a9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_b8a9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_b8a9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1081_c7_96e5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_96e5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_96e5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_96e5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_96e5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_96e5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_96e5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1092_c7_8fac] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1092_c7_8fac_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1092_c7_8fac_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1092_c7_8fac_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1092_c7_8fac_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1092_c7_8fac_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1092_c7_8fac_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output := result_u8_value_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1084_c7_b494] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_b494_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_b494_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_b494_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_b494_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_b494_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_b494_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_b494_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_b494_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1084_c7_b494] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_b494_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_b494_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_b494_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_b494_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_b494_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_b494_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_b494_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_b494_return_output;

     -- n16_MUX[uxn_opcodes_h_l1084_c7_b494] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1084_c7_b494_cond <= VAR_n16_MUX_uxn_opcodes_h_l1084_c7_b494_cond;
     n16_MUX_uxn_opcodes_h_l1084_c7_b494_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1084_c7_b494_iftrue;
     n16_MUX_uxn_opcodes_h_l1084_c7_b494_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1084_c7_b494_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1084_c7_b494_return_output := n16_MUX_uxn_opcodes_h_l1084_c7_b494_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1089_c7_b8a9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1089_c7_b8a9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_b8a9_cond;
     tmp16_MUX_uxn_opcodes_h_l1089_c7_b8a9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_b8a9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1089_c7_b8a9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_b8a9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output := tmp16_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1089_c7_b8a9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_b8a9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_b8a9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_b8a9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_b8a9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_b8a9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_b8a9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1081_c7_96e5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1084_c7_b494_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_b494_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_96e5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_b494_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_b494_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c2_bb6f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_96e5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_b494_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1089_c7_b8a9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1092_c7_8fac_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_b494_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1084_c7_b494] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_b494_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_b494_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_b494_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_b494_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_b494_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_b494_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_b494_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_b494_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1089_c7_b8a9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1089_c7_b8a9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1089_c7_b8a9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1089_c7_b8a9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1089_c7_b8a9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1089_c7_b8a9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1089_c7_b8a9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output := result_u8_value_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1084_c7_b494] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1084_c7_b494_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_b494_cond;
     tmp16_MUX_uxn_opcodes_h_l1084_c7_b494_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_b494_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1084_c7_b494_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_b494_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_b494_return_output := tmp16_MUX_uxn_opcodes_h_l1084_c7_b494_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1084_c7_b494] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_b494_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_b494_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_b494_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_b494_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_b494_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_b494_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_b494_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_b494_return_output;

     -- n16_MUX[uxn_opcodes_h_l1081_c7_96e5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1081_c7_96e5_cond <= VAR_n16_MUX_uxn_opcodes_h_l1081_c7_96e5_cond;
     n16_MUX_uxn_opcodes_h_l1081_c7_96e5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1081_c7_96e5_iftrue;
     n16_MUX_uxn_opcodes_h_l1081_c7_96e5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1081_c7_96e5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output := n16_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1081_c7_96e5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_96e5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_96e5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_96e5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_96e5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_96e5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_96e5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1081_c7_96e5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_96e5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_96e5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_96e5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_96e5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_96e5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_96e5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1076_c2_bb6f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c2_bb6f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c2_bb6f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c2_bb6f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c2_bb6f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c2_bb6f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c2_bb6f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1076_c2_bb6f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_96e5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_b494_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c2_bb6f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_96e5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_b494_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c2_bb6f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_b494_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1089_c7_b8a9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1081_c7_96e5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_b494_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1076_c2_bb6f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c2_bb6f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c2_bb6f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c2_bb6f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c2_bb6f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c2_bb6f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c2_bb6f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1081_c7_96e5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_96e5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_96e5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_96e5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_96e5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_96e5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_96e5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output;

     -- n16_MUX[uxn_opcodes_h_l1076_c2_bb6f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1076_c2_bb6f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1076_c2_bb6f_cond;
     n16_MUX_uxn_opcodes_h_l1076_c2_bb6f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1076_c2_bb6f_iftrue;
     n16_MUX_uxn_opcodes_h_l1076_c2_bb6f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1076_c2_bb6f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output := n16_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1084_c7_b494] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1084_c7_b494_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_b494_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1084_c7_b494_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_b494_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1084_c7_b494_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_b494_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_b494_return_output := result_u8_value_MUX_uxn_opcodes_h_l1084_c7_b494_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1081_c7_96e5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1081_c7_96e5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1081_c7_96e5_cond;
     tmp16_MUX_uxn_opcodes_h_l1081_c7_96e5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1081_c7_96e5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1081_c7_96e5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1081_c7_96e5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output := tmp16_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1076_c2_bb6f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c2_bb6f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c2_bb6f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c2_bb6f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c2_bb6f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c2_bb6f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c2_bb6f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1081_c7_96e5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_96e5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_96e5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_96e5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_96e5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_96e5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_96e5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1076_c2_bb6f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1076_c2_bb6f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1081_c7_96e5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_b494_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1076_c2_bb6f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1076_c2_bb6f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1076_c2_bb6f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1076_c2_bb6f_cond;
     tmp16_MUX_uxn_opcodes_h_l1076_c2_bb6f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1076_c2_bb6f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1076_c2_bb6f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1076_c2_bb6f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output := tmp16_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1081_c7_96e5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1081_c7_96e5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1081_c7_96e5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1081_c7_96e5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1081_c7_96e5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1081_c7_96e5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1081_c7_96e5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output := result_u8_value_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1076_c2_bb6f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1076_c2_bb6f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1076_c2_bb6f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1076_c2_bb6f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1076_c2_bb6f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1076_c2_bb6f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1076_c2_bb6f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1076_c2_bb6f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1076_c2_bb6f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1076_c2_bb6f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1076_c2_bb6f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1076_c2_bb6f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1076_c2_bb6f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1076_c2_bb6f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output;

     -- Submodule level 12
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1076_c2_bb6f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1081_c7_96e5_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1076_c2_bb6f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1076_c2_bb6f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1076_c2_bb6f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1076_c2_bb6f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1076_c2_bb6f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1076_c2_bb6f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1076_c2_bb6f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l1072_l1126_DUPLICATE_bc35 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l1072_l1126_DUPLICATE_bc35_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8cda(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1076_c2_bb6f_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l1072_l1126_DUPLICATE_bc35_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l1072_l1126_DUPLICATE_bc35_return_output;
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
