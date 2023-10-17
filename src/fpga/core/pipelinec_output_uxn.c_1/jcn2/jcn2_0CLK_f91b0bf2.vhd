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
-- Submodules: 75
entity jcn2_0CLK_f91b0bf2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jcn2_0CLK_f91b0bf2;
architecture arch of jcn2_0CLK_f91b0bf2 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l721_c6_b3de]
signal BIN_OP_EQ_uxn_opcodes_h_l721_c6_b3de_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l721_c6_b3de_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l721_c6_b3de_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l721_c1_1f1a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l721_c1_1f1a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l721_c1_1f1a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l721_c1_1f1a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l721_c1_1f1a_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l721_c2_2bbb]
signal n8_MUX_uxn_opcodes_h_l721_c2_2bbb_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l721_c2_2bbb_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l721_c2_2bbb_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l721_c2_2bbb]
signal result_u16_value_MUX_uxn_opcodes_h_l721_c2_2bbb_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l721_c2_2bbb_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l721_c2_2bbb_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l721_c2_2bbb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l721_c2_2bbb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l721_c2_2bbb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l721_c2_2bbb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l721_c2_2bbb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c2_2bbb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c2_2bbb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c2_2bbb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l721_c2_2bbb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l721_c2_2bbb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l721_c2_2bbb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l721_c2_2bbb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l721_c2_2bbb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c2_2bbb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c2_2bbb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c2_2bbb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l721_c2_2bbb]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l721_c2_2bbb_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l721_c2_2bbb_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l721_c2_2bbb_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l721_c2_2bbb]
signal t16_MUX_uxn_opcodes_h_l721_c2_2bbb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l721_c2_2bbb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l721_c2_2bbb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l722_c3_60d6[uxn_opcodes_h_l722_c3_60d6]
signal printf_uxn_opcodes_h_l722_c3_60d6_uxn_opcodes_h_l722_c3_60d6_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l726_c11_f0a6]
signal BIN_OP_EQ_uxn_opcodes_h_l726_c11_f0a6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l726_c11_f0a6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l726_c11_f0a6_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l726_c7_fc93]
signal n8_MUX_uxn_opcodes_h_l726_c7_fc93_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l726_c7_fc93_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l726_c7_fc93_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l726_c7_fc93_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l726_c7_fc93]
signal result_u16_value_MUX_uxn_opcodes_h_l726_c7_fc93_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l726_c7_fc93_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l726_c7_fc93_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l726_c7_fc93_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l726_c7_fc93]
signal result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_fc93_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_fc93_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_fc93_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_fc93_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l726_c7_fc93]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_fc93_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_fc93_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_fc93_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_fc93_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l726_c7_fc93]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_fc93_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_fc93_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_fc93_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_fc93_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l726_c7_fc93]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_fc93_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_fc93_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_fc93_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_fc93_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l726_c7_fc93]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_fc93_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_fc93_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_fc93_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_fc93_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l726_c7_fc93]
signal t16_MUX_uxn_opcodes_h_l726_c7_fc93_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l726_c7_fc93_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l726_c7_fc93_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l726_c7_fc93_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l729_c11_bada]
signal BIN_OP_EQ_uxn_opcodes_h_l729_c11_bada_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l729_c11_bada_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l729_c11_bada_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l729_c7_b118]
signal n8_MUX_uxn_opcodes_h_l729_c7_b118_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l729_c7_b118_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l729_c7_b118_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l729_c7_b118_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l729_c7_b118]
signal result_u16_value_MUX_uxn_opcodes_h_l729_c7_b118_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l729_c7_b118_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l729_c7_b118_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l729_c7_b118_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l729_c7_b118]
signal result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_b118_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_b118_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_b118_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_b118_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l729_c7_b118]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_b118_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_b118_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_b118_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_b118_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l729_c7_b118]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_b118_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_b118_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_b118_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_b118_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l729_c7_b118]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_b118_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_b118_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_b118_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_b118_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l729_c7_b118]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_b118_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_b118_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_b118_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_b118_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l729_c7_b118]
signal t16_MUX_uxn_opcodes_h_l729_c7_b118_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l729_c7_b118_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l729_c7_b118_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l729_c7_b118_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l731_c3_ad97]
signal CONST_SL_8_uxn_opcodes_h_l731_c3_ad97_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l731_c3_ad97_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l734_c11_6b34]
signal BIN_OP_EQ_uxn_opcodes_h_l734_c11_6b34_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l734_c11_6b34_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l734_c11_6b34_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l734_c7_1187]
signal n8_MUX_uxn_opcodes_h_l734_c7_1187_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l734_c7_1187_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l734_c7_1187_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l734_c7_1187_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l734_c7_1187]
signal result_u16_value_MUX_uxn_opcodes_h_l734_c7_1187_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l734_c7_1187_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l734_c7_1187_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l734_c7_1187_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l734_c7_1187]
signal result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_1187_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_1187_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_1187_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_1187_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l734_c7_1187]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_1187_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_1187_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_1187_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_1187_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l734_c7_1187]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_1187_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_1187_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_1187_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_1187_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l734_c7_1187]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_1187_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_1187_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_1187_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_1187_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l734_c7_1187]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_1187_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_1187_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_1187_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_1187_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l734_c7_1187]
signal t16_MUX_uxn_opcodes_h_l734_c7_1187_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l734_c7_1187_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l734_c7_1187_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l734_c7_1187_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l737_c11_d3cb]
signal BIN_OP_EQ_uxn_opcodes_h_l737_c11_d3cb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l737_c11_d3cb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l737_c11_d3cb_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l737_c7_c3a9]
signal n8_MUX_uxn_opcodes_h_l737_c7_c3a9_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l737_c7_c3a9_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l737_c7_c3a9_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l737_c7_c3a9]
signal result_u16_value_MUX_uxn_opcodes_h_l737_c7_c3a9_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l737_c7_c3a9_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l737_c7_c3a9_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l737_c7_c3a9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_c3a9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_c3a9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_c3a9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l737_c7_c3a9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_c3a9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_c3a9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_c3a9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l737_c7_c3a9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_c3a9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_c3a9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_c3a9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l737_c7_c3a9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_c3a9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_c3a9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_c3a9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l737_c7_c3a9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_c3a9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_c3a9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_c3a9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l737_c7_c3a9]
signal t16_MUX_uxn_opcodes_h_l737_c7_c3a9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l737_c7_c3a9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l737_c7_c3a9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l738_c3_4fcf]
signal BIN_OP_OR_uxn_opcodes_h_l738_c3_4fcf_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l738_c3_4fcf_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l738_c3_4fcf_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l741_c11_4fd8]
signal BIN_OP_EQ_uxn_opcodes_h_l741_c11_4fd8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l741_c11_4fd8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l741_c11_4fd8_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l741_c7_d414]
signal n8_MUX_uxn_opcodes_h_l741_c7_d414_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l741_c7_d414_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l741_c7_d414_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l741_c7_d414_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l741_c7_d414]
signal result_u16_value_MUX_uxn_opcodes_h_l741_c7_d414_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l741_c7_d414_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l741_c7_d414_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l741_c7_d414_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l741_c7_d414]
signal result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_d414_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_d414_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_d414_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_d414_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l741_c7_d414]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_d414_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_d414_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_d414_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_d414_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l741_c7_d414]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_d414_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_d414_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_d414_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_d414_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l741_c7_d414]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_d414_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_d414_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_d414_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_d414_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l741_c7_d414]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_d414_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_d414_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_d414_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_d414_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l744_c11_169b]
signal BIN_OP_EQ_uxn_opcodes_h_l744_c11_169b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l744_c11_169b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l744_c11_169b_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l744_c7_96f6]
signal n8_MUX_uxn_opcodes_h_l744_c7_96f6_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l744_c7_96f6_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l744_c7_96f6_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l744_c7_96f6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l744_c7_96f6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_96f6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_96f6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_96f6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_96f6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l744_c7_96f6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_96f6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_96f6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_96f6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_96f6_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l744_c7_96f6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_96f6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_96f6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_96f6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_96f6_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l744_c7_96f6]
signal result_u16_value_MUX_uxn_opcodes_h_l744_c7_96f6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l744_c7_96f6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l744_c7_96f6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l744_c7_96f6_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l744_c7_96f6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_96f6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_96f6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_96f6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_96f6_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l747_c30_4156]
signal sp_relative_shift_uxn_opcodes_h_l747_c30_4156_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l747_c30_4156_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l747_c30_4156_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l747_c30_4156_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l748_c26_f19c]
signal BIN_OP_EQ_uxn_opcodes_h_l748_c26_f19c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l748_c26_f19c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l748_c26_f19c_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l748_c26_353d]
signal MUX_uxn_opcodes_h_l748_c26_353d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l748_c26_353d_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l748_c26_353d_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l748_c26_353d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l749_c22_9c3e]
signal BIN_OP_EQ_uxn_opcodes_h_l749_c22_9c3e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l749_c22_9c3e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l749_c22_9c3e_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l749_c22_55a3]
signal MUX_uxn_opcodes_h_l749_c22_55a3_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l749_c22_55a3_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l749_c22_55a3_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l749_c22_55a3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l751_c11_bcf8]
signal BIN_OP_EQ_uxn_opcodes_h_l751_c11_bcf8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l751_c11_bcf8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l751_c11_bcf8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l751_c7_d403]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_d403_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_d403_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_d403_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_d403_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l751_c7_d403]
signal result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_d403_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_d403_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_d403_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_d403_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l751_c7_d403]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_d403_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_d403_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_d403_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_d403_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_43dc( ref_toks_0 : opcode_result_t;
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
      base.u16_value := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_pc_updated := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l721_c6_b3de
BIN_OP_EQ_uxn_opcodes_h_l721_c6_b3de : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l721_c6_b3de_left,
BIN_OP_EQ_uxn_opcodes_h_l721_c6_b3de_right,
BIN_OP_EQ_uxn_opcodes_h_l721_c6_b3de_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l721_c1_1f1a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l721_c1_1f1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l721_c1_1f1a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l721_c1_1f1a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l721_c1_1f1a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l721_c1_1f1a_return_output);

