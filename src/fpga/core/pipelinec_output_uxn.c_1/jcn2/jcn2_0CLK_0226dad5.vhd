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
-- BIN_OP_EQ[uxn_opcodes_h_l676_c6_4743]
signal BIN_OP_EQ_uxn_opcodes_h_l676_c6_4743_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l676_c6_4743_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l676_c6_4743_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l676_c1_65de]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_65de_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_65de_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_65de_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_65de_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l676_c2_1e0b]
signal n8_MUX_uxn_opcodes_h_l676_c2_1e0b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l676_c2_1e0b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l676_c2_1e0b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l676_c2_1e0b]
signal t16_MUX_uxn_opcodes_h_l676_c2_1e0b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l676_c2_1e0b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l676_c2_1e0b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l676_c2_1e0b]
signal result_u16_value_MUX_uxn_opcodes_h_l676_c2_1e0b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l676_c2_1e0b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l676_c2_1e0b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l676_c2_1e0b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_1e0b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_1e0b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_1e0b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l676_c2_1e0b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_1e0b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_1e0b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_1e0b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l676_c2_1e0b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_1e0b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_1e0b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_1e0b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l676_c2_1e0b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_1e0b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_1e0b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_1e0b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l676_c2_1e0b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_1e0b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_1e0b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_1e0b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output : signed(3 downto 0);

-- printf_uxn_opcodes_h_l677_c3_688d[uxn_opcodes_h_l677_c3_688d]
signal printf_uxn_opcodes_h_l677_c3_688d_uxn_opcodes_h_l677_c3_688d_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l681_c11_b26e]
signal BIN_OP_EQ_uxn_opcodes_h_l681_c11_b26e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l681_c11_b26e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l681_c11_b26e_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l681_c7_58cc]
signal n8_MUX_uxn_opcodes_h_l681_c7_58cc_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l681_c7_58cc_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l681_c7_58cc_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l681_c7_58cc_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l681_c7_58cc]
signal t16_MUX_uxn_opcodes_h_l681_c7_58cc_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l681_c7_58cc_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l681_c7_58cc_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l681_c7_58cc_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l681_c7_58cc]
signal result_u16_value_MUX_uxn_opcodes_h_l681_c7_58cc_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l681_c7_58cc_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l681_c7_58cc_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l681_c7_58cc_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l681_c7_58cc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_58cc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_58cc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_58cc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_58cc_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l681_c7_58cc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_58cc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_58cc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_58cc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_58cc_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l681_c7_58cc]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_58cc_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_58cc_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_58cc_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_58cc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l681_c7_58cc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_58cc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_58cc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_58cc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_58cc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l681_c7_58cc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_58cc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_58cc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_58cc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_58cc_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l684_c11_bc07]
signal BIN_OP_EQ_uxn_opcodes_h_l684_c11_bc07_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l684_c11_bc07_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l684_c11_bc07_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l684_c7_b092]
signal n8_MUX_uxn_opcodes_h_l684_c7_b092_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l684_c7_b092_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l684_c7_b092_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l684_c7_b092_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l684_c7_b092]
signal t16_MUX_uxn_opcodes_h_l684_c7_b092_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l684_c7_b092_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l684_c7_b092_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l684_c7_b092_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l684_c7_b092]
signal result_u16_value_MUX_uxn_opcodes_h_l684_c7_b092_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l684_c7_b092_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l684_c7_b092_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l684_c7_b092_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l684_c7_b092]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_b092_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_b092_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_b092_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_b092_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l684_c7_b092]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_b092_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_b092_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_b092_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_b092_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l684_c7_b092]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_b092_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_b092_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_b092_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_b092_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l684_c7_b092]
signal result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_b092_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_b092_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_b092_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_b092_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l684_c7_b092]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_b092_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_b092_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_b092_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_b092_return_output : signed(3 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l686_c3_691b]
signal CONST_SL_8_uxn_opcodes_h_l686_c3_691b_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l686_c3_691b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l689_c11_989c]
signal BIN_OP_EQ_uxn_opcodes_h_l689_c11_989c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l689_c11_989c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l689_c11_989c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l689_c7_6a64]
signal n8_MUX_uxn_opcodes_h_l689_c7_6a64_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l689_c7_6a64_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l689_c7_6a64_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l689_c7_6a64_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l689_c7_6a64]
signal t16_MUX_uxn_opcodes_h_l689_c7_6a64_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l689_c7_6a64_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l689_c7_6a64_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l689_c7_6a64_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l689_c7_6a64]
signal result_u16_value_MUX_uxn_opcodes_h_l689_c7_6a64_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l689_c7_6a64_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l689_c7_6a64_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l689_c7_6a64_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l689_c7_6a64]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_6a64_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_6a64_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_6a64_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_6a64_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l689_c7_6a64]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_6a64_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_6a64_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_6a64_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_6a64_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l689_c7_6a64]
signal result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_6a64_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_6a64_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_6a64_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_6a64_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l689_c7_6a64]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_6a64_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_6a64_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_6a64_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_6a64_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l690_c3_3674]
signal BIN_OP_OR_uxn_opcodes_h_l690_c3_3674_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l690_c3_3674_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l690_c3_3674_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l692_c11_fc7b]
signal BIN_OP_EQ_uxn_opcodes_h_l692_c11_fc7b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l692_c11_fc7b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l692_c11_fc7b_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l692_c7_5a34]
signal n8_MUX_uxn_opcodes_h_l692_c7_5a34_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l692_c7_5a34_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l692_c7_5a34_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l692_c7_5a34_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l692_c7_5a34]
signal result_u16_value_MUX_uxn_opcodes_h_l692_c7_5a34_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l692_c7_5a34_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l692_c7_5a34_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l692_c7_5a34_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l692_c7_5a34]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5a34_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5a34_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5a34_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5a34_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l692_c7_5a34]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5a34_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5a34_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5a34_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5a34_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l692_c7_5a34]
signal result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5a34_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5a34_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5a34_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5a34_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l692_c7_5a34]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5a34_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5a34_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5a34_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5a34_return_output : signed(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l695_c30_8157]
signal sp_relative_shift_uxn_opcodes_h_l695_c30_8157_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l695_c30_8157_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l695_c30_8157_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l695_c30_8157_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l696_c26_3798]
signal BIN_OP_EQ_uxn_opcodes_h_l696_c26_3798_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l696_c26_3798_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l696_c26_3798_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l696_c26_9d32]
signal MUX_uxn_opcodes_h_l696_c26_9d32_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l696_c26_9d32_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l696_c26_9d32_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l696_c26_9d32_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l697_c22_08a2]
signal BIN_OP_EQ_uxn_opcodes_h_l697_c22_08a2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l697_c22_08a2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l697_c22_08a2_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l697_c22_d8bd]
signal MUX_uxn_opcodes_h_l697_c22_d8bd_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l697_c22_d8bd_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l697_c22_d8bd_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l697_c22_d8bd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l699_c11_7acb]
signal BIN_OP_EQ_uxn_opcodes_h_l699_c11_7acb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l699_c11_7acb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l699_c11_7acb_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l699_c7_3cfb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_3cfb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_3cfb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_3cfb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_3cfb_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l699_c7_3cfb]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_3cfb_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_3cfb_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_3cfb_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_3cfb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l699_c7_3cfb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_3cfb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_3cfb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_3cfb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_3cfb_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_6245( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l676_c6_4743
BIN_OP_EQ_uxn_opcodes_h_l676_c6_4743 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l676_c6_4743_left,
BIN_OP_EQ_uxn_opcodes_h_l676_c6_4743_right,
BIN_OP_EQ_uxn_opcodes_h_l676_c6_4743_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_65de
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_65de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_65de_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_65de_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_65de_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_65de_return_output);

