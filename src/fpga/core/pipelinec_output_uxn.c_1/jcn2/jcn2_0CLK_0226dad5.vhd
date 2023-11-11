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
-- BIN_OP_EQ[uxn_opcodes_h_l676_c6_5ae3]
signal BIN_OP_EQ_uxn_opcodes_h_l676_c6_5ae3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l676_c6_5ae3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l676_c6_5ae3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l676_c1_9cab]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_9cab_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_9cab_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_9cab_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_9cab_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l676_c2_bbff]
signal n8_MUX_uxn_opcodes_h_l676_c2_bbff_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l676_c2_bbff_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l676_c2_bbff_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l676_c2_bbff_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l676_c2_bbff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_bbff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_bbff_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_bbff_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_bbff_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l676_c2_bbff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_bbff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_bbff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_bbff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_bbff_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l676_c2_bbff]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_bbff_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_bbff_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_bbff_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_bbff_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l676_c2_bbff]
signal result_u16_value_MUX_uxn_opcodes_h_l676_c2_bbff_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l676_c2_bbff_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l676_c2_bbff_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l676_c2_bbff_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l676_c2_bbff]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_bbff_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_bbff_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_bbff_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_bbff_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l676_c2_bbff]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_bbff_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_bbff_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_bbff_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_bbff_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l676_c2_bbff]
signal t16_MUX_uxn_opcodes_h_l676_c2_bbff_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l676_c2_bbff_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l676_c2_bbff_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l676_c2_bbff_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l677_c3_961a[uxn_opcodes_h_l677_c3_961a]
signal printf_uxn_opcodes_h_l677_c3_961a_uxn_opcodes_h_l677_c3_961a_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l681_c11_5a88]
signal BIN_OP_EQ_uxn_opcodes_h_l681_c11_5a88_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l681_c11_5a88_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l681_c11_5a88_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l681_c7_694f]
signal n8_MUX_uxn_opcodes_h_l681_c7_694f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l681_c7_694f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l681_c7_694f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l681_c7_694f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l681_c7_694f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_694f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_694f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_694f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_694f_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l681_c7_694f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_694f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_694f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_694f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_694f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l681_c7_694f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_694f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_694f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_694f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_694f_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l681_c7_694f]
signal result_u16_value_MUX_uxn_opcodes_h_l681_c7_694f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l681_c7_694f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l681_c7_694f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l681_c7_694f_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l681_c7_694f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_694f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_694f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_694f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_694f_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l681_c7_694f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_694f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_694f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_694f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_694f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l681_c7_694f]
signal t16_MUX_uxn_opcodes_h_l681_c7_694f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l681_c7_694f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l681_c7_694f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l681_c7_694f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l684_c11_fc00]
signal BIN_OP_EQ_uxn_opcodes_h_l684_c11_fc00_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l684_c11_fc00_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l684_c11_fc00_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l684_c7_8320]
signal n8_MUX_uxn_opcodes_h_l684_c7_8320_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l684_c7_8320_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l684_c7_8320_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l684_c7_8320_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l684_c7_8320]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_8320_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_8320_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_8320_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_8320_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l684_c7_8320]
signal result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_8320_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_8320_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_8320_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_8320_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l684_c7_8320]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_8320_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_8320_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_8320_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_8320_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l684_c7_8320]
signal result_u16_value_MUX_uxn_opcodes_h_l684_c7_8320_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l684_c7_8320_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l684_c7_8320_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l684_c7_8320_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l684_c7_8320]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_8320_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_8320_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_8320_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_8320_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l684_c7_8320]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_8320_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_8320_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_8320_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_8320_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l684_c7_8320]
signal t16_MUX_uxn_opcodes_h_l684_c7_8320_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l684_c7_8320_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l684_c7_8320_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l684_c7_8320_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l686_c3_76a2]
signal CONST_SL_8_uxn_opcodes_h_l686_c3_76a2_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l686_c3_76a2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l689_c11_fb03]
signal BIN_OP_EQ_uxn_opcodes_h_l689_c11_fb03_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l689_c11_fb03_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l689_c11_fb03_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l689_c7_5b9d]
signal n8_MUX_uxn_opcodes_h_l689_c7_5b9d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l689_c7_5b9d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l689_c7_5b9d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l689_c7_5b9d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l689_c7_5b9d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_5b9d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_5b9d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_5b9d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_5b9d_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l689_c7_5b9d]
signal result_u16_value_MUX_uxn_opcodes_h_l689_c7_5b9d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l689_c7_5b9d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l689_c7_5b9d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l689_c7_5b9d_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l689_c7_5b9d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_5b9d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_5b9d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_5b9d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_5b9d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l689_c7_5b9d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_5b9d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_5b9d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_5b9d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_5b9d_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l689_c7_5b9d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_5b9d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_5b9d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_5b9d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_5b9d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l689_c7_5b9d]
signal t16_MUX_uxn_opcodes_h_l689_c7_5b9d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l689_c7_5b9d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l689_c7_5b9d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l689_c7_5b9d_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l690_c3_1845]
signal BIN_OP_OR_uxn_opcodes_h_l690_c3_1845_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l690_c3_1845_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l690_c3_1845_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l692_c11_8ae4]
signal BIN_OP_EQ_uxn_opcodes_h_l692_c11_8ae4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l692_c11_8ae4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l692_c11_8ae4_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l692_c7_5f09]
signal n8_MUX_uxn_opcodes_h_l692_c7_5f09_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l692_c7_5f09_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l692_c7_5f09_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l692_c7_5f09_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l692_c7_5f09]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5f09_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5f09_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5f09_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5f09_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l692_c7_5f09]
signal result_u16_value_MUX_uxn_opcodes_h_l692_c7_5f09_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l692_c7_5f09_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l692_c7_5f09_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l692_c7_5f09_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l692_c7_5f09]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5f09_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5f09_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5f09_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5f09_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l692_c7_5f09]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5f09_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5f09_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5f09_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5f09_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l692_c7_5f09]
signal result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5f09_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5f09_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5f09_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5f09_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l695_c30_fb96]
signal sp_relative_shift_uxn_opcodes_h_l695_c30_fb96_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l695_c30_fb96_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l695_c30_fb96_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l695_c30_fb96_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l696_c26_63f4]
signal BIN_OP_EQ_uxn_opcodes_h_l696_c26_63f4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l696_c26_63f4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l696_c26_63f4_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l696_c26_2edd]
signal MUX_uxn_opcodes_h_l696_c26_2edd_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l696_c26_2edd_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l696_c26_2edd_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l696_c26_2edd_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l697_c22_205e]
signal BIN_OP_EQ_uxn_opcodes_h_l697_c22_205e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l697_c22_205e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l697_c22_205e_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l697_c22_2df8]
signal MUX_uxn_opcodes_h_l697_c22_2df8_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l697_c22_2df8_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l697_c22_2df8_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l697_c22_2df8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l699_c11_94ba]
signal BIN_OP_EQ_uxn_opcodes_h_l699_c11_94ba_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l699_c11_94ba_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l699_c11_94ba_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l699_c7_bcd0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_bcd0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_bcd0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_bcd0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_bcd0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l699_c7_bcd0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_bcd0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_bcd0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_bcd0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_bcd0_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l699_c7_bcd0]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_bcd0_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_bcd0_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_bcd0_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_bcd0_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_5d97( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.u16_value := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_pc_updated := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l676_c6_5ae3
BIN_OP_EQ_uxn_opcodes_h_l676_c6_5ae3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l676_c6_5ae3_left,
BIN_OP_EQ_uxn_opcodes_h_l676_c6_5ae3_right,
BIN_OP_EQ_uxn_opcodes_h_l676_c6_5ae3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_9cab
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_9cab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_9cab_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_9cab_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_9cab_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_9cab_return_output);

