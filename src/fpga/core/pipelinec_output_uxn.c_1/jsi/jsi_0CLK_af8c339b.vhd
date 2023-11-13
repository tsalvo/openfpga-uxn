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
-- Submodules: 59
entity jsi_0CLK_af8c339b is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jsi_0CLK_af8c339b;
architecture arch of jsi_0CLK_af8c339b is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l140_c6_7e15]
signal BIN_OP_EQ_uxn_opcodes_h_l140_c6_7e15_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l140_c6_7e15_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l140_c6_7e15_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l140_c1_8fe1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_8fe1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_8fe1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_8fe1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_8fe1_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l140_c2_bf37]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_bf37_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_bf37_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_bf37_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_bf37_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l140_c2_bf37]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_bf37_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_bf37_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_bf37_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_bf37_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l140_c2_bf37]
signal result_u16_value_MUX_uxn_opcodes_h_l140_c2_bf37_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l140_c2_bf37_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l140_c2_bf37_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l140_c2_bf37_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l140_c2_bf37]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_bf37_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_bf37_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_bf37_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_bf37_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l140_c2_bf37]
signal result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_bf37_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_bf37_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_bf37_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_bf37_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l140_c2_bf37]
signal result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_bf37_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_bf37_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_bf37_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_bf37_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l140_c2_bf37]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_bf37_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_bf37_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_bf37_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_bf37_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l140_c2_bf37]
signal result_u8_value_MUX_uxn_opcodes_h_l140_c2_bf37_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l140_c2_bf37_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l140_c2_bf37_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l140_c2_bf37_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l140_c2_bf37]
signal tmp16_MUX_uxn_opcodes_h_l140_c2_bf37_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l140_c2_bf37_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l140_c2_bf37_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l140_c2_bf37_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l141_c3_02a4[uxn_opcodes_h_l141_c3_02a4]
signal printf_uxn_opcodes_h_l141_c3_02a4_uxn_opcodes_h_l141_c3_02a4_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l144_c11_591e]
signal BIN_OP_PLUS_uxn_opcodes_h_l144_c11_591e_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l144_c11_591e_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l144_c11_591e_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l147_c11_0a8f]
signal BIN_OP_EQ_uxn_opcodes_h_l147_c11_0a8f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l147_c11_0a8f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l147_c11_0a8f_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l147_c7_8457]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_8457_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_8457_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_8457_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_8457_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l147_c7_8457]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_8457_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_8457_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_8457_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_8457_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l147_c7_8457]
signal result_u16_value_MUX_uxn_opcodes_h_l147_c7_8457_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l147_c7_8457_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l147_c7_8457_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l147_c7_8457_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l147_c7_8457]
signal result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_8457_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_8457_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_8457_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_8457_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l147_c7_8457]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_8457_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_8457_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_8457_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_8457_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l147_c7_8457]
signal result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_8457_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_8457_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_8457_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_8457_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l147_c7_8457]
signal result_u8_value_MUX_uxn_opcodes_h_l147_c7_8457_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l147_c7_8457_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l147_c7_8457_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l147_c7_8457_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l147_c7_8457]
signal tmp16_MUX_uxn_opcodes_h_l147_c7_8457_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l147_c7_8457_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l147_c7_8457_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l147_c7_8457_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l153_c11_9c56]
signal BIN_OP_EQ_uxn_opcodes_h_l153_c11_9c56_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l153_c11_9c56_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l153_c11_9c56_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l153_c7_5a23]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_5a23_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_5a23_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_5a23_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_5a23_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l153_c7_5a23]
signal result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_5a23_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_5a23_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_5a23_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_5a23_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l153_c7_5a23]
signal result_u16_value_MUX_uxn_opcodes_h_l153_c7_5a23_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l153_c7_5a23_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l153_c7_5a23_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l153_c7_5a23_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l153_c7_5a23]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_5a23_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_5a23_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_5a23_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_5a23_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l153_c7_5a23]
signal result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_5a23_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_5a23_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_5a23_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_5a23_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l153_c7_5a23]
signal result_u8_value_MUX_uxn_opcodes_h_l153_c7_5a23_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l153_c7_5a23_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l153_c7_5a23_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l153_c7_5a23_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l153_c7_5a23]
signal tmp16_MUX_uxn_opcodes_h_l153_c7_5a23_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l153_c7_5a23_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l153_c7_5a23_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l153_c7_5a23_return_output : unsigned(15 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l155_c31_8e80]
signal CONST_SR_8_uxn_opcodes_h_l155_c31_8e80_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l155_c31_8e80_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l158_c11_1846]
signal BIN_OP_EQ_uxn_opcodes_h_l158_c11_1846_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l158_c11_1846_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l158_c11_1846_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l158_c7_b211]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_b211_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_b211_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_b211_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_b211_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l158_c7_b211]
signal result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_b211_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_b211_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_b211_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_b211_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l158_c7_b211]
signal result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_b211_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_b211_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_b211_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_b211_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l158_c7_b211]
signal result_u16_value_MUX_uxn_opcodes_h_l158_c7_b211_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l158_c7_b211_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l158_c7_b211_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l158_c7_b211_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l158_c7_b211]
signal tmp16_MUX_uxn_opcodes_h_l158_c7_b211_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l158_c7_b211_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l158_c7_b211_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l158_c7_b211_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l160_c22_94ee]
signal BIN_OP_PLUS_uxn_opcodes_h_l160_c22_94ee_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l160_c22_94ee_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l160_c22_94ee_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l162_c11_d97f]
signal BIN_OP_EQ_uxn_opcodes_h_l162_c11_d97f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l162_c11_d97f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l162_c11_d97f_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l162_c7_e8eb]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_e8eb_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_e8eb_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_e8eb_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_e8eb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l162_c7_e8eb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_e8eb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_e8eb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_e8eb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_e8eb_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l162_c7_e8eb]
signal result_u16_value_MUX_uxn_opcodes_h_l162_c7_e8eb_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l162_c7_e8eb_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l162_c7_e8eb_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l162_c7_e8eb_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l162_c7_e8eb]
signal tmp16_MUX_uxn_opcodes_h_l162_c7_e8eb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l162_c7_e8eb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l162_c7_e8eb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l162_c7_e8eb_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l164_c3_c39b]
signal CONST_SL_8_uxn_opcodes_h_l164_c3_c39b_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l164_c3_c39b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l166_c11_73fd]
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_73fd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_73fd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_73fd_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l166_c7_0922]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_0922_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_0922_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_0922_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_0922_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l166_c7_0922]
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_0922_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_0922_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_0922_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_0922_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l166_c7_0922]
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_0922_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_0922_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_0922_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_0922_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l166_c7_0922]
signal tmp16_MUX_uxn_opcodes_h_l166_c7_0922_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_0922_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_0922_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_0922_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l167_c3_3056]
signal BIN_OP_OR_uxn_opcodes_h_l167_c3_3056_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l167_c3_3056_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l167_c3_3056_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l169_c22_3b22]
signal BIN_OP_PLUS_uxn_opcodes_h_l169_c22_3b22_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l169_c22_3b22_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l169_c22_3b22_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l169_c22_3b32]
signal BIN_OP_PLUS_uxn_opcodes_h_l169_c22_3b32_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l169_c22_3b32_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l169_c22_3b32_return_output : unsigned(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l171_c11_fa35]
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_fa35_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_fa35_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_fa35_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_d280]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_d280_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_d280_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_d280_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_d280_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_d280]
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_d280_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_d280_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_d280_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_d280_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_14ff( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_pc_updated := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.u8_value := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l140_c6_7e15
BIN_OP_EQ_uxn_opcodes_h_l140_c6_7e15 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l140_c6_7e15_left,
BIN_OP_EQ_uxn_opcodes_h_l140_c6_7e15_right,
BIN_OP_EQ_uxn_opcodes_h_l140_c6_7e15_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_8fe1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_8fe1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_8fe1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_8fe1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_8fe1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_8fe1_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_bf37
result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_bf37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_bf37_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_bf37_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_bf37_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_bf37_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_bf37
result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_bf37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_bf37_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_bf37_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_bf37_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_bf37_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l140_c2_bf37
result_u16_value_MUX_uxn_opcodes_h_l140_c2_bf37 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l140_c2_bf37_cond,
result_u16_value_MUX_uxn_opcodes_h_l140_c2_bf37_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l140_c2_bf37_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l140_c2_bf37_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_bf37
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_bf37 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_bf37_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_bf37_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_bf37_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_bf37_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_bf37
result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_bf37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_bf37_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_bf37_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_bf37_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_bf37_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_bf37
result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_bf37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_bf37_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_bf37_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_bf37_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_bf37_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_bf37
result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_bf37 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_bf37_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_bf37_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_bf37_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_bf37_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l140_c2_bf37
result_u8_value_MUX_uxn_opcodes_h_l140_c2_bf37 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l140_c2_bf37_cond,
result_u8_value_MUX_uxn_opcodes_h_l140_c2_bf37_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l140_c2_bf37_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l140_c2_bf37_return_output);