-- n8_MUX_uxn_opcodes_h_l676_c2_1e0b
n8_MUX_uxn_opcodes_h_l676_c2_1e0b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l676_c2_1e0b_cond,
n8_MUX_uxn_opcodes_h_l676_c2_1e0b_iftrue,
n8_MUX_uxn_opcodes_h_l676_c2_1e0b_iffalse,
n8_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output);

-- t16_MUX_uxn_opcodes_h_l676_c2_1e0b
t16_MUX_uxn_opcodes_h_l676_c2_1e0b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l676_c2_1e0b_cond,
t16_MUX_uxn_opcodes_h_l676_c2_1e0b_iftrue,
t16_MUX_uxn_opcodes_h_l676_c2_1e0b_iffalse,
t16_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l676_c2_1e0b
result_u16_value_MUX_uxn_opcodes_h_l676_c2_1e0b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l676_c2_1e0b_cond,
result_u16_value_MUX_uxn_opcodes_h_l676_c2_1e0b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l676_c2_1e0b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_1e0b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_1e0b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_1e0b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_1e0b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_1e0b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_1e0b
result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_1e0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_1e0b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_1e0b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_1e0b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_1e0b
result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_1e0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_1e0b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_1e0b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_1e0b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_1e0b
result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_1e0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_1e0b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_1e0b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_1e0b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_1e0b
result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_1e0b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_1e0b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_1e0b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_1e0b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output);

-- printf_uxn_opcodes_h_l677_c3_688d_uxn_opcodes_h_l677_c3_688d
printf_uxn_opcodes_h_l677_c3_688d_uxn_opcodes_h_l677_c3_688d : entity work.printf_uxn_opcodes_h_l677_c3_688d_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l677_c3_688d_uxn_opcodes_h_l677_c3_688d_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l681_c11_b26e
BIN_OP_EQ_uxn_opcodes_h_l681_c11_b26e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l681_c11_b26e_left,
BIN_OP_EQ_uxn_opcodes_h_l681_c11_b26e_right,
BIN_OP_EQ_uxn_opcodes_h_l681_c11_b26e_return_output);

-- n8_MUX_uxn_opcodes_h_l681_c7_58cc
n8_MUX_uxn_opcodes_h_l681_c7_58cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l681_c7_58cc_cond,
n8_MUX_uxn_opcodes_h_l681_c7_58cc_iftrue,
n8_MUX_uxn_opcodes_h_l681_c7_58cc_iffalse,
n8_MUX_uxn_opcodes_h_l681_c7_58cc_return_output);

-- t16_MUX_uxn_opcodes_h_l681_c7_58cc
t16_MUX_uxn_opcodes_h_l681_c7_58cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l681_c7_58cc_cond,
t16_MUX_uxn_opcodes_h_l681_c7_58cc_iftrue,
t16_MUX_uxn_opcodes_h_l681_c7_58cc_iffalse,
t16_MUX_uxn_opcodes_h_l681_c7_58cc_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l681_c7_58cc
result_u16_value_MUX_uxn_opcodes_h_l681_c7_58cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l681_c7_58cc_cond,
result_u16_value_MUX_uxn_opcodes_h_l681_c7_58cc_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l681_c7_58cc_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l681_c7_58cc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_58cc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_58cc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_58cc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_58cc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_58cc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_58cc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_58cc
result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_58cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_58cc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_58cc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_58cc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_58cc_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_58cc
result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_58cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_58cc_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_58cc_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_58cc_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_58cc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_58cc
result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_58cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_58cc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_58cc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_58cc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_58cc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_58cc
result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_58cc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_58cc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_58cc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_58cc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_58cc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l684_c11_bc07
BIN_OP_EQ_uxn_opcodes_h_l684_c11_bc07 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l684_c11_bc07_left,
BIN_OP_EQ_uxn_opcodes_h_l684_c11_bc07_right,
BIN_OP_EQ_uxn_opcodes_h_l684_c11_bc07_return_output);

-- n8_MUX_uxn_opcodes_h_l684_c7_b092
n8_MUX_uxn_opcodes_h_l684_c7_b092 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l684_c7_b092_cond,
n8_MUX_uxn_opcodes_h_l684_c7_b092_iftrue,
n8_MUX_uxn_opcodes_h_l684_c7_b092_iffalse,
n8_MUX_uxn_opcodes_h_l684_c7_b092_return_output);

