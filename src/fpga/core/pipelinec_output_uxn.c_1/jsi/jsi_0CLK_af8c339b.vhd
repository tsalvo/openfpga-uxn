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
-- BIN_OP_EQ[uxn_opcodes_h_l140_c6_b490]
signal BIN_OP_EQ_uxn_opcodes_h_l140_c6_b490_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l140_c6_b490_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l140_c6_b490_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l140_c1_e8fa]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_e8fa_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_e8fa_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_e8fa_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_e8fa_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l140_c2_fd62]
signal tmp16_MUX_uxn_opcodes_h_l140_c2_fd62_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l140_c2_fd62_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l140_c2_fd62_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l140_c2_fd62_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l140_c2_fd62]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_fd62_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_fd62_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_fd62_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_fd62_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l140_c2_fd62]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_fd62_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_fd62_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_fd62_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_fd62_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l140_c2_fd62]
signal result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_fd62_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_fd62_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_fd62_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_fd62_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l140_c2_fd62]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_fd62_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_fd62_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_fd62_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_fd62_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l140_c2_fd62]
signal result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_fd62_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_fd62_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_fd62_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_fd62_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l140_c2_fd62]
signal result_u16_value_MUX_uxn_opcodes_h_l140_c2_fd62_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l140_c2_fd62_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l140_c2_fd62_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l140_c2_fd62_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l140_c2_fd62]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_fd62_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_fd62_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_fd62_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_fd62_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l140_c2_fd62]
signal result_u8_value_MUX_uxn_opcodes_h_l140_c2_fd62_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l140_c2_fd62_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l140_c2_fd62_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l140_c2_fd62_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l141_c3_1630[uxn_opcodes_h_l141_c3_1630]
signal printf_uxn_opcodes_h_l141_c3_1630_uxn_opcodes_h_l141_c3_1630_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l144_c11_be18]
signal BIN_OP_PLUS_uxn_opcodes_h_l144_c11_be18_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l144_c11_be18_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l144_c11_be18_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l147_c11_ffb6]
signal BIN_OP_EQ_uxn_opcodes_h_l147_c11_ffb6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l147_c11_ffb6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l147_c11_ffb6_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l147_c7_eec5]
signal tmp16_MUX_uxn_opcodes_h_l147_c7_eec5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l147_c7_eec5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l147_c7_eec5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l147_c7_eec5_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l147_c7_eec5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_eec5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_eec5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_eec5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_eec5_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l147_c7_eec5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_eec5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_eec5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_eec5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_eec5_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l147_c7_eec5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_eec5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_eec5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_eec5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_eec5_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l147_c7_eec5]
signal result_u16_value_MUX_uxn_opcodes_h_l147_c7_eec5_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l147_c7_eec5_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l147_c7_eec5_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l147_c7_eec5_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l147_c7_eec5]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_eec5_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_eec5_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_eec5_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_eec5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l147_c7_eec5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_eec5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_eec5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_eec5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_eec5_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l147_c7_eec5]
signal result_u8_value_MUX_uxn_opcodes_h_l147_c7_eec5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l147_c7_eec5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l147_c7_eec5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l147_c7_eec5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l153_c11_e700]
signal BIN_OP_EQ_uxn_opcodes_h_l153_c11_e700_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l153_c11_e700_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l153_c11_e700_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l153_c7_399a]
signal tmp16_MUX_uxn_opcodes_h_l153_c7_399a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l153_c7_399a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l153_c7_399a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l153_c7_399a_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l153_c7_399a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_399a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_399a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_399a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_399a_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l153_c7_399a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_399a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_399a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_399a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_399a_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l153_c7_399a]
signal result_u16_value_MUX_uxn_opcodes_h_l153_c7_399a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l153_c7_399a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l153_c7_399a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l153_c7_399a_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l153_c7_399a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_399a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_399a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_399a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_399a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l153_c7_399a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_399a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_399a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_399a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_399a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l153_c7_399a]
signal result_u8_value_MUX_uxn_opcodes_h_l153_c7_399a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l153_c7_399a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l153_c7_399a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l153_c7_399a_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l155_c31_a321]
signal CONST_SR_8_uxn_opcodes_h_l155_c31_a321_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l155_c31_a321_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l158_c11_58df]
signal BIN_OP_EQ_uxn_opcodes_h_l158_c11_58df_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l158_c11_58df_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l158_c11_58df_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l158_c7_16fa]
signal tmp16_MUX_uxn_opcodes_h_l158_c7_16fa_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l158_c7_16fa_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l158_c7_16fa_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l158_c7_16fa_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l158_c7_16fa]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_16fa_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_16fa_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_16fa_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_16fa_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l158_c7_16fa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_16fa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_16fa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_16fa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_16fa_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l158_c7_16fa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_16fa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_16fa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_16fa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_16fa_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l158_c7_16fa]
signal result_u16_value_MUX_uxn_opcodes_h_l158_c7_16fa_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l158_c7_16fa_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l158_c7_16fa_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l158_c7_16fa_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l160_c22_eccf]
signal BIN_OP_PLUS_uxn_opcodes_h_l160_c22_eccf_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l160_c22_eccf_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l160_c22_eccf_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l162_c11_5927]
signal BIN_OP_EQ_uxn_opcodes_h_l162_c11_5927_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l162_c11_5927_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l162_c11_5927_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l162_c7_c67d]
signal tmp16_MUX_uxn_opcodes_h_l162_c7_c67d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l162_c7_c67d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l162_c7_c67d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l162_c7_c67d_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l162_c7_c67d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_c67d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_c67d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_c67d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_c67d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l162_c7_c67d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_c67d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_c67d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_c67d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_c67d_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l162_c7_c67d]
signal result_u16_value_MUX_uxn_opcodes_h_l162_c7_c67d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l162_c7_c67d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l162_c7_c67d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l162_c7_c67d_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l164_c3_7a00]
signal CONST_SL_8_uxn_opcodes_h_l164_c3_7a00_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l164_c3_7a00_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l166_c11_e36b]
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_e36b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_e36b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_e36b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l166_c7_47ea]
signal tmp16_MUX_uxn_opcodes_h_l166_c7_47ea_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_47ea_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_47ea_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_47ea_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l166_c7_47ea]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_47ea_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_47ea_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_47ea_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_47ea_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l166_c7_47ea]
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_47ea_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_47ea_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_47ea_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_47ea_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l166_c7_47ea]
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_47ea_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_47ea_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_47ea_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_47ea_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l167_c3_505b]
signal BIN_OP_OR_uxn_opcodes_h_l167_c3_505b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l167_c3_505b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l167_c3_505b_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l169_c22_0750]
signal BIN_OP_PLUS_uxn_opcodes_h_l169_c22_0750_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l169_c22_0750_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l169_c22_0750_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l169_c22_5773]
signal BIN_OP_PLUS_uxn_opcodes_h_l169_c22_5773_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l169_c22_5773_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l169_c22_5773_return_output : unsigned(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l171_c11_e53e]
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_e53e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_e53e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_e53e_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_8f59]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_8f59_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_8f59_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_8f59_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_8f59_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_8f59]
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_8f59_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_8f59_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_8f59_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_8f59_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_e2b8( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.u16_value := ref_toks_6;
      base.is_sp_shift := ref_toks_7;
      base.u8_value := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l140_c6_b490
BIN_OP_EQ_uxn_opcodes_h_l140_c6_b490 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l140_c6_b490_left,
BIN_OP_EQ_uxn_opcodes_h_l140_c6_b490_right,
BIN_OP_EQ_uxn_opcodes_h_l140_c6_b490_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_e8fa
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_e8fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_e8fa_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_e8fa_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_e8fa_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_e8fa_return_output);

