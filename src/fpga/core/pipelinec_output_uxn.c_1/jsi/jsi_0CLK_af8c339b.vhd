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
-- BIN_OP_EQ[uxn_opcodes_h_l140_c6_f066]
signal BIN_OP_EQ_uxn_opcodes_h_l140_c6_f066_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l140_c6_f066_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l140_c6_f066_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l140_c1_1903]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_1903_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_1903_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_1903_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_1903_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l140_c2_e61c]
signal result_u16_value_MUX_uxn_opcodes_h_l140_c2_e61c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l140_c2_e61c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l140_c2_e61c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l140_c2_e61c_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l140_c2_e61c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_e61c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_e61c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_e61c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_e61c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l140_c2_e61c]
signal result_u8_value_MUX_uxn_opcodes_h_l140_c2_e61c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l140_c2_e61c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l140_c2_e61c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l140_c2_e61c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l140_c2_e61c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_e61c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_e61c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_e61c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_e61c_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l140_c2_e61c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_e61c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_e61c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_e61c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_e61c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l140_c2_e61c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_e61c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_e61c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_e61c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_e61c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l140_c2_e61c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_e61c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_e61c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_e61c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_e61c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l140_c2_e61c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_e61c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_e61c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_e61c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_e61c_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l140_c2_e61c]
signal tmp16_MUX_uxn_opcodes_h_l140_c2_e61c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l140_c2_e61c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l140_c2_e61c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l140_c2_e61c_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l141_c3_427e[uxn_opcodes_h_l141_c3_427e]
signal printf_uxn_opcodes_h_l141_c3_427e_uxn_opcodes_h_l141_c3_427e_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l144_c11_96f7]
signal BIN_OP_PLUS_uxn_opcodes_h_l144_c11_96f7_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l144_c11_96f7_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l144_c11_96f7_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l147_c11_6196]
signal BIN_OP_EQ_uxn_opcodes_h_l147_c11_6196_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l147_c11_6196_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l147_c11_6196_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l147_c7_e380]
signal result_u16_value_MUX_uxn_opcodes_h_l147_c7_e380_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l147_c7_e380_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l147_c7_e380_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l147_c7_e380_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l147_c7_e380]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_e380_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_e380_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_e380_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_e380_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l147_c7_e380]
signal result_u8_value_MUX_uxn_opcodes_h_l147_c7_e380_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l147_c7_e380_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l147_c7_e380_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l147_c7_e380_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l147_c7_e380]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_e380_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_e380_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_e380_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_e380_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l147_c7_e380]
signal result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_e380_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_e380_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_e380_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_e380_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l147_c7_e380]
signal result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_e380_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_e380_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_e380_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_e380_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l147_c7_e380]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_e380_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_e380_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_e380_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_e380_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l147_c7_e380]
signal tmp16_MUX_uxn_opcodes_h_l147_c7_e380_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l147_c7_e380_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l147_c7_e380_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l147_c7_e380_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l153_c11_68a7]
signal BIN_OP_EQ_uxn_opcodes_h_l153_c11_68a7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l153_c11_68a7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l153_c11_68a7_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l153_c7_fb89]
signal result_u16_value_MUX_uxn_opcodes_h_l153_c7_fb89_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l153_c7_fb89_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l153_c7_fb89_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l153_c7_fb89_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l153_c7_fb89]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_fb89_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_fb89_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_fb89_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_fb89_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l153_c7_fb89]
signal result_u8_value_MUX_uxn_opcodes_h_l153_c7_fb89_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l153_c7_fb89_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l153_c7_fb89_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l153_c7_fb89_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l153_c7_fb89]
signal result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_fb89_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_fb89_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_fb89_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_fb89_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l153_c7_fb89]
signal result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_fb89_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_fb89_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_fb89_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_fb89_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l153_c7_fb89]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_fb89_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_fb89_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_fb89_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_fb89_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l153_c7_fb89]
signal tmp16_MUX_uxn_opcodes_h_l153_c7_fb89_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l153_c7_fb89_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l153_c7_fb89_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l153_c7_fb89_return_output : unsigned(15 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l155_c31_3da6]
signal CONST_SR_8_uxn_opcodes_h_l155_c31_3da6_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l155_c31_3da6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l158_c11_f3fb]
signal BIN_OP_EQ_uxn_opcodes_h_l158_c11_f3fb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l158_c11_f3fb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l158_c11_f3fb_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l158_c7_5cc6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_5cc6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_5cc6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_5cc6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_5cc6_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l158_c7_5cc6]
signal result_u16_value_MUX_uxn_opcodes_h_l158_c7_5cc6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l158_c7_5cc6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l158_c7_5cc6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l158_c7_5cc6_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l158_c7_5cc6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_5cc6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_5cc6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_5cc6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_5cc6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l158_c7_5cc6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_5cc6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_5cc6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_5cc6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_5cc6_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l158_c7_5cc6]
signal tmp16_MUX_uxn_opcodes_h_l158_c7_5cc6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l158_c7_5cc6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l158_c7_5cc6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l158_c7_5cc6_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l160_c22_208a]
signal BIN_OP_PLUS_uxn_opcodes_h_l160_c22_208a_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l160_c22_208a_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l160_c22_208a_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l162_c11_00a2]
signal BIN_OP_EQ_uxn_opcodes_h_l162_c11_00a2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l162_c11_00a2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l162_c11_00a2_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l162_c7_7b6c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_7b6c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_7b6c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_7b6c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_7b6c_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l162_c7_7b6c]
signal result_u16_value_MUX_uxn_opcodes_h_l162_c7_7b6c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l162_c7_7b6c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l162_c7_7b6c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l162_c7_7b6c_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l162_c7_7b6c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_7b6c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_7b6c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_7b6c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_7b6c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l162_c7_7b6c]
signal tmp16_MUX_uxn_opcodes_h_l162_c7_7b6c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l162_c7_7b6c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l162_c7_7b6c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l162_c7_7b6c_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l164_c3_4710]
signal CONST_SL_8_uxn_opcodes_h_l164_c3_4710_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l164_c3_4710_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l166_c11_31ea]
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_31ea_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_31ea_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_31ea_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l166_c7_4ce6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_4ce6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_4ce6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_4ce6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_4ce6_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l166_c7_4ce6]
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_4ce6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_4ce6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_4ce6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_4ce6_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l166_c7_4ce6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_4ce6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_4ce6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_4ce6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_4ce6_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l166_c7_4ce6]
signal tmp16_MUX_uxn_opcodes_h_l166_c7_4ce6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_4ce6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_4ce6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_4ce6_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l167_c3_f7c3]
signal BIN_OP_OR_uxn_opcodes_h_l167_c3_f7c3_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l167_c3_f7c3_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l167_c3_f7c3_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l169_c22_c717]
signal BIN_OP_PLUS_uxn_opcodes_h_l169_c22_c717_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l169_c22_c717_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l169_c22_c717_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l169_c22_82b1]
signal BIN_OP_PLUS_uxn_opcodes_h_l169_c22_82b1_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l169_c22_82b1_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l169_c22_82b1_return_output : unsigned(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l171_c11_df62]
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_df62_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_df62_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_df62_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_fee2]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_fee2_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_fee2_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_fee2_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_fee2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_fee2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_fee2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_fee2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_fee2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_fee2_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_9147( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u16_value := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.is_stack_write := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l140_c6_f066
BIN_OP_EQ_uxn_opcodes_h_l140_c6_f066 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l140_c6_f066_left,
BIN_OP_EQ_uxn_opcodes_h_l140_c6_f066_right,
BIN_OP_EQ_uxn_opcodes_h_l140_c6_f066_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_1903
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_1903 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_1903_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_1903_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_1903_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_1903_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l140_c2_e61c
result_u16_value_MUX_uxn_opcodes_h_l140_c2_e61c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l140_c2_e61c_cond,
result_u16_value_MUX_uxn_opcodes_h_l140_c2_e61c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l140_c2_e61c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l140_c2_e61c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_e61c
result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_e61c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_e61c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_e61c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_e61c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_e61c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l140_c2_e61c
result_u8_value_MUX_uxn_opcodes_h_l140_c2_e61c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l140_c2_e61c_cond,
result_u8_value_MUX_uxn_opcodes_h_l140_c2_e61c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l140_c2_e61c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l140_c2_e61c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_e61c
result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_e61c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_e61c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_e61c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_e61c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_e61c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_e61c
result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_e61c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_e61c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_e61c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_e61c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_e61c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_e61c
result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_e61c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_e61c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_e61c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_e61c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_e61c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_e61c
result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_e61c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_e61c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_e61c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_e61c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_e61c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_e61c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_e61c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_e61c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_e61c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_e61c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_e61c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l140_c2_e61c
tmp16_MUX_uxn_opcodes_h_l140_c2_e61c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l140_c2_e61c_cond,
tmp16_MUX_uxn_opcodes_h_l140_c2_e61c_iftrue,
tmp16_MUX_uxn_opcodes_h_l140_c2_e61c_iffalse,
tmp16_MUX_uxn_opcodes_h_l140_c2_e61c_return_output);

