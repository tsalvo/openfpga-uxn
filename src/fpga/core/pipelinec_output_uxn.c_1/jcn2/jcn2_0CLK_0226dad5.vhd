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
-- Submodules: 57
entity jcn2_0CLK_0226dad5 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jcn2_0CLK_0226dad5;
architecture arch of jcn2_0CLK_0226dad5 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l676_c6_4070]
signal BIN_OP_EQ_uxn_opcodes_h_l676_c6_4070_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l676_c6_4070_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l676_c6_4070_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l676_c1_c97d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_c97d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_c97d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_c97d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_c97d_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l676_c2_47be]
signal n8_MUX_uxn_opcodes_h_l676_c2_47be_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l676_c2_47be_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l676_c2_47be_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l676_c2_47be_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l676_c2_47be]
signal result_u16_value_MUX_uxn_opcodes_h_l676_c2_47be_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l676_c2_47be_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l676_c2_47be_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l676_c2_47be_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l676_c2_47be]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_47be_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_47be_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_47be_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_47be_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l676_c2_47be]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_47be_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_47be_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_47be_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_47be_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l676_c2_47be]
signal result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_47be_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_47be_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_47be_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_47be_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l676_c2_47be]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_47be_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_47be_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_47be_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_47be_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l676_c2_47be]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_47be_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_47be_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_47be_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_47be_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l676_c2_47be]
signal t16_MUX_uxn_opcodes_h_l676_c2_47be_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l676_c2_47be_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l676_c2_47be_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l676_c2_47be_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l677_c3_c182[uxn_opcodes_h_l677_c3_c182]
signal printf_uxn_opcodes_h_l677_c3_c182_uxn_opcodes_h_l677_c3_c182_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l681_c11_8b5f]
signal BIN_OP_EQ_uxn_opcodes_h_l681_c11_8b5f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l681_c11_8b5f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l681_c11_8b5f_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l681_c7_9885]
signal n8_MUX_uxn_opcodes_h_l681_c7_9885_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l681_c7_9885_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l681_c7_9885_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l681_c7_9885_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l681_c7_9885]
signal result_u16_value_MUX_uxn_opcodes_h_l681_c7_9885_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l681_c7_9885_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l681_c7_9885_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l681_c7_9885_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l681_c7_9885]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_9885_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_9885_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_9885_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_9885_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l681_c7_9885]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_9885_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_9885_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_9885_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_9885_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l681_c7_9885]
signal result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_9885_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_9885_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_9885_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_9885_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l681_c7_9885]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_9885_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_9885_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_9885_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_9885_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l681_c7_9885]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_9885_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_9885_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_9885_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_9885_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l681_c7_9885]
signal t16_MUX_uxn_opcodes_h_l681_c7_9885_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l681_c7_9885_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l681_c7_9885_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l681_c7_9885_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l684_c11_6314]
signal BIN_OP_EQ_uxn_opcodes_h_l684_c11_6314_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l684_c11_6314_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l684_c11_6314_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l684_c7_edfc]
signal n8_MUX_uxn_opcodes_h_l684_c7_edfc_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l684_c7_edfc_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l684_c7_edfc_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l684_c7_edfc_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l684_c7_edfc]
signal result_u16_value_MUX_uxn_opcodes_h_l684_c7_edfc_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l684_c7_edfc_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l684_c7_edfc_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l684_c7_edfc_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l684_c7_edfc]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_edfc_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_edfc_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_edfc_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_edfc_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l684_c7_edfc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_edfc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_edfc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_edfc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_edfc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l684_c7_edfc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_edfc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_edfc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_edfc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_edfc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l684_c7_edfc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_edfc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_edfc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_edfc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_edfc_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l684_c7_edfc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_edfc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_edfc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_edfc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_edfc_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l684_c7_edfc]
signal t16_MUX_uxn_opcodes_h_l684_c7_edfc_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l684_c7_edfc_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l684_c7_edfc_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l684_c7_edfc_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l686_c3_9cf0]
signal CONST_SL_8_uxn_opcodes_h_l686_c3_9cf0_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l686_c3_9cf0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l689_c11_b432]
signal BIN_OP_EQ_uxn_opcodes_h_l689_c11_b432_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l689_c11_b432_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l689_c11_b432_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l689_c7_3ad2]
signal n8_MUX_uxn_opcodes_h_l689_c7_3ad2_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l689_c7_3ad2_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l689_c7_3ad2_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l689_c7_3ad2_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l689_c7_3ad2]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_3ad2_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_3ad2_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_3ad2_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_3ad2_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l689_c7_3ad2]
signal result_u16_value_MUX_uxn_opcodes_h_l689_c7_3ad2_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l689_c7_3ad2_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l689_c7_3ad2_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l689_c7_3ad2_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l689_c7_3ad2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_3ad2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_3ad2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_3ad2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_3ad2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l689_c7_3ad2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_3ad2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_3ad2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_3ad2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_3ad2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l689_c7_3ad2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_3ad2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_3ad2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_3ad2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_3ad2_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l689_c7_3ad2]
signal t16_MUX_uxn_opcodes_h_l689_c7_3ad2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l689_c7_3ad2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l689_c7_3ad2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l689_c7_3ad2_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l690_c3_fc26]
signal BIN_OP_OR_uxn_opcodes_h_l690_c3_fc26_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l690_c3_fc26_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l690_c3_fc26_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l692_c11_d4dd]
signal BIN_OP_EQ_uxn_opcodes_h_l692_c11_d4dd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l692_c11_d4dd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l692_c11_d4dd_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l692_c7_964d]
signal n8_MUX_uxn_opcodes_h_l692_c7_964d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l692_c7_964d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l692_c7_964d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l692_c7_964d_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l692_c7_964d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_964d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_964d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_964d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_964d_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l692_c7_964d]
signal result_u16_value_MUX_uxn_opcodes_h_l692_c7_964d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l692_c7_964d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l692_c7_964d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l692_c7_964d_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l692_c7_964d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_964d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_964d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_964d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_964d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l692_c7_964d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_964d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_964d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_964d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_964d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l692_c7_964d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_964d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_964d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_964d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_964d_return_output : signed(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l695_c30_d17e]
signal sp_relative_shift_uxn_opcodes_h_l695_c30_d17e_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l695_c30_d17e_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l695_c30_d17e_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l695_c30_d17e_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l696_c26_306c]
signal BIN_OP_EQ_uxn_opcodes_h_l696_c26_306c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l696_c26_306c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l696_c26_306c_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l696_c26_0b47]
signal MUX_uxn_opcodes_h_l696_c26_0b47_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l696_c26_0b47_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l696_c26_0b47_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l696_c26_0b47_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l697_c22_992d]
signal BIN_OP_EQ_uxn_opcodes_h_l697_c22_992d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l697_c22_992d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l697_c22_992d_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l697_c22_f35c]
signal MUX_uxn_opcodes_h_l697_c22_f35c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l697_c22_f35c_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l697_c22_f35c_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l697_c22_f35c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l699_c11_8750]
signal BIN_OP_EQ_uxn_opcodes_h_l699_c11_8750_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l699_c11_8750_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l699_c11_8750_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l699_c7_1b21]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_1b21_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_1b21_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_1b21_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_1b21_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l699_c7_1b21]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_1b21_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_1b21_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_1b21_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_1b21_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l699_c7_1b21]
signal result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_1b21_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_1b21_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_1b21_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_1b21_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_660c( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u16_value := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l676_c6_4070
BIN_OP_EQ_uxn_opcodes_h_l676_c6_4070 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l676_c6_4070_left,
BIN_OP_EQ_uxn_opcodes_h_l676_c6_4070_right,
BIN_OP_EQ_uxn_opcodes_h_l676_c6_4070_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_c97d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_c97d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_c97d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_c97d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_c97d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_c97d_return_output);