-- n8_MUX_uxn_opcodes_h_l721_c2_2bbb
n8_MUX_uxn_opcodes_h_l721_c2_2bbb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l721_c2_2bbb_cond,
n8_MUX_uxn_opcodes_h_l721_c2_2bbb_iftrue,
n8_MUX_uxn_opcodes_h_l721_c2_2bbb_iffalse,
n8_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l721_c2_2bbb
result_u16_value_MUX_uxn_opcodes_h_l721_c2_2bbb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l721_c2_2bbb_cond,
result_u16_value_MUX_uxn_opcodes_h_l721_c2_2bbb_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l721_c2_2bbb_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l721_c2_2bbb
result_is_opc_done_MUX_uxn_opcodes_h_l721_c2_2bbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l721_c2_2bbb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l721_c2_2bbb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l721_c2_2bbb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c2_2bbb
result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c2_2bbb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c2_2bbb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c2_2bbb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c2_2bbb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l721_c2_2bbb
result_is_sp_shift_MUX_uxn_opcodes_h_l721_c2_2bbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l721_c2_2bbb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l721_c2_2bbb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l721_c2_2bbb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c2_2bbb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c2_2bbb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c2_2bbb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c2_2bbb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c2_2bbb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l721_c2_2bbb
result_is_pc_updated_MUX_uxn_opcodes_h_l721_c2_2bbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l721_c2_2bbb_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l721_c2_2bbb_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l721_c2_2bbb_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output);

-- t16_MUX_uxn_opcodes_h_l721_c2_2bbb
t16_MUX_uxn_opcodes_h_l721_c2_2bbb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l721_c2_2bbb_cond,
t16_MUX_uxn_opcodes_h_l721_c2_2bbb_iftrue,
t16_MUX_uxn_opcodes_h_l721_c2_2bbb_iffalse,
t16_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output);

-- printf_uxn_opcodes_h_l722_c3_60d6_uxn_opcodes_h_l722_c3_60d6
printf_uxn_opcodes_h_l722_c3_60d6_uxn_opcodes_h_l722_c3_60d6 : entity work.printf_uxn_opcodes_h_l722_c3_60d6_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l722_c3_60d6_uxn_opcodes_h_l722_c3_60d6_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l726_c11_f0a6
BIN_OP_EQ_uxn_opcodes_h_l726_c11_f0a6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l726_c11_f0a6_left,
BIN_OP_EQ_uxn_opcodes_h_l726_c11_f0a6_right,
BIN_OP_EQ_uxn_opcodes_h_l726_c11_f0a6_return_output);

-- n8_MUX_uxn_opcodes_h_l726_c7_fc93
n8_MUX_uxn_opcodes_h_l726_c7_fc93 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l726_c7_fc93_cond,
n8_MUX_uxn_opcodes_h_l726_c7_fc93_iftrue,
n8_MUX_uxn_opcodes_h_l726_c7_fc93_iffalse,
n8_MUX_uxn_opcodes_h_l726_c7_fc93_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l726_c7_fc93
result_u16_value_MUX_uxn_opcodes_h_l726_c7_fc93 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l726_c7_fc93_cond,
result_u16_value_MUX_uxn_opcodes_h_l726_c7_fc93_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l726_c7_fc93_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l726_c7_fc93_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_fc93
result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_fc93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_fc93_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_fc93_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_fc93_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_fc93_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_fc93
result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_fc93 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_fc93_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_fc93_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_fc93_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_fc93_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_fc93
result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_fc93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_fc93_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_fc93_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_fc93_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_fc93_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_fc93
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_fc93 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_fc93_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_fc93_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_fc93_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_fc93_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_fc93
result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_fc93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_fc93_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_fc93_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_fc93_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_fc93_return_output);

-- t16_MUX_uxn_opcodes_h_l726_c7_fc93
t16_MUX_uxn_opcodes_h_l726_c7_fc93 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l726_c7_fc93_cond,
t16_MUX_uxn_opcodes_h_l726_c7_fc93_iftrue,
t16_MUX_uxn_opcodes_h_l726_c7_fc93_iffalse,
t16_MUX_uxn_opcodes_h_l726_c7_fc93_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l729_c11_bada
BIN_OP_EQ_uxn_opcodes_h_l729_c11_bada : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l729_c11_bada_left,
BIN_OP_EQ_uxn_opcodes_h_l729_c11_bada_right,
BIN_OP_EQ_uxn_opcodes_h_l729_c11_bada_return_output);

-- n8_MUX_uxn_opcodes_h_l729_c7_b118
n8_MUX_uxn_opcodes_h_l729_c7_b118 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l729_c7_b118_cond,
n8_MUX_uxn_opcodes_h_l729_c7_b118_iftrue,
n8_MUX_uxn_opcodes_h_l729_c7_b118_iffalse,
n8_MUX_uxn_opcodes_h_l729_c7_b118_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l729_c7_b118
result_u16_value_MUX_uxn_opcodes_h_l729_c7_b118 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l729_c7_b118_cond,
result_u16_value_MUX_uxn_opcodes_h_l729_c7_b118_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l729_c7_b118_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l729_c7_b118_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_b118
result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_b118 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_b118_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_b118_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_b118_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_b118_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_b118
result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_b118 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_b118_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_b118_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_b118_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_b118_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_b118
result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_b118 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_b118_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_b118_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_b118_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_b118_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_b118
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_b118 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_b118_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_b118_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_b118_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_b118_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_b118
result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_b118 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_b118_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_b118_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_b118_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_b118_return_output);