-- printf_uxn_opcodes_h_l141_c3_427e_uxn_opcodes_h_l141_c3_427e
printf_uxn_opcodes_h_l141_c3_427e_uxn_opcodes_h_l141_c3_427e : entity work.printf_uxn_opcodes_h_l141_c3_427e_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l141_c3_427e_uxn_opcodes_h_l141_c3_427e_CLOCK_ENABLE);

-- BIN_OP_PLUS_uxn_opcodes_h_l144_c11_96f7
BIN_OP_PLUS_uxn_opcodes_h_l144_c11_96f7 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l144_c11_96f7_left,
BIN_OP_PLUS_uxn_opcodes_h_l144_c11_96f7_right,
BIN_OP_PLUS_uxn_opcodes_h_l144_c11_96f7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l147_c11_6196
BIN_OP_EQ_uxn_opcodes_h_l147_c11_6196 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l147_c11_6196_left,
BIN_OP_EQ_uxn_opcodes_h_l147_c11_6196_right,
BIN_OP_EQ_uxn_opcodes_h_l147_c11_6196_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l147_c7_e380
result_u16_value_MUX_uxn_opcodes_h_l147_c7_e380 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l147_c7_e380_cond,
result_u16_value_MUX_uxn_opcodes_h_l147_c7_e380_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l147_c7_e380_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l147_c7_e380_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_e380
result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_e380 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_e380_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_e380_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_e380_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_e380_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l147_c7_e380
result_u8_value_MUX_uxn_opcodes_h_l147_c7_e380 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l147_c7_e380_cond,
result_u8_value_MUX_uxn_opcodes_h_l147_c7_e380_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l147_c7_e380_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l147_c7_e380_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_e380
result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_e380 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_e380_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_e380_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_e380_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_e380_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_e380
result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_e380 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_e380_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_e380_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_e380_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_e380_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_e380
result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_e380 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_e380_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_e380_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_e380_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_e380_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_e380
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_e380 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_e380_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_e380_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_e380_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_e380_return_output);