-- tmp16_MUX_uxn_opcodes_h_l140_c2_bf37
tmp16_MUX_uxn_opcodes_h_l140_c2_bf37 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l140_c2_bf37_cond,
tmp16_MUX_uxn_opcodes_h_l140_c2_bf37_iftrue,
tmp16_MUX_uxn_opcodes_h_l140_c2_bf37_iffalse,
tmp16_MUX_uxn_opcodes_h_l140_c2_bf37_return_output);

-- printf_uxn_opcodes_h_l141_c3_02a4_uxn_opcodes_h_l141_c3_02a4
printf_uxn_opcodes_h_l141_c3_02a4_uxn_opcodes_h_l141_c3_02a4 : entity work.printf_uxn_opcodes_h_l141_c3_02a4_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l141_c3_02a4_uxn_opcodes_h_l141_c3_02a4_CLOCK_ENABLE);

-- BIN_OP_PLUS_uxn_opcodes_h_l144_c11_591e
BIN_OP_PLUS_uxn_opcodes_h_l144_c11_591e : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l144_c11_591e_left,
BIN_OP_PLUS_uxn_opcodes_h_l144_c11_591e_right,
BIN_OP_PLUS_uxn_opcodes_h_l144_c11_591e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l147_c11_0a8f
BIN_OP_EQ_uxn_opcodes_h_l147_c11_0a8f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l147_c11_0a8f_left,
BIN_OP_EQ_uxn_opcodes_h_l147_c11_0a8f_right,
BIN_OP_EQ_uxn_opcodes_h_l147_c11_0a8f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_8457
result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_8457 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_8457_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_8457_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_8457_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_8457_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_8457
result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_8457 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_8457_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_8457_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_8457_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_8457_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l147_c7_8457
result_u16_value_MUX_uxn_opcodes_h_l147_c7_8457 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l147_c7_8457_cond,
result_u16_value_MUX_uxn_opcodes_h_l147_c7_8457_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l147_c7_8457_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l147_c7_8457_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_8457
result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_8457 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_8457_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_8457_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_8457_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_8457_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_8457
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_8457 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_8457_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_8457_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_8457_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_8457_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_8457
result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_8457 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_8457_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_8457_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_8457_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_8457_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l147_c7_8457
result_u8_value_MUX_uxn_opcodes_h_l147_c7_8457 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l147_c7_8457_cond,
result_u8_value_MUX_uxn_opcodes_h_l147_c7_8457_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l147_c7_8457_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l147_c7_8457_return_output);