-- t16_MUX_uxn_opcodes_h_l729_c7_b118
t16_MUX_uxn_opcodes_h_l729_c7_b118 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l729_c7_b118_cond,
t16_MUX_uxn_opcodes_h_l729_c7_b118_iftrue,
t16_MUX_uxn_opcodes_h_l729_c7_b118_iffalse,
t16_MUX_uxn_opcodes_h_l729_c7_b118_return_output);

-- CONST_SL_8_uxn_opcodes_h_l731_c3_ad97
CONST_SL_8_uxn_opcodes_h_l731_c3_ad97 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l731_c3_ad97_x,
CONST_SL_8_uxn_opcodes_h_l731_c3_ad97_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l734_c11_6b34
BIN_OP_EQ_uxn_opcodes_h_l734_c11_6b34 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l734_c11_6b34_left,
BIN_OP_EQ_uxn_opcodes_h_l734_c11_6b34_right,
BIN_OP_EQ_uxn_opcodes_h_l734_c11_6b34_return_output);

-- n8_MUX_uxn_opcodes_h_l734_c7_1187
n8_MUX_uxn_opcodes_h_l734_c7_1187 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l734_c7_1187_cond,
n8_MUX_uxn_opcodes_h_l734_c7_1187_iftrue,
n8_MUX_uxn_opcodes_h_l734_c7_1187_iffalse,
n8_MUX_uxn_opcodes_h_l734_c7_1187_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l734_c7_1187
result_u16_value_MUX_uxn_opcodes_h_l734_c7_1187 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l734_c7_1187_cond,
result_u16_value_MUX_uxn_opcodes_h_l734_c7_1187_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l734_c7_1187_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l734_c7_1187_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_1187
result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_1187 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_1187_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_1187_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_1187_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_1187_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_1187
result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_1187 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_1187_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_1187_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_1187_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_1187_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_1187
result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_1187 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_1187_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_1187_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_1187_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_1187_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_1187
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_1187 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_1187_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_1187_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_1187_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_1187_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_1187
result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_1187 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_1187_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_1187_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_1187_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_1187_return_output);

-- t16_MUX_uxn_opcodes_h_l734_c7_1187
t16_MUX_uxn_opcodes_h_l734_c7_1187 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l734_c7_1187_cond,
t16_MUX_uxn_opcodes_h_l734_c7_1187_iftrue,
t16_MUX_uxn_opcodes_h_l734_c7_1187_iffalse,
t16_MUX_uxn_opcodes_h_l734_c7_1187_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l737_c11_d3cb
BIN_OP_EQ_uxn_opcodes_h_l737_c11_d3cb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l737_c11_d3cb_left,
BIN_OP_EQ_uxn_opcodes_h_l737_c11_d3cb_right,
BIN_OP_EQ_uxn_opcodes_h_l737_c11_d3cb_return_output);

-- n8_MUX_uxn_opcodes_h_l737_c7_c3a9
n8_MUX_uxn_opcodes_h_l737_c7_c3a9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l737_c7_c3a9_cond,
n8_MUX_uxn_opcodes_h_l737_c7_c3a9_iftrue,
n8_MUX_uxn_opcodes_h_l737_c7_c3a9_iffalse,
n8_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l737_c7_c3a9
result_u16_value_MUX_uxn_opcodes_h_l737_c7_c3a9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l737_c7_c3a9_cond,
result_u16_value_MUX_uxn_opcodes_h_l737_c7_c3a9_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l737_c7_c3a9_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_c3a9
result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_c3a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_c3a9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_c3a9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_c3a9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_c3a9
result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_c3a9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_c3a9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_c3a9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_c3a9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_c3a9
result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_c3a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_c3a9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_c3a9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_c3a9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_c3a9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_c3a9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_c3a9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_c3a9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_c3a9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_c3a9
result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_c3a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_c3a9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_c3a9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_c3a9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output);

-- t16_MUX_uxn_opcodes_h_l737_c7_c3a9
t16_MUX_uxn_opcodes_h_l737_c7_c3a9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l737_c7_c3a9_cond,
t16_MUX_uxn_opcodes_h_l737_c7_c3a9_iftrue,
t16_MUX_uxn_opcodes_h_l737_c7_c3a9_iffalse,
t16_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l738_c3_4fcf
BIN_OP_OR_uxn_opcodes_h_l738_c3_4fcf : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l738_c3_4fcf_left,
BIN_OP_OR_uxn_opcodes_h_l738_c3_4fcf_right,
BIN_OP_OR_uxn_opcodes_h_l738_c3_4fcf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l741_c11_4fd8
BIN_OP_EQ_uxn_opcodes_h_l741_c11_4fd8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l741_c11_4fd8_left,
BIN_OP_EQ_uxn_opcodes_h_l741_c11_4fd8_right,
BIN_OP_EQ_uxn_opcodes_h_l741_c11_4fd8_return_output);

-- n8_MUX_uxn_opcodes_h_l741_c7_d414
n8_MUX_uxn_opcodes_h_l741_c7_d414 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l741_c7_d414_cond,
n8_MUX_uxn_opcodes_h_l741_c7_d414_iftrue,
n8_MUX_uxn_opcodes_h_l741_c7_d414_iffalse,
n8_MUX_uxn_opcodes_h_l741_c7_d414_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l741_c7_d414
result_u16_value_MUX_uxn_opcodes_h_l741_c7_d414 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l741_c7_d414_cond,
result_u16_value_MUX_uxn_opcodes_h_l741_c7_d414_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l741_c7_d414_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l741_c7_d414_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_d414
result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_d414 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_d414_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_d414_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_d414_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_d414_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_d414
result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_d414 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_d414_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_d414_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_d414_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_d414_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_d414
result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_d414 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_d414_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_d414_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_d414_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_d414_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_d414
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_d414 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_d414_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_d414_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_d414_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_d414_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_d414
result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_d414 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_d414_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_d414_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_d414_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_d414_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l744_c11_169b
BIN_OP_EQ_uxn_opcodes_h_l744_c11_169b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l744_c11_169b_left,
BIN_OP_EQ_uxn_opcodes_h_l744_c11_169b_right,
BIN_OP_EQ_uxn_opcodes_h_l744_c11_169b_return_output);

-- n8_MUX_uxn_opcodes_h_l744_c7_96f6
n8_MUX_uxn_opcodes_h_l744_c7_96f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l744_c7_96f6_cond,
n8_MUX_uxn_opcodes_h_l744_c7_96f6_iftrue,
n8_MUX_uxn_opcodes_h_l744_c7_96f6_iffalse,
n8_MUX_uxn_opcodes_h_l744_c7_96f6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_96f6
result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_96f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_96f6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_96f6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_96f6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_96f6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_96f6
result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_96f6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_96f6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_96f6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_96f6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_96f6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_96f6
result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_96f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_96f6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_96f6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_96f6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_96f6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l744_c7_96f6
result_u16_value_MUX_uxn_opcodes_h_l744_c7_96f6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l744_c7_96f6_cond,
result_u16_value_MUX_uxn_opcodes_h_l744_c7_96f6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l744_c7_96f6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l744_c7_96f6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_96f6
result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_96f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_96f6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_96f6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_96f6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_96f6_return_output);

-- sp_relative_shift_uxn_opcodes_h_l747_c30_4156
sp_relative_shift_uxn_opcodes_h_l747_c30_4156 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l747_c30_4156_ins,
sp_relative_shift_uxn_opcodes_h_l747_c30_4156_x,
sp_relative_shift_uxn_opcodes_h_l747_c30_4156_y,
sp_relative_shift_uxn_opcodes_h_l747_c30_4156_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l748_c26_f19c
BIN_OP_EQ_uxn_opcodes_h_l748_c26_f19c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l748_c26_f19c_left,
BIN_OP_EQ_uxn_opcodes_h_l748_c26_f19c_right,
BIN_OP_EQ_uxn_opcodes_h_l748_c26_f19c_return_output);