-- n8_MUX_uxn_opcodes_h_l676_c2_47be
n8_MUX_uxn_opcodes_h_l676_c2_47be : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l676_c2_47be_cond,
n8_MUX_uxn_opcodes_h_l676_c2_47be_iftrue,
n8_MUX_uxn_opcodes_h_l676_c2_47be_iffalse,
n8_MUX_uxn_opcodes_h_l676_c2_47be_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l676_c2_47be
result_u16_value_MUX_uxn_opcodes_h_l676_c2_47be : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l676_c2_47be_cond,
result_u16_value_MUX_uxn_opcodes_h_l676_c2_47be_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l676_c2_47be_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l676_c2_47be_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_47be
result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_47be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_47be_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_47be_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_47be_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_47be_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_47be
result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_47be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_47be_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_47be_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_47be_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_47be_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_47be
result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_47be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_47be_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_47be_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_47be_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_47be_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_47be
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_47be : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_47be_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_47be_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_47be_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_47be_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_47be
result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_47be : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_47be_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_47be_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_47be_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_47be_return_output);

-- t16_MUX_uxn_opcodes_h_l676_c2_47be
t16_MUX_uxn_opcodes_h_l676_c2_47be : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l676_c2_47be_cond,
t16_MUX_uxn_opcodes_h_l676_c2_47be_iftrue,
t16_MUX_uxn_opcodes_h_l676_c2_47be_iffalse,
t16_MUX_uxn_opcodes_h_l676_c2_47be_return_output);

-- printf_uxn_opcodes_h_l677_c3_c182_uxn_opcodes_h_l677_c3_c182
printf_uxn_opcodes_h_l677_c3_c182_uxn_opcodes_h_l677_c3_c182 : entity work.printf_uxn_opcodes_h_l677_c3_c182_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l677_c3_c182_uxn_opcodes_h_l677_c3_c182_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l681_c11_8b5f
BIN_OP_EQ_uxn_opcodes_h_l681_c11_8b5f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l681_c11_8b5f_left,
BIN_OP_EQ_uxn_opcodes_h_l681_c11_8b5f_right,
BIN_OP_EQ_uxn_opcodes_h_l681_c11_8b5f_return_output);

-- n8_MUX_uxn_opcodes_h_l681_c7_9885
n8_MUX_uxn_opcodes_h_l681_c7_9885 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l681_c7_9885_cond,
n8_MUX_uxn_opcodes_h_l681_c7_9885_iftrue,
n8_MUX_uxn_opcodes_h_l681_c7_9885_iffalse,
n8_MUX_uxn_opcodes_h_l681_c7_9885_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l681_c7_9885
result_u16_value_MUX_uxn_opcodes_h_l681_c7_9885 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l681_c7_9885_cond,
result_u16_value_MUX_uxn_opcodes_h_l681_c7_9885_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l681_c7_9885_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l681_c7_9885_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_9885
result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_9885 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_9885_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_9885_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_9885_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_9885_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_9885
result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_9885 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_9885_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_9885_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_9885_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_9885_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_9885
result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_9885 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_9885_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_9885_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_9885_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_9885_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_9885
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_9885 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_9885_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_9885_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_9885_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_9885_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_9885
result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_9885 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_9885_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_9885_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_9885_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_9885_return_output);

-- t16_MUX_uxn_opcodes_h_l681_c7_9885
t16_MUX_uxn_opcodes_h_l681_c7_9885 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l681_c7_9885_cond,
t16_MUX_uxn_opcodes_h_l681_c7_9885_iftrue,
t16_MUX_uxn_opcodes_h_l681_c7_9885_iffalse,
t16_MUX_uxn_opcodes_h_l681_c7_9885_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l684_c11_6314
BIN_OP_EQ_uxn_opcodes_h_l684_c11_6314 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l684_c11_6314_left,
BIN_OP_EQ_uxn_opcodes_h_l684_c11_6314_right,
BIN_OP_EQ_uxn_opcodes_h_l684_c11_6314_return_output);