-- t16_MUX_uxn_opcodes_h_l684_c7_b092
t16_MUX_uxn_opcodes_h_l684_c7_b092 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l684_c7_b092_cond,
t16_MUX_uxn_opcodes_h_l684_c7_b092_iftrue,
t16_MUX_uxn_opcodes_h_l684_c7_b092_iffalse,
t16_MUX_uxn_opcodes_h_l684_c7_b092_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l684_c7_b092
result_u16_value_MUX_uxn_opcodes_h_l684_c7_b092 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l684_c7_b092_cond,
result_u16_value_MUX_uxn_opcodes_h_l684_c7_b092_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l684_c7_b092_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l684_c7_b092_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_b092
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_b092 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_b092_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_b092_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_b092_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_b092_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_b092
result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_b092 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_b092_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_b092_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_b092_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_b092_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_b092
result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_b092 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_b092_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_b092_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_b092_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_b092_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_b092
result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_b092 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_b092_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_b092_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_b092_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_b092_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_b092
result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_b092 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_b092_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_b092_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_b092_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_b092_return_output);

-- CONST_SL_8_uxn_opcodes_h_l686_c3_691b
CONST_SL_8_uxn_opcodes_h_l686_c3_691b : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l686_c3_691b_x,
CONST_SL_8_uxn_opcodes_h_l686_c3_691b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l689_c11_989c
BIN_OP_EQ_uxn_opcodes_h_l689_c11_989c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l689_c11_989c_left,
BIN_OP_EQ_uxn_opcodes_h_l689_c11_989c_right,
BIN_OP_EQ_uxn_opcodes_h_l689_c11_989c_return_output);

-- n8_MUX_uxn_opcodes_h_l689_c7_6a64
n8_MUX_uxn_opcodes_h_l689_c7_6a64 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l689_c7_6a64_cond,
n8_MUX_uxn_opcodes_h_l689_c7_6a64_iftrue,
n8_MUX_uxn_opcodes_h_l689_c7_6a64_iffalse,
n8_MUX_uxn_opcodes_h_l689_c7_6a64_return_output);

-- t16_MUX_uxn_opcodes_h_l689_c7_6a64
t16_MUX_uxn_opcodes_h_l689_c7_6a64 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l689_c7_6a64_cond,
t16_MUX_uxn_opcodes_h_l689_c7_6a64_iftrue,
t16_MUX_uxn_opcodes_h_l689_c7_6a64_iffalse,
t16_MUX_uxn_opcodes_h_l689_c7_6a64_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l689_c7_6a64
result_u16_value_MUX_uxn_opcodes_h_l689_c7_6a64 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l689_c7_6a64_cond,
result_u16_value_MUX_uxn_opcodes_h_l689_c7_6a64_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l689_c7_6a64_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l689_c7_6a64_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_6a64
result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_6a64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_6a64_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_6a64_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_6a64_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_6a64_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_6a64
result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_6a64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_6a64_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_6a64_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_6a64_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_6a64_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_6a64
result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_6a64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_6a64_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_6a64_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_6a64_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_6a64_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_6a64
result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_6a64 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_6a64_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_6a64_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_6a64_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_6a64_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l690_c3_3674
BIN_OP_OR_uxn_opcodes_h_l690_c3_3674 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l690_c3_3674_left,
BIN_OP_OR_uxn_opcodes_h_l690_c3_3674_right,
BIN_OP_OR_uxn_opcodes_h_l690_c3_3674_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l692_c11_fc7b
BIN_OP_EQ_uxn_opcodes_h_l692_c11_fc7b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l692_c11_fc7b_left,
BIN_OP_EQ_uxn_opcodes_h_l692_c11_fc7b_right,
BIN_OP_EQ_uxn_opcodes_h_l692_c11_fc7b_return_output);

-- n8_MUX_uxn_opcodes_h_l692_c7_5a34
n8_MUX_uxn_opcodes_h_l692_c7_5a34 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l692_c7_5a34_cond,
n8_MUX_uxn_opcodes_h_l692_c7_5a34_iftrue,
n8_MUX_uxn_opcodes_h_l692_c7_5a34_iffalse,
n8_MUX_uxn_opcodes_h_l692_c7_5a34_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l692_c7_5a34
result_u16_value_MUX_uxn_opcodes_h_l692_c7_5a34 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l692_c7_5a34_cond,
result_u16_value_MUX_uxn_opcodes_h_l692_c7_5a34_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l692_c7_5a34_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l692_c7_5a34_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5a34
result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5a34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5a34_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5a34_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5a34_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5a34_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5a34
result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5a34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5a34_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5a34_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5a34_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5a34_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5a34
result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5a34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5a34_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5a34_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5a34_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5a34_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5a34
result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5a34 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5a34_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5a34_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5a34_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5a34_return_output);

-- sp_relative_shift_uxn_opcodes_h_l695_c30_8157
sp_relative_shift_uxn_opcodes_h_l695_c30_8157 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l695_c30_8157_ins,
sp_relative_shift_uxn_opcodes_h_l695_c30_8157_x,
sp_relative_shift_uxn_opcodes_h_l695_c30_8157_y,
sp_relative_shift_uxn_opcodes_h_l695_c30_8157_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l696_c26_3798
BIN_OP_EQ_uxn_opcodes_h_l696_c26_3798 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l696_c26_3798_left,
BIN_OP_EQ_uxn_opcodes_h_l696_c26_3798_right,
BIN_OP_EQ_uxn_opcodes_h_l696_c26_3798_return_output);

-- MUX_uxn_opcodes_h_l696_c26_9d32
MUX_uxn_opcodes_h_l696_c26_9d32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l696_c26_9d32_cond,
MUX_uxn_opcodes_h_l696_c26_9d32_iftrue,
MUX_uxn_opcodes_h_l696_c26_9d32_iffalse,
MUX_uxn_opcodes_h_l696_c26_9d32_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l697_c22_08a2
BIN_OP_EQ_uxn_opcodes_h_l697_c22_08a2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l697_c22_08a2_left,
BIN_OP_EQ_uxn_opcodes_h_l697_c22_08a2_right,
BIN_OP_EQ_uxn_opcodes_h_l697_c22_08a2_return_output);