-- tmp16_MUX_uxn_opcodes_h_l147_c7_e380
tmp16_MUX_uxn_opcodes_h_l147_c7_e380 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l147_c7_e380_cond,
tmp16_MUX_uxn_opcodes_h_l147_c7_e380_iftrue,
tmp16_MUX_uxn_opcodes_h_l147_c7_e380_iffalse,
tmp16_MUX_uxn_opcodes_h_l147_c7_e380_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l153_c11_68a7
BIN_OP_EQ_uxn_opcodes_h_l153_c11_68a7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l153_c11_68a7_left,
BIN_OP_EQ_uxn_opcodes_h_l153_c11_68a7_right,
BIN_OP_EQ_uxn_opcodes_h_l153_c11_68a7_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l153_c7_fb89
result_u16_value_MUX_uxn_opcodes_h_l153_c7_fb89 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l153_c7_fb89_cond,
result_u16_value_MUX_uxn_opcodes_h_l153_c7_fb89_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l153_c7_fb89_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l153_c7_fb89_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_fb89
result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_fb89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_fb89_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_fb89_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_fb89_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_fb89_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l153_c7_fb89
result_u8_value_MUX_uxn_opcodes_h_l153_c7_fb89 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l153_c7_fb89_cond,
result_u8_value_MUX_uxn_opcodes_h_l153_c7_fb89_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l153_c7_fb89_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l153_c7_fb89_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_fb89
result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_fb89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_fb89_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_fb89_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_fb89_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_fb89_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_fb89
result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_fb89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_fb89_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_fb89_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_fb89_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_fb89_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_fb89
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_fb89 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_fb89_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_fb89_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_fb89_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_fb89_return_output);

-- tmp16_MUX_uxn_opcodes_h_l153_c7_fb89
tmp16_MUX_uxn_opcodes_h_l153_c7_fb89 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l153_c7_fb89_cond,
tmp16_MUX_uxn_opcodes_h_l153_c7_fb89_iftrue,
tmp16_MUX_uxn_opcodes_h_l153_c7_fb89_iffalse,
tmp16_MUX_uxn_opcodes_h_l153_c7_fb89_return_output);

-- CONST_SR_8_uxn_opcodes_h_l155_c31_3da6
CONST_SR_8_uxn_opcodes_h_l155_c31_3da6 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l155_c31_3da6_x,
CONST_SR_8_uxn_opcodes_h_l155_c31_3da6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l158_c11_f3fb
BIN_OP_EQ_uxn_opcodes_h_l158_c11_f3fb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l158_c11_f3fb_left,
BIN_OP_EQ_uxn_opcodes_h_l158_c11_f3fb_right,
BIN_OP_EQ_uxn_opcodes_h_l158_c11_f3fb_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_5cc6
result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_5cc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_5cc6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_5cc6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_5cc6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_5cc6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l158_c7_5cc6
result_u16_value_MUX_uxn_opcodes_h_l158_c7_5cc6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l158_c7_5cc6_cond,
result_u16_value_MUX_uxn_opcodes_h_l158_c7_5cc6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l158_c7_5cc6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l158_c7_5cc6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_5cc6
result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_5cc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_5cc6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_5cc6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_5cc6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_5cc6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_5cc6
result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_5cc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_5cc6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_5cc6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_5cc6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_5cc6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l158_c7_5cc6
tmp16_MUX_uxn_opcodes_h_l158_c7_5cc6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l158_c7_5cc6_cond,
tmp16_MUX_uxn_opcodes_h_l158_c7_5cc6_iftrue,
tmp16_MUX_uxn_opcodes_h_l158_c7_5cc6_iffalse,
tmp16_MUX_uxn_opcodes_h_l158_c7_5cc6_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l160_c22_208a
BIN_OP_PLUS_uxn_opcodes_h_l160_c22_208a : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l160_c22_208a_left,
BIN_OP_PLUS_uxn_opcodes_h_l160_c22_208a_right,
BIN_OP_PLUS_uxn_opcodes_h_l160_c22_208a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l162_c11_00a2
BIN_OP_EQ_uxn_opcodes_h_l162_c11_00a2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l162_c11_00a2_left,
BIN_OP_EQ_uxn_opcodes_h_l162_c11_00a2_right,
BIN_OP_EQ_uxn_opcodes_h_l162_c11_00a2_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_7b6c
result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_7b6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_7b6c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_7b6c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_7b6c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_7b6c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l162_c7_7b6c
result_u16_value_MUX_uxn_opcodes_h_l162_c7_7b6c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l162_c7_7b6c_cond,
result_u16_value_MUX_uxn_opcodes_h_l162_c7_7b6c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l162_c7_7b6c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l162_c7_7b6c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_7b6c
result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_7b6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_7b6c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_7b6c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_7b6c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_7b6c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l162_c7_7b6c
tmp16_MUX_uxn_opcodes_h_l162_c7_7b6c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l162_c7_7b6c_cond,
tmp16_MUX_uxn_opcodes_h_l162_c7_7b6c_iftrue,
tmp16_MUX_uxn_opcodes_h_l162_c7_7b6c_iffalse,
tmp16_MUX_uxn_opcodes_h_l162_c7_7b6c_return_output);