-- n8_MUX_uxn_opcodes_h_l676_c2_bbff
n8_MUX_uxn_opcodes_h_l676_c2_bbff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l676_c2_bbff_cond,
n8_MUX_uxn_opcodes_h_l676_c2_bbff_iftrue,
n8_MUX_uxn_opcodes_h_l676_c2_bbff_iffalse,
n8_MUX_uxn_opcodes_h_l676_c2_bbff_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_bbff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_bbff : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_bbff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_bbff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_bbff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_bbff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_bbff
result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_bbff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_bbff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_bbff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_bbff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_bbff_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_bbff
result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_bbff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_bbff_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_bbff_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_bbff_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_bbff_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l676_c2_bbff
result_u16_value_MUX_uxn_opcodes_h_l676_c2_bbff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l676_c2_bbff_cond,
result_u16_value_MUX_uxn_opcodes_h_l676_c2_bbff_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l676_c2_bbff_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l676_c2_bbff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_bbff
result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_bbff : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_bbff_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_bbff_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_bbff_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_bbff_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_bbff
result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_bbff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_bbff_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_bbff_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_bbff_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_bbff_return_output);

-- t16_MUX_uxn_opcodes_h_l676_c2_bbff
t16_MUX_uxn_opcodes_h_l676_c2_bbff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l676_c2_bbff_cond,
t16_MUX_uxn_opcodes_h_l676_c2_bbff_iftrue,
t16_MUX_uxn_opcodes_h_l676_c2_bbff_iffalse,
t16_MUX_uxn_opcodes_h_l676_c2_bbff_return_output);

-- printf_uxn_opcodes_h_l677_c3_961a_uxn_opcodes_h_l677_c3_961a
printf_uxn_opcodes_h_l677_c3_961a_uxn_opcodes_h_l677_c3_961a : entity work.printf_uxn_opcodes_h_l677_c3_961a_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l677_c3_961a_uxn_opcodes_h_l677_c3_961a_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l681_c11_5a88
BIN_OP_EQ_uxn_opcodes_h_l681_c11_5a88 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l681_c11_5a88_left,
BIN_OP_EQ_uxn_opcodes_h_l681_c11_5a88_right,
BIN_OP_EQ_uxn_opcodes_h_l681_c11_5a88_return_output);

-- n8_MUX_uxn_opcodes_h_l681_c7_694f
n8_MUX_uxn_opcodes_h_l681_c7_694f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l681_c7_694f_cond,
n8_MUX_uxn_opcodes_h_l681_c7_694f_iftrue,
n8_MUX_uxn_opcodes_h_l681_c7_694f_iffalse,
n8_MUX_uxn_opcodes_h_l681_c7_694f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_694f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_694f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_694f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_694f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_694f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_694f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_694f
result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_694f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_694f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_694f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_694f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_694f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_694f
result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_694f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_694f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_694f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_694f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_694f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l681_c7_694f
result_u16_value_MUX_uxn_opcodes_h_l681_c7_694f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l681_c7_694f_cond,
result_u16_value_MUX_uxn_opcodes_h_l681_c7_694f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l681_c7_694f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l681_c7_694f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_694f
result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_694f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_694f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_694f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_694f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_694f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_694f
result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_694f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_694f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_694f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_694f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_694f_return_output);

-- t16_MUX_uxn_opcodes_h_l681_c7_694f
t16_MUX_uxn_opcodes_h_l681_c7_694f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l681_c7_694f_cond,
t16_MUX_uxn_opcodes_h_l681_c7_694f_iftrue,
t16_MUX_uxn_opcodes_h_l681_c7_694f_iffalse,
t16_MUX_uxn_opcodes_h_l681_c7_694f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l684_c11_fc00
BIN_OP_EQ_uxn_opcodes_h_l684_c11_fc00 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l684_c11_fc00_left,
BIN_OP_EQ_uxn_opcodes_h_l684_c11_fc00_right,
BIN_OP_EQ_uxn_opcodes_h_l684_c11_fc00_return_output);