-- tmp16_MUX_uxn_opcodes_h_l140_c2_fd62
tmp16_MUX_uxn_opcodes_h_l140_c2_fd62 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l140_c2_fd62_cond,
tmp16_MUX_uxn_opcodes_h_l140_c2_fd62_iftrue,
tmp16_MUX_uxn_opcodes_h_l140_c2_fd62_iffalse,
tmp16_MUX_uxn_opcodes_h_l140_c2_fd62_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_fd62
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_fd62 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_fd62_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_fd62_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_fd62_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_fd62_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_fd62
result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_fd62 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_fd62_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_fd62_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_fd62_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_fd62_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_fd62
result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_fd62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_fd62_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_fd62_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_fd62_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_fd62_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_fd62
result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_fd62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_fd62_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_fd62_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_fd62_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_fd62_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_fd62
result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_fd62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_fd62_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_fd62_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_fd62_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_fd62_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l140_c2_fd62
result_u16_value_MUX_uxn_opcodes_h_l140_c2_fd62 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l140_c2_fd62_cond,
result_u16_value_MUX_uxn_opcodes_h_l140_c2_fd62_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l140_c2_fd62_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l140_c2_fd62_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_fd62
result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_fd62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_fd62_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_fd62_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_fd62_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_fd62_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l140_c2_fd62
result_u8_value_MUX_uxn_opcodes_h_l140_c2_fd62 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l140_c2_fd62_cond,
result_u8_value_MUX_uxn_opcodes_h_l140_c2_fd62_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l140_c2_fd62_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l140_c2_fd62_return_output);

-- printf_uxn_opcodes_h_l141_c3_1630_uxn_opcodes_h_l141_c3_1630
printf_uxn_opcodes_h_l141_c3_1630_uxn_opcodes_h_l141_c3_1630 : entity work.printf_uxn_opcodes_h_l141_c3_1630_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l141_c3_1630_uxn_opcodes_h_l141_c3_1630_CLOCK_ENABLE);

-- BIN_OP_PLUS_uxn_opcodes_h_l144_c11_be18
BIN_OP_PLUS_uxn_opcodes_h_l144_c11_be18 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l144_c11_be18_left,
BIN_OP_PLUS_uxn_opcodes_h_l144_c11_be18_right,
BIN_OP_PLUS_uxn_opcodes_h_l144_c11_be18_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l147_c11_ffb6
BIN_OP_EQ_uxn_opcodes_h_l147_c11_ffb6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l147_c11_ffb6_left,
BIN_OP_EQ_uxn_opcodes_h_l147_c11_ffb6_right,
BIN_OP_EQ_uxn_opcodes_h_l147_c11_ffb6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l147_c7_eec5
tmp16_MUX_uxn_opcodes_h_l147_c7_eec5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l147_c7_eec5_cond,
tmp16_MUX_uxn_opcodes_h_l147_c7_eec5_iftrue,
tmp16_MUX_uxn_opcodes_h_l147_c7_eec5_iffalse,
tmp16_MUX_uxn_opcodes_h_l147_c7_eec5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_eec5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_eec5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_eec5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_eec5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_eec5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_eec5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_eec5
result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_eec5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_eec5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_eec5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_eec5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_eec5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_eec5
result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_eec5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_eec5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_eec5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_eec5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_eec5_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l147_c7_eec5
result_u16_value_MUX_uxn_opcodes_h_l147_c7_eec5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l147_c7_eec5_cond,
result_u16_value_MUX_uxn_opcodes_h_l147_c7_eec5_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l147_c7_eec5_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l147_c7_eec5_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_eec5
result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_eec5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_eec5_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_eec5_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_eec5_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_eec5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_eec5
result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_eec5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_eec5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_eec5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_eec5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_eec5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l147_c7_eec5
result_u8_value_MUX_uxn_opcodes_h_l147_c7_eec5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l147_c7_eec5_cond,
result_u8_value_MUX_uxn_opcodes_h_l147_c7_eec5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l147_c7_eec5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l147_c7_eec5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l153_c11_e700
BIN_OP_EQ_uxn_opcodes_h_l153_c11_e700 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l153_c11_e700_left,
BIN_OP_EQ_uxn_opcodes_h_l153_c11_e700_right,
BIN_OP_EQ_uxn_opcodes_h_l153_c11_e700_return_output);