-- n8_MUX_uxn_opcodes_h_l684_c7_edfc
n8_MUX_uxn_opcodes_h_l684_c7_edfc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l684_c7_edfc_cond,
n8_MUX_uxn_opcodes_h_l684_c7_edfc_iftrue,
n8_MUX_uxn_opcodes_h_l684_c7_edfc_iffalse,
n8_MUX_uxn_opcodes_h_l684_c7_edfc_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l684_c7_edfc
result_u16_value_MUX_uxn_opcodes_h_l684_c7_edfc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l684_c7_edfc_cond,
result_u16_value_MUX_uxn_opcodes_h_l684_c7_edfc_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l684_c7_edfc_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l684_c7_edfc_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_edfc
result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_edfc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_edfc_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_edfc_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_edfc_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_edfc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_edfc
result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_edfc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_edfc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_edfc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_edfc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_edfc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_edfc
result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_edfc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_edfc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_edfc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_edfc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_edfc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_edfc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_edfc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_edfc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_edfc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_edfc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_edfc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_edfc
result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_edfc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_edfc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_edfc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_edfc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_edfc_return_output);

-- t16_MUX_uxn_opcodes_h_l684_c7_edfc
t16_MUX_uxn_opcodes_h_l684_c7_edfc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l684_c7_edfc_cond,
t16_MUX_uxn_opcodes_h_l684_c7_edfc_iftrue,
t16_MUX_uxn_opcodes_h_l684_c7_edfc_iffalse,
t16_MUX_uxn_opcodes_h_l684_c7_edfc_return_output);

-- CONST_SL_8_uxn_opcodes_h_l686_c3_9cf0
CONST_SL_8_uxn_opcodes_h_l686_c3_9cf0 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l686_c3_9cf0_x,
CONST_SL_8_uxn_opcodes_h_l686_c3_9cf0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l689_c11_b432
BIN_OP_EQ_uxn_opcodes_h_l689_c11_b432 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l689_c11_b432_left,
BIN_OP_EQ_uxn_opcodes_h_l689_c11_b432_right,
BIN_OP_EQ_uxn_opcodes_h_l689_c11_b432_return_output);

-- n8_MUX_uxn_opcodes_h_l689_c7_3ad2
n8_MUX_uxn_opcodes_h_l689_c7_3ad2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l689_c7_3ad2_cond,
n8_MUX_uxn_opcodes_h_l689_c7_3ad2_iftrue,
n8_MUX_uxn_opcodes_h_l689_c7_3ad2_iffalse,
n8_MUX_uxn_opcodes_h_l689_c7_3ad2_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_3ad2
result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_3ad2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_3ad2_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_3ad2_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_3ad2_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_3ad2_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l689_c7_3ad2
result_u16_value_MUX_uxn_opcodes_h_l689_c7_3ad2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l689_c7_3ad2_cond,
result_u16_value_MUX_uxn_opcodes_h_l689_c7_3ad2_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l689_c7_3ad2_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l689_c7_3ad2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_3ad2
result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_3ad2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_3ad2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_3ad2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_3ad2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_3ad2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_3ad2
result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_3ad2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_3ad2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_3ad2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_3ad2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_3ad2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_3ad2
result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_3ad2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_3ad2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_3ad2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_3ad2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_3ad2_return_output);

-- t16_MUX_uxn_opcodes_h_l689_c7_3ad2
t16_MUX_uxn_opcodes_h_l689_c7_3ad2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l689_c7_3ad2_cond,
t16_MUX_uxn_opcodes_h_l689_c7_3ad2_iftrue,
t16_MUX_uxn_opcodes_h_l689_c7_3ad2_iffalse,
t16_MUX_uxn_opcodes_h_l689_c7_3ad2_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l690_c3_fc26
BIN_OP_OR_uxn_opcodes_h_l690_c3_fc26 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l690_c3_fc26_left,
BIN_OP_OR_uxn_opcodes_h_l690_c3_fc26_right,
BIN_OP_OR_uxn_opcodes_h_l690_c3_fc26_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l692_c11_d4dd
BIN_OP_EQ_uxn_opcodes_h_l692_c11_d4dd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l692_c11_d4dd_left,
BIN_OP_EQ_uxn_opcodes_h_l692_c11_d4dd_right,
BIN_OP_EQ_uxn_opcodes_h_l692_c11_d4dd_return_output);

-- n8_MUX_uxn_opcodes_h_l692_c7_964d
n8_MUX_uxn_opcodes_h_l692_c7_964d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l692_c7_964d_cond,
n8_MUX_uxn_opcodes_h_l692_c7_964d_iftrue,
n8_MUX_uxn_opcodes_h_l692_c7_964d_iffalse,
n8_MUX_uxn_opcodes_h_l692_c7_964d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_964d
result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_964d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_964d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_964d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_964d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_964d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l692_c7_964d
result_u16_value_MUX_uxn_opcodes_h_l692_c7_964d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l692_c7_964d_cond,
result_u16_value_MUX_uxn_opcodes_h_l692_c7_964d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l692_c7_964d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l692_c7_964d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_964d
result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_964d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_964d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_964d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_964d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_964d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_964d
result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_964d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_964d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_964d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_964d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_964d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_964d
result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_964d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_964d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_964d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_964d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_964d_return_output);

-- sp_relative_shift_uxn_opcodes_h_l695_c30_d17e
sp_relative_shift_uxn_opcodes_h_l695_c30_d17e : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l695_c30_d17e_ins,
sp_relative_shift_uxn_opcodes_h_l695_c30_d17e_x,
sp_relative_shift_uxn_opcodes_h_l695_c30_d17e_y,
sp_relative_shift_uxn_opcodes_h_l695_c30_d17e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l696_c26_306c
BIN_OP_EQ_uxn_opcodes_h_l696_c26_306c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l696_c26_306c_left,
BIN_OP_EQ_uxn_opcodes_h_l696_c26_306c_right,
BIN_OP_EQ_uxn_opcodes_h_l696_c26_306c_return_output);

-- MUX_uxn_opcodes_h_l696_c26_0b47
MUX_uxn_opcodes_h_l696_c26_0b47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l696_c26_0b47_cond,
MUX_uxn_opcodes_h_l696_c26_0b47_iftrue,
MUX_uxn_opcodes_h_l696_c26_0b47_iffalse,
MUX_uxn_opcodes_h_l696_c26_0b47_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l697_c22_992d
BIN_OP_EQ_uxn_opcodes_h_l697_c22_992d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l697_c22_992d_left,
BIN_OP_EQ_uxn_opcodes_h_l697_c22_992d_right,
BIN_OP_EQ_uxn_opcodes_h_l697_c22_992d_return_output);