-- MUX_uxn_opcodes_h_l748_c26_353d
MUX_uxn_opcodes_h_l748_c26_353d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l748_c26_353d_cond,
MUX_uxn_opcodes_h_l748_c26_353d_iftrue,
MUX_uxn_opcodes_h_l748_c26_353d_iffalse,
MUX_uxn_opcodes_h_l748_c26_353d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l749_c22_9c3e
BIN_OP_EQ_uxn_opcodes_h_l749_c22_9c3e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l749_c22_9c3e_left,
BIN_OP_EQ_uxn_opcodes_h_l749_c22_9c3e_right,
BIN_OP_EQ_uxn_opcodes_h_l749_c22_9c3e_return_output);

-- MUX_uxn_opcodes_h_l749_c22_55a3
MUX_uxn_opcodes_h_l749_c22_55a3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l749_c22_55a3_cond,
MUX_uxn_opcodes_h_l749_c22_55a3_iftrue,
MUX_uxn_opcodes_h_l749_c22_55a3_iffalse,
MUX_uxn_opcodes_h_l749_c22_55a3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l751_c11_bcf8
BIN_OP_EQ_uxn_opcodes_h_l751_c11_bcf8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l751_c11_bcf8_left,
BIN_OP_EQ_uxn_opcodes_h_l751_c11_bcf8_right,
BIN_OP_EQ_uxn_opcodes_h_l751_c11_bcf8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_d403
result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_d403 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_d403_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_d403_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_d403_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_d403_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_d403
result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_d403 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_d403_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_d403_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_d403_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_d403_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_d403
result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_d403 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_d403_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_d403_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_d403_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_d403_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l721_c6_b3de_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l721_c1_1f1a_return_output,
 n8_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output,
 t16_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l726_c11_f0a6_return_output,
 n8_MUX_uxn_opcodes_h_l726_c7_fc93_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l726_c7_fc93_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_fc93_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_fc93_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_fc93_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_fc93_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_fc93_return_output,
 t16_MUX_uxn_opcodes_h_l726_c7_fc93_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l729_c11_bada_return_output,
 n8_MUX_uxn_opcodes_h_l729_c7_b118_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l729_c7_b118_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_b118_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_b118_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_b118_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_b118_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_b118_return_output,
 t16_MUX_uxn_opcodes_h_l729_c7_b118_return_output,
 CONST_SL_8_uxn_opcodes_h_l731_c3_ad97_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l734_c11_6b34_return_output,
 n8_MUX_uxn_opcodes_h_l734_c7_1187_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l734_c7_1187_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_1187_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_1187_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_1187_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_1187_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_1187_return_output,
 t16_MUX_uxn_opcodes_h_l734_c7_1187_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l737_c11_d3cb_return_output,
 n8_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output,
 t16_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output,
 BIN_OP_OR_uxn_opcodes_h_l738_c3_4fcf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l741_c11_4fd8_return_output,
 n8_MUX_uxn_opcodes_h_l741_c7_d414_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l741_c7_d414_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_d414_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_d414_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_d414_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_d414_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_d414_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l744_c11_169b_return_output,
 n8_MUX_uxn_opcodes_h_l744_c7_96f6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_96f6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_96f6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_96f6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l744_c7_96f6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_96f6_return_output,
 sp_relative_shift_uxn_opcodes_h_l747_c30_4156_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l748_c26_f19c_return_output,
 MUX_uxn_opcodes_h_l748_c26_353d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l749_c22_9c3e_return_output,
 MUX_uxn_opcodes_h_l749_c22_55a3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l751_c11_bcf8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_d403_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_d403_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_d403_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c6_b3de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c6_b3de_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c6_b3de_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l721_c1_1f1a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l721_c1_1f1a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l721_c1_1f1a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l721_c1_1f1a_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l721_c2_2bbb_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l721_c2_2bbb_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l726_c7_fc93_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l721_c2_2bbb_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l721_c2_2bbb_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l721_c2_2bbb_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_fc93_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l721_c2_2bbb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l721_c2_2bbb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l721_c2_2bbb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_fc93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l721_c2_2bbb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c2_2bbb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c2_2bbb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_fc93_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c2_2bbb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l721_c2_2bbb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l721_c2_2bbb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_fc93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l721_c2_2bbb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c2_2bbb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l723_c3_7602 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c2_2bbb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_fc93_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c2_2bbb_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l721_c2_2bbb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l721_c2_2bbb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_fc93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l721_c2_2bbb_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l721_c2_2bbb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l721_c2_2bbb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l726_c7_fc93_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l721_c2_2bbb_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l722_c3_60d6_uxn_opcodes_h_l722_c3_60d6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_f0a6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_f0a6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_f0a6_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l726_c7_fc93_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l726_c7_fc93_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l729_c7_b118_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l726_c7_fc93_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_fc93_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_fc93_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l729_c7_b118_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_fc93_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_fc93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_fc93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_b118_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_fc93_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_fc93_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_fc93_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_b118_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_fc93_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_fc93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_fc93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_b118_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_fc93_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_fc93_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l727_c3_51af : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_fc93_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_b118_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_fc93_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_fc93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_fc93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_b118_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_fc93_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l726_c7_fc93_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l726_c7_fc93_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l729_c7_b118_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l726_c7_fc93_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_bada_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_bada_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_bada_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l729_c7_b118_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l729_c7_b118_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l734_c7_1187_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l729_c7_b118_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l729_c7_b118_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l729_c7_b118_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_1187_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l729_c7_b118_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_b118_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_b118_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_1187_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_b118_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_b118_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_b118_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_1187_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_b118_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_b118_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_b118_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_1187_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_b118_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_b118_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l732_c3_2483 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_b118_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_1187_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_b118_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_b118_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_b118_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_1187_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_b118_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l729_c7_b118_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l729_c7_b118_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l734_c7_1187_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l729_c7_b118_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l731_c3_ad97_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l731_c3_ad97_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_6b34_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_6b34_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_6b34_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l734_c7_1187_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l734_c7_1187_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l734_c7_1187_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_1187_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_1187_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_1187_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_1187_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_1187_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_1187_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_1187_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_1187_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_1187_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_1187_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_1187_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_1187_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_1187_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l735_c3_01a9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_1187_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_1187_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_1187_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_1187_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_1187_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l734_c7_1187_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l734_c7_1187_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l734_c7_1187_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_d3cb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_d3cb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_d3cb_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l737_c7_c3a9_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l737_c7_c3a9_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l741_c7_d414_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l737_c7_c3a9_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l737_c7_c3a9_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l737_c7_c3a9_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l741_c7_d414_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l737_c7_c3a9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_c3a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_c3a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_d414_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_c3a9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_c3a9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_c3a9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_d414_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_c3a9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_c3a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_c3a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_d414_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_c3a9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_c3a9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l739_c3_61fd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_c3a9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_d414_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_c3a9_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_c3a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_c3a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_d414_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_c3a9_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l737_c7_c3a9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l737_c7_c3a9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l737_c7_c3a9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l738_c3_4fcf_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l738_c3_4fcf_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l738_c3_4fcf_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_4fd8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_4fd8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_4fd8_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l741_c7_d414_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l741_c7_d414_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l744_c7_96f6_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l741_c7_d414_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l741_c7_d414_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l741_c7_d414_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l744_c7_96f6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l741_c7_d414_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_d414_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_d414_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_96f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_d414_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_d414_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_d414_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_96f6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_d414_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_d414_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_d414_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_96f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_d414_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_d414_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l742_c3_3b57 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_d414_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l741_c7_d414_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_d414_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_d414_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_d414_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_96f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_d414_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_169b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_169b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_169b_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l744_c7_96f6_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l744_c7_96f6_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l744_c7_96f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_96f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_96f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_d403_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_96f6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_96f6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_96f6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_96f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_96f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_96f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_d403_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_96f6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l744_c7_96f6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l744_c7_96f6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l744_c7_96f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_96f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_96f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_d403_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_96f6_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l747_c30_4156_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l747_c30_4156_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l747_c30_4156_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l747_c30_4156_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l748_c26_353d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l748_c26_353d_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l748_c26_353d_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c26_f19c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c26_f19c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c26_f19c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l748_c26_353d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l749_c22_55a3_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l749_c22_55a3_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l749_c22_55a3_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c22_9c3e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c22_9c3e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c22_9c3e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l749_c22_55a3_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_bcf8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_bcf8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_bcf8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_d403_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_d403_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_d403_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_d403_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_d403_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_d403_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_d403_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_d403_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_d403_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l729_l721_l726_l744_l737_l741_l734_DUPLICATE_c3a6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l729_l721_l726_l744_l737_l741_l734_DUPLICATE_ca79_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l729_l721_l726_l751_l737_l741_l734_DUPLICATE_dd2c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l729_l721_l726_l751_l737_l741_l734_DUPLICATE_fbd8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l729_l726_l751_l744_l737_l741_l734_DUPLICATE_b4ca_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l730_l738_DUPLICATE_f3ac_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_43dc_uxn_opcodes_h_l716_l757_DUPLICATE_4cd4_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_d403_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_d403_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l748_c26_353d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c26_f19c_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_d403_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l721_c1_1f1a_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l742_c3_3b57 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_d414_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l742_c3_3b57;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_d3cb_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_96f6_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l748_c26_353d_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_169b_right := to_unsigned(6, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l747_c30_4156_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_bada_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_4fd8_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l735_c3_01a9 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_1187_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l735_c3_01a9;
     VAR_sp_relative_shift_uxn_opcodes_h_l747_c30_4156_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_6b34_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l727_c3_51af := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_fc93_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l727_c3_51af;
     VAR_MUX_uxn_opcodes_h_l749_c22_55a3_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l739_c3_61fd := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_c3a9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l739_c3_61fd;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c6_b3de_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_bcf8_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l723_c3_7602 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c2_2bbb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l723_c3_7602;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_f0a6_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l721_c2_2bbb_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l732_c3_2483 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_b118_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l732_c3_2483;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c22_9c3e_right := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l721_c1_1f1a_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l747_c30_4156_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l721_c2_2bbb_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l726_c7_fc93_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l729_c7_b118_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l734_c7_1187_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l737_c7_c3a9_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l741_c7_d414_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l744_c7_96f6_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c6_b3de_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_f0a6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_bada_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_6b34_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_d3cb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_4fd8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_169b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_bcf8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c26_f19c_left := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c22_9c3e_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l744_c7_96f6_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l738_c3_4fcf_left := t16;
     VAR_MUX_uxn_opcodes_h_l749_c22_55a3_iffalse := t16;
     VAR_t16_MUX_uxn_opcodes_h_l721_c2_2bbb_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l726_c7_fc93_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l734_c7_1187_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l737_c7_c3a9_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l734_c11_6b34] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l734_c11_6b34_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_6b34_left;
     BIN_OP_EQ_uxn_opcodes_h_l734_c11_6b34_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_6b34_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_6b34_return_output := BIN_OP_EQ_uxn_opcodes_h_l734_c11_6b34_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l751_c11_bcf8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l751_c11_bcf8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_bcf8_left;
     BIN_OP_EQ_uxn_opcodes_h_l751_c11_bcf8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_bcf8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_bcf8_return_output := BIN_OP_EQ_uxn_opcodes_h_l751_c11_bcf8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l729_l721_l726_l751_l737_l741_l734_DUPLICATE_fbd8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l729_l721_l726_l751_l737_l741_l734_DUPLICATE_fbd8_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l726_c11_f0a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l726_c11_f0a6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_f0a6_left;
     BIN_OP_EQ_uxn_opcodes_h_l726_c11_f0a6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_f0a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_f0a6_return_output := BIN_OP_EQ_uxn_opcodes_h_l726_c11_f0a6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l748_c26_f19c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l748_c26_f19c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c26_f19c_left;
     BIN_OP_EQ_uxn_opcodes_h_l748_c26_f19c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c26_f19c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c26_f19c_return_output := BIN_OP_EQ_uxn_opcodes_h_l748_c26_f19c_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l729_l721_l726_l744_l737_l741_l734_DUPLICATE_c3a6 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l729_l721_l726_l744_l737_l741_l734_DUPLICATE_c3a6_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l737_c11_d3cb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l737_c11_d3cb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_d3cb_left;
     BIN_OP_EQ_uxn_opcodes_h_l737_c11_d3cb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_d3cb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_d3cb_return_output := BIN_OP_EQ_uxn_opcodes_h_l737_c11_d3cb_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l729_l721_l726_l751_l737_l741_l734_DUPLICATE_dd2c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l729_l721_l726_l751_l737_l741_l734_DUPLICATE_dd2c_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l729_l726_l751_l744_l737_l741_l734_DUPLICATE_b4ca LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l729_l726_l751_l744_l737_l741_l734_DUPLICATE_b4ca_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l729_c11_bada] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l729_c11_bada_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_bada_left;
     BIN_OP_EQ_uxn_opcodes_h_l729_c11_bada_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_bada_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_bada_return_output := BIN_OP_EQ_uxn_opcodes_h_l729_c11_bada_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l729_l721_l726_l744_l737_l741_l734_DUPLICATE_ca79 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l729_l721_l726_l744_l737_l741_l734_DUPLICATE_ca79_return_output := result.sp_relative_shift;

     -- sp_relative_shift[uxn_opcodes_h_l747_c30_4156] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l747_c30_4156_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l747_c30_4156_ins;
     sp_relative_shift_uxn_opcodes_h_l747_c30_4156_x <= VAR_sp_relative_shift_uxn_opcodes_h_l747_c30_4156_x;
     sp_relative_shift_uxn_opcodes_h_l747_c30_4156_y <= VAR_sp_relative_shift_uxn_opcodes_h_l747_c30_4156_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l747_c30_4156_return_output := sp_relative_shift_uxn_opcodes_h_l747_c30_4156_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l730_l738_DUPLICATE_f3ac LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l730_l738_DUPLICATE_f3ac_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l741_c7_d414] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l741_c7_d414_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l749_c22_9c3e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l749_c22_9c3e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c22_9c3e_left;
     BIN_OP_EQ_uxn_opcodes_h_l749_c22_9c3e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c22_9c3e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c22_9c3e_return_output := BIN_OP_EQ_uxn_opcodes_h_l749_c22_9c3e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l741_c11_4fd8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l741_c11_4fd8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_4fd8_left;
     BIN_OP_EQ_uxn_opcodes_h_l741_c11_4fd8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_4fd8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_4fd8_return_output := BIN_OP_EQ_uxn_opcodes_h_l741_c11_4fd8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l721_c6_b3de] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l721_c6_b3de_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c6_b3de_left;
     BIN_OP_EQ_uxn_opcodes_h_l721_c6_b3de_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c6_b3de_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c6_b3de_return_output := BIN_OP_EQ_uxn_opcodes_h_l721_c6_b3de_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l744_c11_169b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l744_c11_169b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_169b_left;
     BIN_OP_EQ_uxn_opcodes_h_l744_c11_169b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_169b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_169b_return_output := BIN_OP_EQ_uxn_opcodes_h_l744_c11_169b_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l721_c1_1f1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c6_b3de_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l721_c2_2bbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c6_b3de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l721_c2_2bbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c6_b3de_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l721_c2_2bbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c6_b3de_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l721_c2_2bbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c6_b3de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c2_2bbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c6_b3de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c2_2bbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c6_b3de_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l721_c2_2bbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c6_b3de_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l721_c2_2bbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c6_b3de_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l726_c7_fc93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_f0a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_fc93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_f0a6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_fc93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_f0a6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_fc93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_f0a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_fc93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_f0a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_fc93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_f0a6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_fc93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_f0a6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l726_c7_fc93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_f0a6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l729_c7_b118_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_bada_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_b118_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_bada_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_b118_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_bada_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_b118_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_bada_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_b118_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_bada_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_b118_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_bada_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l729_c7_b118_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_bada_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l729_c7_b118_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_bada_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l734_c7_1187_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_6b34_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_1187_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_6b34_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_1187_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_6b34_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_1187_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_6b34_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_1187_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_6b34_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_1187_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_6b34_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_1187_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_6b34_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l734_c7_1187_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_6b34_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l737_c7_c3a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_d3cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_c3a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_d3cb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_c3a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_d3cb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_c3a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_d3cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_c3a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_d3cb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_c3a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_d3cb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l737_c7_c3a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_d3cb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l737_c7_c3a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_d3cb_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l741_c7_d414_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_4fd8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_d414_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_4fd8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_d414_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_4fd8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_d414_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_4fd8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_d414_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_4fd8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_d414_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_4fd8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l741_c7_d414_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_4fd8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l744_c7_96f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_169b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_96f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_169b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_96f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_169b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_96f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_169b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_96f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_169b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l744_c7_96f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_169b_return_output;
     VAR_MUX_uxn_opcodes_h_l748_c26_353d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c26_f19c_return_output;
     VAR_MUX_uxn_opcodes_h_l749_c22_55a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c22_9c3e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_d403_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_bcf8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_d403_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_bcf8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_d403_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_bcf8_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l738_c3_4fcf_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l730_l738_DUPLICATE_f3ac_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l731_c3_ad97_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l730_l738_DUPLICATE_f3ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c2_2bbb_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l729_l721_l726_l744_l737_l741_l734_DUPLICATE_ca79_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_fc93_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l729_l721_l726_l744_l737_l741_l734_DUPLICATE_ca79_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_b118_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l729_l721_l726_l744_l737_l741_l734_DUPLICATE_ca79_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_1187_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l729_l721_l726_l744_l737_l741_l734_DUPLICATE_ca79_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_c3a9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l729_l721_l726_l744_l737_l741_l734_DUPLICATE_ca79_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_d414_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l729_l721_l726_l744_l737_l741_l734_DUPLICATE_ca79_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_96f6_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l729_l721_l726_l744_l737_l741_l734_DUPLICATE_ca79_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l721_c2_2bbb_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l729_l721_l726_l744_l737_l741_l734_DUPLICATE_c3a6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_fc93_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l729_l721_l726_l744_l737_l741_l734_DUPLICATE_c3a6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l729_c7_b118_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l729_l721_l726_l744_l737_l741_l734_DUPLICATE_c3a6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_1187_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l729_l721_l726_l744_l737_l741_l734_DUPLICATE_c3a6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l737_c7_c3a9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l729_l721_l726_l744_l737_l741_l734_DUPLICATE_c3a6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l741_c7_d414_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l729_l721_l726_l744_l737_l741_l734_DUPLICATE_c3a6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l744_c7_96f6_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l729_l721_l726_l744_l737_l741_l734_DUPLICATE_c3a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_fc93_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l729_l726_l751_l744_l737_l741_l734_DUPLICATE_b4ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_b118_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l729_l726_l751_l744_l737_l741_l734_DUPLICATE_b4ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_1187_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l729_l726_l751_l744_l737_l741_l734_DUPLICATE_b4ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_c3a9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l729_l726_l751_l744_l737_l741_l734_DUPLICATE_b4ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_d414_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l729_l726_l751_l744_l737_l741_l734_DUPLICATE_b4ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_96f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l729_l726_l751_l744_l737_l741_l734_DUPLICATE_b4ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_d403_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l729_l726_l751_l744_l737_l741_l734_DUPLICATE_b4ca_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l721_c2_2bbb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l729_l721_l726_l751_l737_l741_l734_DUPLICATE_fbd8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_fc93_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l729_l721_l726_l751_l737_l741_l734_DUPLICATE_fbd8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_b118_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l729_l721_l726_l751_l737_l741_l734_DUPLICATE_fbd8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_1187_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l729_l721_l726_l751_l737_l741_l734_DUPLICATE_fbd8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_c3a9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l729_l721_l726_l751_l737_l741_l734_DUPLICATE_fbd8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_d414_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l729_l721_l726_l751_l737_l741_l734_DUPLICATE_fbd8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_d403_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l729_l721_l726_l751_l737_l741_l734_DUPLICATE_fbd8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l721_c2_2bbb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l729_l721_l726_l751_l737_l741_l734_DUPLICATE_dd2c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_fc93_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l729_l721_l726_l751_l737_l741_l734_DUPLICATE_dd2c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_b118_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l729_l721_l726_l751_l737_l741_l734_DUPLICATE_dd2c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_1187_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l729_l721_l726_l751_l737_l741_l734_DUPLICATE_dd2c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_c3a9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l729_l721_l726_l751_l737_l741_l734_DUPLICATE_dd2c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_d414_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l729_l721_l726_l751_l737_l741_l734_DUPLICATE_dd2c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_d403_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l729_l721_l726_l751_l737_l741_l734_DUPLICATE_dd2c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_d414_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l741_c7_d414_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_96f6_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l747_c30_4156_return_output;
     -- MUX[uxn_opcodes_h_l749_c22_55a3] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l749_c22_55a3_cond <= VAR_MUX_uxn_opcodes_h_l749_c22_55a3_cond;
     MUX_uxn_opcodes_h_l749_c22_55a3_iftrue <= VAR_MUX_uxn_opcodes_h_l749_c22_55a3_iftrue;
     MUX_uxn_opcodes_h_l749_c22_55a3_iffalse <= VAR_MUX_uxn_opcodes_h_l749_c22_55a3_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l749_c22_55a3_return_output := MUX_uxn_opcodes_h_l749_c22_55a3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l741_c7_d414] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_d414_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_d414_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_d414_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_d414_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_d414_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_d414_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_d414_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_d414_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l721_c1_1f1a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l721_c1_1f1a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l721_c1_1f1a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l721_c1_1f1a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l721_c1_1f1a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l721_c1_1f1a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l721_c1_1f1a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l721_c1_1f1a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l721_c1_1f1a_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l731_c3_ad97] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l731_c3_ad97_x <= VAR_CONST_SL_8_uxn_opcodes_h_l731_c3_ad97_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l731_c3_ad97_return_output := CONST_SL_8_uxn_opcodes_h_l731_c3_ad97_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l744_c7_96f6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_96f6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_96f6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_96f6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_96f6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_96f6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_96f6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_96f6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_96f6_return_output;

     -- MUX[uxn_opcodes_h_l748_c26_353d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l748_c26_353d_cond <= VAR_MUX_uxn_opcodes_h_l748_c26_353d_cond;
     MUX_uxn_opcodes_h_l748_c26_353d_iftrue <= VAR_MUX_uxn_opcodes_h_l748_c26_353d_iftrue;
     MUX_uxn_opcodes_h_l748_c26_353d_iffalse <= VAR_MUX_uxn_opcodes_h_l748_c26_353d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l748_c26_353d_return_output := MUX_uxn_opcodes_h_l748_c26_353d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l751_c7_d403] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_d403_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_d403_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_d403_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_d403_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_d403_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_d403_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_d403_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_d403_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l738_c3_4fcf] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l738_c3_4fcf_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l738_c3_4fcf_left;
     BIN_OP_OR_uxn_opcodes_h_l738_c3_4fcf_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l738_c3_4fcf_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l738_c3_4fcf_return_output := BIN_OP_OR_uxn_opcodes_h_l738_c3_4fcf_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l751_c7_d403] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_d403_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_d403_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_d403_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_d403_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_d403_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_d403_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_d403_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_d403_return_output;

     -- n8_MUX[uxn_opcodes_h_l744_c7_96f6] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l744_c7_96f6_cond <= VAR_n8_MUX_uxn_opcodes_h_l744_c7_96f6_cond;
     n8_MUX_uxn_opcodes_h_l744_c7_96f6_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l744_c7_96f6_iftrue;
     n8_MUX_uxn_opcodes_h_l744_c7_96f6_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l744_c7_96f6_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l744_c7_96f6_return_output := n8_MUX_uxn_opcodes_h_l744_c7_96f6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l751_c7_d403] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_d403_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_d403_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_d403_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_d403_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_d403_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_d403_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_d403_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_d403_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l737_c7_c3a9_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l738_c3_4fcf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l729_c7_b118_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l731_c3_ad97_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_96f6_iftrue := VAR_MUX_uxn_opcodes_h_l748_c26_353d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l744_c7_96f6_iftrue := VAR_MUX_uxn_opcodes_h_l749_c22_55a3_return_output;
     VAR_printf_uxn_opcodes_h_l722_c3_60d6_uxn_opcodes_h_l722_c3_60d6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l721_c1_1f1a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l741_c7_d414_iffalse := VAR_n8_MUX_uxn_opcodes_h_l744_c7_96f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_96f6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_d403_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_96f6_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_d403_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_96f6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_d403_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_d414_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_96f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_c3a9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_d414_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l744_c7_96f6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_96f6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_96f6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_96f6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_96f6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_96f6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_96f6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_96f6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_96f6_return_output;

     -- printf_uxn_opcodes_h_l722_c3_60d6[uxn_opcodes_h_l722_c3_60d6] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l722_c3_60d6_uxn_opcodes_h_l722_c3_60d6_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l722_c3_60d6_uxn_opcodes_h_l722_c3_60d6_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l744_c7_96f6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_96f6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_96f6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_96f6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_96f6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_96f6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_96f6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_96f6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_96f6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l737_c7_c3a9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_c3a9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_c3a9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_c3a9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_c3a9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_c3a9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_c3a9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l744_c7_96f6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_96f6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_96f6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_96f6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_96f6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_96f6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_96f6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_96f6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_96f6_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l744_c7_96f6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l744_c7_96f6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l744_c7_96f6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l744_c7_96f6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l744_c7_96f6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l744_c7_96f6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l744_c7_96f6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l744_c7_96f6_return_output := result_u16_value_MUX_uxn_opcodes_h_l744_c7_96f6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l741_c7_d414] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_d414_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_d414_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_d414_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_d414_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_d414_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_d414_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_d414_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_d414_return_output;

     -- n8_MUX[uxn_opcodes_h_l741_c7_d414] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l741_c7_d414_cond <= VAR_n8_MUX_uxn_opcodes_h_l741_c7_d414_cond;
     n8_MUX_uxn_opcodes_h_l741_c7_d414_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l741_c7_d414_iftrue;
     n8_MUX_uxn_opcodes_h_l741_c7_d414_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l741_c7_d414_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l741_c7_d414_return_output := n8_MUX_uxn_opcodes_h_l741_c7_d414_return_output;

     -- t16_MUX[uxn_opcodes_h_l737_c7_c3a9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l737_c7_c3a9_cond <= VAR_t16_MUX_uxn_opcodes_h_l737_c7_c3a9_cond;
     t16_MUX_uxn_opcodes_h_l737_c7_c3a9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l737_c7_c3a9_iftrue;
     t16_MUX_uxn_opcodes_h_l737_c7_c3a9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l737_c7_c3a9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output := t16_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l737_c7_c3a9_iffalse := VAR_n8_MUX_uxn_opcodes_h_l741_c7_d414_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_d414_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_96f6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_d414_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_96f6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_d414_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_96f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_c3a9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_d414_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_1187_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l741_c7_d414_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l744_c7_96f6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l734_c7_1187_iffalse := VAR_t16_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l741_c7_d414] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_d414_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_d414_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_d414_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_d414_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_d414_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_d414_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_d414_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_d414_return_output;

     -- n8_MUX[uxn_opcodes_h_l737_c7_c3a9] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l737_c7_c3a9_cond <= VAR_n8_MUX_uxn_opcodes_h_l737_c7_c3a9_cond;
     n8_MUX_uxn_opcodes_h_l737_c7_c3a9_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l737_c7_c3a9_iftrue;
     n8_MUX_uxn_opcodes_h_l737_c7_c3a9_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l737_c7_c3a9_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output := n8_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output;

     -- t16_MUX[uxn_opcodes_h_l734_c7_1187] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l734_c7_1187_cond <= VAR_t16_MUX_uxn_opcodes_h_l734_c7_1187_cond;
     t16_MUX_uxn_opcodes_h_l734_c7_1187_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l734_c7_1187_iftrue;
     t16_MUX_uxn_opcodes_h_l734_c7_1187_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l734_c7_1187_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l734_c7_1187_return_output := t16_MUX_uxn_opcodes_h_l734_c7_1187_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l741_c7_d414] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_d414_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_d414_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_d414_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_d414_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_d414_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_d414_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_d414_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_d414_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l741_c7_d414] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l741_c7_d414_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l741_c7_d414_cond;
     result_u16_value_MUX_uxn_opcodes_h_l741_c7_d414_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l741_c7_d414_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l741_c7_d414_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l741_c7_d414_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l741_c7_d414_return_output := result_u16_value_MUX_uxn_opcodes_h_l741_c7_d414_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l741_c7_d414] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_d414_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_d414_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_d414_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_d414_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_d414_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_d414_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_d414_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_d414_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l737_c7_c3a9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_c3a9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_c3a9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_c3a9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_c3a9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_c3a9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_c3a9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l734_c7_1187] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_1187_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_1187_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_1187_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_1187_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_1187_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_1187_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_1187_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_1187_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l734_c7_1187_iffalse := VAR_n8_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_c3a9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_d414_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_c3a9_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_d414_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_c3a9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_d414_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_1187_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_b118_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_1187_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l737_c7_c3a9_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l741_c7_d414_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l729_c7_b118_iffalse := VAR_t16_MUX_uxn_opcodes_h_l734_c7_1187_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l734_c7_1187] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_1187_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_1187_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_1187_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_1187_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_1187_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_1187_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_1187_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_1187_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l729_c7_b118] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_b118_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_b118_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_b118_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_b118_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_b118_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_b118_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_b118_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_b118_return_output;

     -- n8_MUX[uxn_opcodes_h_l734_c7_1187] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l734_c7_1187_cond <= VAR_n8_MUX_uxn_opcodes_h_l734_c7_1187_cond;
     n8_MUX_uxn_opcodes_h_l734_c7_1187_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l734_c7_1187_iftrue;
     n8_MUX_uxn_opcodes_h_l734_c7_1187_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l734_c7_1187_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l734_c7_1187_return_output := n8_MUX_uxn_opcodes_h_l734_c7_1187_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l737_c7_c3a9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_c3a9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_c3a9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_c3a9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_c3a9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_c3a9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_c3a9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l737_c7_c3a9] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l737_c7_c3a9_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l737_c7_c3a9_cond;
     result_u16_value_MUX_uxn_opcodes_h_l737_c7_c3a9_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l737_c7_c3a9_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l737_c7_c3a9_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l737_c7_c3a9_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output := result_u16_value_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output;

     -- t16_MUX[uxn_opcodes_h_l729_c7_b118] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l729_c7_b118_cond <= VAR_t16_MUX_uxn_opcodes_h_l729_c7_b118_cond;
     t16_MUX_uxn_opcodes_h_l729_c7_b118_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l729_c7_b118_iftrue;
     t16_MUX_uxn_opcodes_h_l729_c7_b118_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l729_c7_b118_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l729_c7_b118_return_output := t16_MUX_uxn_opcodes_h_l729_c7_b118_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l737_c7_c3a9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_c3a9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_c3a9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_c3a9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_c3a9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_c3a9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_c3a9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l737_c7_c3a9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_c3a9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_c3a9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_c3a9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_c3a9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_c3a9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_c3a9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l729_c7_b118_iffalse := VAR_n8_MUX_uxn_opcodes_h_l734_c7_1187_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_1187_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_1187_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_1187_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_b118_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_1187_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_fc93_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_b118_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_1187_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l737_c7_c3a9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l726_c7_fc93_iffalse := VAR_t16_MUX_uxn_opcodes_h_l729_c7_b118_return_output;
     -- t16_MUX[uxn_opcodes_h_l726_c7_fc93] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l726_c7_fc93_cond <= VAR_t16_MUX_uxn_opcodes_h_l726_c7_fc93_cond;
     t16_MUX_uxn_opcodes_h_l726_c7_fc93_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l726_c7_fc93_iftrue;
     t16_MUX_uxn_opcodes_h_l726_c7_fc93_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l726_c7_fc93_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l726_c7_fc93_return_output := t16_MUX_uxn_opcodes_h_l726_c7_fc93_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l729_c7_b118] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_b118_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_b118_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_b118_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_b118_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_b118_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_b118_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_b118_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_b118_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l734_c7_1187] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_1187_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_1187_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_1187_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_1187_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_1187_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_1187_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_1187_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_1187_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l726_c7_fc93] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_fc93_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_fc93_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_fc93_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_fc93_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_fc93_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_fc93_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_fc93_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_fc93_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l734_c7_1187] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_1187_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_1187_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_1187_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_1187_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_1187_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_1187_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_1187_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_1187_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l734_c7_1187] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l734_c7_1187_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_1187_cond;
     result_u16_value_MUX_uxn_opcodes_h_l734_c7_1187_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_1187_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l734_c7_1187_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_1187_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_1187_return_output := result_u16_value_MUX_uxn_opcodes_h_l734_c7_1187_return_output;

     -- n8_MUX[uxn_opcodes_h_l729_c7_b118] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l729_c7_b118_cond <= VAR_n8_MUX_uxn_opcodes_h_l729_c7_b118_cond;
     n8_MUX_uxn_opcodes_h_l729_c7_b118_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l729_c7_b118_iftrue;
     n8_MUX_uxn_opcodes_h_l729_c7_b118_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l729_c7_b118_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l729_c7_b118_return_output := n8_MUX_uxn_opcodes_h_l729_c7_b118_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l734_c7_1187] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_1187_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_1187_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_1187_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_1187_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_1187_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_1187_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_1187_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_1187_return_output;

     -- Submodule level 6
     VAR_n8_MUX_uxn_opcodes_h_l726_c7_fc93_iffalse := VAR_n8_MUX_uxn_opcodes_h_l729_c7_b118_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_b118_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_1187_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_b118_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_1187_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_b118_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_1187_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_fc93_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_b118_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c2_2bbb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_fc93_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l729_c7_b118_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_1187_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l721_c2_2bbb_iffalse := VAR_t16_MUX_uxn_opcodes_h_l726_c7_fc93_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l729_c7_b118] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l729_c7_b118_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l729_c7_b118_cond;
     result_u16_value_MUX_uxn_opcodes_h_l729_c7_b118_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l729_c7_b118_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l729_c7_b118_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l729_c7_b118_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l729_c7_b118_return_output := result_u16_value_MUX_uxn_opcodes_h_l729_c7_b118_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l729_c7_b118] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_b118_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_b118_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_b118_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_b118_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_b118_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_b118_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_b118_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_b118_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l729_c7_b118] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_b118_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_b118_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_b118_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_b118_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_b118_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_b118_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_b118_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_b118_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l729_c7_b118] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_b118_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_b118_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_b118_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_b118_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_b118_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_b118_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_b118_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_b118_return_output;

     -- t16_MUX[uxn_opcodes_h_l721_c2_2bbb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l721_c2_2bbb_cond <= VAR_t16_MUX_uxn_opcodes_h_l721_c2_2bbb_cond;
     t16_MUX_uxn_opcodes_h_l721_c2_2bbb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l721_c2_2bbb_iftrue;
     t16_MUX_uxn_opcodes_h_l721_c2_2bbb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l721_c2_2bbb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output := t16_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output;

     -- n8_MUX[uxn_opcodes_h_l726_c7_fc93] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l726_c7_fc93_cond <= VAR_n8_MUX_uxn_opcodes_h_l726_c7_fc93_cond;
     n8_MUX_uxn_opcodes_h_l726_c7_fc93_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l726_c7_fc93_iftrue;
     n8_MUX_uxn_opcodes_h_l726_c7_fc93_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l726_c7_fc93_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l726_c7_fc93_return_output := n8_MUX_uxn_opcodes_h_l726_c7_fc93_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l721_c2_2bbb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c2_2bbb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c2_2bbb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c2_2bbb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c2_2bbb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c2_2bbb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c2_2bbb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l726_c7_fc93] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_fc93_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_fc93_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_fc93_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_fc93_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_fc93_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_fc93_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_fc93_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_fc93_return_output;

     -- Submodule level 7
     VAR_n8_MUX_uxn_opcodes_h_l721_c2_2bbb_iffalse := VAR_n8_MUX_uxn_opcodes_h_l726_c7_fc93_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_fc93_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_b118_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_fc93_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_b118_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_fc93_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_b118_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c2_2bbb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_fc93_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_fc93_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l729_c7_b118_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output;
     -- n8_MUX[uxn_opcodes_h_l721_c2_2bbb] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l721_c2_2bbb_cond <= VAR_n8_MUX_uxn_opcodes_h_l721_c2_2bbb_cond;
     n8_MUX_uxn_opcodes_h_l721_c2_2bbb_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l721_c2_2bbb_iftrue;
     n8_MUX_uxn_opcodes_h_l721_c2_2bbb_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l721_c2_2bbb_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output := n8_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l721_c2_2bbb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c2_2bbb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c2_2bbb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c2_2bbb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c2_2bbb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c2_2bbb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c2_2bbb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l726_c7_fc93] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_fc93_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_fc93_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_fc93_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_fc93_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_fc93_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_fc93_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_fc93_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_fc93_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l726_c7_fc93] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_fc93_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_fc93_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_fc93_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_fc93_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_fc93_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_fc93_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_fc93_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_fc93_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l726_c7_fc93] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l726_c7_fc93_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_fc93_cond;
     result_u16_value_MUX_uxn_opcodes_h_l726_c7_fc93_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_fc93_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l726_c7_fc93_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_fc93_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_fc93_return_output := result_u16_value_MUX_uxn_opcodes_h_l726_c7_fc93_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l726_c7_fc93] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_fc93_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_fc93_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_fc93_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_fc93_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_fc93_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_fc93_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_fc93_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_fc93_return_output;

     -- Submodule level 8
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l721_c2_2bbb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_fc93_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l721_c2_2bbb_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_fc93_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l721_c2_2bbb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_fc93_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l721_c2_2bbb_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_fc93_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l721_c2_2bbb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l721_c2_2bbb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l721_c2_2bbb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l721_c2_2bbb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l721_c2_2bbb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l721_c2_2bbb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l721_c2_2bbb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l721_c2_2bbb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l721_c2_2bbb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l721_c2_2bbb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l721_c2_2bbb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l721_c2_2bbb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l721_c2_2bbb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l721_c2_2bbb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l721_c2_2bbb] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l721_c2_2bbb_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l721_c2_2bbb_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l721_c2_2bbb_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l721_c2_2bbb_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l721_c2_2bbb_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l721_c2_2bbb_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l721_c2_2bbb] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l721_c2_2bbb_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l721_c2_2bbb_cond;
     result_u16_value_MUX_uxn_opcodes_h_l721_c2_2bbb_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l721_c2_2bbb_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l721_c2_2bbb_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l721_c2_2bbb_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output := result_u16_value_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_43dc_uxn_opcodes_h_l716_l757_DUPLICATE_4cd4 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_43dc_uxn_opcodes_h_l716_l757_DUPLICATE_4cd4_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_43dc(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l721_c2_2bbb_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_43dc_uxn_opcodes_h_l716_l757_DUPLICATE_4cd4_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_43dc_uxn_opcodes_h_l716_l757_DUPLICATE_4cd4_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