-- n8_MUX_uxn_opcodes_h_l684_c7_8320
n8_MUX_uxn_opcodes_h_l684_c7_8320 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l684_c7_8320_cond,
n8_MUX_uxn_opcodes_h_l684_c7_8320_iftrue,
n8_MUX_uxn_opcodes_h_l684_c7_8320_iffalse,
n8_MUX_uxn_opcodes_h_l684_c7_8320_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_8320
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_8320 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_8320_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_8320_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_8320_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_8320_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_8320
result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_8320 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_8320_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_8320_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_8320_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_8320_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_8320
result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_8320 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_8320_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_8320_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_8320_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_8320_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l684_c7_8320
result_u16_value_MUX_uxn_opcodes_h_l684_c7_8320 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l684_c7_8320_cond,
result_u16_value_MUX_uxn_opcodes_h_l684_c7_8320_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l684_c7_8320_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l684_c7_8320_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_8320
result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_8320 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_8320_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_8320_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_8320_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_8320_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_8320
result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_8320 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_8320_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_8320_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_8320_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_8320_return_output);

-- t16_MUX_uxn_opcodes_h_l684_c7_8320
t16_MUX_uxn_opcodes_h_l684_c7_8320 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l684_c7_8320_cond,
t16_MUX_uxn_opcodes_h_l684_c7_8320_iftrue,
t16_MUX_uxn_opcodes_h_l684_c7_8320_iffalse,
t16_MUX_uxn_opcodes_h_l684_c7_8320_return_output);

-- CONST_SL_8_uxn_opcodes_h_l686_c3_76a2
CONST_SL_8_uxn_opcodes_h_l686_c3_76a2 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l686_c3_76a2_x,
CONST_SL_8_uxn_opcodes_h_l686_c3_76a2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l689_c11_fb03
BIN_OP_EQ_uxn_opcodes_h_l689_c11_fb03 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l689_c11_fb03_left,
BIN_OP_EQ_uxn_opcodes_h_l689_c11_fb03_right,
BIN_OP_EQ_uxn_opcodes_h_l689_c11_fb03_return_output);

-- n8_MUX_uxn_opcodes_h_l689_c7_5b9d
n8_MUX_uxn_opcodes_h_l689_c7_5b9d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l689_c7_5b9d_cond,
n8_MUX_uxn_opcodes_h_l689_c7_5b9d_iftrue,
n8_MUX_uxn_opcodes_h_l689_c7_5b9d_iffalse,
n8_MUX_uxn_opcodes_h_l689_c7_5b9d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_5b9d
result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_5b9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_5b9d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_5b9d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_5b9d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_5b9d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l689_c7_5b9d
result_u16_value_MUX_uxn_opcodes_h_l689_c7_5b9d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l689_c7_5b9d_cond,
result_u16_value_MUX_uxn_opcodes_h_l689_c7_5b9d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l689_c7_5b9d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l689_c7_5b9d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_5b9d
result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_5b9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_5b9d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_5b9d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_5b9d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_5b9d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_5b9d
result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_5b9d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_5b9d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_5b9d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_5b9d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_5b9d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_5b9d
result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_5b9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_5b9d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_5b9d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_5b9d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_5b9d_return_output);

-- t16_MUX_uxn_opcodes_h_l689_c7_5b9d
t16_MUX_uxn_opcodes_h_l689_c7_5b9d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l689_c7_5b9d_cond,
t16_MUX_uxn_opcodes_h_l689_c7_5b9d_iftrue,
t16_MUX_uxn_opcodes_h_l689_c7_5b9d_iffalse,
t16_MUX_uxn_opcodes_h_l689_c7_5b9d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l690_c3_1845
BIN_OP_OR_uxn_opcodes_h_l690_c3_1845 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l690_c3_1845_left,
BIN_OP_OR_uxn_opcodes_h_l690_c3_1845_right,
BIN_OP_OR_uxn_opcodes_h_l690_c3_1845_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l692_c11_8ae4
BIN_OP_EQ_uxn_opcodes_h_l692_c11_8ae4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l692_c11_8ae4_left,
BIN_OP_EQ_uxn_opcodes_h_l692_c11_8ae4_right,
BIN_OP_EQ_uxn_opcodes_h_l692_c11_8ae4_return_output);

-- n8_MUX_uxn_opcodes_h_l692_c7_5f09
n8_MUX_uxn_opcodes_h_l692_c7_5f09 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l692_c7_5f09_cond,
n8_MUX_uxn_opcodes_h_l692_c7_5f09_iftrue,
n8_MUX_uxn_opcodes_h_l692_c7_5f09_iffalse,
n8_MUX_uxn_opcodes_h_l692_c7_5f09_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5f09
result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5f09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5f09_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5f09_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5f09_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5f09_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l692_c7_5f09
result_u16_value_MUX_uxn_opcodes_h_l692_c7_5f09 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l692_c7_5f09_cond,
result_u16_value_MUX_uxn_opcodes_h_l692_c7_5f09_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l692_c7_5f09_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l692_c7_5f09_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5f09
result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5f09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5f09_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5f09_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5f09_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5f09_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5f09
result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5f09 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5f09_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5f09_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5f09_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5f09_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5f09
result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5f09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5f09_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5f09_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5f09_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5f09_return_output);

-- sp_relative_shift_uxn_opcodes_h_l695_c30_fb96
sp_relative_shift_uxn_opcodes_h_l695_c30_fb96 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l695_c30_fb96_ins,
sp_relative_shift_uxn_opcodes_h_l695_c30_fb96_x,
sp_relative_shift_uxn_opcodes_h_l695_c30_fb96_y,
sp_relative_shift_uxn_opcodes_h_l695_c30_fb96_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l696_c26_63f4
BIN_OP_EQ_uxn_opcodes_h_l696_c26_63f4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l696_c26_63f4_left,
BIN_OP_EQ_uxn_opcodes_h_l696_c26_63f4_right,
BIN_OP_EQ_uxn_opcodes_h_l696_c26_63f4_return_output);

-- MUX_uxn_opcodes_h_l696_c26_2edd
MUX_uxn_opcodes_h_l696_c26_2edd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l696_c26_2edd_cond,
MUX_uxn_opcodes_h_l696_c26_2edd_iftrue,
MUX_uxn_opcodes_h_l696_c26_2edd_iffalse,
MUX_uxn_opcodes_h_l696_c26_2edd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l697_c22_205e
BIN_OP_EQ_uxn_opcodes_h_l697_c22_205e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l697_c22_205e_left,
BIN_OP_EQ_uxn_opcodes_h_l697_c22_205e_right,
BIN_OP_EQ_uxn_opcodes_h_l697_c22_205e_return_output);