-- tmp16_MUX_uxn_opcodes_h_l147_c7_8457
tmp16_MUX_uxn_opcodes_h_l147_c7_8457 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l147_c7_8457_cond,
tmp16_MUX_uxn_opcodes_h_l147_c7_8457_iftrue,
tmp16_MUX_uxn_opcodes_h_l147_c7_8457_iffalse,
tmp16_MUX_uxn_opcodes_h_l147_c7_8457_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l153_c11_9c56
BIN_OP_EQ_uxn_opcodes_h_l153_c11_9c56 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l153_c11_9c56_left,
BIN_OP_EQ_uxn_opcodes_h_l153_c11_9c56_right,
BIN_OP_EQ_uxn_opcodes_h_l153_c11_9c56_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_5a23
result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_5a23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_5a23_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_5a23_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_5a23_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_5a23_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_5a23
result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_5a23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_5a23_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_5a23_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_5a23_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_5a23_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l153_c7_5a23
result_u16_value_MUX_uxn_opcodes_h_l153_c7_5a23 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l153_c7_5a23_cond,
result_u16_value_MUX_uxn_opcodes_h_l153_c7_5a23_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l153_c7_5a23_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l153_c7_5a23_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_5a23
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_5a23 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_5a23_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_5a23_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_5a23_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_5a23_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_5a23
result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_5a23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_5a23_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_5a23_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_5a23_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_5a23_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l153_c7_5a23
result_u8_value_MUX_uxn_opcodes_h_l153_c7_5a23 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l153_c7_5a23_cond,
result_u8_value_MUX_uxn_opcodes_h_l153_c7_5a23_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l153_c7_5a23_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l153_c7_5a23_return_output);

-- tmp16_MUX_uxn_opcodes_h_l153_c7_5a23
tmp16_MUX_uxn_opcodes_h_l153_c7_5a23 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l153_c7_5a23_cond,
tmp16_MUX_uxn_opcodes_h_l153_c7_5a23_iftrue,
tmp16_MUX_uxn_opcodes_h_l153_c7_5a23_iffalse,
tmp16_MUX_uxn_opcodes_h_l153_c7_5a23_return_output);

-- CONST_SR_8_uxn_opcodes_h_l155_c31_8e80
CONST_SR_8_uxn_opcodes_h_l155_c31_8e80 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l155_c31_8e80_x,
CONST_SR_8_uxn_opcodes_h_l155_c31_8e80_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l158_c11_1846
BIN_OP_EQ_uxn_opcodes_h_l158_c11_1846 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l158_c11_1846_left,
BIN_OP_EQ_uxn_opcodes_h_l158_c11_1846_right,
BIN_OP_EQ_uxn_opcodes_h_l158_c11_1846_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_b211
result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_b211 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_b211_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_b211_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_b211_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_b211_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_b211
result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_b211 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_b211_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_b211_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_b211_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_b211_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_b211
result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_b211 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_b211_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_b211_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_b211_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_b211_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l158_c7_b211
result_u16_value_MUX_uxn_opcodes_h_l158_c7_b211 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l158_c7_b211_cond,
result_u16_value_MUX_uxn_opcodes_h_l158_c7_b211_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l158_c7_b211_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l158_c7_b211_return_output);

-- tmp16_MUX_uxn_opcodes_h_l158_c7_b211
tmp16_MUX_uxn_opcodes_h_l158_c7_b211 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l158_c7_b211_cond,
tmp16_MUX_uxn_opcodes_h_l158_c7_b211_iftrue,
tmp16_MUX_uxn_opcodes_h_l158_c7_b211_iffalse,
tmp16_MUX_uxn_opcodes_h_l158_c7_b211_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l160_c22_94ee
BIN_OP_PLUS_uxn_opcodes_h_l160_c22_94ee : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l160_c22_94ee_left,
BIN_OP_PLUS_uxn_opcodes_h_l160_c22_94ee_right,
BIN_OP_PLUS_uxn_opcodes_h_l160_c22_94ee_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l162_c11_d97f
BIN_OP_EQ_uxn_opcodes_h_l162_c11_d97f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l162_c11_d97f_left,
BIN_OP_EQ_uxn_opcodes_h_l162_c11_d97f_right,
BIN_OP_EQ_uxn_opcodes_h_l162_c11_d97f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_e8eb
result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_e8eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_e8eb_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_e8eb_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_e8eb_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_e8eb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_e8eb
result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_e8eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_e8eb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_e8eb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_e8eb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_e8eb_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l162_c7_e8eb
result_u16_value_MUX_uxn_opcodes_h_l162_c7_e8eb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l162_c7_e8eb_cond,
result_u16_value_MUX_uxn_opcodes_h_l162_c7_e8eb_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l162_c7_e8eb_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l162_c7_e8eb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l162_c7_e8eb
tmp16_MUX_uxn_opcodes_h_l162_c7_e8eb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l162_c7_e8eb_cond,
tmp16_MUX_uxn_opcodes_h_l162_c7_e8eb_iftrue,
tmp16_MUX_uxn_opcodes_h_l162_c7_e8eb_iffalse,
tmp16_MUX_uxn_opcodes_h_l162_c7_e8eb_return_output);

-- CONST_SL_8_uxn_opcodes_h_l164_c3_c39b
CONST_SL_8_uxn_opcodes_h_l164_c3_c39b : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l164_c3_c39b_x,
CONST_SL_8_uxn_opcodes_h_l164_c3_c39b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l166_c11_73fd
BIN_OP_EQ_uxn_opcodes_h_l166_c11_73fd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l166_c11_73fd_left,
BIN_OP_EQ_uxn_opcodes_h_l166_c11_73fd_right,
BIN_OP_EQ_uxn_opcodes_h_l166_c11_73fd_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_0922
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_0922 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_0922_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_0922_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_0922_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_0922_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_0922
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_0922 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_0922_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_0922_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_0922_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_0922_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l166_c7_0922
result_u16_value_MUX_uxn_opcodes_h_l166_c7_0922 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l166_c7_0922_cond,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_0922_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_0922_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_0922_return_output);