-- MUX_uxn_opcodes_h_l697_c22_d8bd
MUX_uxn_opcodes_h_l697_c22_d8bd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l697_c22_d8bd_cond,
MUX_uxn_opcodes_h_l697_c22_d8bd_iftrue,
MUX_uxn_opcodes_h_l697_c22_d8bd_iffalse,
MUX_uxn_opcodes_h_l697_c22_d8bd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l699_c11_7acb
BIN_OP_EQ_uxn_opcodes_h_l699_c11_7acb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l699_c11_7acb_left,
BIN_OP_EQ_uxn_opcodes_h_l699_c11_7acb_right,
BIN_OP_EQ_uxn_opcodes_h_l699_c11_7acb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_3cfb
result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_3cfb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_3cfb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_3cfb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_3cfb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_3cfb_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_3cfb
result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_3cfb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_3cfb_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_3cfb_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_3cfb_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_3cfb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_3cfb
result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_3cfb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_3cfb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_3cfb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_3cfb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_3cfb_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l676_c6_4743_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_65de_return_output,
 n8_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output,
 t16_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l681_c11_b26e_return_output,
 n8_MUX_uxn_opcodes_h_l681_c7_58cc_return_output,
 t16_MUX_uxn_opcodes_h_l681_c7_58cc_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l681_c7_58cc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_58cc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_58cc_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_58cc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_58cc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_58cc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l684_c11_bc07_return_output,
 n8_MUX_uxn_opcodes_h_l684_c7_b092_return_output,
 t16_MUX_uxn_opcodes_h_l684_c7_b092_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l684_c7_b092_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_b092_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_b092_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_b092_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_b092_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_b092_return_output,
 CONST_SL_8_uxn_opcodes_h_l686_c3_691b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l689_c11_989c_return_output,
 n8_MUX_uxn_opcodes_h_l689_c7_6a64_return_output,
 t16_MUX_uxn_opcodes_h_l689_c7_6a64_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l689_c7_6a64_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_6a64_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_6a64_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_6a64_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_6a64_return_output,
 BIN_OP_OR_uxn_opcodes_h_l690_c3_3674_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l692_c11_fc7b_return_output,
 n8_MUX_uxn_opcodes_h_l692_c7_5a34_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l692_c7_5a34_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5a34_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5a34_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5a34_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5a34_return_output,
 sp_relative_shift_uxn_opcodes_h_l695_c30_8157_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l696_c26_3798_return_output,
 MUX_uxn_opcodes_h_l696_c26_9d32_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l697_c22_08a2_return_output,
 MUX_uxn_opcodes_h_l697_c22_d8bd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l699_c11_7acb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_3cfb_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_3cfb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_3cfb_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_4743_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_4743_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_4743_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_65de_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_65de_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_65de_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_65de_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l676_c2_1e0b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l676_c2_1e0b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l681_c7_58cc_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l676_c2_1e0b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l676_c2_1e0b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l676_c2_1e0b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l681_c7_58cc_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l676_c2_1e0b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c2_1e0b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c2_1e0b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l681_c7_58cc_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c2_1e0b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_1e0b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l678_c3_ebaf : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_1e0b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_58cc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_1e0b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_1e0b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_1e0b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_58cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_1e0b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_1e0b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_1e0b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_58cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_1e0b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_1e0b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_1e0b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_58cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_1e0b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_1e0b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_1e0b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_58cc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_1e0b_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l677_c3_688d_uxn_opcodes_h_l677_c3_688d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_b26e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_b26e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_b26e_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l681_c7_58cc_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l681_c7_58cc_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l684_c7_b092_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l681_c7_58cc_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l681_c7_58cc_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l681_c7_58cc_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l684_c7_b092_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l681_c7_58cc_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l681_c7_58cc_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l681_c7_58cc_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l684_c7_b092_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l681_c7_58cc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_58cc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l682_c3_bbf1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_58cc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_b092_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_58cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_58cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_58cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_b092_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_58cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_58cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_58cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_b092_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_58cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_58cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_58cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_b092_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_58cc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_58cc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_58cc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_b092_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_58cc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_bc07_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_bc07_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_bc07_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l684_c7_b092_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l684_c7_b092_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l689_c7_6a64_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l684_c7_b092_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l684_c7_b092_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l684_c7_b092_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l689_c7_6a64_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l684_c7_b092_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l684_c7_b092_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l684_c7_b092_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l689_c7_6a64_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l684_c7_b092_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_b092_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l687_c3_7d0c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_b092_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l684_c7_b092_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_b092_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_b092_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_b092_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_6a64_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_b092_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_b092_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_b092_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_6a64_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_b092_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_b092_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_b092_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_6a64_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_b092_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_b092_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_b092_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_6a64_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_b092_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l686_c3_691b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l686_c3_691b_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_989c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_989c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_989c_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l689_c7_6a64_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l689_c7_6a64_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l692_c7_5a34_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l689_c7_6a64_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l689_c7_6a64_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l689_c7_6a64_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l689_c7_6a64_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l689_c7_6a64_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l689_c7_6a64_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l692_c7_5a34_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l689_c7_6a64_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_6a64_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_6a64_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5a34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_6a64_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_6a64_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_6a64_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5a34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_6a64_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_6a64_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_6a64_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5a34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_6a64_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_6a64_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_6a64_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5a34_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_6a64_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l690_c3_3674_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l690_c3_3674_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l690_c3_3674_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_fc7b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_fc7b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_fc7b_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l692_c7_5a34_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l692_c7_5a34_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l692_c7_5a34_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l692_c7_5a34_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l692_c7_5a34_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l692_c7_5a34_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5a34_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5a34_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_3cfb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5a34_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5a34_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5a34_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_3cfb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5a34_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5a34_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5a34_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_3cfb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5a34_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5a34_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5a34_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5a34_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l695_c30_8157_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l695_c30_8157_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l695_c30_8157_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l695_c30_8157_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l696_c26_9d32_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l696_c26_9d32_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l696_c26_9d32_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c26_3798_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c26_3798_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c26_3798_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l696_c26_9d32_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l697_c22_d8bd_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l697_c22_d8bd_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l697_c22_d8bd_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c22_08a2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c22_08a2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c22_08a2_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l697_c22_d8bd_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_7acb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_7acb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_7acb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_3cfb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_3cfb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_3cfb_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_3cfb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_3cfb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_3cfb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_3cfb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_3cfb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_3cfb_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l676_l692_l689_l684_l681_DUPLICATE_7032_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l676_l699_l689_l684_l681_DUPLICATE_da87_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l676_l699_l689_l684_l681_DUPLICATE_4738_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l676_l692_l689_l684_l681_DUPLICATE_79f9_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l699_l692_l689_l684_l681_DUPLICATE_c611_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l685_l690_DUPLICATE_d586_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6245_uxn_opcodes_h_l705_l671_DUPLICATE_5c21_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_3cfb_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l687_c3_7d0c := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_b092_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l687_c3_7d0c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_b26e_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_3cfb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_7acb_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_bc07_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c22_08a2_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l682_c3_bbf1 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_58cc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l682_c3_bbf1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c26_3798_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_65de_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l696_c26_9d32_iffalse := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l696_c26_9d32_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_1e0b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_4743_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l695_c30_8157_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_fc7b_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_989c_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l678_c3_ebaf := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_1e0b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l678_c3_ebaf;
     VAR_sp_relative_shift_uxn_opcodes_h_l695_c30_8157_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_MUX_uxn_opcodes_h_l697_c22_d8bd_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5a34_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_3cfb_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_65de_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l695_c30_8157_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l676_c2_1e0b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l681_c7_58cc_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l684_c7_b092_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l689_c7_6a64_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l692_c7_5a34_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_4743_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_b26e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_bc07_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_989c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_fc7b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_7acb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c26_3798_left := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c22_08a2_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l692_c7_5a34_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l690_c3_3674_left := t16;
     VAR_MUX_uxn_opcodes_h_l697_c22_d8bd_iffalse := t16;
     VAR_t16_MUX_uxn_opcodes_h_l676_c2_1e0b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l681_c7_58cc_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l689_c7_6a64_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l697_c22_08a2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l697_c22_08a2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c22_08a2_left;
     BIN_OP_EQ_uxn_opcodes_h_l697_c22_08a2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c22_08a2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c22_08a2_return_output := BIN_OP_EQ_uxn_opcodes_h_l697_c22_08a2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l699_l692_l689_l684_l681_DUPLICATE_c611 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l699_l692_l689_l684_l681_DUPLICATE_c611_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l692_c11_fc7b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l692_c11_fc7b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_fc7b_left;
     BIN_OP_EQ_uxn_opcodes_h_l692_c11_fc7b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_fc7b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_fc7b_return_output := BIN_OP_EQ_uxn_opcodes_h_l692_c11_fc7b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l676_l699_l689_l684_l681_DUPLICATE_da87 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l676_l699_l689_l684_l681_DUPLICATE_da87_return_output := result.is_sp_shift;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l684_c7_b092] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l684_c7_b092_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l699_c11_7acb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l699_c11_7acb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_7acb_left;
     BIN_OP_EQ_uxn_opcodes_h_l699_c11_7acb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_7acb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_7acb_return_output := BIN_OP_EQ_uxn_opcodes_h_l699_c11_7acb_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l676_l699_l689_l684_l681_DUPLICATE_4738 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l676_l699_l689_l684_l681_DUPLICATE_4738_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l684_c11_bc07] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l684_c11_bc07_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_bc07_left;
     BIN_OP_EQ_uxn_opcodes_h_l684_c11_bc07_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_bc07_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_bc07_return_output := BIN_OP_EQ_uxn_opcodes_h_l684_c11_bc07_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l695_c30_8157] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l695_c30_8157_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l695_c30_8157_ins;
     sp_relative_shift_uxn_opcodes_h_l695_c30_8157_x <= VAR_sp_relative_shift_uxn_opcodes_h_l695_c30_8157_x;
     sp_relative_shift_uxn_opcodes_h_l695_c30_8157_y <= VAR_sp_relative_shift_uxn_opcodes_h_l695_c30_8157_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l695_c30_8157_return_output := sp_relative_shift_uxn_opcodes_h_l695_c30_8157_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l676_l692_l689_l684_l681_DUPLICATE_79f9 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l676_l692_l689_l684_l681_DUPLICATE_79f9_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l676_c6_4743] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l676_c6_4743_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_4743_left;
     BIN_OP_EQ_uxn_opcodes_h_l676_c6_4743_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_4743_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_4743_return_output := BIN_OP_EQ_uxn_opcodes_h_l676_c6_4743_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l685_l690_DUPLICATE_d586 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l685_l690_DUPLICATE_d586_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l681_c11_b26e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l681_c11_b26e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_b26e_left;
     BIN_OP_EQ_uxn_opcodes_h_l681_c11_b26e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_b26e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_b26e_return_output := BIN_OP_EQ_uxn_opcodes_h_l681_c11_b26e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l689_c11_989c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l689_c11_989c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_989c_left;
     BIN_OP_EQ_uxn_opcodes_h_l689_c11_989c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_989c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_989c_return_output := BIN_OP_EQ_uxn_opcodes_h_l689_c11_989c_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l676_l692_l689_l684_l681_DUPLICATE_7032 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l676_l692_l689_l684_l681_DUPLICATE_7032_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l696_c26_3798] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l696_c26_3798_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c26_3798_left;
     BIN_OP_EQ_uxn_opcodes_h_l696_c26_3798_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c26_3798_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c26_3798_return_output := BIN_OP_EQ_uxn_opcodes_h_l696_c26_3798_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_65de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_4743_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l676_c2_1e0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_4743_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_1e0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_4743_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_1e0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_4743_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_1e0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_4743_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_1e0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_4743_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_1e0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_4743_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c2_1e0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_4743_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l676_c2_1e0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_4743_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l681_c7_58cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_b26e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_58cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_b26e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_58cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_b26e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_58cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_b26e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_58cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_b26e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_58cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_b26e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l681_c7_58cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_b26e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l681_c7_58cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c11_b26e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l684_c7_b092_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_bc07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_b092_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_bc07_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_b092_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_bc07_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_b092_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_bc07_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_b092_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_bc07_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_b092_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_bc07_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l684_c7_b092_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_bc07_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l684_c7_b092_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_bc07_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l689_c7_6a64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_989c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_6a64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_989c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_6a64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_989c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_6a64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_989c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_6a64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_989c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l689_c7_6a64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_989c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l689_c7_6a64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l689_c11_989c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l692_c7_5a34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_fc7b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5a34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_fc7b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5a34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_fc7b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5a34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_fc7b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5a34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_fc7b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l692_c7_5a34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_fc7b_return_output;
     VAR_MUX_uxn_opcodes_h_l696_c26_9d32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l696_c26_3798_return_output;
     VAR_MUX_uxn_opcodes_h_l697_c22_d8bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c22_08a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_3cfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_7acb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_3cfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_7acb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_3cfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l699_c11_7acb_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l690_c3_3674_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l685_l690_DUPLICATE_d586_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l686_c3_691b_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l685_l690_DUPLICATE_d586_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_1e0b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l676_l692_l689_l684_l681_DUPLICATE_79f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_58cc_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l676_l692_l689_l684_l681_DUPLICATE_79f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_b092_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l676_l692_l689_l684_l681_DUPLICATE_79f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_6a64_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l676_l692_l689_l684_l681_DUPLICATE_79f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5a34_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l676_l692_l689_l684_l681_DUPLICATE_79f9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c2_1e0b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l676_l692_l689_l684_l681_DUPLICATE_7032_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l681_c7_58cc_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l676_l692_l689_l684_l681_DUPLICATE_7032_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l684_c7_b092_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l676_l692_l689_l684_l681_DUPLICATE_7032_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l689_c7_6a64_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l676_l692_l689_l684_l681_DUPLICATE_7032_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l692_c7_5a34_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l676_l692_l689_l684_l681_DUPLICATE_7032_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_58cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l699_l692_l689_l684_l681_DUPLICATE_c611_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_b092_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l699_l692_l689_l684_l681_DUPLICATE_c611_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_6a64_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l699_l692_l689_l684_l681_DUPLICATE_c611_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5a34_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l699_l692_l689_l684_l681_DUPLICATE_c611_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_3cfb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l699_l692_l689_l684_l681_DUPLICATE_c611_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_1e0b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l676_l699_l689_l684_l681_DUPLICATE_4738_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_58cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l676_l699_l689_l684_l681_DUPLICATE_4738_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_b092_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l676_l699_l689_l684_l681_DUPLICATE_4738_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_6a64_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l676_l699_l689_l684_l681_DUPLICATE_4738_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_3cfb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l676_l699_l689_l684_l681_DUPLICATE_4738_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_1e0b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l676_l699_l689_l684_l681_DUPLICATE_da87_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_58cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l676_l699_l689_l684_l681_DUPLICATE_da87_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_b092_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l676_l699_l689_l684_l681_DUPLICATE_da87_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_6a64_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l676_l699_l689_l684_l681_DUPLICATE_da87_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_3cfb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l676_l699_l689_l684_l681_DUPLICATE_da87_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_b092_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l684_c7_b092_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5a34_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l695_c30_8157_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l690_c3_3674] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l690_c3_3674_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l690_c3_3674_left;
     BIN_OP_OR_uxn_opcodes_h_l690_c3_3674_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l690_c3_3674_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l690_c3_3674_return_output := BIN_OP_OR_uxn_opcodes_h_l690_c3_3674_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l684_c7_b092] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_b092_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_b092_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_b092_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_b092_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_b092_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_b092_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_b092_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_b092_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l686_c3_691b] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l686_c3_691b_x <= VAR_CONST_SL_8_uxn_opcodes_h_l686_c3_691b_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l686_c3_691b_return_output := CONST_SL_8_uxn_opcodes_h_l686_c3_691b_return_output;

     -- MUX[uxn_opcodes_h_l696_c26_9d32] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l696_c26_9d32_cond <= VAR_MUX_uxn_opcodes_h_l696_c26_9d32_cond;
     MUX_uxn_opcodes_h_l696_c26_9d32_iftrue <= VAR_MUX_uxn_opcodes_h_l696_c26_9d32_iftrue;
     MUX_uxn_opcodes_h_l696_c26_9d32_iffalse <= VAR_MUX_uxn_opcodes_h_l696_c26_9d32_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l696_c26_9d32_return_output := MUX_uxn_opcodes_h_l696_c26_9d32_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l692_c7_5a34] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5a34_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5a34_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5a34_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5a34_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5a34_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5a34_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5a34_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5a34_return_output;

     -- MUX[uxn_opcodes_h_l697_c22_d8bd] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l697_c22_d8bd_cond <= VAR_MUX_uxn_opcodes_h_l697_c22_d8bd_cond;
     MUX_uxn_opcodes_h_l697_c22_d8bd_iftrue <= VAR_MUX_uxn_opcodes_h_l697_c22_d8bd_iftrue;
     MUX_uxn_opcodes_h_l697_c22_d8bd_iffalse <= VAR_MUX_uxn_opcodes_h_l697_c22_d8bd_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l697_c22_d8bd_return_output := MUX_uxn_opcodes_h_l697_c22_d8bd_return_output;

     -- n8_MUX[uxn_opcodes_h_l692_c7_5a34] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l692_c7_5a34_cond <= VAR_n8_MUX_uxn_opcodes_h_l692_c7_5a34_cond;
     n8_MUX_uxn_opcodes_h_l692_c7_5a34_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l692_c7_5a34_iftrue;
     n8_MUX_uxn_opcodes_h_l692_c7_5a34_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l692_c7_5a34_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l692_c7_5a34_return_output := n8_MUX_uxn_opcodes_h_l692_c7_5a34_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l699_c7_3cfb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_3cfb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_3cfb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_3cfb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_3cfb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_3cfb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_3cfb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_3cfb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_3cfb_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l699_c7_3cfb] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_3cfb_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_3cfb_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_3cfb_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_3cfb_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_3cfb_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_3cfb_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_3cfb_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_3cfb_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l676_c1_65de] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_65de_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_65de_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_65de_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_65de_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_65de_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_65de_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_65de_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_65de_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l699_c7_3cfb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_3cfb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_3cfb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_3cfb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_3cfb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_3cfb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_3cfb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_3cfb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_3cfb_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l689_c7_6a64_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l690_c3_3674_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l684_c7_b092_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l686_c3_691b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5a34_iftrue := VAR_MUX_uxn_opcodes_h_l696_c26_9d32_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l692_c7_5a34_iftrue := VAR_MUX_uxn_opcodes_h_l697_c22_d8bd_return_output;
     VAR_printf_uxn_opcodes_h_l677_c3_688d_uxn_opcodes_h_l677_c3_688d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_65de_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l689_c7_6a64_iffalse := VAR_n8_MUX_uxn_opcodes_h_l692_c7_5a34_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5a34_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l699_c7_3cfb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5a34_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l699_c7_3cfb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5a34_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l699_c7_3cfb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_6a64_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5a34_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_58cc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_b092_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l681_c7_58cc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_58cc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_58cc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_58cc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_58cc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_58cc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_58cc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_58cc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_58cc_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l692_c7_5a34] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l692_c7_5a34_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l692_c7_5a34_cond;
     result_u16_value_MUX_uxn_opcodes_h_l692_c7_5a34_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l692_c7_5a34_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l692_c7_5a34_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l692_c7_5a34_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l692_c7_5a34_return_output := result_u16_value_MUX_uxn_opcodes_h_l692_c7_5a34_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l689_c7_6a64] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_6a64_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_6a64_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_6a64_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_6a64_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_6a64_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_6a64_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_6a64_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_6a64_return_output;

     -- t16_MUX[uxn_opcodes_h_l689_c7_6a64] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l689_c7_6a64_cond <= VAR_t16_MUX_uxn_opcodes_h_l689_c7_6a64_cond;
     t16_MUX_uxn_opcodes_h_l689_c7_6a64_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l689_c7_6a64_iftrue;
     t16_MUX_uxn_opcodes_h_l689_c7_6a64_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l689_c7_6a64_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l689_c7_6a64_return_output := t16_MUX_uxn_opcodes_h_l689_c7_6a64_return_output;

     -- n8_MUX[uxn_opcodes_h_l689_c7_6a64] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l689_c7_6a64_cond <= VAR_n8_MUX_uxn_opcodes_h_l689_c7_6a64_cond;
     n8_MUX_uxn_opcodes_h_l689_c7_6a64_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l689_c7_6a64_iftrue;
     n8_MUX_uxn_opcodes_h_l689_c7_6a64_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l689_c7_6a64_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l689_c7_6a64_return_output := n8_MUX_uxn_opcodes_h_l689_c7_6a64_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l692_c7_5a34] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5a34_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5a34_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5a34_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5a34_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5a34_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5a34_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5a34_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5a34_return_output;

     -- printf_uxn_opcodes_h_l677_c3_688d[uxn_opcodes_h_l677_c3_688d] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l677_c3_688d_uxn_opcodes_h_l677_c3_688d_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l677_c3_688d_uxn_opcodes_h_l677_c3_688d_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l692_c7_5a34] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5a34_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5a34_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5a34_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5a34_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5a34_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5a34_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5a34_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5a34_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l692_c7_5a34] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5a34_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5a34_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5a34_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5a34_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5a34_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5a34_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5a34_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5a34_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l684_c7_b092_iffalse := VAR_n8_MUX_uxn_opcodes_h_l689_c7_6a64_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_6a64_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5a34_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_6a64_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5a34_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_6a64_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5a34_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_b092_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l689_c7_6a64_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_1e0b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c7_58cc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l689_c7_6a64_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l692_c7_5a34_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l684_c7_b092_iffalse := VAR_t16_MUX_uxn_opcodes_h_l689_c7_6a64_return_output;
     -- n8_MUX[uxn_opcodes_h_l684_c7_b092] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l684_c7_b092_cond <= VAR_n8_MUX_uxn_opcodes_h_l684_c7_b092_cond;
     n8_MUX_uxn_opcodes_h_l684_c7_b092_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l684_c7_b092_iftrue;
     n8_MUX_uxn_opcodes_h_l684_c7_b092_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l684_c7_b092_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l684_c7_b092_return_output := n8_MUX_uxn_opcodes_h_l684_c7_b092_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l684_c7_b092] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_b092_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_b092_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_b092_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_b092_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_b092_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_b092_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_b092_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_b092_return_output;

     -- t16_MUX[uxn_opcodes_h_l684_c7_b092] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l684_c7_b092_cond <= VAR_t16_MUX_uxn_opcodes_h_l684_c7_b092_cond;
     t16_MUX_uxn_opcodes_h_l684_c7_b092_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l684_c7_b092_iftrue;
     t16_MUX_uxn_opcodes_h_l684_c7_b092_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l684_c7_b092_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l684_c7_b092_return_output := t16_MUX_uxn_opcodes_h_l684_c7_b092_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l676_c2_1e0b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_1e0b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_1e0b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_1e0b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_1e0b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_1e0b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_1e0b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l689_c7_6a64] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_6a64_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_6a64_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_6a64_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_6a64_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_6a64_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_6a64_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_6a64_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_6a64_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l689_c7_6a64] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_6a64_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_6a64_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_6a64_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_6a64_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_6a64_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_6a64_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_6a64_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_6a64_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l689_c7_6a64] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l689_c7_6a64_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l689_c7_6a64_cond;
     result_u16_value_MUX_uxn_opcodes_h_l689_c7_6a64_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l689_c7_6a64_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l689_c7_6a64_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l689_c7_6a64_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l689_c7_6a64_return_output := result_u16_value_MUX_uxn_opcodes_h_l689_c7_6a64_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l689_c7_6a64] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_6a64_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_6a64_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_6a64_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_6a64_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_6a64_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_6a64_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_6a64_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_6a64_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l681_c7_58cc_iffalse := VAR_n8_MUX_uxn_opcodes_h_l684_c7_b092_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_b092_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l689_c7_6a64_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_b092_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l689_c7_6a64_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_b092_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l689_c7_6a64_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_58cc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_b092_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l684_c7_b092_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l689_c7_6a64_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l681_c7_58cc_iffalse := VAR_t16_MUX_uxn_opcodes_h_l684_c7_b092_return_output;
     -- n8_MUX[uxn_opcodes_h_l681_c7_58cc] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l681_c7_58cc_cond <= VAR_n8_MUX_uxn_opcodes_h_l681_c7_58cc_cond;
     n8_MUX_uxn_opcodes_h_l681_c7_58cc_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l681_c7_58cc_iftrue;
     n8_MUX_uxn_opcodes_h_l681_c7_58cc_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l681_c7_58cc_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l681_c7_58cc_return_output := n8_MUX_uxn_opcodes_h_l681_c7_58cc_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l684_c7_b092] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l684_c7_b092_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l684_c7_b092_cond;
     result_u16_value_MUX_uxn_opcodes_h_l684_c7_b092_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l684_c7_b092_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l684_c7_b092_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l684_c7_b092_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l684_c7_b092_return_output := result_u16_value_MUX_uxn_opcodes_h_l684_c7_b092_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l684_c7_b092] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_b092_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_b092_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_b092_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_b092_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_b092_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_b092_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_b092_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_b092_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l681_c7_58cc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_58cc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_58cc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_58cc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_58cc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_58cc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_58cc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_58cc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_58cc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l684_c7_b092] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_b092_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_b092_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_b092_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_b092_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_b092_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_b092_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_b092_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_b092_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l684_c7_b092] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_b092_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_b092_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_b092_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_b092_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_b092_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_b092_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_b092_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_b092_return_output;

     -- t16_MUX[uxn_opcodes_h_l681_c7_58cc] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l681_c7_58cc_cond <= VAR_t16_MUX_uxn_opcodes_h_l681_c7_58cc_cond;
     t16_MUX_uxn_opcodes_h_l681_c7_58cc_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l681_c7_58cc_iftrue;
     t16_MUX_uxn_opcodes_h_l681_c7_58cc_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l681_c7_58cc_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l681_c7_58cc_return_output := t16_MUX_uxn_opcodes_h_l681_c7_58cc_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l676_c2_1e0b_iffalse := VAR_n8_MUX_uxn_opcodes_h_l681_c7_58cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_58cc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_b092_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_58cc_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l684_c7_b092_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_58cc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_b092_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_1e0b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c7_58cc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l681_c7_58cc_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l684_c7_b092_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l676_c2_1e0b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l681_c7_58cc_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l681_c7_58cc] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l681_c7_58cc_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l681_c7_58cc_cond;
     result_u16_value_MUX_uxn_opcodes_h_l681_c7_58cc_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l681_c7_58cc_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l681_c7_58cc_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l681_c7_58cc_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l681_c7_58cc_return_output := result_u16_value_MUX_uxn_opcodes_h_l681_c7_58cc_return_output;

     -- n8_MUX[uxn_opcodes_h_l676_c2_1e0b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l676_c2_1e0b_cond <= VAR_n8_MUX_uxn_opcodes_h_l676_c2_1e0b_cond;
     n8_MUX_uxn_opcodes_h_l676_c2_1e0b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l676_c2_1e0b_iftrue;
     n8_MUX_uxn_opcodes_h_l676_c2_1e0b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l676_c2_1e0b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output := n8_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l681_c7_58cc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_58cc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_58cc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_58cc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_58cc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_58cc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_58cc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_58cc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_58cc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l681_c7_58cc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_58cc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_58cc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_58cc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_58cc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_58cc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_58cc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_58cc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_58cc_return_output;

     -- t16_MUX[uxn_opcodes_h_l676_c2_1e0b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l676_c2_1e0b_cond <= VAR_t16_MUX_uxn_opcodes_h_l676_c2_1e0b_cond;
     t16_MUX_uxn_opcodes_h_l676_c2_1e0b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l676_c2_1e0b_iftrue;
     t16_MUX_uxn_opcodes_h_l676_c2_1e0b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l676_c2_1e0b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output := t16_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l681_c7_58cc] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_58cc_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_58cc_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_58cc_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_58cc_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_58cc_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_58cc_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_58cc_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_58cc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l676_c2_1e0b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_1e0b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_1e0b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_1e0b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_1e0b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_1e0b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_1e0b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_1e0b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c7_58cc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_1e0b_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c7_58cc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_1e0b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c7_58cc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c2_1e0b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l681_c7_58cc_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l676_c2_1e0b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_1e0b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_1e0b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_1e0b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_1e0b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_1e0b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_1e0b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l676_c2_1e0b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_1e0b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_1e0b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_1e0b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_1e0b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_1e0b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_1e0b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l676_c2_1e0b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_1e0b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_1e0b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_1e0b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_1e0b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_1e0b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_1e0b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l676_c2_1e0b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l676_c2_1e0b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c2_1e0b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l676_c2_1e0b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c2_1e0b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l676_c2_1e0b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c2_1e0b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output := result_u16_value_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_6245_uxn_opcodes_h_l705_l671_DUPLICATE_5c21 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6245_uxn_opcodes_h_l705_l671_DUPLICATE_5c21_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_6245(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_1e0b_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6245_uxn_opcodes_h_l705_l671_DUPLICATE_5c21_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6245_uxn_opcodes_h_l705_l671_DUPLICATE_5c21_return_output;
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