-- MUX_uxn_opcodes_h_l697_c22_f35c
MUX_uxn_opcodes_h_l697_c22_f35c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l697_c22_f35c_cond,
MUX_uxn_opcodes_h_l697_c22_f35c_iftrue,
MUX_uxn_opcodes_h_l697_c22_f35c_iffalse,
MUX_uxn_opcodes_h_l697_c22_f35c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l699_c11_8750
BIN_OP_EQ_uxn_opcodes_h_l699_c11_8750 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l699_c11_8750_left,
BIN_OP_EQ_uxn_opcodes_h_l699_c11_8750_right,
BIN_OP_EQ_uxn_opcodes_h_l699_c11_8750_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_1b21
result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_1b21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_1b21_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_1b21_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_1b21_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_1b21_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_1b21
result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_1b21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_1b21_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_1b21_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_1b21_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_1b21_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_1b21
result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_1b21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_1b21_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_1b21_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_1b21_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_1b21_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l676_c6_4070_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_c97d_return_output,
 n8_MUX_uxn_opcodes_h_l676_c2_47be_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l676_c2_47be_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_47be_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_47be_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_47be_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_47be_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_47be_return_output,
 t16_MUX_uxn_opcodes_h_l676_c2_47be_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l681_c11_8b5f_return_output,
 n8_MUX_uxn_opcodes_h_l681_c7_9885_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l681_c7_9885_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_9885_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_9885_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_9885_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_9885_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_9885_return_output,
 t16_MUX_uxn_opcodes_h_l681_c7_9885_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l684_c11_6314_return_output,
 n8_MUX_uxn_opcodes_h_l684_c7_edfc_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l684_c7_edfc_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_edfc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_edfc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_edfc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_edfc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_edfc_return_output,
 t16_MUX_uxn_opcodes_h_l684_c7_edfc_return_output,
 CONST_SL_8_uxn_opcodes_h_l686_c3_9cf0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l689_c11_b432_return_output,
 n8_MUX_uxn_opcodes_h_l689_c7_3ad2_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_3ad2_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l689_c7_3ad2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_3ad2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_3ad2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_3ad2_return_output,
 t16_MUX_uxn_opcodes_h_l689_c7_3ad2_return_output,
 BIN_OP_OR_uxn_opcodes_h_l690_c3_fc26_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l692_c11_d4dd_return_output,
 n8_MUX_uxn_opcodes_h_l692_c7_964d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_964d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l692_c7_964d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_964d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_964d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_964d_return_output,
 sp_relative_shift_uxn_opcodes_h_l695_c30_d17e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l696_c26_306c_return_output,
 MUX_uxn_opcodes_h_l696_c26_0b47_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l697_c22_992d_return_output,
 MUX_uxn_opcodes_h_l697_c22_f35c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l699_c11_8750_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_1b21_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_1b21_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_1b21_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_4070_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_4070_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_4070_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_c97d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_c97d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_c97d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_c97d_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l676_c2_47be_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l676_c2_47be_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l681_c7_9885_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l676_c2_47be_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l676_c2_47be_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c2_47be_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c2_47be_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l681_c7_9885_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c2_47be_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c2_47be_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_47be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_47be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_9885_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_47be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_47be_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_47be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_47be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_9885_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_47be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_47be_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_47be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_47be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_9885_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_47be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_47be_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_47be_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l678_c3_9c4d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_47be_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_9885_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_47be_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_47be_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_47be_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_47be_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_9885_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_47be_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_47be_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l676_c2_47be_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l676_c2_47be_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l681_c7_9885_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l676_c2_47be_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l676_c2_47be_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l677_c3_c182_uxn_opcodes_h_l677_c3_c182_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_8b5f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_8b5f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_8b5f_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l681_c7_9885_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l681_c7_9885_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l684_c7_edfc_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l681_c7_9885_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l681_c7_9885_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l681_c7_9885_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l684_c7_edfc_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l681_c7_9885_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_9885_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_9885_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_edfc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_9885_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_9885_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_9885_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_edfc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_9885_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_9885_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_9885_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_edfc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_9885_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_9885_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l682_c3_e87d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_9885_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_edfc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_9885_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_9885_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_9885_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_edfc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_9885_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l681_c7_9885_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l681_c7_9885_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l684_c7_edfc_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l681_c7_9885_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_6314_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_6314_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_6314_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l684_c7_edfc_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l684_c7_edfc_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l689_c7_3ad2_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l684_c7_edfc_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l684_c7_edfc_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l684_c7_edfc_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l689_c7_3ad2_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l684_c7_edfc_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_edfc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_edfc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_3ad2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_edfc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_edfc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_edfc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_3ad2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_edfc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_edfc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_edfc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_3ad2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_edfc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_edfc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l687_c3_b7a5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_edfc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l684_c7_edfc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_edfc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_edfc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_edfc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_3ad2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_edfc_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l684_c7_edfc_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l684_c7_edfc_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l689_c7_3ad2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l684_c7_edfc_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l686_c3_9cf0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l686_c3_9cf0_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_b432_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_b432_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_b432_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l689_c7_3ad2_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l689_c7_3ad2_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l692_c7_964d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l689_c7_3ad2_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_3ad2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_3ad2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_964d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_3ad2_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l689_c7_3ad2_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l689_c7_3ad2_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l692_c7_964d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l689_c7_3ad2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_3ad2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_3ad2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_964d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_3ad2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_3ad2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_3ad2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_964d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_3ad2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_3ad2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_3ad2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_964d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_3ad2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l689_c7_3ad2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l689_c7_3ad2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l689_c7_3ad2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l690_c3_fc26_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l690_c3_fc26_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l690_c3_fc26_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_d4dd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_d4dd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_d4dd_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l692_c7_964d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l692_c7_964d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l692_c7_964d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_964d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_964d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_1b21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_964d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l692_c7_964d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l692_c7_964d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l692_c7_964d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_964d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_964d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_1b21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_964d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_964d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_964d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_1b21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_964d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_964d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_964d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_964d_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l695_c30_d17e_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l695_c30_d17e_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l695_c30_d17e_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l695_c30_d17e_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l696_c26_0b47_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l696_c26_0b47_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l696_c26_0b47_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c26_306c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c26_306c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c26_306c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l696_c26_0b47_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l697_c22_f35c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l697_c22_f35c_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l697_c22_f35c_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c22_992d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c22_992d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c22_992d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l697_c22_f35c_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_8750_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_8750_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_8750_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_1b21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_1b21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_1b21_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_1b21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_1b21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_1b21_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_1b21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_1b21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_1b21_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l676_l681_l692_l689_l684_DUPLICATE_0817_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l676_l681_l699_l689_l684_DUPLICATE_6c55_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l676_l681_l699_l689_l684_DUPLICATE_48a2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l676_l681_l692_l689_l684_DUPLICATE_818b_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l681_l692_l699_l689_l684_DUPLICATE_2fa6_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l685_l690_DUPLICATE_8ead_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_660c_uxn_opcodes_h_l705_l671_DUPLICATE_5a26_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c22_992d_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_964d_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l695_c30_d17e_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_d4dd_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l696_c26_0b47_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_4070_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_b432_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c26_306c_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_1b21_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l696_c26_0b47_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_47be_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l678_c3_9c4d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_47be_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l678_c3_9c4d;
     VAR_sp_relative_shift_uxn_opcodes_h_l695_c30_d17e_y := resize(to_signed(-3, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l682_c3_e87d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_9885_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l682_c3_e87d;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_1b21_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_8b5f_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_8750_right := to_unsigned(5, 3);
     VAR_MUX_uxn_opcodes_h_l697_c22_f35c_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l687_c3_b7a5 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_edfc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l687_c3_b7a5;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_1b21_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_c97d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_6314_right := to_unsigned(2, 2);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_c97d_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l695_c30_d17e_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l676_c2_47be_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l681_c7_9885_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l684_c7_edfc_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l689_c7_3ad2_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l692_c7_964d_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_4070_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_8b5f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_6314_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_b432_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_d4dd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_8750_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c26_306c_left := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c22_992d_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l692_c7_964d_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l690_c3_fc26_left := t16;
     VAR_MUX_uxn_opcodes_h_l697_c22_f35c_iffalse := t16;
     VAR_t16_MUX_uxn_opcodes_h_l676_c2_47be_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l681_c7_9885_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l689_c7_3ad2_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l684_c11_6314] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l684_c11_6314_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_6314_left;
     BIN_OP_EQ_uxn_opcodes_h_l684_c11_6314_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_6314_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_6314_return_output := BIN_OP_EQ_uxn_opcodes_h_l684_c11_6314_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l696_c26_306c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l696_c26_306c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c26_306c_left;
     BIN_OP_EQ_uxn_opcodes_h_l696_c26_306c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c26_306c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c26_306c_return_output := BIN_OP_EQ_uxn_opcodes_h_l696_c26_306c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l699_c11_8750] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l699_c11_8750_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_8750_left;
     BIN_OP_EQ_uxn_opcodes_h_l699_c11_8750_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_8750_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_8750_return_output := BIN_OP_EQ_uxn_opcodes_h_l699_c11_8750_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l676_l681_l692_l689_l684_DUPLICATE_818b LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l676_l681_l692_l689_l684_DUPLICATE_818b_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l676_l681_l699_l689_l684_DUPLICATE_48a2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l676_l681_l699_l689_l684_DUPLICATE_48a2_return_output := result.is_sp_shift;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l684_c7_edfc] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l684_c7_edfc_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l676_l681_l699_l689_l684_DUPLICATE_6c55 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l676_l681_l699_l689_l684_DUPLICATE_6c55_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l676_l681_l692_l689_l684_DUPLICATE_0817 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l676_l681_l692_l689_l684_DUPLICATE_0817_return_output := result.u16_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l685_l690_DUPLICATE_8ead LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l685_l690_DUPLICATE_8ead_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l681_c11_8b5f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l681_c11_8b5f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_8b5f_left;
     BIN_OP_EQ_uxn_opcodes_h_l681_c11_8b5f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_8b5f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_8b5f_return_output := BIN_OP_EQ_uxn_opcodes_h_l681_c11_8b5f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l692_c11_d4dd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l692_c11_d4dd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_d4dd_left;
     BIN_OP_EQ_uxn_opcodes_h_l692_c11_d4dd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_d4dd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_d4dd_return_output := BIN_OP_EQ_uxn_opcodes_h_l692_c11_d4dd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l697_c22_992d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l697_c22_992d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c22_992d_left;
     BIN_OP_EQ_uxn_opcodes_h_l697_c22_992d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c22_992d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c22_992d_return_output := BIN_OP_EQ_uxn_opcodes_h_l697_c22_992d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l681_l692_l699_l689_l684_DUPLICATE_2fa6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l681_l692_l699_l689_l684_DUPLICATE_2fa6_return_output := result.is_opc_done;

     -- sp_relative_shift[uxn_opcodes_h_l695_c30_d17e] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l695_c30_d17e_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l695_c30_d17e_ins;
     sp_relative_shift_uxn_opcodes_h_l695_c30_d17e_x <= VAR_sp_relative_shift_uxn_opcodes_h_l695_c30_d17e_x;
     sp_relative_shift_uxn_opcodes_h_l695_c30_d17e_y <= VAR_sp_relative_shift_uxn_opcodes_h_l695_c30_d17e_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l695_c30_d17e_return_output := sp_relative_shift_uxn_opcodes_h_l695_c30_d17e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l689_c11_b432] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l689_c11_b432_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_b432_left;
     BIN_OP_EQ_uxn_opcodes_h_l689_c11_b432_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_b432_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_b432_return_output := BIN_OP_EQ_uxn_opcodes_h_l689_c11_b432_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l676_c6_4070] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l676_c6_4070_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_4070_left;
     BIN_OP_EQ_uxn_opcodes_h_l676_c6_4070_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_4070_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_4070_return_output := BIN_OP_EQ_uxn_opcodes_h_l676_c6_4070_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_c97d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_4070_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l676_c2_47be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_4070_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_47be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_4070_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_47be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_4070_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_47be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_4070_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_47be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_4070_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_47be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_4070_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c2_47be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_4070_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l676_c2_47be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_4070_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l681_c7_9885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_8b5f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_9885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_8b5f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_9885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_8b5f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_9885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_8b5f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_9885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_8b5f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_9885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_8b5f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l681_c7_9885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_8b5f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l681_c7_9885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_8b5f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l684_c7_edfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_6314_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_edfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_6314_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_edfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_6314_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_edfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_6314_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_edfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_6314_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_edfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_6314_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l684_c7_edfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_6314_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l684_c7_edfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_6314_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l689_c7_3ad2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_b432_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_3ad2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_b432_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_3ad2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_b432_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_3ad2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_b432_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_3ad2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_b432_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l689_c7_3ad2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_b432_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l689_c7_3ad2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_b432_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l692_c7_964d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_d4dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_964d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_d4dd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_964d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_d4dd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_964d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_d4dd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_964d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_d4dd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l692_c7_964d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_d4dd_return_output;
     VAR_MUX_uxn_opcodes_h_l696_c26_0b47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c26_306c_return_output;
     VAR_MUX_uxn_opcodes_h_l697_c22_f35c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c22_992d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_1b21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_8750_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_1b21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_8750_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_1b21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_8750_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l690_c3_fc26_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l685_l690_DUPLICATE_8ead_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l686_c3_9cf0_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l685_l690_DUPLICATE_8ead_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_47be_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l676_l681_l692_l689_l684_DUPLICATE_818b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_9885_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l676_l681_l692_l689_l684_DUPLICATE_818b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_edfc_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l676_l681_l692_l689_l684_DUPLICATE_818b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_3ad2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l676_l681_l692_l689_l684_DUPLICATE_818b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_964d_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l676_l681_l692_l689_l684_DUPLICATE_818b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c2_47be_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l676_l681_l692_l689_l684_DUPLICATE_0817_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l681_c7_9885_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l676_l681_l692_l689_l684_DUPLICATE_0817_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l684_c7_edfc_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l676_l681_l692_l689_l684_DUPLICATE_0817_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l689_c7_3ad2_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l676_l681_l692_l689_l684_DUPLICATE_0817_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l692_c7_964d_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l676_l681_l692_l689_l684_DUPLICATE_0817_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_9885_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l681_l692_l699_l689_l684_DUPLICATE_2fa6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_edfc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l681_l692_l699_l689_l684_DUPLICATE_2fa6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_3ad2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l681_l692_l699_l689_l684_DUPLICATE_2fa6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_964d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l681_l692_l699_l689_l684_DUPLICATE_2fa6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_1b21_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l681_l692_l699_l689_l684_DUPLICATE_2fa6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_47be_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l676_l681_l699_l689_l684_DUPLICATE_6c55_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_9885_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l676_l681_l699_l689_l684_DUPLICATE_6c55_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_edfc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l676_l681_l699_l689_l684_DUPLICATE_6c55_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_3ad2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l676_l681_l699_l689_l684_DUPLICATE_6c55_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_1b21_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l676_l681_l699_l689_l684_DUPLICATE_6c55_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_47be_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l676_l681_l699_l689_l684_DUPLICATE_48a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_9885_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l676_l681_l699_l689_l684_DUPLICATE_48a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_edfc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l676_l681_l699_l689_l684_DUPLICATE_48a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_3ad2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l676_l681_l699_l689_l684_DUPLICATE_48a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_1b21_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l676_l681_l699_l689_l684_DUPLICATE_48a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_edfc_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l684_c7_edfc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_964d_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l695_c30_d17e_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l692_c7_964d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_964d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_964d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_964d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_964d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_964d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_964d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_964d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_964d_return_output;

     -- MUX[uxn_opcodes_h_l696_c26_0b47] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l696_c26_0b47_cond <= VAR_MUX_uxn_opcodes_h_l696_c26_0b47_cond;
     MUX_uxn_opcodes_h_l696_c26_0b47_iftrue <= VAR_MUX_uxn_opcodes_h_l696_c26_0b47_iftrue;
     MUX_uxn_opcodes_h_l696_c26_0b47_iffalse <= VAR_MUX_uxn_opcodes_h_l696_c26_0b47_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l696_c26_0b47_return_output := MUX_uxn_opcodes_h_l696_c26_0b47_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l699_c7_1b21] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_1b21_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_1b21_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_1b21_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_1b21_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_1b21_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_1b21_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_1b21_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_1b21_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l699_c7_1b21] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_1b21_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_1b21_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_1b21_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_1b21_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_1b21_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_1b21_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_1b21_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_1b21_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l676_c1_c97d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_c97d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_c97d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_c97d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_c97d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_c97d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_c97d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_c97d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_c97d_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l686_c3_9cf0] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l686_c3_9cf0_x <= VAR_CONST_SL_8_uxn_opcodes_h_l686_c3_9cf0_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l686_c3_9cf0_return_output := CONST_SL_8_uxn_opcodes_h_l686_c3_9cf0_return_output;

     -- n8_MUX[uxn_opcodes_h_l692_c7_964d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l692_c7_964d_cond <= VAR_n8_MUX_uxn_opcodes_h_l692_c7_964d_cond;
     n8_MUX_uxn_opcodes_h_l692_c7_964d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l692_c7_964d_iftrue;
     n8_MUX_uxn_opcodes_h_l692_c7_964d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l692_c7_964d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l692_c7_964d_return_output := n8_MUX_uxn_opcodes_h_l692_c7_964d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l690_c3_fc26] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l690_c3_fc26_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l690_c3_fc26_left;
     BIN_OP_OR_uxn_opcodes_h_l690_c3_fc26_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l690_c3_fc26_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l690_c3_fc26_return_output := BIN_OP_OR_uxn_opcodes_h_l690_c3_fc26_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l684_c7_edfc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_edfc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_edfc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_edfc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_edfc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_edfc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_edfc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_edfc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_edfc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l699_c7_1b21] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_1b21_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_1b21_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_1b21_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_1b21_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_1b21_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_1b21_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_1b21_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_1b21_return_output;

     -- MUX[uxn_opcodes_h_l697_c22_f35c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l697_c22_f35c_cond <= VAR_MUX_uxn_opcodes_h_l697_c22_f35c_cond;
     MUX_uxn_opcodes_h_l697_c22_f35c_iftrue <= VAR_MUX_uxn_opcodes_h_l697_c22_f35c_iftrue;
     MUX_uxn_opcodes_h_l697_c22_f35c_iffalse <= VAR_MUX_uxn_opcodes_h_l697_c22_f35c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l697_c22_f35c_return_output := MUX_uxn_opcodes_h_l697_c22_f35c_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l689_c7_3ad2_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l690_c3_fc26_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l684_c7_edfc_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l686_c3_9cf0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_964d_iftrue := VAR_MUX_uxn_opcodes_h_l696_c26_0b47_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l692_c7_964d_iftrue := VAR_MUX_uxn_opcodes_h_l697_c22_f35c_return_output;
     VAR_printf_uxn_opcodes_h_l677_c3_c182_uxn_opcodes_h_l677_c3_c182_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_c97d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l689_c7_3ad2_iffalse := VAR_n8_MUX_uxn_opcodes_h_l692_c7_964d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_964d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_1b21_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_964d_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_1b21_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_964d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_1b21_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_3ad2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_964d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_9885_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_edfc_return_output;
     -- t16_MUX[uxn_opcodes_h_l689_c7_3ad2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l689_c7_3ad2_cond <= VAR_t16_MUX_uxn_opcodes_h_l689_c7_3ad2_cond;
     t16_MUX_uxn_opcodes_h_l689_c7_3ad2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l689_c7_3ad2_iftrue;
     t16_MUX_uxn_opcodes_h_l689_c7_3ad2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l689_c7_3ad2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l689_c7_3ad2_return_output := t16_MUX_uxn_opcodes_h_l689_c7_3ad2_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l692_c7_964d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l692_c7_964d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l692_c7_964d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l692_c7_964d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l692_c7_964d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l692_c7_964d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l692_c7_964d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l692_c7_964d_return_output := result_u16_value_MUX_uxn_opcodes_h_l692_c7_964d_return_output;

     -- n8_MUX[uxn_opcodes_h_l689_c7_3ad2] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l689_c7_3ad2_cond <= VAR_n8_MUX_uxn_opcodes_h_l689_c7_3ad2_cond;
     n8_MUX_uxn_opcodes_h_l689_c7_3ad2_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l689_c7_3ad2_iftrue;
     n8_MUX_uxn_opcodes_h_l689_c7_3ad2_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l689_c7_3ad2_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l689_c7_3ad2_return_output := n8_MUX_uxn_opcodes_h_l689_c7_3ad2_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l692_c7_964d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_964d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_964d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_964d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_964d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_964d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_964d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_964d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_964d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l689_c7_3ad2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_3ad2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_3ad2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_3ad2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_3ad2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_3ad2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_3ad2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_3ad2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_3ad2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l681_c7_9885] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_9885_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_9885_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_9885_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_9885_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_9885_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_9885_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_9885_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_9885_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l692_c7_964d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_964d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_964d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_964d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_964d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_964d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_964d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_964d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_964d_return_output;

     -- printf_uxn_opcodes_h_l677_c3_c182[uxn_opcodes_h_l677_c3_c182] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l677_c3_c182_uxn_opcodes_h_l677_c3_c182_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l677_c3_c182_uxn_opcodes_h_l677_c3_c182_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l692_c7_964d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_964d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_964d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_964d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_964d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_964d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_964d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_964d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_964d_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l684_c7_edfc_iffalse := VAR_n8_MUX_uxn_opcodes_h_l689_c7_3ad2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_3ad2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_964d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_3ad2_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_964d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_3ad2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_964d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_edfc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_3ad2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_47be_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_9885_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l689_c7_3ad2_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l692_c7_964d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l684_c7_edfc_iffalse := VAR_t16_MUX_uxn_opcodes_h_l689_c7_3ad2_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l689_c7_3ad2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_3ad2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_3ad2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_3ad2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_3ad2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_3ad2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_3ad2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_3ad2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_3ad2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l676_c2_47be] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_47be_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_47be_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_47be_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_47be_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_47be_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_47be_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_47be_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_47be_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l689_c7_3ad2] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_3ad2_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_3ad2_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_3ad2_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_3ad2_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_3ad2_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_3ad2_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_3ad2_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_3ad2_return_output;

     -- n8_MUX[uxn_opcodes_h_l684_c7_edfc] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l684_c7_edfc_cond <= VAR_n8_MUX_uxn_opcodes_h_l684_c7_edfc_cond;
     n8_MUX_uxn_opcodes_h_l684_c7_edfc_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l684_c7_edfc_iftrue;
     n8_MUX_uxn_opcodes_h_l684_c7_edfc_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l684_c7_edfc_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l684_c7_edfc_return_output := n8_MUX_uxn_opcodes_h_l684_c7_edfc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l689_c7_3ad2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_3ad2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_3ad2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_3ad2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_3ad2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_3ad2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_3ad2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_3ad2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_3ad2_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l689_c7_3ad2] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l689_c7_3ad2_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l689_c7_3ad2_cond;
     result_u16_value_MUX_uxn_opcodes_h_l689_c7_3ad2_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l689_c7_3ad2_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l689_c7_3ad2_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l689_c7_3ad2_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l689_c7_3ad2_return_output := result_u16_value_MUX_uxn_opcodes_h_l689_c7_3ad2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l684_c7_edfc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_edfc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_edfc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_edfc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_edfc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_edfc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_edfc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_edfc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_edfc_return_output;

     -- t16_MUX[uxn_opcodes_h_l684_c7_edfc] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l684_c7_edfc_cond <= VAR_t16_MUX_uxn_opcodes_h_l684_c7_edfc_cond;
     t16_MUX_uxn_opcodes_h_l684_c7_edfc_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l684_c7_edfc_iftrue;
     t16_MUX_uxn_opcodes_h_l684_c7_edfc_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l684_c7_edfc_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l684_c7_edfc_return_output := t16_MUX_uxn_opcodes_h_l684_c7_edfc_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l681_c7_9885_iffalse := VAR_n8_MUX_uxn_opcodes_h_l684_c7_edfc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_edfc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_3ad2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_edfc_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_3ad2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_edfc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_3ad2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_9885_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_edfc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l684_c7_edfc_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l689_c7_3ad2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l681_c7_9885_iffalse := VAR_t16_MUX_uxn_opcodes_h_l684_c7_edfc_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l684_c7_edfc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_edfc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_edfc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_edfc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_edfc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_edfc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_edfc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_edfc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_edfc_return_output;

     -- n8_MUX[uxn_opcodes_h_l681_c7_9885] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l681_c7_9885_cond <= VAR_n8_MUX_uxn_opcodes_h_l681_c7_9885_cond;
     n8_MUX_uxn_opcodes_h_l681_c7_9885_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l681_c7_9885_iftrue;
     n8_MUX_uxn_opcodes_h_l681_c7_9885_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l681_c7_9885_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l681_c7_9885_return_output := n8_MUX_uxn_opcodes_h_l681_c7_9885_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l681_c7_9885] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_9885_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_9885_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_9885_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_9885_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_9885_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_9885_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_9885_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_9885_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l684_c7_edfc] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l684_c7_edfc_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l684_c7_edfc_cond;
     result_u16_value_MUX_uxn_opcodes_h_l684_c7_edfc_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l684_c7_edfc_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l684_c7_edfc_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l684_c7_edfc_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l684_c7_edfc_return_output := result_u16_value_MUX_uxn_opcodes_h_l684_c7_edfc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l684_c7_edfc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_edfc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_edfc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_edfc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_edfc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_edfc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_edfc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_edfc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_edfc_return_output;

     -- t16_MUX[uxn_opcodes_h_l681_c7_9885] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l681_c7_9885_cond <= VAR_t16_MUX_uxn_opcodes_h_l681_c7_9885_cond;
     t16_MUX_uxn_opcodes_h_l681_c7_9885_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l681_c7_9885_iftrue;
     t16_MUX_uxn_opcodes_h_l681_c7_9885_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l681_c7_9885_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l681_c7_9885_return_output := t16_MUX_uxn_opcodes_h_l681_c7_9885_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l684_c7_edfc] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_edfc_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_edfc_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_edfc_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_edfc_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_edfc_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_edfc_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_edfc_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_edfc_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l676_c2_47be_iffalse := VAR_n8_MUX_uxn_opcodes_h_l681_c7_9885_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_9885_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_edfc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_9885_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_edfc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_9885_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_edfc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_47be_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_9885_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l681_c7_9885_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l684_c7_edfc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l676_c2_47be_iffalse := VAR_t16_MUX_uxn_opcodes_h_l681_c7_9885_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l681_c7_9885] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_9885_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_9885_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_9885_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_9885_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_9885_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_9885_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_9885_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_9885_return_output;

     -- t16_MUX[uxn_opcodes_h_l676_c2_47be] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l676_c2_47be_cond <= VAR_t16_MUX_uxn_opcodes_h_l676_c2_47be_cond;
     t16_MUX_uxn_opcodes_h_l676_c2_47be_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l676_c2_47be_iftrue;
     t16_MUX_uxn_opcodes_h_l676_c2_47be_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l676_c2_47be_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l676_c2_47be_return_output := t16_MUX_uxn_opcodes_h_l676_c2_47be_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l676_c2_47be] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_47be_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_47be_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_47be_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_47be_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_47be_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_47be_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_47be_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_47be_return_output;

     -- n8_MUX[uxn_opcodes_h_l676_c2_47be] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l676_c2_47be_cond <= VAR_n8_MUX_uxn_opcodes_h_l676_c2_47be_cond;
     n8_MUX_uxn_opcodes_h_l676_c2_47be_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l676_c2_47be_iftrue;
     n8_MUX_uxn_opcodes_h_l676_c2_47be_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l676_c2_47be_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l676_c2_47be_return_output := n8_MUX_uxn_opcodes_h_l676_c2_47be_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l681_c7_9885] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_9885_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_9885_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_9885_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_9885_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_9885_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_9885_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_9885_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_9885_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l681_c7_9885] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l681_c7_9885_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l681_c7_9885_cond;
     result_u16_value_MUX_uxn_opcodes_h_l681_c7_9885_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l681_c7_9885_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l681_c7_9885_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l681_c7_9885_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l681_c7_9885_return_output := result_u16_value_MUX_uxn_opcodes_h_l681_c7_9885_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l681_c7_9885] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_9885_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_9885_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_9885_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_9885_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_9885_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_9885_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_9885_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_9885_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l676_c2_47be_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_47be_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_9885_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_47be_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_9885_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_47be_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_9885_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c2_47be_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l681_c7_9885_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l676_c2_47be_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l676_c2_47be] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_47be_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_47be_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_47be_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_47be_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_47be_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_47be_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_47be_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_47be_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l676_c2_47be] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l676_c2_47be_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c2_47be_cond;
     result_u16_value_MUX_uxn_opcodes_h_l676_c2_47be_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c2_47be_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l676_c2_47be_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c2_47be_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c2_47be_return_output := result_u16_value_MUX_uxn_opcodes_h_l676_c2_47be_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l676_c2_47be] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_47be_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_47be_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_47be_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_47be_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_47be_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_47be_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_47be_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_47be_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l676_c2_47be] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_47be_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_47be_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_47be_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_47be_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_47be_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_47be_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_47be_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_47be_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_660c_uxn_opcodes_h_l705_l671_DUPLICATE_5a26 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_660c_uxn_opcodes_h_l705_l671_DUPLICATE_5a26_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_660c(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c2_47be_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_47be_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_47be_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_47be_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_47be_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_47be_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_660c_uxn_opcodes_h_l705_l671_DUPLICATE_5a26_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_660c_uxn_opcodes_h_l705_l671_DUPLICATE_5a26_return_output;
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