-- MUX_uxn_opcodes_h_l697_c22_2df8
MUX_uxn_opcodes_h_l697_c22_2df8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l697_c22_2df8_cond,
MUX_uxn_opcodes_h_l697_c22_2df8_iftrue,
MUX_uxn_opcodes_h_l697_c22_2df8_iffalse,
MUX_uxn_opcodes_h_l697_c22_2df8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l699_c11_94ba
BIN_OP_EQ_uxn_opcodes_h_l699_c11_94ba : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l699_c11_94ba_left,
BIN_OP_EQ_uxn_opcodes_h_l699_c11_94ba_right,
BIN_OP_EQ_uxn_opcodes_h_l699_c11_94ba_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_bcd0
result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_bcd0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_bcd0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_bcd0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_bcd0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_bcd0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_bcd0
result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_bcd0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_bcd0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_bcd0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_bcd0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_bcd0_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_bcd0
result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_bcd0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_bcd0_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_bcd0_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_bcd0_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_bcd0_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l676_c6_5ae3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_9cab_return_output,
 n8_MUX_uxn_opcodes_h_l676_c2_bbff_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_bbff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_bbff_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_bbff_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l676_c2_bbff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_bbff_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_bbff_return_output,
 t16_MUX_uxn_opcodes_h_l676_c2_bbff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l681_c11_5a88_return_output,
 n8_MUX_uxn_opcodes_h_l681_c7_694f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_694f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_694f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_694f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l681_c7_694f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_694f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_694f_return_output,
 t16_MUX_uxn_opcodes_h_l681_c7_694f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l684_c11_fc00_return_output,
 n8_MUX_uxn_opcodes_h_l684_c7_8320_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_8320_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_8320_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_8320_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l684_c7_8320_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_8320_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_8320_return_output,
 t16_MUX_uxn_opcodes_h_l684_c7_8320_return_output,
 CONST_SL_8_uxn_opcodes_h_l686_c3_76a2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l689_c11_fb03_return_output,
 n8_MUX_uxn_opcodes_h_l689_c7_5b9d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_5b9d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l689_c7_5b9d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_5b9d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_5b9d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_5b9d_return_output,
 t16_MUX_uxn_opcodes_h_l689_c7_5b9d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l690_c3_1845_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l692_c11_8ae4_return_output,
 n8_MUX_uxn_opcodes_h_l692_c7_5f09_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5f09_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l692_c7_5f09_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5f09_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5f09_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5f09_return_output,
 sp_relative_shift_uxn_opcodes_h_l695_c30_fb96_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l696_c26_63f4_return_output,
 MUX_uxn_opcodes_h_l696_c26_2edd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l697_c22_205e_return_output,
 MUX_uxn_opcodes_h_l697_c22_2df8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l699_c11_94ba_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_bcd0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_bcd0_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_bcd0_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_5ae3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_5ae3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_5ae3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_9cab_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_9cab_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_9cab_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_9cab_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l676_c2_bbff_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l676_c2_bbff_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l681_c7_694f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l676_c2_bbff_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l676_c2_bbff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_bbff_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l678_c3_48f2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_bbff_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_694f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_bbff_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_bbff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_bbff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_bbff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_694f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_bbff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_bbff_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_bbff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_bbff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_694f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_bbff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_bbff_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c2_bbff_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c2_bbff_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l681_c7_694f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c2_bbff_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c2_bbff_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_bbff_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_bbff_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_694f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_bbff_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_bbff_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_bbff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_bbff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_694f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_bbff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_bbff_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l676_c2_bbff_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l676_c2_bbff_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l681_c7_694f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l676_c2_bbff_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l676_c2_bbff_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l677_c3_961a_uxn_opcodes_h_l677_c3_961a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_5a88_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_5a88_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_5a88_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l681_c7_694f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l681_c7_694f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l684_c7_8320_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l681_c7_694f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_694f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l682_c3_8583 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_694f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_8320_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_694f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_694f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_694f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_8320_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_694f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_694f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_694f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_8320_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_694f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l681_c7_694f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l681_c7_694f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l684_c7_8320_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l681_c7_694f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_694f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_694f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_8320_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_694f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_694f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_694f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_8320_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_694f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l681_c7_694f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l681_c7_694f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l684_c7_8320_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l681_c7_694f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_fc00_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_fc00_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_fc00_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l684_c7_8320_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l684_c7_8320_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l689_c7_5b9d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l684_c7_8320_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_8320_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l687_c3_d95f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_8320_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l684_c7_8320_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_8320_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_8320_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_8320_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_5b9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_8320_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_8320_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_8320_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_5b9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_8320_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l684_c7_8320_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l684_c7_8320_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l689_c7_5b9d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l684_c7_8320_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_8320_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_8320_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_5b9d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_8320_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_8320_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_8320_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_5b9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_8320_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l684_c7_8320_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l684_c7_8320_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l689_c7_5b9d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l684_c7_8320_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l686_c3_76a2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l686_c3_76a2_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_fb03_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_fb03_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_fb03_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l689_c7_5b9d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l689_c7_5b9d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l692_c7_5f09_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l689_c7_5b9d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_5b9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_5b9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5f09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_5b9d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l689_c7_5b9d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l689_c7_5b9d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l692_c7_5f09_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l689_c7_5b9d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_5b9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_5b9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5f09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_5b9d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_5b9d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_5b9d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5f09_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_5b9d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_5b9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_5b9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5f09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_5b9d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l689_c7_5b9d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l689_c7_5b9d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l689_c7_5b9d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l690_c3_1845_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l690_c3_1845_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l690_c3_1845_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_8ae4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_8ae4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_8ae4_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l692_c7_5f09_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l692_c7_5f09_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l692_c7_5f09_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5f09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5f09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_bcd0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5f09_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l692_c7_5f09_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l692_c7_5f09_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l692_c7_5f09_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5f09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5f09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_bcd0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5f09_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5f09_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5f09_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5f09_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5f09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5f09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_bcd0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5f09_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l695_c30_fb96_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l695_c30_fb96_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l695_c30_fb96_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l695_c30_fb96_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l696_c26_2edd_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l696_c26_2edd_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l696_c26_2edd_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c26_63f4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c26_63f4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c26_63f4_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l696_c26_2edd_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l697_c22_2df8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l697_c22_2df8_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l697_c22_2df8_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c22_205e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c22_205e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c22_205e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l697_c22_2df8_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_94ba_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_94ba_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_94ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_bcd0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_bcd0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_bcd0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_bcd0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_bcd0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_bcd0_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_bcd0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_bcd0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_bcd0_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l684_l681_l676_l699_l689_DUPLICATE_12c8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l684_l681_l676_l692_l689_DUPLICATE_9bd3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l684_l681_l676_l692_l689_DUPLICATE_075d_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l684_l681_l676_l699_l689_DUPLICATE_0c3d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l684_l681_l699_l692_l689_DUPLICATE_4740_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l690_l685_DUPLICATE_a65b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5d97_uxn_opcodes_h_l671_l705_DUPLICATE_042b_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_5ae3_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_bcd0_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l687_c3_d95f := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_8320_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l687_c3_d95f;
     VAR_MUX_uxn_opcodes_h_l696_c26_2edd_iffalse := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l696_c26_2edd_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l678_c3_48f2 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_bbff_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l678_c3_48f2;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_bcd0_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_bbff_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_5a88_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l695_c30_fb96_y := resize(to_signed(-3, 3), 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_9cab_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5f09_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l695_c30_fb96_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_fc00_right := to_unsigned(2, 2);
     VAR_MUX_uxn_opcodes_h_l697_c22_2df8_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c26_63f4_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_94ba_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_fb03_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_bcd0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c22_205e_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_8ae4_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l682_c3_8583 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_694f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l682_c3_8583;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_9cab_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l695_c30_fb96_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l676_c2_bbff_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l681_c7_694f_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l684_c7_8320_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l689_c7_5b9d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l692_c7_5f09_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_5ae3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_5a88_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_fc00_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_fb03_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_8ae4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_94ba_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c26_63f4_left := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c22_205e_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l692_c7_5f09_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l690_c3_1845_left := t16;
     VAR_MUX_uxn_opcodes_h_l697_c22_2df8_iffalse := t16;
     VAR_t16_MUX_uxn_opcodes_h_l676_c2_bbff_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l681_c7_694f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l689_c7_5b9d_iffalse := t16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l684_l681_l676_l699_l689_DUPLICATE_12c8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l684_l681_l676_l699_l689_DUPLICATE_12c8_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l681_c11_5a88] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l681_c11_5a88_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_5a88_left;
     BIN_OP_EQ_uxn_opcodes_h_l681_c11_5a88_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_5a88_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_5a88_return_output := BIN_OP_EQ_uxn_opcodes_h_l681_c11_5a88_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l696_c26_63f4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l696_c26_63f4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c26_63f4_left;
     BIN_OP_EQ_uxn_opcodes_h_l696_c26_63f4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c26_63f4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c26_63f4_return_output := BIN_OP_EQ_uxn_opcodes_h_l696_c26_63f4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l684_l681_l676_l699_l689_DUPLICATE_0c3d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l684_l681_l676_l699_l689_DUPLICATE_0c3d_return_output := result.is_pc_updated;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l684_l681_l676_l692_l689_DUPLICATE_075d LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l684_l681_l676_l692_l689_DUPLICATE_075d_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l684_l681_l676_l692_l689_DUPLICATE_9bd3 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l684_l681_l676_l692_l689_DUPLICATE_9bd3_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l699_c11_94ba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l699_c11_94ba_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_94ba_left;
     BIN_OP_EQ_uxn_opcodes_h_l699_c11_94ba_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_94ba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_94ba_return_output := BIN_OP_EQ_uxn_opcodes_h_l699_c11_94ba_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l684_l681_l699_l692_l689_DUPLICATE_4740 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l684_l681_l699_l692_l689_DUPLICATE_4740_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l689_c11_fb03] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l689_c11_fb03_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_fb03_left;
     BIN_OP_EQ_uxn_opcodes_h_l689_c11_fb03_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_fb03_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_fb03_return_output := BIN_OP_EQ_uxn_opcodes_h_l689_c11_fb03_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l697_c22_205e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l697_c22_205e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c22_205e_left;
     BIN_OP_EQ_uxn_opcodes_h_l697_c22_205e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c22_205e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c22_205e_return_output := BIN_OP_EQ_uxn_opcodes_h_l697_c22_205e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l676_c6_5ae3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l676_c6_5ae3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_5ae3_left;
     BIN_OP_EQ_uxn_opcodes_h_l676_c6_5ae3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_5ae3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_5ae3_return_output := BIN_OP_EQ_uxn_opcodes_h_l676_c6_5ae3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l684_c11_fc00] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l684_c11_fc00_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_fc00_left;
     BIN_OP_EQ_uxn_opcodes_h_l684_c11_fc00_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_fc00_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_fc00_return_output := BIN_OP_EQ_uxn_opcodes_h_l684_c11_fc00_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l684_c7_8320] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l684_c7_8320_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l692_c11_8ae4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l692_c11_8ae4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_8ae4_left;
     BIN_OP_EQ_uxn_opcodes_h_l692_c11_8ae4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_8ae4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_8ae4_return_output := BIN_OP_EQ_uxn_opcodes_h_l692_c11_8ae4_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l695_c30_fb96] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l695_c30_fb96_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l695_c30_fb96_ins;
     sp_relative_shift_uxn_opcodes_h_l695_c30_fb96_x <= VAR_sp_relative_shift_uxn_opcodes_h_l695_c30_fb96_x;
     sp_relative_shift_uxn_opcodes_h_l695_c30_fb96_y <= VAR_sp_relative_shift_uxn_opcodes_h_l695_c30_fb96_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l695_c30_fb96_return_output := sp_relative_shift_uxn_opcodes_h_l695_c30_fb96_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l690_l685_DUPLICATE_a65b LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l690_l685_DUPLICATE_a65b_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_9cab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_5ae3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l676_c2_bbff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_5ae3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_bbff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_5ae3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_bbff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_5ae3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_bbff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_5ae3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_bbff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_5ae3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_bbff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_5ae3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c2_bbff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_5ae3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l676_c2_bbff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_5ae3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l681_c7_694f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_5a88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_694f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_5a88_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_694f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_5a88_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_694f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_5a88_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_694f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_5a88_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_694f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_5a88_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l681_c7_694f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_5a88_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l681_c7_694f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_5a88_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l684_c7_8320_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_fc00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_8320_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_fc00_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_8320_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_fc00_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_8320_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_fc00_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_8320_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_fc00_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_8320_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_fc00_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l684_c7_8320_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_fc00_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l684_c7_8320_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_fc00_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l689_c7_5b9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_fb03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_5b9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_fb03_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_5b9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_fb03_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_5b9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_fb03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_5b9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_fb03_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l689_c7_5b9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_fb03_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l689_c7_5b9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_fb03_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l692_c7_5f09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_8ae4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5f09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_8ae4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5f09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_8ae4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5f09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_8ae4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5f09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_8ae4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l692_c7_5f09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_8ae4_return_output;
     VAR_MUX_uxn_opcodes_h_l696_c26_2edd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c26_63f4_return_output;
     VAR_MUX_uxn_opcodes_h_l697_c22_2df8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c22_205e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_bcd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_94ba_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_bcd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_94ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_bcd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_94ba_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l690_c3_1845_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l690_l685_DUPLICATE_a65b_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l686_c3_76a2_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l690_l685_DUPLICATE_a65b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_bbff_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l684_l681_l676_l692_l689_DUPLICATE_075d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_694f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l684_l681_l676_l692_l689_DUPLICATE_075d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_8320_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l684_l681_l676_l692_l689_DUPLICATE_075d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_5b9d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l684_l681_l676_l692_l689_DUPLICATE_075d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5f09_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l684_l681_l676_l692_l689_DUPLICATE_075d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c2_bbff_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l684_l681_l676_l692_l689_DUPLICATE_9bd3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l681_c7_694f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l684_l681_l676_l692_l689_DUPLICATE_9bd3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l684_c7_8320_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l684_l681_l676_l692_l689_DUPLICATE_9bd3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l689_c7_5b9d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l684_l681_l676_l692_l689_DUPLICATE_9bd3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l692_c7_5f09_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l684_l681_l676_l692_l689_DUPLICATE_9bd3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_694f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l684_l681_l699_l692_l689_DUPLICATE_4740_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_8320_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l684_l681_l699_l692_l689_DUPLICATE_4740_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_5b9d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l684_l681_l699_l692_l689_DUPLICATE_4740_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5f09_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l684_l681_l699_l692_l689_DUPLICATE_4740_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_bcd0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l684_l681_l699_l692_l689_DUPLICATE_4740_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_bbff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l684_l681_l676_l699_l689_DUPLICATE_0c3d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_694f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l684_l681_l676_l699_l689_DUPLICATE_0c3d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_8320_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l684_l681_l676_l699_l689_DUPLICATE_0c3d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_5b9d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l684_l681_l676_l699_l689_DUPLICATE_0c3d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_bcd0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l684_l681_l676_l699_l689_DUPLICATE_0c3d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_bbff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l684_l681_l676_l699_l689_DUPLICATE_12c8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_694f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l684_l681_l676_l699_l689_DUPLICATE_12c8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_8320_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l684_l681_l676_l699_l689_DUPLICATE_12c8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_5b9d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l684_l681_l676_l699_l689_DUPLICATE_12c8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_bcd0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l684_l681_l676_l699_l689_DUPLICATE_12c8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_8320_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l684_c7_8320_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5f09_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l695_c30_fb96_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l692_c7_5f09] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5f09_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5f09_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5f09_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5f09_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5f09_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5f09_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5f09_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5f09_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l699_c7_bcd0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_bcd0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_bcd0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_bcd0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_bcd0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_bcd0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_bcd0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_bcd0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_bcd0_return_output;

     -- n8_MUX[uxn_opcodes_h_l692_c7_5f09] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l692_c7_5f09_cond <= VAR_n8_MUX_uxn_opcodes_h_l692_c7_5f09_cond;
     n8_MUX_uxn_opcodes_h_l692_c7_5f09_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l692_c7_5f09_iftrue;
     n8_MUX_uxn_opcodes_h_l692_c7_5f09_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l692_c7_5f09_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l692_c7_5f09_return_output := n8_MUX_uxn_opcodes_h_l692_c7_5f09_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l684_c7_8320] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_8320_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_8320_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_8320_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_8320_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_8320_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_8320_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_8320_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_8320_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l690_c3_1845] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l690_c3_1845_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l690_c3_1845_left;
     BIN_OP_OR_uxn_opcodes_h_l690_c3_1845_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l690_c3_1845_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l690_c3_1845_return_output := BIN_OP_OR_uxn_opcodes_h_l690_c3_1845_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l699_c7_bcd0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_bcd0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_bcd0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_bcd0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_bcd0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_bcd0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_bcd0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_bcd0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_bcd0_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l699_c7_bcd0] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_bcd0_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_bcd0_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_bcd0_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_bcd0_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_bcd0_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_bcd0_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_bcd0_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_bcd0_return_output;

     -- MUX[uxn_opcodes_h_l696_c26_2edd] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l696_c26_2edd_cond <= VAR_MUX_uxn_opcodes_h_l696_c26_2edd_cond;
     MUX_uxn_opcodes_h_l696_c26_2edd_iftrue <= VAR_MUX_uxn_opcodes_h_l696_c26_2edd_iftrue;
     MUX_uxn_opcodes_h_l696_c26_2edd_iffalse <= VAR_MUX_uxn_opcodes_h_l696_c26_2edd_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l696_c26_2edd_return_output := MUX_uxn_opcodes_h_l696_c26_2edd_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l676_c1_9cab] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_9cab_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_9cab_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_9cab_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_9cab_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_9cab_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_9cab_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_9cab_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_9cab_return_output;

     -- MUX[uxn_opcodes_h_l697_c22_2df8] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l697_c22_2df8_cond <= VAR_MUX_uxn_opcodes_h_l697_c22_2df8_cond;
     MUX_uxn_opcodes_h_l697_c22_2df8_iftrue <= VAR_MUX_uxn_opcodes_h_l697_c22_2df8_iftrue;
     MUX_uxn_opcodes_h_l697_c22_2df8_iffalse <= VAR_MUX_uxn_opcodes_h_l697_c22_2df8_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l697_c22_2df8_return_output := MUX_uxn_opcodes_h_l697_c22_2df8_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l686_c3_76a2] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l686_c3_76a2_x <= VAR_CONST_SL_8_uxn_opcodes_h_l686_c3_76a2_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l686_c3_76a2_return_output := CONST_SL_8_uxn_opcodes_h_l686_c3_76a2_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l689_c7_5b9d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l690_c3_1845_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l684_c7_8320_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l686_c3_76a2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5f09_iftrue := VAR_MUX_uxn_opcodes_h_l696_c26_2edd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l692_c7_5f09_iftrue := VAR_MUX_uxn_opcodes_h_l697_c22_2df8_return_output;
     VAR_printf_uxn_opcodes_h_l677_c3_961a_uxn_opcodes_h_l677_c3_961a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_9cab_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l689_c7_5b9d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l692_c7_5f09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5f09_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_bcd0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5f09_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_bcd0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5f09_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_bcd0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_5b9d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5f09_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_694f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_8320_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l692_c7_5f09] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5f09_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5f09_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5f09_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5f09_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5f09_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5f09_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5f09_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5f09_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l681_c7_694f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_694f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_694f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_694f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_694f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_694f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_694f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_694f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_694f_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l692_c7_5f09] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l692_c7_5f09_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l692_c7_5f09_cond;
     result_u16_value_MUX_uxn_opcodes_h_l692_c7_5f09_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l692_c7_5f09_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l692_c7_5f09_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l692_c7_5f09_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l692_c7_5f09_return_output := result_u16_value_MUX_uxn_opcodes_h_l692_c7_5f09_return_output;

     -- n8_MUX[uxn_opcodes_h_l689_c7_5b9d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l689_c7_5b9d_cond <= VAR_n8_MUX_uxn_opcodes_h_l689_c7_5b9d_cond;
     n8_MUX_uxn_opcodes_h_l689_c7_5b9d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l689_c7_5b9d_iftrue;
     n8_MUX_uxn_opcodes_h_l689_c7_5b9d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l689_c7_5b9d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l689_c7_5b9d_return_output := n8_MUX_uxn_opcodes_h_l689_c7_5b9d_return_output;

     -- printf_uxn_opcodes_h_l677_c3_961a[uxn_opcodes_h_l677_c3_961a] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l677_c3_961a_uxn_opcodes_h_l677_c3_961a_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l677_c3_961a_uxn_opcodes_h_l677_c3_961a_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l692_c7_5f09] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5f09_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5f09_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5f09_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5f09_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5f09_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5f09_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5f09_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5f09_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l692_c7_5f09] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5f09_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5f09_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5f09_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5f09_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5f09_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5f09_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5f09_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5f09_return_output;

     -- t16_MUX[uxn_opcodes_h_l689_c7_5b9d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l689_c7_5b9d_cond <= VAR_t16_MUX_uxn_opcodes_h_l689_c7_5b9d_cond;
     t16_MUX_uxn_opcodes_h_l689_c7_5b9d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l689_c7_5b9d_iftrue;
     t16_MUX_uxn_opcodes_h_l689_c7_5b9d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l689_c7_5b9d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l689_c7_5b9d_return_output := t16_MUX_uxn_opcodes_h_l689_c7_5b9d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l689_c7_5b9d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_5b9d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_5b9d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_5b9d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_5b9d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_5b9d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_5b9d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_5b9d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_5b9d_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l684_c7_8320_iffalse := VAR_n8_MUX_uxn_opcodes_h_l689_c7_5b9d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_5b9d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5f09_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_5b9d_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5f09_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_5b9d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5f09_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_8320_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_5b9d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_bbff_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_694f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l689_c7_5b9d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l692_c7_5f09_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l684_c7_8320_iffalse := VAR_t16_MUX_uxn_opcodes_h_l689_c7_5b9d_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l684_c7_8320] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_8320_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_8320_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_8320_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_8320_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_8320_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_8320_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_8320_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_8320_return_output;

     -- n8_MUX[uxn_opcodes_h_l684_c7_8320] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l684_c7_8320_cond <= VAR_n8_MUX_uxn_opcodes_h_l684_c7_8320_cond;
     n8_MUX_uxn_opcodes_h_l684_c7_8320_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l684_c7_8320_iftrue;
     n8_MUX_uxn_opcodes_h_l684_c7_8320_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l684_c7_8320_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l684_c7_8320_return_output := n8_MUX_uxn_opcodes_h_l684_c7_8320_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l689_c7_5b9d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_5b9d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_5b9d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_5b9d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_5b9d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_5b9d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_5b9d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_5b9d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_5b9d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l689_c7_5b9d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_5b9d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_5b9d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_5b9d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_5b9d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_5b9d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_5b9d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_5b9d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_5b9d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l689_c7_5b9d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l689_c7_5b9d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l689_c7_5b9d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l689_c7_5b9d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l689_c7_5b9d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l689_c7_5b9d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l689_c7_5b9d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l689_c7_5b9d_return_output := result_u16_value_MUX_uxn_opcodes_h_l689_c7_5b9d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l676_c2_bbff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_bbff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_bbff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_bbff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_bbff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_bbff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_bbff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_bbff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_bbff_return_output;

     -- t16_MUX[uxn_opcodes_h_l684_c7_8320] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l684_c7_8320_cond <= VAR_t16_MUX_uxn_opcodes_h_l684_c7_8320_cond;
     t16_MUX_uxn_opcodes_h_l684_c7_8320_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l684_c7_8320_iftrue;
     t16_MUX_uxn_opcodes_h_l684_c7_8320_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l684_c7_8320_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l684_c7_8320_return_output := t16_MUX_uxn_opcodes_h_l684_c7_8320_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l689_c7_5b9d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_5b9d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_5b9d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_5b9d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_5b9d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_5b9d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_5b9d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_5b9d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_5b9d_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l681_c7_694f_iffalse := VAR_n8_MUX_uxn_opcodes_h_l684_c7_8320_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_8320_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_5b9d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_8320_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_5b9d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_8320_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_5b9d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_694f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_8320_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l684_c7_8320_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l689_c7_5b9d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l681_c7_694f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l684_c7_8320_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l684_c7_8320] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_8320_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_8320_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_8320_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_8320_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_8320_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_8320_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_8320_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_8320_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l681_c7_694f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_694f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_694f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_694f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_694f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_694f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_694f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_694f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_694f_return_output;

     -- n8_MUX[uxn_opcodes_h_l681_c7_694f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l681_c7_694f_cond <= VAR_n8_MUX_uxn_opcodes_h_l681_c7_694f_cond;
     n8_MUX_uxn_opcodes_h_l681_c7_694f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l681_c7_694f_iftrue;
     n8_MUX_uxn_opcodes_h_l681_c7_694f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l681_c7_694f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l681_c7_694f_return_output := n8_MUX_uxn_opcodes_h_l681_c7_694f_return_output;

     -- t16_MUX[uxn_opcodes_h_l681_c7_694f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l681_c7_694f_cond <= VAR_t16_MUX_uxn_opcodes_h_l681_c7_694f_cond;
     t16_MUX_uxn_opcodes_h_l681_c7_694f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l681_c7_694f_iftrue;
     t16_MUX_uxn_opcodes_h_l681_c7_694f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l681_c7_694f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l681_c7_694f_return_output := t16_MUX_uxn_opcodes_h_l681_c7_694f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l684_c7_8320] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_8320_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_8320_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_8320_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_8320_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_8320_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_8320_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_8320_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_8320_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l684_c7_8320] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l684_c7_8320_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l684_c7_8320_cond;
     result_u16_value_MUX_uxn_opcodes_h_l684_c7_8320_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l684_c7_8320_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l684_c7_8320_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l684_c7_8320_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l684_c7_8320_return_output := result_u16_value_MUX_uxn_opcodes_h_l684_c7_8320_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l684_c7_8320] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_8320_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_8320_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_8320_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_8320_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_8320_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_8320_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_8320_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_8320_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l676_c2_bbff_iffalse := VAR_n8_MUX_uxn_opcodes_h_l681_c7_694f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_694f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_8320_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_694f_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_8320_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_694f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_8320_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_bbff_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_694f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l681_c7_694f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l684_c7_8320_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l676_c2_bbff_iffalse := VAR_t16_MUX_uxn_opcodes_h_l681_c7_694f_return_output;
     -- t16_MUX[uxn_opcodes_h_l676_c2_bbff] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l676_c2_bbff_cond <= VAR_t16_MUX_uxn_opcodes_h_l676_c2_bbff_cond;
     t16_MUX_uxn_opcodes_h_l676_c2_bbff_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l676_c2_bbff_iftrue;
     t16_MUX_uxn_opcodes_h_l676_c2_bbff_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l676_c2_bbff_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l676_c2_bbff_return_output := t16_MUX_uxn_opcodes_h_l676_c2_bbff_return_output;

     -- n8_MUX[uxn_opcodes_h_l676_c2_bbff] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l676_c2_bbff_cond <= VAR_n8_MUX_uxn_opcodes_h_l676_c2_bbff_cond;
     n8_MUX_uxn_opcodes_h_l676_c2_bbff_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l676_c2_bbff_iftrue;
     n8_MUX_uxn_opcodes_h_l676_c2_bbff_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l676_c2_bbff_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l676_c2_bbff_return_output := n8_MUX_uxn_opcodes_h_l676_c2_bbff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l681_c7_694f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_694f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_694f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_694f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_694f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_694f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_694f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_694f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_694f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l676_c2_bbff] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_bbff_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_bbff_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_bbff_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_bbff_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_bbff_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_bbff_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_bbff_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_bbff_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l681_c7_694f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_694f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_694f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_694f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_694f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_694f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_694f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_694f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_694f_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l681_c7_694f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l681_c7_694f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l681_c7_694f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l681_c7_694f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l681_c7_694f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l681_c7_694f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l681_c7_694f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l681_c7_694f_return_output := result_u16_value_MUX_uxn_opcodes_h_l681_c7_694f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l681_c7_694f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_694f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_694f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_694f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_694f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_694f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_694f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_694f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_694f_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l676_c2_bbff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_bbff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_694f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_bbff_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_694f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_bbff_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_694f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c2_bbff_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l681_c7_694f_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l676_c2_bbff_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l676_c2_bbff] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l676_c2_bbff_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c2_bbff_cond;
     result_u16_value_MUX_uxn_opcodes_h_l676_c2_bbff_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c2_bbff_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l676_c2_bbff_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c2_bbff_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c2_bbff_return_output := result_u16_value_MUX_uxn_opcodes_h_l676_c2_bbff_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l676_c2_bbff] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_bbff_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_bbff_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_bbff_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_bbff_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_bbff_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_bbff_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_bbff_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_bbff_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l676_c2_bbff] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_bbff_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_bbff_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_bbff_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_bbff_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_bbff_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_bbff_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_bbff_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_bbff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l676_c2_bbff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_bbff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_bbff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_bbff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_bbff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_bbff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_bbff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_bbff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_bbff_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5d97_uxn_opcodes_h_l671_l705_DUPLICATE_042b LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5d97_uxn_opcodes_h_l671_l705_DUPLICATE_042b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5d97(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_bbff_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_bbff_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_bbff_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c2_bbff_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_bbff_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_bbff_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5d97_uxn_opcodes_h_l671_l705_DUPLICATE_042b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5d97_uxn_opcodes_h_l671_l705_DUPLICATE_042b_return_output;
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