-- tmp16_MUX_uxn_opcodes_h_l153_c7_399a
tmp16_MUX_uxn_opcodes_h_l153_c7_399a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l153_c7_399a_cond,
tmp16_MUX_uxn_opcodes_h_l153_c7_399a_iftrue,
tmp16_MUX_uxn_opcodes_h_l153_c7_399a_iffalse,
tmp16_MUX_uxn_opcodes_h_l153_c7_399a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_399a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_399a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_399a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_399a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_399a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_399a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_399a
result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_399a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_399a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_399a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_399a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_399a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l153_c7_399a
result_u16_value_MUX_uxn_opcodes_h_l153_c7_399a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l153_c7_399a_cond,
result_u16_value_MUX_uxn_opcodes_h_l153_c7_399a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l153_c7_399a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l153_c7_399a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_399a
result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_399a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_399a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_399a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_399a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_399a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_399a
result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_399a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_399a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_399a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_399a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_399a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l153_c7_399a
result_u8_value_MUX_uxn_opcodes_h_l153_c7_399a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l153_c7_399a_cond,
result_u8_value_MUX_uxn_opcodes_h_l153_c7_399a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l153_c7_399a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l153_c7_399a_return_output);

-- CONST_SR_8_uxn_opcodes_h_l155_c31_a321
CONST_SR_8_uxn_opcodes_h_l155_c31_a321 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l155_c31_a321_x,
CONST_SR_8_uxn_opcodes_h_l155_c31_a321_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l158_c11_58df
BIN_OP_EQ_uxn_opcodes_h_l158_c11_58df : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l158_c11_58df_left,
BIN_OP_EQ_uxn_opcodes_h_l158_c11_58df_right,
BIN_OP_EQ_uxn_opcodes_h_l158_c11_58df_return_output);

-- tmp16_MUX_uxn_opcodes_h_l158_c7_16fa
tmp16_MUX_uxn_opcodes_h_l158_c7_16fa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l158_c7_16fa_cond,
tmp16_MUX_uxn_opcodes_h_l158_c7_16fa_iftrue,
tmp16_MUX_uxn_opcodes_h_l158_c7_16fa_iffalse,
tmp16_MUX_uxn_opcodes_h_l158_c7_16fa_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_16fa
result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_16fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_16fa_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_16fa_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_16fa_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_16fa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_16fa
result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_16fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_16fa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_16fa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_16fa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_16fa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_16fa
result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_16fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_16fa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_16fa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_16fa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_16fa_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l158_c7_16fa
result_u16_value_MUX_uxn_opcodes_h_l158_c7_16fa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l158_c7_16fa_cond,
result_u16_value_MUX_uxn_opcodes_h_l158_c7_16fa_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l158_c7_16fa_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l158_c7_16fa_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l160_c22_eccf
BIN_OP_PLUS_uxn_opcodes_h_l160_c22_eccf : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l160_c22_eccf_left,
BIN_OP_PLUS_uxn_opcodes_h_l160_c22_eccf_right,
BIN_OP_PLUS_uxn_opcodes_h_l160_c22_eccf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l162_c11_5927
BIN_OP_EQ_uxn_opcodes_h_l162_c11_5927 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l162_c11_5927_left,
BIN_OP_EQ_uxn_opcodes_h_l162_c11_5927_right,
BIN_OP_EQ_uxn_opcodes_h_l162_c11_5927_return_output);

-- tmp16_MUX_uxn_opcodes_h_l162_c7_c67d
tmp16_MUX_uxn_opcodes_h_l162_c7_c67d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l162_c7_c67d_cond,
tmp16_MUX_uxn_opcodes_h_l162_c7_c67d_iftrue,
tmp16_MUX_uxn_opcodes_h_l162_c7_c67d_iffalse,
tmp16_MUX_uxn_opcodes_h_l162_c7_c67d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_c67d
result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_c67d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_c67d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_c67d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_c67d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_c67d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_c67d
result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_c67d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_c67d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_c67d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_c67d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_c67d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l162_c7_c67d
result_u16_value_MUX_uxn_opcodes_h_l162_c7_c67d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l162_c7_c67d_cond,
result_u16_value_MUX_uxn_opcodes_h_l162_c7_c67d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l162_c7_c67d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l162_c7_c67d_return_output);