-- tmp16_MUX_uxn_opcodes_h_l166_c7_0922
tmp16_MUX_uxn_opcodes_h_l166_c7_0922 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l166_c7_0922_cond,
tmp16_MUX_uxn_opcodes_h_l166_c7_0922_iftrue,
tmp16_MUX_uxn_opcodes_h_l166_c7_0922_iffalse,
tmp16_MUX_uxn_opcodes_h_l166_c7_0922_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l167_c3_3056
BIN_OP_OR_uxn_opcodes_h_l167_c3_3056 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l167_c3_3056_left,
BIN_OP_OR_uxn_opcodes_h_l167_c3_3056_right,
BIN_OP_OR_uxn_opcodes_h_l167_c3_3056_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l169_c22_3b22
BIN_OP_PLUS_uxn_opcodes_h_l169_c22_3b22 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l169_c22_3b22_left,
BIN_OP_PLUS_uxn_opcodes_h_l169_c22_3b22_right,
BIN_OP_PLUS_uxn_opcodes_h_l169_c22_3b22_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l169_c22_3b32
BIN_OP_PLUS_uxn_opcodes_h_l169_c22_3b32 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l169_c22_3b32_left,
BIN_OP_PLUS_uxn_opcodes_h_l169_c22_3b32_right,
BIN_OP_PLUS_uxn_opcodes_h_l169_c22_3b32_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l171_c11_fa35
BIN_OP_EQ_uxn_opcodes_h_l171_c11_fa35 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l171_c11_fa35_left,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_fa35_right,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_fa35_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_d280
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_d280 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_d280_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_d280_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_d280_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_d280_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_d280
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_d280 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_d280_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_d280_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_d280_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_d280_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 pc,
 previous_ram_read,
 -- Registers
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l140_c6_7e15_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_8fe1_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_bf37_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_bf37_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l140_c2_bf37_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_bf37_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_bf37_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_bf37_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_bf37_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l140_c2_bf37_return_output,
 tmp16_MUX_uxn_opcodes_h_l140_c2_bf37_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l144_c11_591e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l147_c11_0a8f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_8457_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_8457_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l147_c7_8457_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_8457_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_8457_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_8457_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l147_c7_8457_return_output,
 tmp16_MUX_uxn_opcodes_h_l147_c7_8457_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l153_c11_9c56_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_5a23_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_5a23_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l153_c7_5a23_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_5a23_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_5a23_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l153_c7_5a23_return_output,
 tmp16_MUX_uxn_opcodes_h_l153_c7_5a23_return_output,
 CONST_SR_8_uxn_opcodes_h_l155_c31_8e80_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l158_c11_1846_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_b211_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_b211_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_b211_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l158_c7_b211_return_output,
 tmp16_MUX_uxn_opcodes_h_l158_c7_b211_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l160_c22_94ee_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l162_c11_d97f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_e8eb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_e8eb_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l162_c7_e8eb_return_output,
 tmp16_MUX_uxn_opcodes_h_l162_c7_e8eb_return_output,
 CONST_SL_8_uxn_opcodes_h_l164_c3_c39b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l166_c11_73fd_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_0922_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_0922_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l166_c7_0922_return_output,
 tmp16_MUX_uxn_opcodes_h_l166_c7_0922_return_output,
 BIN_OP_OR_uxn_opcodes_h_l167_c3_3056_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l169_c22_3b22_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l169_c22_3b32_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l171_c11_fa35_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_d280_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_d280_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_7e15_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_7e15_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_7e15_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_8fe1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_8fe1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_8fe1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_8fe1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_bf37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_bf37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_8457_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_bf37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_bf37_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_bf37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_bf37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_8457_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_bf37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_bf37_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l140_c2_bf37_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l140_c2_bf37_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c7_8457_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l140_c2_bf37_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l140_c2_bf37_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_bf37_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_bf37_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_8457_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_bf37_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_bf37_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_bf37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_bf37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_8457_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_bf37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_bf37_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_bf37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_bf37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_8457_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_bf37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_bf37_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_bf37_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l143_c3_e1a0 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_bf37_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l140_c2_bf37_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_bf37_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_bf37_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l140_c2_bf37_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l140_c2_bf37_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c7_8457_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l140_c2_bf37_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l140_c2_bf37_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l140_c2_bf37_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l144_c3_fb6a : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l140_c2_bf37_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l147_c7_8457_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l140_c2_bf37_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l140_c2_bf37_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l141_c3_02a4_uxn_opcodes_h_l141_c3_02a4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l144_c11_591e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l144_c11_591e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l144_c11_591e_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_0a8f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_0a8f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_0a8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_8457_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_8457_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_5a23_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_8457_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_8457_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_8457_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l147_c7_8457_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_8457_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c7_8457_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c7_8457_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l153_c7_5a23_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c7_8457_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_8457_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_8457_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_5a23_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_8457_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_8457_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l150_c3_2cc4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_8457_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_5a23_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_8457_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_8457_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_8457_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_5a23_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_8457_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c7_8457_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c7_8457_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l153_c7_5a23_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c7_8457_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l147_c7_8457_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l147_c7_8457_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_5a23_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l147_c7_8457_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l151_c21_9902_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_9c56_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_9c56_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_9c56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_5a23_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_5a23_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_b211_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_5a23_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_5a23_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_5a23_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_b211_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_5a23_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l153_c7_5a23_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l153_c7_5a23_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l158_c7_b211_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l153_c7_5a23_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_5a23_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l154_c3_a3eb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_5a23_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_5a23_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_5a23_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_5a23_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_b211_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_5a23_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l153_c7_5a23_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l153_c7_5a23_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l153_c7_5a23_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_5a23_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_5a23_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l158_c7_b211_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_5a23_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l155_c31_8e80_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l155_c31_8e80_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l155_c21_3a17_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l158_c11_1846_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l158_c11_1846_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l158_c11_1846_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_b211_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_b211_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_e8eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_b211_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_b211_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_b211_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_e8eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_b211_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_b211_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_b211_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_b211_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l158_c7_b211_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l160_c3_6df3 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l158_c7_b211_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_e8eb_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l158_c7_b211_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l158_c7_b211_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l158_c7_b211_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_e8eb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l158_c7_b211_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l160_c22_94ee_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l160_c22_94ee_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l160_c22_94ee_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_d97f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_d97f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_d97f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_e8eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_e8eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_0922_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_e8eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_e8eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_e8eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_0922_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_e8eb_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_e8eb_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_e8eb_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_0922_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_e8eb_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_e8eb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_e8eb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_0922_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_e8eb_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l164_c3_c39b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l164_c3_c39b_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_73fd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_73fd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_73fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_0922_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_0922_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_d280_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_0922_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_0922_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_0922_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_d280_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_0922_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_0922_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l169_c3_6bfd : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_0922_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_0922_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_0922_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_0922_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_0922_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l167_c3_3056_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l167_c3_3056_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l167_c3_3056_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_3b22_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_3b22_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_3b22_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_3b32_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_3b32_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_3b32_return_output : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_fa35_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_fa35_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_fa35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_d280_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_d280_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_d280_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_d280_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_d280_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_d280_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l162_l158_l153_l147_l140_l171_DUPLICATE_852d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l140_l147_l162_l166_DUPLICATE_3aee_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l140_l153_DUPLICATE_cf5e_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l140_l158_l153_DUPLICATE_bc85_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l140_l153_DUPLICATE_4e67_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l162_l158_l153_l147_l171_l166_DUPLICATE_5292_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l163_l167_DUPLICATE_0217_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_14ff_uxn_opcodes_h_l176_l136_DUPLICATE_cb8c_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_8457_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_7e15_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_b211_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l154_c3_a3eb := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_5a23_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l154_c3_a3eb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_fa35_right := to_unsigned(6, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_3b32_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_d97f_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l150_c3_2cc4 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_8457_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l150_c3_2cc4;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_bf37_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l144_c11_591e_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_bf37_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_8457_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l143_c3_e1a0 := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_bf37_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l143_c3_e1a0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l158_c11_1846_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_d280_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l160_c22_94ee_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_8fe1_iffalse := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_0922_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_0a8f_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_9c56_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_d280_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_73fd_right := to_unsigned(5, 3);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_pc := pc;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_8fe1_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l144_c11_591e_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l160_c22_94ee_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_3b22_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l153_c7_5a23_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_7e15_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_0a8f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_9c56_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l158_c11_1846_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_d97f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_73fd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_fa35_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l167_c3_3056_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l155_c31_8e80_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l147_c7_8457_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_5a23_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l158_c7_b211_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_0922_iffalse := tmp16;
     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l140_c2_bf37] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l140_c2_bf37_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l162_c11_d97f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l162_c11_d97f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_d97f_left;
     BIN_OP_EQ_uxn_opcodes_h_l162_c11_d97f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_d97f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_d97f_return_output := BIN_OP_EQ_uxn_opcodes_h_l162_c11_d97f_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l151_c21_9902] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l151_c21_9902_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_EQ[uxn_opcodes_h_l153_c11_9c56] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l153_c11_9c56_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_9c56_left;
     BIN_OP_EQ_uxn_opcodes_h_l153_c11_9c56_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_9c56_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_9c56_return_output := BIN_OP_EQ_uxn_opcodes_h_l153_c11_9c56_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l155_c31_8e80] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l155_c31_8e80_x <= VAR_CONST_SR_8_uxn_opcodes_h_l155_c31_8e80_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l155_c31_8e80_return_output := CONST_SR_8_uxn_opcodes_h_l155_c31_8e80_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l144_c11_591e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l144_c11_591e_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l144_c11_591e_left;
     BIN_OP_PLUS_uxn_opcodes_h_l144_c11_591e_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l144_c11_591e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l144_c11_591e_return_output := BIN_OP_PLUS_uxn_opcodes_h_l144_c11_591e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l162_l158_l153_l147_l140_l171_DUPLICATE_852d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l162_l158_l153_l147_l140_l171_DUPLICATE_852d_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l158_c11_1846] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l158_c11_1846_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l158_c11_1846_left;
     BIN_OP_EQ_uxn_opcodes_h_l158_c11_1846_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l158_c11_1846_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l158_c11_1846_return_output := BIN_OP_EQ_uxn_opcodes_h_l158_c11_1846_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l162_l158_l153_l147_l171_l166_DUPLICATE_5292 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l162_l158_l153_l147_l171_l166_DUPLICATE_5292_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l140_l153_DUPLICATE_cf5e LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l140_l153_DUPLICATE_cf5e_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l166_c11_73fd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l166_c11_73fd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_73fd_left;
     BIN_OP_EQ_uxn_opcodes_h_l166_c11_73fd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_73fd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_73fd_return_output := BIN_OP_EQ_uxn_opcodes_h_l166_c11_73fd_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l160_c22_94ee] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l160_c22_94ee_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l160_c22_94ee_left;
     BIN_OP_PLUS_uxn_opcodes_h_l160_c22_94ee_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l160_c22_94ee_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l160_c22_94ee_return_output := BIN_OP_PLUS_uxn_opcodes_h_l160_c22_94ee_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l140_l158_l153_DUPLICATE_bc85 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l140_l158_l153_DUPLICATE_bc85_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l171_c11_fa35] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_fa35_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_fa35_left;
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_fa35_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_fa35_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_fa35_return_output := BIN_OP_EQ_uxn_opcodes_h_l171_c11_fa35_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l140_l147_l162_l166_DUPLICATE_3aee LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l140_l147_l162_l166_DUPLICATE_3aee_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l140_c6_7e15] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l140_c6_7e15_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_7e15_left;
     BIN_OP_EQ_uxn_opcodes_h_l140_c6_7e15_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_7e15_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_7e15_return_output := BIN_OP_EQ_uxn_opcodes_h_l140_c6_7e15_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l140_l153_DUPLICATE_4e67 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l140_l153_DUPLICATE_4e67_return_output := result.u8_value;

     -- result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l147_c7_8457] LATENCY=0
     VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l147_c7_8457_return_output := result.is_sp_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l163_l167_DUPLICATE_0217 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l163_l167_DUPLICATE_0217_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l147_c11_0a8f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l147_c11_0a8f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_0a8f_left;
     BIN_OP_EQ_uxn_opcodes_h_l147_c11_0a8f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_0a8f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_0a8f_return_output := BIN_OP_EQ_uxn_opcodes_h_l147_c11_0a8f_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_8fe1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_7e15_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_bf37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_7e15_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_bf37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_7e15_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_bf37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_7e15_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_bf37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_7e15_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_bf37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_7e15_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_bf37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_7e15_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l140_c2_bf37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_7e15_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l140_c2_bf37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_7e15_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l140_c2_bf37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_7e15_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_8457_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_0a8f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_8457_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_0a8f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_8457_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_0a8f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_8457_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_0a8f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_8457_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_0a8f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c7_8457_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_0a8f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c7_8457_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_0a8f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l147_c7_8457_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_0a8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_5a23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_9c56_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_5a23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_9c56_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_5a23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_9c56_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_5a23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_9c56_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l153_c7_5a23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_9c56_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l153_c7_5a23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_9c56_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_5a23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_9c56_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_b211_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l158_c11_1846_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_b211_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l158_c11_1846_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_b211_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l158_c11_1846_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l158_c7_b211_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l158_c11_1846_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l158_c7_b211_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l158_c11_1846_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_e8eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_d97f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_e8eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_d97f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_e8eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_d97f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_e8eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_d97f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_0922_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_73fd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_0922_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_73fd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_0922_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_73fd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_0922_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_73fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_d280_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_fa35_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_d280_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_fa35_return_output;
     VAR_tmp16_uxn_opcodes_h_l144_c3_fb6a := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l144_c11_591e_return_output, 16);
     VAR_result_u16_value_uxn_opcodes_h_l160_c3_6df3 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l160_c22_94ee_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l167_c3_3056_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l163_l167_DUPLICATE_0217_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l164_c3_c39b_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l163_l167_DUPLICATE_0217_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c7_8457_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l151_c21_9902_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l140_c2_bf37_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l140_l147_l162_l166_DUPLICATE_3aee_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c7_8457_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l140_l147_l162_l166_DUPLICATE_3aee_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_e8eb_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l140_l147_l162_l166_DUPLICATE_3aee_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_0922_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l140_l147_l162_l166_DUPLICATE_3aee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_8457_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l162_l158_l153_l147_l171_l166_DUPLICATE_5292_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_5a23_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l162_l158_l153_l147_l171_l166_DUPLICATE_5292_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_b211_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l162_l158_l153_l147_l171_l166_DUPLICATE_5292_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_e8eb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l162_l158_l153_l147_l171_l166_DUPLICATE_5292_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_0922_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l162_l158_l153_l147_l171_l166_DUPLICATE_5292_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_d280_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l162_l158_l153_l147_l171_l166_DUPLICATE_5292_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_bf37_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l162_l158_l153_l147_l140_l171_DUPLICATE_852d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_8457_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l162_l158_l153_l147_l140_l171_DUPLICATE_852d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_5a23_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l162_l158_l153_l147_l140_l171_DUPLICATE_852d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_b211_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l162_l158_l153_l147_l140_l171_DUPLICATE_852d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_e8eb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l162_l158_l153_l147_l140_l171_DUPLICATE_852d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_d280_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l162_l158_l153_l147_l140_l171_DUPLICATE_852d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_bf37_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l140_l158_l153_DUPLICATE_bc85_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_5a23_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l140_l158_l153_DUPLICATE_bc85_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_b211_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l140_l158_l153_DUPLICATE_bc85_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_bf37_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l140_l153_DUPLICATE_cf5e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_5a23_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l140_l153_DUPLICATE_cf5e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l140_c2_bf37_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l140_l153_DUPLICATE_4e67_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l153_c7_5a23_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l140_l153_DUPLICATE_4e67_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_8457_iffalse := VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l147_c7_8457_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_bf37_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l140_c2_bf37_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l158_c7_b211_iftrue := VAR_result_u16_value_uxn_opcodes_h_l160_c3_6df3;
     VAR_tmp16_MUX_uxn_opcodes_h_l140_c2_bf37_iftrue := VAR_tmp16_uxn_opcodes_h_l144_c3_fb6a;
     -- BIN_OP_OR[uxn_opcodes_h_l167_c3_3056] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l167_c3_3056_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l167_c3_3056_left;
     BIN_OP_OR_uxn_opcodes_h_l167_c3_3056_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l167_c3_3056_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l167_c3_3056_return_output := BIN_OP_OR_uxn_opcodes_h_l167_c3_3056_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l140_c1_8fe1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_8fe1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_8fe1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_8fe1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_8fe1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_8fe1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_8fe1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_8fe1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_8fe1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l158_c7_b211] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_b211_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_b211_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_b211_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_b211_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_b211_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_b211_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_b211_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_b211_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l153_c7_5a23] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_5a23_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_5a23_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_5a23_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_5a23_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_5a23_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_5a23_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_5a23_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_5a23_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l140_c2_bf37] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_bf37_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_bf37_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_bf37_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_bf37_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_bf37_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_bf37_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_bf37_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_bf37_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_d280] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_d280_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_d280_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_d280_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_d280_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_d280_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_d280_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_d280_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_d280_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_d280] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_d280_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_d280_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_d280_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_d280_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_d280_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_d280_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_d280_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_d280_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l164_c3_c39b] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l164_c3_c39b_x <= VAR_CONST_SL_8_uxn_opcodes_h_l164_c3_c39b_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l164_c3_c39b_return_output := CONST_SL_8_uxn_opcodes_h_l164_c3_c39b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l147_c7_8457] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_8457_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_8457_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_8457_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_8457_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_8457_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_8457_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_8457_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_8457_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l155_c21_3a17] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l155_c21_3a17_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l155_c31_8e80_return_output);

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_3b22_right := VAR_BIN_OP_OR_uxn_opcodes_h_l167_c3_3056_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_0922_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l167_c3_3056_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l153_c7_5a23_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l155_c21_3a17_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_e8eb_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l164_c3_c39b_return_output;
     VAR_printf_uxn_opcodes_h_l141_c3_02a4_uxn_opcodes_h_l141_c3_02a4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_8fe1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_0922_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_d280_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_0922_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_d280_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_bf37_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_8457_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_5a23_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_b211_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_8457_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_5a23_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l140_c2_bf37] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_bf37_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_bf37_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_bf37_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_bf37_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_bf37_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_bf37_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_bf37_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_bf37_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l147_c7_8457] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_8457_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_8457_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_8457_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_8457_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_8457_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_8457_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_8457_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_8457_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l153_c7_5a23] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l153_c7_5a23_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l153_c7_5a23_cond;
     result_u8_value_MUX_uxn_opcodes_h_l153_c7_5a23_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l153_c7_5a23_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l153_c7_5a23_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l153_c7_5a23_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l153_c7_5a23_return_output := result_u8_value_MUX_uxn_opcodes_h_l153_c7_5a23_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l169_c22_3b22] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l169_c22_3b22_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_3b22_left;
     BIN_OP_PLUS_uxn_opcodes_h_l169_c22_3b22_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_3b22_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_3b22_return_output := BIN_OP_PLUS_uxn_opcodes_h_l169_c22_3b22_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l166_c7_0922] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_0922_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_0922_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_0922_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_0922_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_0922_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_0922_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_0922_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_0922_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l166_c7_0922] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_0922_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_0922_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_0922_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_0922_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_0922_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_0922_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_0922_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_0922_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l166_c7_0922] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l166_c7_0922_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_0922_cond;
     tmp16_MUX_uxn_opcodes_h_l166_c7_0922_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_0922_iftrue;
     tmp16_MUX_uxn_opcodes_h_l166_c7_0922_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_0922_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_0922_return_output := tmp16_MUX_uxn_opcodes_h_l166_c7_0922_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l153_c7_5a23] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_5a23_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_5a23_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_5a23_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_5a23_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_5a23_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_5a23_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_5a23_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_5a23_return_output;

     -- printf_uxn_opcodes_h_l141_c3_02a4[uxn_opcodes_h_l141_c3_02a4] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l141_c3_02a4_uxn_opcodes_h_l141_c3_02a4_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l141_c3_02a4_uxn_opcodes_h_l141_c3_02a4_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_3b32_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_3b22_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_e8eb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_0922_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_e8eb_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_0922_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_8457_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_5a23_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_bf37_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_8457_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c7_8457_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l153_c7_5a23_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_e8eb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_0922_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l162_c7_e8eb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l162_c7_e8eb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_e8eb_cond;
     tmp16_MUX_uxn_opcodes_h_l162_c7_e8eb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_e8eb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l162_c7_e8eb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_e8eb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_e8eb_return_output := tmp16_MUX_uxn_opcodes_h_l162_c7_e8eb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l147_c7_8457] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_8457_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_8457_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_8457_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_8457_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_8457_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_8457_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_8457_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_8457_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l140_c2_bf37] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_bf37_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_bf37_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_bf37_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_bf37_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_bf37_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_bf37_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_bf37_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_bf37_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l162_c7_e8eb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_e8eb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_e8eb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_e8eb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_e8eb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_e8eb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_e8eb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_e8eb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_e8eb_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l162_c7_e8eb] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_e8eb_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_e8eb_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_e8eb_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_e8eb_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_e8eb_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_e8eb_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_e8eb_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_e8eb_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l169_c22_3b32] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l169_c22_3b32_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_3b32_left;
     BIN_OP_PLUS_uxn_opcodes_h_l169_c22_3b32_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_3b32_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_3b32_return_output := BIN_OP_PLUS_uxn_opcodes_h_l169_c22_3b32_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l147_c7_8457] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l147_c7_8457_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c7_8457_cond;
     result_u8_value_MUX_uxn_opcodes_h_l147_c7_8457_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c7_8457_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l147_c7_8457_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c7_8457_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c7_8457_return_output := result_u8_value_MUX_uxn_opcodes_h_l147_c7_8457_return_output;

     -- Submodule level 4
     VAR_result_u16_value_uxn_opcodes_h_l169_c3_6bfd := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_3b32_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_b211_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_e8eb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_b211_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_e8eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_bf37_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_8457_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l140_c2_bf37_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c7_8457_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l158_c7_b211_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_e8eb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_0922_iftrue := VAR_result_u16_value_uxn_opcodes_h_l169_c3_6bfd;
     -- result_u16_value_MUX[uxn_opcodes_h_l166_c7_0922] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_0922_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_0922_cond;
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_0922_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_0922_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_0922_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_0922_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_0922_return_output := result_u16_value_MUX_uxn_opcodes_h_l166_c7_0922_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l158_c7_b211] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l158_c7_b211_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l158_c7_b211_cond;
     tmp16_MUX_uxn_opcodes_h_l158_c7_b211_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l158_c7_b211_iftrue;
     tmp16_MUX_uxn_opcodes_h_l158_c7_b211_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l158_c7_b211_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l158_c7_b211_return_output := tmp16_MUX_uxn_opcodes_h_l158_c7_b211_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l140_c2_bf37] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l140_c2_bf37_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l140_c2_bf37_cond;
     result_u8_value_MUX_uxn_opcodes_h_l140_c2_bf37_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l140_c2_bf37_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l140_c2_bf37_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l140_c2_bf37_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l140_c2_bf37_return_output := result_u8_value_MUX_uxn_opcodes_h_l140_c2_bf37_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l158_c7_b211] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_b211_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_b211_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_b211_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_b211_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_b211_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_b211_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_b211_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_b211_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l158_c7_b211] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_b211_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_b211_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_b211_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_b211_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_b211_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_b211_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_b211_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_b211_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l140_c2_bf37] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_bf37_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_bf37_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_bf37_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_bf37_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_bf37_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_bf37_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_bf37_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_bf37_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_5a23_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_b211_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_5a23_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_b211_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_e8eb_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_0922_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_5a23_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l158_c7_b211_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l153_c7_5a23] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_5a23_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_5a23_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_5a23_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_5a23_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_5a23_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_5a23_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_5a23_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_5a23_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l153_c7_5a23] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_5a23_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_5a23_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_5a23_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_5a23_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_5a23_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_5a23_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_5a23_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_5a23_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l162_c7_e8eb] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l162_c7_e8eb_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_e8eb_cond;
     result_u16_value_MUX_uxn_opcodes_h_l162_c7_e8eb_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_e8eb_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l162_c7_e8eb_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_e8eb_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_e8eb_return_output := result_u16_value_MUX_uxn_opcodes_h_l162_c7_e8eb_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l153_c7_5a23] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l153_c7_5a23_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_5a23_cond;
     tmp16_MUX_uxn_opcodes_h_l153_c7_5a23_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_5a23_iftrue;
     tmp16_MUX_uxn_opcodes_h_l153_c7_5a23_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_5a23_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_5a23_return_output := tmp16_MUX_uxn_opcodes_h_l153_c7_5a23_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_8457_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_5a23_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_8457_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_5a23_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l158_c7_b211_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_e8eb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l147_c7_8457_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_5a23_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l158_c7_b211] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l158_c7_b211_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l158_c7_b211_cond;
     result_u16_value_MUX_uxn_opcodes_h_l158_c7_b211_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l158_c7_b211_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l158_c7_b211_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l158_c7_b211_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l158_c7_b211_return_output := result_u16_value_MUX_uxn_opcodes_h_l158_c7_b211_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l147_c7_8457] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l147_c7_8457_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l147_c7_8457_cond;
     tmp16_MUX_uxn_opcodes_h_l147_c7_8457_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l147_c7_8457_iftrue;
     tmp16_MUX_uxn_opcodes_h_l147_c7_8457_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l147_c7_8457_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l147_c7_8457_return_output := tmp16_MUX_uxn_opcodes_h_l147_c7_8457_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l147_c7_8457] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_8457_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_8457_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_8457_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_8457_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_8457_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_8457_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_8457_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_8457_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l147_c7_8457] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_8457_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_8457_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_8457_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_8457_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_8457_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_8457_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_8457_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_8457_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_bf37_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_8457_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_bf37_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_8457_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l153_c7_5a23_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l158_c7_b211_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l140_c2_bf37_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l147_c7_8457_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l140_c2_bf37] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l140_c2_bf37_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l140_c2_bf37_cond;
     tmp16_MUX_uxn_opcodes_h_l140_c2_bf37_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l140_c2_bf37_iftrue;
     tmp16_MUX_uxn_opcodes_h_l140_c2_bf37_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l140_c2_bf37_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l140_c2_bf37_return_output := tmp16_MUX_uxn_opcodes_h_l140_c2_bf37_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l140_c2_bf37] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_bf37_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_bf37_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_bf37_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_bf37_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_bf37_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_bf37_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_bf37_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_bf37_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l153_c7_5a23] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l153_c7_5a23_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l153_c7_5a23_cond;
     result_u16_value_MUX_uxn_opcodes_h_l153_c7_5a23_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l153_c7_5a23_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l153_c7_5a23_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l153_c7_5a23_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l153_c7_5a23_return_output := result_u16_value_MUX_uxn_opcodes_h_l153_c7_5a23_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l140_c2_bf37] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_bf37_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_bf37_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_bf37_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_bf37_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_bf37_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_bf37_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_bf37_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_bf37_return_output;

     -- Submodule level 8
     VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c7_8457_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l153_c7_5a23_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l140_c2_bf37_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l147_c7_8457] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l147_c7_8457_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c7_8457_cond;
     result_u16_value_MUX_uxn_opcodes_h_l147_c7_8457_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c7_8457_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l147_c7_8457_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c7_8457_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c7_8457_return_output := result_u16_value_MUX_uxn_opcodes_h_l147_c7_8457_return_output;

     -- Submodule level 9
     VAR_result_u16_value_MUX_uxn_opcodes_h_l140_c2_bf37_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c7_8457_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l140_c2_bf37] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l140_c2_bf37_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l140_c2_bf37_cond;
     result_u16_value_MUX_uxn_opcodes_h_l140_c2_bf37_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l140_c2_bf37_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l140_c2_bf37_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l140_c2_bf37_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l140_c2_bf37_return_output := result_u16_value_MUX_uxn_opcodes_h_l140_c2_bf37_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_14ff_uxn_opcodes_h_l176_l136_DUPLICATE_cb8c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_14ff_uxn_opcodes_h_l176_l136_DUPLICATE_cb8c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_14ff(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_bf37_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_bf37_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l140_c2_bf37_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_bf37_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_bf37_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_bf37_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_bf37_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l140_c2_bf37_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_14ff_uxn_opcodes_h_l176_l136_DUPLICATE_cb8c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_14ff_uxn_opcodes_h_l176_l136_DUPLICATE_cb8c_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