-- CONST_SL_8_uxn_opcodes_h_l164_c3_4710
CONST_SL_8_uxn_opcodes_h_l164_c3_4710 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l164_c3_4710_x,
CONST_SL_8_uxn_opcodes_h_l164_c3_4710_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l166_c11_31ea
BIN_OP_EQ_uxn_opcodes_h_l166_c11_31ea : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l166_c11_31ea_left,
BIN_OP_EQ_uxn_opcodes_h_l166_c11_31ea_right,
BIN_OP_EQ_uxn_opcodes_h_l166_c11_31ea_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_4ce6
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_4ce6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_4ce6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_4ce6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_4ce6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_4ce6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l166_c7_4ce6
result_u16_value_MUX_uxn_opcodes_h_l166_c7_4ce6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l166_c7_4ce6_cond,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_4ce6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_4ce6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_4ce6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_4ce6
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_4ce6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_4ce6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_4ce6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_4ce6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_4ce6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l166_c7_4ce6
tmp16_MUX_uxn_opcodes_h_l166_c7_4ce6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l166_c7_4ce6_cond,
tmp16_MUX_uxn_opcodes_h_l166_c7_4ce6_iftrue,
tmp16_MUX_uxn_opcodes_h_l166_c7_4ce6_iffalse,
tmp16_MUX_uxn_opcodes_h_l166_c7_4ce6_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l167_c3_f7c3
BIN_OP_OR_uxn_opcodes_h_l167_c3_f7c3 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l167_c3_f7c3_left,
BIN_OP_OR_uxn_opcodes_h_l167_c3_f7c3_right,
BIN_OP_OR_uxn_opcodes_h_l167_c3_f7c3_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l169_c22_c717
BIN_OP_PLUS_uxn_opcodes_h_l169_c22_c717 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l169_c22_c717_left,
BIN_OP_PLUS_uxn_opcodes_h_l169_c22_c717_right,
BIN_OP_PLUS_uxn_opcodes_h_l169_c22_c717_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l169_c22_82b1
BIN_OP_PLUS_uxn_opcodes_h_l169_c22_82b1 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l169_c22_82b1_left,
BIN_OP_PLUS_uxn_opcodes_h_l169_c22_82b1_right,
BIN_OP_PLUS_uxn_opcodes_h_l169_c22_82b1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l171_c11_df62
BIN_OP_EQ_uxn_opcodes_h_l171_c11_df62 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l171_c11_df62_left,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_df62_right,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_df62_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_fee2
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_fee2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_fee2_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_fee2_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_fee2_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_fee2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_fee2
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_fee2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_fee2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_fee2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_fee2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_fee2_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l140_c6_f066_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_1903_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l140_c2_e61c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_e61c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l140_c2_e61c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_e61c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_e61c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_e61c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_e61c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_e61c_return_output,
 tmp16_MUX_uxn_opcodes_h_l140_c2_e61c_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l144_c11_96f7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l147_c11_6196_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l147_c7_e380_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_e380_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l147_c7_e380_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_e380_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_e380_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_e380_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_e380_return_output,
 tmp16_MUX_uxn_opcodes_h_l147_c7_e380_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l153_c11_68a7_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l153_c7_fb89_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_fb89_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l153_c7_fb89_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_fb89_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_fb89_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_fb89_return_output,
 tmp16_MUX_uxn_opcodes_h_l153_c7_fb89_return_output,
 CONST_SR_8_uxn_opcodes_h_l155_c31_3da6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l158_c11_f3fb_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_5cc6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l158_c7_5cc6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_5cc6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_5cc6_return_output,
 tmp16_MUX_uxn_opcodes_h_l158_c7_5cc6_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l160_c22_208a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l162_c11_00a2_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_7b6c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l162_c7_7b6c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_7b6c_return_output,
 tmp16_MUX_uxn_opcodes_h_l162_c7_7b6c_return_output,
 CONST_SL_8_uxn_opcodes_h_l164_c3_4710_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l166_c11_31ea_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_4ce6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l166_c7_4ce6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_4ce6_return_output,
 tmp16_MUX_uxn_opcodes_h_l166_c7_4ce6_return_output,
 BIN_OP_OR_uxn_opcodes_h_l167_c3_f7c3_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l169_c22_c717_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l169_c22_82b1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l171_c11_df62_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_fee2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_fee2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_f066_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_f066_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_f066_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_1903_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_1903_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_1903_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_1903_iffalse : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l140_c2_e61c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l140_c2_e61c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c7_e380_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l140_c2_e61c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l140_c2_e61c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_e61c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_e61c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_e380_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_e61c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_e61c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l140_c2_e61c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l140_c2_e61c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c7_e380_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l140_c2_e61c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l140_c2_e61c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_e61c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l143_c3_2c52 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_e61c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l140_c2_e61c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_e61c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_e61c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_e61c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_e61c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_e380_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_e61c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_e61c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_e61c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_e61c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_e380_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_e61c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_e61c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_e61c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_e61c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_e380_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_e61c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_e61c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_e61c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_e61c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_e380_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_e61c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_e61c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l140_c2_e61c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l144_c3_e552 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l140_c2_e61c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l147_c7_e380_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l140_c2_e61c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l140_c2_e61c_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l141_c3_427e_uxn_opcodes_h_l141_c3_427e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l144_c11_96f7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l144_c11_96f7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l144_c11_96f7_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_6196_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_6196_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_6196_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c7_e380_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c7_e380_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l153_c7_fb89_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c7_e380_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_e380_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_e380_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_fb89_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_e380_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c7_e380_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c7_e380_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l153_c7_fb89_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c7_e380_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_e380_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_e380_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l147_c7_e380_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_e380_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_e380_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_e380_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_fb89_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_e380_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_e380_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_e380_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_fb89_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_e380_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_e380_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l150_c3_fa1e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_e380_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_fb89_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_e380_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l147_c7_e380_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l147_c7_e380_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_fb89_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l147_c7_e380_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l151_c21_3dda_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_68a7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_68a7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_68a7_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l153_c7_fb89_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l153_c7_fb89_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l158_c7_5cc6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l153_c7_fb89_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_fb89_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_fb89_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_5cc6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_fb89_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l153_c7_fb89_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l153_c7_fb89_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l153_c7_fb89_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_fb89_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_fb89_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_5cc6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_fb89_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_fb89_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_fb89_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_5cc6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_fb89_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_fb89_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l154_c3_511d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_fb89_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_fb89_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_fb89_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_fb89_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l158_c7_5cc6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_fb89_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l155_c31_3da6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l155_c31_3da6_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l155_c21_a336_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l158_c11_f3fb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l158_c11_f3fb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l158_c11_f3fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_5cc6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_5cc6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_7b6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_5cc6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l158_c7_5cc6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l160_c3_eade : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l158_c7_5cc6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_7b6c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l158_c7_5cc6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_5cc6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_5cc6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_7b6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_5cc6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_5cc6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_5cc6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_5cc6_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l158_c7_5cc6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l158_c7_5cc6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_7b6c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l158_c7_5cc6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l160_c22_208a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l160_c22_208a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l160_c22_208a_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_00a2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_00a2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_00a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_7b6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_7b6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_4ce6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_7b6c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_7b6c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_7b6c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_4ce6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_7b6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_7b6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_7b6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_4ce6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_7b6c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_7b6c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_7b6c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_4ce6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_7b6c_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l164_c3_4710_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l164_c3_4710_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_31ea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_31ea_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_31ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_4ce6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_4ce6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_fee2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_4ce6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_4ce6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l169_c3_d322 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_4ce6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_4ce6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_4ce6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_4ce6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_fee2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_4ce6_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_4ce6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_4ce6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_4ce6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l167_c3_f7c3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l167_c3_f7c3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l167_c3_f7c3_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_c717_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_c717_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_c717_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_82b1_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_82b1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_82b1_return_output : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_df62_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_df62_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_df62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_fee2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_fee2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_fee2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_fee2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_fee2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_fee2_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l140_l147_l162_DUPLICATE_8447_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l162_l158_l153_l147_l140_l171_DUPLICATE_7f0d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l153_l140_DUPLICATE_d5ba_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l153_l140_l158_DUPLICATE_2bcb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l153_l140_DUPLICATE_2fad_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l162_l158_l153_l147_l171_DUPLICATE_58da_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l167_l163_DUPLICATE_301e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9147_uxn_opcodes_h_l176_l136_DUPLICATE_2ca2_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l154_c3_511d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_fb89_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l154_c3_511d;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_fee2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_00a2_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_31ea_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_e61c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_df62_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_e380_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_4ce6_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l150_c3_fa1e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_e380_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l150_c3_fa1e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l158_c11_f3fb_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_f066_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_e61c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_1903_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l160_c22_208a_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_e380_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_5cc6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_6196_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_fee2_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l143_c3_2c52 := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_e61c_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l143_c3_2c52;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l144_c11_96f7_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_68a7_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_82b1_right := to_unsigned(2, 2);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_1903_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l144_c11_96f7_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l160_c22_208a_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_c717_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l153_c7_fb89_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_f066_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_6196_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_68a7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l158_c11_f3fb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_00a2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_31ea_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_df62_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l167_c3_f7c3_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l155_c31_3da6_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l147_c7_e380_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_fb89_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l158_c7_5cc6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_4ce6_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l162_c11_00a2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l162_c11_00a2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_00a2_left;
     BIN_OP_EQ_uxn_opcodes_h_l162_c11_00a2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_00a2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_00a2_return_output := BIN_OP_EQ_uxn_opcodes_h_l162_c11_00a2_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l144_c11_96f7] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l144_c11_96f7_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l144_c11_96f7_left;
     BIN_OP_PLUS_uxn_opcodes_h_l144_c11_96f7_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l144_c11_96f7_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l144_c11_96f7_return_output := BIN_OP_PLUS_uxn_opcodes_h_l144_c11_96f7_return_output;

     -- result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l147_c7_e380] LATENCY=0
     VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l147_c7_e380_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l171_c11_df62] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_df62_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_df62_left;
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_df62_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_df62_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_df62_return_output := BIN_OP_EQ_uxn_opcodes_h_l171_c11_df62_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l160_c22_208a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l160_c22_208a_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l160_c22_208a_left;
     BIN_OP_PLUS_uxn_opcodes_h_l160_c22_208a_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l160_c22_208a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l160_c22_208a_return_output := BIN_OP_PLUS_uxn_opcodes_h_l160_c22_208a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l162_l158_l153_l147_l140_l171_DUPLICATE_7f0d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l162_l158_l153_l147_l140_l171_DUPLICATE_7f0d_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l140_c6_f066] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l140_c6_f066_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_f066_left;
     BIN_OP_EQ_uxn_opcodes_h_l140_c6_f066_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_f066_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_f066_return_output := BIN_OP_EQ_uxn_opcodes_h_l140_c6_f066_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l153_l140_l158_DUPLICATE_2bcb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l153_l140_l158_DUPLICATE_2bcb_return_output := result.is_stack_write;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l140_c2_e61c] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l140_c2_e61c_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l153_l140_DUPLICATE_d5ba LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l153_l140_DUPLICATE_d5ba_return_output := result.u8_value;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l151_c21_3dda] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l151_c21_3dda_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l167_l163_DUPLICATE_301e LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l167_l163_DUPLICATE_301e_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l153_l140_DUPLICATE_2fad LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l153_l140_DUPLICATE_2fad_return_output := result.stack_address_sp_offset;

     -- CONST_SR_8[uxn_opcodes_h_l155_c31_3da6] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l155_c31_3da6_x <= VAR_CONST_SR_8_uxn_opcodes_h_l155_c31_3da6_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l155_c31_3da6_return_output := CONST_SR_8_uxn_opcodes_h_l155_c31_3da6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l162_l158_l153_l147_l171_DUPLICATE_58da LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l162_l158_l153_l147_l171_DUPLICATE_58da_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l166_c11_31ea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l166_c11_31ea_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_31ea_left;
     BIN_OP_EQ_uxn_opcodes_h_l166_c11_31ea_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_31ea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_31ea_return_output := BIN_OP_EQ_uxn_opcodes_h_l166_c11_31ea_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l147_c11_6196] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l147_c11_6196_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_6196_left;
     BIN_OP_EQ_uxn_opcodes_h_l147_c11_6196_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_6196_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_6196_return_output := BIN_OP_EQ_uxn_opcodes_h_l147_c11_6196_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l153_c11_68a7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l153_c11_68a7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_68a7_left;
     BIN_OP_EQ_uxn_opcodes_h_l153_c11_68a7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_68a7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_68a7_return_output := BIN_OP_EQ_uxn_opcodes_h_l153_c11_68a7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l158_c11_f3fb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l158_c11_f3fb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l158_c11_f3fb_left;
     BIN_OP_EQ_uxn_opcodes_h_l158_c11_f3fb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l158_c11_f3fb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l158_c11_f3fb_return_output := BIN_OP_EQ_uxn_opcodes_h_l158_c11_f3fb_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l140_l147_l162_DUPLICATE_8447 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l140_l147_l162_DUPLICATE_8447_return_output := result.u16_value;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_1903_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_f066_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_e61c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_f066_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_e61c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_f066_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_e61c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_f066_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_e61c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_f066_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_e61c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_f066_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_e61c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_f066_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l140_c2_e61c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_f066_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l140_c2_e61c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_f066_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l140_c2_e61c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l140_c6_f066_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_e380_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_6196_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_e380_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_6196_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_e380_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_6196_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_e380_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_6196_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_e380_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_6196_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c7_e380_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_6196_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c7_e380_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_6196_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l147_c7_e380_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c11_6196_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_fb89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_68a7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_fb89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_68a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_fb89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_68a7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_fb89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_68a7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l153_c7_fb89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_68a7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l153_c7_fb89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_68a7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_fb89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l153_c11_68a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_5cc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l158_c11_f3fb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_5cc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l158_c11_f3fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_5cc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l158_c11_f3fb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l158_c7_5cc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l158_c11_f3fb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l158_c7_5cc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l158_c11_f3fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_7b6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_00a2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_7b6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_00a2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_7b6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_00a2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_7b6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l162_c11_00a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_4ce6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_31ea_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_4ce6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_31ea_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_4ce6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_31ea_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_4ce6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_31ea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_fee2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_df62_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_fee2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_df62_return_output;
     VAR_tmp16_uxn_opcodes_h_l144_c3_e552 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l144_c11_96f7_return_output, 16);
     VAR_result_u16_value_uxn_opcodes_h_l160_c3_eade := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l160_c22_208a_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l167_c3_f7c3_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l167_l163_DUPLICATE_301e_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l164_c3_4710_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l167_l163_DUPLICATE_301e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c7_e380_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l151_c21_3dda_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l140_c2_e61c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l140_l147_l162_DUPLICATE_8447_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c7_e380_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l140_l147_l162_DUPLICATE_8447_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_7b6c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l140_l147_l162_DUPLICATE_8447_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_4ce6_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l140_l147_l162_DUPLICATE_8447_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_e380_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l162_l158_l153_l147_l171_DUPLICATE_58da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_fb89_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l162_l158_l153_l147_l171_DUPLICATE_58da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_5cc6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l162_l158_l153_l147_l171_DUPLICATE_58da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_7b6c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l162_l158_l153_l147_l171_DUPLICATE_58da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_4ce6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l162_l158_l153_l147_l171_DUPLICATE_58da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_fee2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l162_l158_l153_l147_l171_DUPLICATE_58da_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_e61c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l162_l158_l153_l147_l140_l171_DUPLICATE_7f0d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_e380_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l162_l158_l153_l147_l140_l171_DUPLICATE_7f0d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_fb89_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l162_l158_l153_l147_l140_l171_DUPLICATE_7f0d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_5cc6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l162_l158_l153_l147_l140_l171_DUPLICATE_7f0d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_7b6c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l162_l158_l153_l147_l140_l171_DUPLICATE_7f0d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_fee2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l162_l158_l153_l147_l140_l171_DUPLICATE_7f0d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_e61c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l153_l140_l158_DUPLICATE_2bcb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_fb89_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l153_l140_l158_DUPLICATE_2bcb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_5cc6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l153_l140_l158_DUPLICATE_2bcb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_e61c_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l153_l140_DUPLICATE_2fad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_fb89_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l153_l140_DUPLICATE_2fad_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l140_c2_e61c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l153_l140_DUPLICATE_d5ba_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l153_c7_fb89_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l153_l140_DUPLICATE_d5ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_e380_iffalse := VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l147_c7_e380_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_e61c_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l140_c2_e61c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l158_c7_5cc6_iftrue := VAR_result_u16_value_uxn_opcodes_h_l160_c3_eade;
     VAR_tmp16_MUX_uxn_opcodes_h_l140_c2_e61c_iftrue := VAR_tmp16_uxn_opcodes_h_l144_c3_e552;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l158_c7_5cc6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_5cc6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_5cc6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_5cc6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_5cc6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_5cc6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_5cc6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_5cc6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_5cc6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l153_c7_fb89] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_fb89_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_fb89_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_fb89_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_fb89_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_fb89_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_fb89_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_fb89_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_fb89_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l147_c7_e380] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_e380_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_e380_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_e380_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_e380_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_e380_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_e380_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_e380_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_e380_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l155_c21_a336] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l155_c21_a336_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l155_c31_3da6_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l167_c3_f7c3] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l167_c3_f7c3_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l167_c3_f7c3_left;
     BIN_OP_OR_uxn_opcodes_h_l167_c3_f7c3_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l167_c3_f7c3_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l167_c3_f7c3_return_output := BIN_OP_OR_uxn_opcodes_h_l167_c3_f7c3_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l164_c3_4710] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l164_c3_4710_x <= VAR_CONST_SL_8_uxn_opcodes_h_l164_c3_4710_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l164_c3_4710_return_output := CONST_SL_8_uxn_opcodes_h_l164_c3_4710_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_fee2] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_fee2_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_fee2_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_fee2_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_fee2_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_fee2_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_fee2_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_fee2_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_fee2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l140_c1_1903] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_1903_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_1903_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_1903_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_1903_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_1903_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_1903_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_1903_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_1903_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l140_c2_e61c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_e61c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_e61c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_e61c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_e61c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_e61c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_e61c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_e61c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_e61c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_fee2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_fee2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_fee2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_fee2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_fee2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_fee2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_fee2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_fee2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_fee2_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_c717_right := VAR_BIN_OP_OR_uxn_opcodes_h_l167_c3_f7c3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_4ce6_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l167_c3_f7c3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l153_c7_fb89_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l155_c21_a336_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_7b6c_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l164_c3_4710_return_output;
     VAR_printf_uxn_opcodes_h_l141_c3_427e_uxn_opcodes_h_l141_c3_427e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l140_c1_1903_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_4ce6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_fee2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_4ce6_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_fee2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_e61c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c7_e380_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_fb89_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l158_c7_5cc6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_e380_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l153_c7_fb89_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l169_c22_c717] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l169_c22_c717_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_c717_left;
     BIN_OP_PLUS_uxn_opcodes_h_l169_c22_c717_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_c717_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_c717_return_output := BIN_OP_PLUS_uxn_opcodes_h_l169_c22_c717_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l166_c7_4ce6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_4ce6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_4ce6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_4ce6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_4ce6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_4ce6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_4ce6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_4ce6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_4ce6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l153_c7_fb89] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_fb89_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_fb89_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_fb89_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_fb89_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_fb89_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_fb89_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_fb89_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_fb89_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l140_c2_e61c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_e61c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_e61c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_e61c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_e61c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_e61c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_e61c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_e61c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_e61c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l147_c7_e380] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_e380_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_e380_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_e380_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_e380_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_e380_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_e380_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_e380_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_e380_return_output;

     -- printf_uxn_opcodes_h_l141_c3_427e[uxn_opcodes_h_l141_c3_427e] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l141_c3_427e_uxn_opcodes_h_l141_c3_427e_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l141_c3_427e_uxn_opcodes_h_l141_c3_427e_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l166_c7_4ce6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_4ce6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_4ce6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_4ce6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_4ce6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_4ce6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_4ce6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_4ce6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_4ce6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l166_c7_4ce6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l166_c7_4ce6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_4ce6_cond;
     tmp16_MUX_uxn_opcodes_h_l166_c7_4ce6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_4ce6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l166_c7_4ce6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_4ce6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_4ce6_return_output := tmp16_MUX_uxn_opcodes_h_l166_c7_4ce6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l153_c7_fb89] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l153_c7_fb89_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l153_c7_fb89_cond;
     result_u8_value_MUX_uxn_opcodes_h_l153_c7_fb89_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l153_c7_fb89_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l153_c7_fb89_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l153_c7_fb89_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l153_c7_fb89_return_output := result_u8_value_MUX_uxn_opcodes_h_l153_c7_fb89_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_82b1_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_c717_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_7b6c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_4ce6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_7b6c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_4ce6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_e380_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l153_c7_fb89_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_e61c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c7_e380_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c7_e380_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l153_c7_fb89_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_7b6c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_4ce6_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l162_c7_7b6c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l162_c7_7b6c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_7b6c_cond;
     tmp16_MUX_uxn_opcodes_h_l162_c7_7b6c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_7b6c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l162_c7_7b6c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_7b6c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_7b6c_return_output := tmp16_MUX_uxn_opcodes_h_l162_c7_7b6c_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l169_c22_82b1] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l169_c22_82b1_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_82b1_left;
     BIN_OP_PLUS_uxn_opcodes_h_l169_c22_82b1_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_82b1_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_82b1_return_output := BIN_OP_PLUS_uxn_opcodes_h_l169_c22_82b1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l140_c2_e61c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_e61c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_e61c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_e61c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_e61c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_e61c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_e61c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_e61c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_e61c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l147_c7_e380] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l147_c7_e380_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c7_e380_cond;
     result_u8_value_MUX_uxn_opcodes_h_l147_c7_e380_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c7_e380_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l147_c7_e380_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c7_e380_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c7_e380_return_output := result_u8_value_MUX_uxn_opcodes_h_l147_c7_e380_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l147_c7_e380] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_e380_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_e380_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_e380_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_e380_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_e380_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_e380_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_e380_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_e380_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l162_c7_7b6c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_7b6c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_7b6c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_7b6c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_7b6c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_7b6c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_7b6c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_7b6c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_7b6c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l162_c7_7b6c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_7b6c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_7b6c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_7b6c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_7b6c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_7b6c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_7b6c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_7b6c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_7b6c_return_output;

     -- Submodule level 4
     VAR_result_u16_value_uxn_opcodes_h_l169_c3_d322 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l169_c22_82b1_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_5cc6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l162_c7_7b6c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_5cc6_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l162_c7_7b6c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_e61c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c7_e380_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l140_c2_e61c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c7_e380_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l158_c7_5cc6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l162_c7_7b6c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_4ce6_iftrue := VAR_result_u16_value_uxn_opcodes_h_l169_c3_d322;
     -- result_u8_value_MUX[uxn_opcodes_h_l140_c2_e61c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l140_c2_e61c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l140_c2_e61c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l140_c2_e61c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l140_c2_e61c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l140_c2_e61c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l140_c2_e61c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l140_c2_e61c_return_output := result_u8_value_MUX_uxn_opcodes_h_l140_c2_e61c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l158_c7_5cc6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_5cc6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_5cc6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_5cc6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_5cc6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_5cc6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_5cc6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_5cc6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_5cc6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l140_c2_e61c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_e61c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_e61c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_e61c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_e61c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_e61c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_e61c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_e61c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_e61c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l158_c7_5cc6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_5cc6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_5cc6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_5cc6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_5cc6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_5cc6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_5cc6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_5cc6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_5cc6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l158_c7_5cc6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l158_c7_5cc6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l158_c7_5cc6_cond;
     tmp16_MUX_uxn_opcodes_h_l158_c7_5cc6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l158_c7_5cc6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l158_c7_5cc6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l158_c7_5cc6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l158_c7_5cc6_return_output := tmp16_MUX_uxn_opcodes_h_l158_c7_5cc6_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l166_c7_4ce6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_4ce6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_4ce6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_4ce6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_4ce6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_4ce6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_4ce6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_4ce6_return_output := result_u16_value_MUX_uxn_opcodes_h_l166_c7_4ce6_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_fb89_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l158_c7_5cc6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_fb89_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l158_c7_5cc6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_7b6c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_4ce6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_fb89_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l158_c7_5cc6_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l162_c7_7b6c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l162_c7_7b6c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_7b6c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l162_c7_7b6c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_7b6c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l162_c7_7b6c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_7b6c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_7b6c_return_output := result_u16_value_MUX_uxn_opcodes_h_l162_c7_7b6c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l153_c7_fb89] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_fb89_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_fb89_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_fb89_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_fb89_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_fb89_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_fb89_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_fb89_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_fb89_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l153_c7_fb89] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_fb89_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_fb89_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_fb89_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_fb89_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_fb89_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_fb89_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_fb89_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_fb89_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l153_c7_fb89] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l153_c7_fb89_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_fb89_cond;
     tmp16_MUX_uxn_opcodes_h_l153_c7_fb89_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_fb89_iftrue;
     tmp16_MUX_uxn_opcodes_h_l153_c7_fb89_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_fb89_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_fb89_return_output := tmp16_MUX_uxn_opcodes_h_l153_c7_fb89_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_e380_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l153_c7_fb89_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_e380_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l153_c7_fb89_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l158_c7_5cc6_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l162_c7_7b6c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l147_c7_e380_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l153_c7_fb89_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l158_c7_5cc6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l158_c7_5cc6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l158_c7_5cc6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l158_c7_5cc6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l158_c7_5cc6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l158_c7_5cc6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l158_c7_5cc6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l158_c7_5cc6_return_output := result_u16_value_MUX_uxn_opcodes_h_l158_c7_5cc6_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l147_c7_e380] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_e380_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_e380_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_e380_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_e380_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_e380_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_e380_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_e380_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_e380_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l147_c7_e380] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_e380_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_e380_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_e380_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_e380_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_e380_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_e380_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_e380_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_e380_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l147_c7_e380] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l147_c7_e380_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l147_c7_e380_cond;
     tmp16_MUX_uxn_opcodes_h_l147_c7_e380_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l147_c7_e380_iftrue;
     tmp16_MUX_uxn_opcodes_h_l147_c7_e380_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l147_c7_e380_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l147_c7_e380_return_output := tmp16_MUX_uxn_opcodes_h_l147_c7_e380_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_e61c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c7_e380_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_e61c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c7_e380_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l153_c7_fb89_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l158_c7_5cc6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l140_c2_e61c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l147_c7_e380_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l140_c2_e61c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_e61c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_e61c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_e61c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_e61c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_e61c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_e61c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_e61c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_e61c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l153_c7_fb89] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l153_c7_fb89_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l153_c7_fb89_cond;
     result_u16_value_MUX_uxn_opcodes_h_l153_c7_fb89_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l153_c7_fb89_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l153_c7_fb89_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l153_c7_fb89_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l153_c7_fb89_return_output := result_u16_value_MUX_uxn_opcodes_h_l153_c7_fb89_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l140_c2_e61c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l140_c2_e61c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l140_c2_e61c_cond;
     tmp16_MUX_uxn_opcodes_h_l140_c2_e61c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l140_c2_e61c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l140_c2_e61c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l140_c2_e61c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l140_c2_e61c_return_output := tmp16_MUX_uxn_opcodes_h_l140_c2_e61c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l140_c2_e61c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_e61c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_e61c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_e61c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_e61c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_e61c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_e61c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_e61c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_e61c_return_output;

     -- Submodule level 8
     VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c7_e380_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l153_c7_fb89_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l140_c2_e61c_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l147_c7_e380] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l147_c7_e380_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c7_e380_cond;
     result_u16_value_MUX_uxn_opcodes_h_l147_c7_e380_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c7_e380_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l147_c7_e380_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c7_e380_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c7_e380_return_output := result_u16_value_MUX_uxn_opcodes_h_l147_c7_e380_return_output;

     -- Submodule level 9
     VAR_result_u16_value_MUX_uxn_opcodes_h_l140_c2_e61c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c7_e380_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l140_c2_e61c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l140_c2_e61c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l140_c2_e61c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l140_c2_e61c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l140_c2_e61c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l140_c2_e61c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l140_c2_e61c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l140_c2_e61c_return_output := result_u16_value_MUX_uxn_opcodes_h_l140_c2_e61c_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_9147_uxn_opcodes_h_l176_l136_DUPLICATE_2ca2 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9147_uxn_opcodes_h_l176_l136_DUPLICATE_2ca2_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_9147(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l140_c2_e61c_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l140_c2_e61c_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l140_c2_e61c_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l140_c2_e61c_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l140_c2_e61c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l140_c2_e61c_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l140_c2_e61c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l140_c2_e61c_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9147_uxn_opcodes_h_l176_l136_DUPLICATE_2ca2_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9147_uxn_opcodes_h_l176_l136_DUPLICATE_2ca2_return_output;
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