-- CONST_SL_8_uxn_opcodes_h_l164_c3_7a00
CONST_SL_8_uxn_opcodes_h_l164_c3_7a00 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l164_c3_7a00_x,
CONST_SL_8_uxn_opcodes_h_l164_c3_7a00_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l166_c11_e36b
BIN_OP_EQ_uxn_opcodes_h_l166_c11_e36b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l166_c11_e36b_left,
BIN_OP_EQ_uxn_opcodes_h_l166_c11_e36b_right,
BIN_OP_EQ_uxn_opcodes_h_l166_c11_e36b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l166_c7_47ea
tmp16_MUX_uxn_opcodes_h_l166_c7_47ea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l166_c7_47ea_cond,
tmp16_MUX_uxn_opcodes_h_l166_c7_47ea_iftrue,
tmp16_MUX_uxn_opcodes_h_l166_c7_47ea_iffalse,
tmp16_MUX_uxn_opcodes_h_l166_c7_47ea_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_47ea
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_47ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_47ea_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_47ea_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_47ea_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_47ea_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_47ea
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_47ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_47ea_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_47ea_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_47ea_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_47ea_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l166_c7_47ea
result_u16_value_MUX_uxn_opcodes_h_l166_c7_47ea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l166_c7_47ea_cond,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_47ea_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_47ea_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_47ea_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l167_c3_505b
BIN_OP_OR_uxn_opcodes_h_l167_c3_505b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l167_c3_505b_left,
BIN_OP_OR_uxn_opcodes_h_l167_c3_505b_right,
BIN_OP_OR_uxn_opcodes_h_l167_c3_505b_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l169_c22_0750
BIN_OP_PLUS_uxn_opcodes_h_l169_c22_0750 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l169_c22_0750_left,
BIN_OP_PLUS_uxn_opcodes_h_l169_c22_0750_right,
BIN_OP_PLUS_uxn_opcodes_h_l169_c22_0750_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l169_c22_5773
BIN_OP_PLUS_uxn_opcodes_h_l169_c22_5773 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l169_c22_5773_left,
BIN_OP_PLUS_uxn_opcodes_h_l169_c22_5773_right,
BIN_OP_PLUS_uxn_opcodes_h_l169_c22_5773_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l171_c11_e53e
BIN_OP_EQ_uxn_opcodes_h_l171_c11_e53e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l171_c11_e53e_left,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_e53e_right,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_e53e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_8f59
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_8f59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_8f59_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_8f59_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_8f59_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_8f59_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_8f59
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_8f59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_8f59_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_8f59_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_8f59_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_8f59_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l140_c6_b490_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_e8fa_return_output,
 tmp16_MUX_uxn_opcodes_h_l140_c2_fd62_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_fd62_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_fd62_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_fd62_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_fd62_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_fd62_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l140_c2_fd62_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_fd62_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l140_c2_fd62_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l144_c11_be18_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l147_c11_ffb6_return_output,
 tmp16_MUX_uxn_opcodes_h_l147_c7_eec5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_eec5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_eec5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_eec5_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l147_c7_eec5_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_eec5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_eec5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l147_c7_eec5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l153_c11_e700_return_output,
 tmp16_MUX_uxn_opcodes_h_l153_c7_399a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_399a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_399a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l153_c7_399a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_399a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_399a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l153_c7_399a_return_output,
 CONST_SR_8_uxn_opcodes_h_l155_c31_a321_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l158_c11_58df_return_output,
 tmp16_MUX_uxn_opcodes_h_l158_c7_16fa_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_16fa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_16fa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_16fa_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l158_c7_16fa_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l160_c22_eccf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l162_c11_5927_return_output,
 tmp16_MUX_uxn_opcodes_h_l162_c7_c67d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_c67d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_c67d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l162_c7_c67d_return_output,
 CONST_SL_8_uxn_opcodes_h_l164_c3_7a00_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l166_c11_e36b_return_output,
 tmp16_MUX_uxn_opcodes_h_l166_c7_47ea_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_47ea_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_47ea_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l166_c7_47ea_return_output,
 BIN_OP_OR_uxn_opcodes_h_l167_c3_505b_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l169_c22_0750_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l169_c22_5773_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l171_c11_e53e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_8f59_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_8f59_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_b490_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_b490_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_b490_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_e8fa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_e8fa_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_e8fa_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_e8fa_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l140_c2_fd62_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l144_c3_5119 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l140_c2_fd62_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l147_c7_eec5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l140_c2_fd62_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l140_c2_fd62_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_fd62_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_fd62_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_eec5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_fd62_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_fd62_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_fd62_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l143_c3_90ea : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_fd62_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l140_c2_fd62_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_fd62_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_fd62_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_fd62_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_fd62_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_eec5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_fd62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_fd62_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_fd62_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_fd62_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_eec5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_fd62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_fd62_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_fd62_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_fd62_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_eec5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_fd62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_fd62_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l140_c2_fd62_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l140_c2_fd62_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c7_eec5_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l140_c2_fd62_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l140_c2_fd62_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_fd62_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_fd62_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_eec5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_fd62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_fd62_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l140_c2_fd62_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l140_c2_fd62_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c7_eec5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l140_c2_fd62_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l140_c2_fd62_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l141_c3_1630_uxn_opcodes_h_l141_c3_1630_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l144_c11_be18_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l144_c11_be18_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l144_c11_be18_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_ffb6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_ffb6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_ffb6_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l147_c7_eec5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l147_c7_eec5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_399a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l147_c7_eec5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_eec5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l150_c3_be8c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_eec5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_399a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_eec5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_eec5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_eec5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_399a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_eec5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_eec5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_eec5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l147_c7_eec5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_eec5_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c7_eec5_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c7_eec5_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l153_c7_399a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c7_eec5_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_eec5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_eec5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_399a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_eec5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_eec5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_eec5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_399a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_eec5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c7_eec5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c7_eec5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l153_c7_399a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c7_eec5_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l151_c21_d964_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_e700_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_e700_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_e700_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_399a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_399a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l158_c7_16fa_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_399a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_399a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l154_c3_b5f8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_399a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_399a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_399a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_399a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_16fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_399a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l153_c7_399a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l153_c7_399a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l158_c7_16fa_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l153_c7_399a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_399a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_399a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_16fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_399a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_399a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_399a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_16fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_399a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l153_c7_399a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l153_c7_399a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l153_c7_399a_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l155_c31_a321_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l155_c31_a321_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l155_c21_e87f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l158_c11_58df_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l158_c11_58df_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l158_c11_58df_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l158_c7_16fa_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l158_c7_16fa_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_c67d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l158_c7_16fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_16fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_16fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_c67d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_16fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_16fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_16fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_16fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_16fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_16fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_c67d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_16fa_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l158_c7_16fa_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l160_c3_6017 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l158_c7_16fa_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_c67d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l158_c7_16fa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l160_c22_eccf_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l160_c22_eccf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l160_c22_eccf_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_5927_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_5927_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_5927_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_c67d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_c67d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_47ea_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_c67d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_c67d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_c67d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_47ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_c67d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_c67d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_c67d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_47ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_c67d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_c67d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_c67d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_47ea_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_c67d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l164_c3_7a00_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l164_c3_7a00_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_e36b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_e36b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_e36b_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_47ea_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_47ea_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_47ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_47ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_47ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_8f59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_47ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_47ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_47ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_8f59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_47ea_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_47ea_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l169_c3_3c5b : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_47ea_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_47ea_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l167_c3_505b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l167_c3_505b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l167_c3_505b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_0750_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_0750_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_0750_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_5773_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_5773_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_5773_return_output : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_e53e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_e53e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_e53e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_8f59_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_8f59_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_8f59_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_8f59_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_8f59_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_8f59_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l153_l140_DUPLICATE_06dc_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l140_l171_l162_l158_l153_l147_DUPLICATE_56d3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l153_l140_l158_DUPLICATE_4614_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l140_l147_l162_DUPLICATE_277e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l153_l140_DUPLICATE_7d64_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l171_l166_l162_l158_l153_l147_DUPLICATE_9a45_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l167_l163_DUPLICATE_a234_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e2b8_uxn_opcodes_h_l136_l176_DUPLICATE_3cd8_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_fd62_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_e700_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_fd62_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_e53e_right := to_unsigned(6, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_e8fa_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_5773_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l150_c3_be8c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_eec5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l150_c3_be8c;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l160_c22_eccf_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_ffb6_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_eec5_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_16fa_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l143_c3_90ea := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_fd62_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l143_c3_90ea;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l144_c11_be18_right := to_unsigned(2, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_8f59_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_47ea_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l158_c11_58df_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_e36b_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l154_c3_b5f8 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_399a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l154_c3_b5f8;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_eec5_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_8f59_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_b490_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_5927_right := to_unsigned(4, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_e8fa_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l144_c11_be18_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l160_c22_eccf_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_0750_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l153_c7_399a_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_b490_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_ffb6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_e700_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l158_c11_58df_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_5927_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_e36b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_e53e_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l167_c3_505b_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l155_c31_a321_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l147_c7_eec5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_399a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l158_c7_16fa_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_47ea_iffalse := tmp16;
     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l140_c2_fd62] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l140_c2_fd62_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l171_c11_e53e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_e53e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_e53e_left;
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_e53e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_e53e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_e53e_return_output := BIN_OP_EQ_uxn_opcodes_h_l171_c11_e53e_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l153_l140_DUPLICATE_7d64 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l153_l140_DUPLICATE_7d64_return_output := result.u8_value;

     -- CONST_SR_8[uxn_opcodes_h_l155_c31_a321] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l155_c31_a321_x <= VAR_CONST_SR_8_uxn_opcodes_h_l155_c31_a321_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l155_c31_a321_return_output := CONST_SR_8_uxn_opcodes_h_l155_c31_a321_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l140_l171_l162_l158_l153_l147_DUPLICATE_56d3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l140_l171_l162_l158_l153_l147_DUPLICATE_56d3_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l158_c11_58df] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l158_c11_58df_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l158_c11_58df_left;
     BIN_OP_EQ_uxn_opcodes_h_l158_c11_58df_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l158_c11_58df_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l158_c11_58df_return_output := BIN_OP_EQ_uxn_opcodes_h_l158_c11_58df_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l147_c11_ffb6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l147_c11_ffb6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_ffb6_left;
     BIN_OP_EQ_uxn_opcodes_h_l147_c11_ffb6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_ffb6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_ffb6_return_output := BIN_OP_EQ_uxn_opcodes_h_l147_c11_ffb6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l140_c6_b490] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l140_c6_b490_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_b490_left;
     BIN_OP_EQ_uxn_opcodes_h_l140_c6_b490_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_b490_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_b490_return_output := BIN_OP_EQ_uxn_opcodes_h_l140_c6_b490_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l160_c22_eccf] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l160_c22_eccf_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l160_c22_eccf_left;
     BIN_OP_PLUS_uxn_opcodes_h_l160_c22_eccf_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l160_c22_eccf_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l160_c22_eccf_return_output := BIN_OP_PLUS_uxn_opcodes_h_l160_c22_eccf_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l140_l147_l162_DUPLICATE_277e LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l140_l147_l162_DUPLICATE_277e_return_output := result.u16_value;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l153_l140_DUPLICATE_06dc LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l153_l140_DUPLICATE_06dc_return_output := result.stack_address_sp_offset;

     -- result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l147_c7_eec5] LATENCY=0
     VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l147_c7_eec5_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l171_l166_l162_l158_l153_l147_DUPLICATE_9a45 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l171_l166_l162_l158_l153_l147_DUPLICATE_9a45_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l167_l163_DUPLICATE_a234 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l167_l163_DUPLICATE_a234_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_PLUS[uxn_opcodes_h_l144_c11_be18] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l144_c11_be18_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l144_c11_be18_left;
     BIN_OP_PLUS_uxn_opcodes_h_l144_c11_be18_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l144_c11_be18_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l144_c11_be18_return_output := BIN_OP_PLUS_uxn_opcodes_h_l144_c11_be18_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l153_l140_l158_DUPLICATE_4614 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l153_l140_l158_DUPLICATE_4614_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l153_c11_e700] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l153_c11_e700_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_e700_left;
     BIN_OP_EQ_uxn_opcodes_h_l153_c11_e700_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_e700_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_e700_return_output := BIN_OP_EQ_uxn_opcodes_h_l153_c11_e700_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l162_c11_5927] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l162_c11_5927_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_5927_left;
     BIN_OP_EQ_uxn_opcodes_h_l162_c11_5927_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_5927_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_5927_return_output := BIN_OP_EQ_uxn_opcodes_h_l162_c11_5927_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l151_c21_d964] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l151_c21_d964_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_EQ[uxn_opcodes_h_l166_c11_e36b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l166_c11_e36b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_e36b_left;
     BIN_OP_EQ_uxn_opcodes_h_l166_c11_e36b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_e36b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_e36b_return_output := BIN_OP_EQ_uxn_opcodes_h_l166_c11_e36b_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_e8fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_b490_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_fd62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_b490_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_fd62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_b490_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_fd62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_b490_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_fd62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_b490_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_fd62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_b490_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_fd62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_b490_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l140_c2_fd62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_b490_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l140_c2_fd62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_b490_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l140_c2_fd62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_b490_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_eec5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_ffb6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_eec5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_ffb6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_eec5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_ffb6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_eec5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_ffb6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_eec5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_ffb6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c7_eec5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_ffb6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c7_eec5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_ffb6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l147_c7_eec5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_ffb6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_399a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_e700_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_399a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_e700_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_399a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_e700_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_399a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_e700_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l153_c7_399a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_e700_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l153_c7_399a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_e700_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_399a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_e700_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_16fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l158_c11_58df_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_16fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l158_c11_58df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_16fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l158_c11_58df_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l158_c7_16fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l158_c11_58df_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l158_c7_16fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l158_c11_58df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_c67d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_5927_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_c67d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_5927_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_c67d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_5927_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_c67d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_5927_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_47ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_e36b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_47ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_e36b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_47ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_e36b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_47ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_e36b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_8f59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_e53e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_8f59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_e53e_return_output;
     VAR_tmp16_uxn_opcodes_h_l144_c3_5119 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l144_c11_be18_return_output, 16);
     VAR_result_u16_value_uxn_opcodes_h_l160_c3_6017 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l160_c22_eccf_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l167_c3_505b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l167_l163_DUPLICATE_a234_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l164_c3_7a00_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l167_l163_DUPLICATE_a234_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c7_eec5_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l151_c21_d964_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l140_c2_fd62_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l140_l147_l162_DUPLICATE_277e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c7_eec5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l140_l147_l162_DUPLICATE_277e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_c67d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l140_l147_l162_DUPLICATE_277e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_47ea_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l140_l147_l162_DUPLICATE_277e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_eec5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l171_l166_l162_l158_l153_l147_DUPLICATE_9a45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_399a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l171_l166_l162_l158_l153_l147_DUPLICATE_9a45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_16fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l171_l166_l162_l158_l153_l147_DUPLICATE_9a45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_c67d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l171_l166_l162_l158_l153_l147_DUPLICATE_9a45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_47ea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l171_l166_l162_l158_l153_l147_DUPLICATE_9a45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_8f59_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l171_l166_l162_l158_l153_l147_DUPLICATE_9a45_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_fd62_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l140_l171_l162_l158_l153_l147_DUPLICATE_56d3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_eec5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l140_l171_l162_l158_l153_l147_DUPLICATE_56d3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_399a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l140_l171_l162_l158_l153_l147_DUPLICATE_56d3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_16fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l140_l171_l162_l158_l153_l147_DUPLICATE_56d3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_c67d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l140_l171_l162_l158_l153_l147_DUPLICATE_56d3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_8f59_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l140_l171_l162_l158_l153_l147_DUPLICATE_56d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_fd62_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l153_l140_l158_DUPLICATE_4614_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_399a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l153_l140_l158_DUPLICATE_4614_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_16fa_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l153_l140_l158_DUPLICATE_4614_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_fd62_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l153_l140_DUPLICATE_06dc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_399a_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l153_l140_DUPLICATE_06dc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l140_c2_fd62_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l153_l140_DUPLICATE_7d64_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l153_c7_399a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l153_l140_DUPLICATE_7d64_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_eec5_iffalse := VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l147_c7_eec5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_fd62_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l140_c2_fd62_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l158_c7_16fa_iftrue := VAR_result_u16_value_uxn_opcodes_h_l160_c3_6017;
     VAR_tmp16_MUX_uxn_opcodes_h_l140_c2_fd62_iftrue := VAR_tmp16_uxn_opcodes_h_l144_c3_5119;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l147_c7_eec5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_eec5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_eec5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_eec5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_eec5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_eec5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_eec5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_eec5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_eec5_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l167_c3_505b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l167_c3_505b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l167_c3_505b_left;
     BIN_OP_OR_uxn_opcodes_h_l167_c3_505b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l167_c3_505b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l167_c3_505b_return_output := BIN_OP_OR_uxn_opcodes_h_l167_c3_505b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l140_c2_fd62] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_fd62_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_fd62_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_fd62_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_fd62_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_fd62_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_fd62_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_fd62_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_fd62_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l140_c1_e8fa] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_e8fa_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_e8fa_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_e8fa_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_e8fa_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_e8fa_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_e8fa_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_e8fa_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_e8fa_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_8f59] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_8f59_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_8f59_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_8f59_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_8f59_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_8f59_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_8f59_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_8f59_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_8f59_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l158_c7_16fa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_16fa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_16fa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_16fa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_16fa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_16fa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_16fa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_16fa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_16fa_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l164_c3_7a00] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l164_c3_7a00_x <= VAR_CONST_SL_8_uxn_opcodes_h_l164_c3_7a00_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l164_c3_7a00_return_output := CONST_SL_8_uxn_opcodes_h_l164_c3_7a00_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l155_c21_e87f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l155_c21_e87f_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l155_c31_a321_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_8f59] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_8f59_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_8f59_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_8f59_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_8f59_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_8f59_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_8f59_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_8f59_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_8f59_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l153_c7_399a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_399a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_399a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_399a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_399a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_399a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_399a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_399a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_399a_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_0750_right := VAR_BIN_OP_OR_uxn_opcodes_h_l167_c3_505b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_47ea_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l167_c3_505b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l153_c7_399a_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l155_c21_e87f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_c67d_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l164_c3_7a00_return_output;
     VAR_printf_uxn_opcodes_h_l141_c3_1630_uxn_opcodes_h_l141_c3_1630_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_e8fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_47ea_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_8f59_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_47ea_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_8f59_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_fd62_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_eec5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_399a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_16fa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_eec5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_399a_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l166_c7_47ea] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_47ea_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_47ea_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_47ea_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_47ea_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_47ea_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_47ea_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_47ea_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_47ea_return_output;

     -- printf_uxn_opcodes_h_l141_c3_1630[uxn_opcodes_h_l141_c3_1630] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l141_c3_1630_uxn_opcodes_h_l141_c3_1630_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l141_c3_1630_uxn_opcodes_h_l141_c3_1630_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- tmp16_MUX[uxn_opcodes_h_l166_c7_47ea] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l166_c7_47ea_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_47ea_cond;
     tmp16_MUX_uxn_opcodes_h_l166_c7_47ea_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_47ea_iftrue;
     tmp16_MUX_uxn_opcodes_h_l166_c7_47ea_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_47ea_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_47ea_return_output := tmp16_MUX_uxn_opcodes_h_l166_c7_47ea_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l147_c7_eec5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_eec5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_eec5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_eec5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_eec5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_eec5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_eec5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_eec5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_eec5_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l169_c22_0750] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l169_c22_0750_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_0750_left;
     BIN_OP_PLUS_uxn_opcodes_h_l169_c22_0750_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_0750_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_0750_return_output := BIN_OP_PLUS_uxn_opcodes_h_l169_c22_0750_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l153_c7_399a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_399a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_399a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_399a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_399a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_399a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_399a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_399a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_399a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l153_c7_399a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l153_c7_399a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l153_c7_399a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l153_c7_399a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l153_c7_399a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l153_c7_399a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l153_c7_399a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l153_c7_399a_return_output := result_u8_value_MUX_uxn_opcodes_h_l153_c7_399a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l140_c2_fd62] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_fd62_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_fd62_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_fd62_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_fd62_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_fd62_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_fd62_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_fd62_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_fd62_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l166_c7_47ea] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_47ea_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_47ea_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_47ea_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_47ea_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_47ea_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_47ea_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_47ea_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_47ea_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_5773_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_0750_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_c67d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_47ea_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_c67d_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_47ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_eec5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_399a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_fd62_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_eec5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c7_eec5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l153_c7_399a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_c67d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_47ea_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l162_c7_c67d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_c67d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_c67d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_c67d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_c67d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_c67d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_c67d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_c67d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_c67d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l140_c2_fd62] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_fd62_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_fd62_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_fd62_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_fd62_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_fd62_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_fd62_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_fd62_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_fd62_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l169_c22_5773] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l169_c22_5773_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_5773_left;
     BIN_OP_PLUS_uxn_opcodes_h_l169_c22_5773_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_5773_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_5773_return_output := BIN_OP_PLUS_uxn_opcodes_h_l169_c22_5773_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l162_c7_c67d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l162_c7_c67d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_c67d_cond;
     tmp16_MUX_uxn_opcodes_h_l162_c7_c67d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_c67d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l162_c7_c67d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_c67d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_c67d_return_output := tmp16_MUX_uxn_opcodes_h_l162_c7_c67d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l162_c7_c67d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_c67d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_c67d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_c67d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_c67d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_c67d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_c67d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_c67d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_c67d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l147_c7_eec5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l147_c7_eec5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c7_eec5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l147_c7_eec5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c7_eec5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l147_c7_eec5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c7_eec5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c7_eec5_return_output := result_u8_value_MUX_uxn_opcodes_h_l147_c7_eec5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l147_c7_eec5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_eec5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_eec5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_eec5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_eec5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_eec5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_eec5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_eec5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_eec5_return_output;

     -- Submodule level 4
     VAR_result_u16_value_uxn_opcodes_h_l169_c3_3c5b := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_5773_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_16fa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_c67d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_16fa_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_c67d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_fd62_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_eec5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l140_c2_fd62_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c7_eec5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l158_c7_16fa_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_c67d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_47ea_iftrue := VAR_result_u16_value_uxn_opcodes_h_l169_c3_3c5b;
     -- tmp16_MUX[uxn_opcodes_h_l158_c7_16fa] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l158_c7_16fa_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l158_c7_16fa_cond;
     tmp16_MUX_uxn_opcodes_h_l158_c7_16fa_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l158_c7_16fa_iftrue;
     tmp16_MUX_uxn_opcodes_h_l158_c7_16fa_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l158_c7_16fa_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l158_c7_16fa_return_output := tmp16_MUX_uxn_opcodes_h_l158_c7_16fa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l158_c7_16fa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_16fa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_16fa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_16fa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_16fa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_16fa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_16fa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_16fa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_16fa_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l166_c7_47ea] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_47ea_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_47ea_cond;
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_47ea_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_47ea_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_47ea_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_47ea_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_47ea_return_output := result_u16_value_MUX_uxn_opcodes_h_l166_c7_47ea_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l140_c2_fd62] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_fd62_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_fd62_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_fd62_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_fd62_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_fd62_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_fd62_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_fd62_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_fd62_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l158_c7_16fa] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_16fa_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_16fa_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_16fa_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_16fa_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_16fa_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_16fa_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_16fa_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_16fa_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l140_c2_fd62] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l140_c2_fd62_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l140_c2_fd62_cond;
     result_u8_value_MUX_uxn_opcodes_h_l140_c2_fd62_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l140_c2_fd62_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l140_c2_fd62_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l140_c2_fd62_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l140_c2_fd62_return_output := result_u8_value_MUX_uxn_opcodes_h_l140_c2_fd62_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_399a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_16fa_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_399a_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_16fa_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_c67d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_47ea_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_399a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l158_c7_16fa_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l153_c7_399a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_399a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_399a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_399a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_399a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_399a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_399a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_399a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_399a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l153_c7_399a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_399a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_399a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_399a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_399a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_399a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_399a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_399a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_399a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l153_c7_399a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l153_c7_399a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_399a_cond;
     tmp16_MUX_uxn_opcodes_h_l153_c7_399a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_399a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l153_c7_399a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_399a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_399a_return_output := tmp16_MUX_uxn_opcodes_h_l153_c7_399a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l162_c7_c67d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l162_c7_c67d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_c67d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l162_c7_c67d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_c67d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l162_c7_c67d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_c67d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_c67d_return_output := result_u16_value_MUX_uxn_opcodes_h_l162_c7_c67d_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_eec5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_399a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_eec5_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_399a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l158_c7_16fa_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_c67d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l147_c7_eec5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_399a_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l147_c7_eec5] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_eec5_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_eec5_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_eec5_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_eec5_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_eec5_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_eec5_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_eec5_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_eec5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l147_c7_eec5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_eec5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_eec5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_eec5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_eec5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_eec5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_eec5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_eec5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_eec5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l147_c7_eec5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l147_c7_eec5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l147_c7_eec5_cond;
     tmp16_MUX_uxn_opcodes_h_l147_c7_eec5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l147_c7_eec5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l147_c7_eec5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l147_c7_eec5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l147_c7_eec5_return_output := tmp16_MUX_uxn_opcodes_h_l147_c7_eec5_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l158_c7_16fa] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l158_c7_16fa_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l158_c7_16fa_cond;
     result_u16_value_MUX_uxn_opcodes_h_l158_c7_16fa_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l158_c7_16fa_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l158_c7_16fa_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l158_c7_16fa_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l158_c7_16fa_return_output := result_u16_value_MUX_uxn_opcodes_h_l158_c7_16fa_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_fd62_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_eec5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_fd62_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_eec5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l153_c7_399a_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l158_c7_16fa_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l140_c2_fd62_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l147_c7_eec5_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l140_c2_fd62] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_fd62_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_fd62_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_fd62_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_fd62_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_fd62_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_fd62_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_fd62_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_fd62_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l153_c7_399a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l153_c7_399a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l153_c7_399a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l153_c7_399a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l153_c7_399a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l153_c7_399a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l153_c7_399a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l153_c7_399a_return_output := result_u16_value_MUX_uxn_opcodes_h_l153_c7_399a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l140_c2_fd62] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l140_c2_fd62_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l140_c2_fd62_cond;
     tmp16_MUX_uxn_opcodes_h_l140_c2_fd62_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l140_c2_fd62_iftrue;
     tmp16_MUX_uxn_opcodes_h_l140_c2_fd62_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l140_c2_fd62_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l140_c2_fd62_return_output := tmp16_MUX_uxn_opcodes_h_l140_c2_fd62_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l140_c2_fd62] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_fd62_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_fd62_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_fd62_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_fd62_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_fd62_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_fd62_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_fd62_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_fd62_return_output;

     -- Submodule level 8
     VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c7_eec5_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l153_c7_399a_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l140_c2_fd62_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l147_c7_eec5] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l147_c7_eec5_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c7_eec5_cond;
     result_u16_value_MUX_uxn_opcodes_h_l147_c7_eec5_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c7_eec5_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l147_c7_eec5_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c7_eec5_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c7_eec5_return_output := result_u16_value_MUX_uxn_opcodes_h_l147_c7_eec5_return_output;

     -- Submodule level 9
     VAR_result_u16_value_MUX_uxn_opcodes_h_l140_c2_fd62_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c7_eec5_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l140_c2_fd62] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l140_c2_fd62_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l140_c2_fd62_cond;
     result_u16_value_MUX_uxn_opcodes_h_l140_c2_fd62_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l140_c2_fd62_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l140_c2_fd62_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l140_c2_fd62_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l140_c2_fd62_return_output := result_u16_value_MUX_uxn_opcodes_h_l140_c2_fd62_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e2b8_uxn_opcodes_h_l136_l176_DUPLICATE_3cd8 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e2b8_uxn_opcodes_h_l136_l176_DUPLICATE_3cd8_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e2b8(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_fd62_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_fd62_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_fd62_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_fd62_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_fd62_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l140_c2_fd62_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_fd62_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l140_c2_fd62_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e2b8_uxn_opcodes_h_l136_l176_DUPLICATE_3cd8_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e2b8_uxn_opcodes_h_l136_l176_DUPLICATE_3cd8_return_output;
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
