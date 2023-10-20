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
-- -- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 63
entity jsi_0CLK_fd2391e7 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jsi_0CLK_fd2391e7;
architecture arch of jsi_0CLK_fd2391e7 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l147_c6_3a1c]
signal BIN_OP_EQ_uxn_opcodes_h_l147_c6_3a1c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l147_c6_3a1c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l147_c6_3a1c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l147_c2_af37]
signal tmp16_MUX_uxn_opcodes_h_l147_c2_af37_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l147_c2_af37_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l147_c2_af37_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l147_c2_af37_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l147_c2_af37]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c2_af37_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c2_af37_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c2_af37_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c2_af37_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l147_c2_af37]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l147_c2_af37_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l147_c2_af37_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l147_c2_af37_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l147_c2_af37_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l147_c2_af37]
signal result_u16_value_MUX_uxn_opcodes_h_l147_c2_af37_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l147_c2_af37_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l147_c2_af37_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l147_c2_af37_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l147_c2_af37]
signal result_u8_value_MUX_uxn_opcodes_h_l147_c2_af37_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l147_c2_af37_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l147_c2_af37_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l147_c2_af37_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l147_c2_af37]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l147_c2_af37_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l147_c2_af37_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l147_c2_af37_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l147_c2_af37_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l147_c2_af37]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l147_c2_af37_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l147_c2_af37_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l147_c2_af37_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l147_c2_af37_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l147_c2_af37]
signal result_is_opc_done_MUX_uxn_opcodes_h_l147_c2_af37_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l147_c2_af37_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l147_c2_af37_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l147_c2_af37_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l147_c2_af37]
signal result_is_stack_write_MUX_uxn_opcodes_h_l147_c2_af37_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l147_c2_af37_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l147_c2_af37_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l147_c2_af37_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l151_c11_8ac0]
signal BIN_OP_PLUS_uxn_opcodes_h_l151_c11_8ac0_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l151_c11_8ac0_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l151_c11_8ac0_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l154_c11_03cb]
signal BIN_OP_EQ_uxn_opcodes_h_l154_c11_03cb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l154_c11_03cb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l154_c11_03cb_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l154_c7_1d93]
signal tmp16_MUX_uxn_opcodes_h_l154_c7_1d93_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l154_c7_1d93_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l154_c7_1d93_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l154_c7_1d93_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l154_c7_1d93]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_1d93_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_1d93_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_1d93_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_1d93_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l154_c7_1d93]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_1d93_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_1d93_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_1d93_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_1d93_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l154_c7_1d93]
signal result_u16_value_MUX_uxn_opcodes_h_l154_c7_1d93_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l154_c7_1d93_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l154_c7_1d93_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l154_c7_1d93_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l154_c7_1d93]
signal result_u8_value_MUX_uxn_opcodes_h_l154_c7_1d93_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l154_c7_1d93_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l154_c7_1d93_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l154_c7_1d93_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l154_c7_1d93]
signal result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_1d93_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_1d93_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_1d93_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_1d93_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l154_c7_1d93]
signal result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_1d93_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_1d93_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_1d93_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_1d93_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l154_c7_1d93]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l154_c7_1d93_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l154_c7_1d93_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l154_c7_1d93_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l154_c7_1d93_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l160_c11_229d]
signal BIN_OP_EQ_uxn_opcodes_h_l160_c11_229d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l160_c11_229d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l160_c11_229d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l160_c7_fff1]
signal tmp16_MUX_uxn_opcodes_h_l160_c7_fff1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l160_c7_fff1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l160_c7_fff1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l160_c7_fff1_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l160_c7_fff1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_fff1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_fff1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_fff1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_fff1_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l160_c7_fff1]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_fff1_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_fff1_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_fff1_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_fff1_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l160_c7_fff1]
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_fff1_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_fff1_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_fff1_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_fff1_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l160_c7_fff1]
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_fff1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_fff1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_fff1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_fff1_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l160_c7_fff1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_fff1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_fff1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_fff1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_fff1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l160_c7_fff1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_fff1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_fff1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_fff1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_fff1_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l162_c31_b4b6]
signal CONST_SR_8_uxn_opcodes_h_l162_c31_b4b6_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l162_c31_b4b6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l165_c11_d716]
signal BIN_OP_EQ_uxn_opcodes_h_l165_c11_d716_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l165_c11_d716_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l165_c11_d716_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l165_c7_04fa]
signal tmp16_MUX_uxn_opcodes_h_l165_c7_04fa_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l165_c7_04fa_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l165_c7_04fa_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l165_c7_04fa_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l165_c7_04fa]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_04fa_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_04fa_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_04fa_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_04fa_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l165_c7_04fa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_04fa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_04fa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_04fa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_04fa_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l165_c7_04fa]
signal result_u16_value_MUX_uxn_opcodes_h_l165_c7_04fa_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l165_c7_04fa_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l165_c7_04fa_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l165_c7_04fa_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l165_c7_04fa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_04fa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_04fa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_04fa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_04fa_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l169_c11_2430]
signal BIN_OP_EQ_uxn_opcodes_h_l169_c11_2430_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l169_c11_2430_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l169_c11_2430_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l169_c7_d9f7]
signal tmp16_MUX_uxn_opcodes_h_l169_c7_d9f7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l169_c7_d9f7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l169_c7_d9f7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l169_c7_d9f7_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l169_c7_d9f7]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_d9f7_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_d9f7_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_d9f7_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_d9f7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l169_c7_d9f7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_d9f7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_d9f7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_d9f7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_d9f7_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l169_c7_d9f7]
signal result_u16_value_MUX_uxn_opcodes_h_l169_c7_d9f7_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l169_c7_d9f7_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l169_c7_d9f7_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l169_c7_d9f7_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l171_c3_060a]
signal CONST_SL_8_uxn_opcodes_h_l171_c3_060a_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l171_c3_060a_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l172_c22_1674]
signal BIN_OP_PLUS_uxn_opcodes_h_l172_c22_1674_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l172_c22_1674_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l172_c22_1674_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l174_c11_da6f]
signal BIN_OP_EQ_uxn_opcodes_h_l174_c11_da6f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l174_c11_da6f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l174_c11_da6f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l174_c7_e86c]
signal tmp16_MUX_uxn_opcodes_h_l174_c7_e86c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l174_c7_e86c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l174_c7_e86c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l174_c7_e86c_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l174_c7_e86c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_e86c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_e86c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_e86c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_e86c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l174_c7_e86c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_e86c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_e86c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_e86c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_e86c_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l174_c7_e86c]
signal result_u16_value_MUX_uxn_opcodes_h_l174_c7_e86c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l174_c7_e86c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l174_c7_e86c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l174_c7_e86c_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l175_c22_132c]
signal BIN_OP_PLUS_uxn_opcodes_h_l175_c22_132c_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l175_c22_132c_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l175_c22_132c_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l177_c11_d9c4]
signal BIN_OP_EQ_uxn_opcodes_h_l177_c11_d9c4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l177_c11_d9c4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l177_c11_d9c4_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l177_c7_1936]
signal tmp16_MUX_uxn_opcodes_h_l177_c7_1936_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l177_c7_1936_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l177_c7_1936_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l177_c7_1936_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l177_c7_1936]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_1936_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_1936_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_1936_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_1936_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l177_c7_1936]
signal result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_1936_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_1936_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_1936_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_1936_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l177_c7_1936]
signal result_u16_value_MUX_uxn_opcodes_h_l177_c7_1936_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l177_c7_1936_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l177_c7_1936_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l177_c7_1936_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l178_c3_95c1]
signal BIN_OP_OR_uxn_opcodes_h_l178_c3_95c1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l178_c3_95c1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l178_c3_95c1_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l180_c22_2254]
signal BIN_OP_PLUS_uxn_opcodes_h_l180_c22_2254_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l180_c22_2254_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l180_c22_2254_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l180_c22_048e]
signal BIN_OP_PLUS_uxn_opcodes_h_l180_c22_048e_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l180_c22_048e_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l180_c22_048e_return_output : unsigned(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l182_c11_5550]
signal BIN_OP_EQ_uxn_opcodes_h_l182_c11_5550_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l182_c11_5550_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l182_c11_5550_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l182_c7_28fc]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_28fc_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_28fc_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_28fc_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_28fc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l182_c7_28fc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_28fc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_28fc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_28fc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_28fc_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_e00b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_sp_shift := ref_toks_6;
      base.is_opc_done := ref_toks_7;
      base.is_stack_write := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l147_c6_3a1c
BIN_OP_EQ_uxn_opcodes_h_l147_c6_3a1c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l147_c6_3a1c_left,
BIN_OP_EQ_uxn_opcodes_h_l147_c6_3a1c_right,
BIN_OP_EQ_uxn_opcodes_h_l147_c6_3a1c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l147_c2_af37
tmp16_MUX_uxn_opcodes_h_l147_c2_af37 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l147_c2_af37_cond,
tmp16_MUX_uxn_opcodes_h_l147_c2_af37_iftrue,
tmp16_MUX_uxn_opcodes_h_l147_c2_af37_iffalse,
tmp16_MUX_uxn_opcodes_h_l147_c2_af37_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c2_af37
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c2_af37 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c2_af37_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c2_af37_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c2_af37_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c2_af37_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l147_c2_af37
result_is_pc_updated_MUX_uxn_opcodes_h_l147_c2_af37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l147_c2_af37_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l147_c2_af37_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l147_c2_af37_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l147_c2_af37_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l147_c2_af37
result_u16_value_MUX_uxn_opcodes_h_l147_c2_af37 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l147_c2_af37_cond,
result_u16_value_MUX_uxn_opcodes_h_l147_c2_af37_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l147_c2_af37_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l147_c2_af37_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l147_c2_af37
result_u8_value_MUX_uxn_opcodes_h_l147_c2_af37 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l147_c2_af37_cond,
result_u8_value_MUX_uxn_opcodes_h_l147_c2_af37_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l147_c2_af37_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l147_c2_af37_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l147_c2_af37
result_sp_relative_shift_MUX_uxn_opcodes_h_l147_c2_af37 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l147_c2_af37_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l147_c2_af37_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l147_c2_af37_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l147_c2_af37_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l147_c2_af37
result_is_sp_shift_MUX_uxn_opcodes_h_l147_c2_af37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l147_c2_af37_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l147_c2_af37_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l147_c2_af37_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l147_c2_af37_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l147_c2_af37
result_is_opc_done_MUX_uxn_opcodes_h_l147_c2_af37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l147_c2_af37_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l147_c2_af37_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l147_c2_af37_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l147_c2_af37_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l147_c2_af37
result_is_stack_write_MUX_uxn_opcodes_h_l147_c2_af37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l147_c2_af37_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l147_c2_af37_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l147_c2_af37_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l147_c2_af37_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l151_c11_8ac0
BIN_OP_PLUS_uxn_opcodes_h_l151_c11_8ac0 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l151_c11_8ac0_left,
BIN_OP_PLUS_uxn_opcodes_h_l151_c11_8ac0_right,
BIN_OP_PLUS_uxn_opcodes_h_l151_c11_8ac0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l154_c11_03cb
BIN_OP_EQ_uxn_opcodes_h_l154_c11_03cb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l154_c11_03cb_left,
BIN_OP_EQ_uxn_opcodes_h_l154_c11_03cb_right,
BIN_OP_EQ_uxn_opcodes_h_l154_c11_03cb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l154_c7_1d93
tmp16_MUX_uxn_opcodes_h_l154_c7_1d93 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l154_c7_1d93_cond,
tmp16_MUX_uxn_opcodes_h_l154_c7_1d93_iftrue,
tmp16_MUX_uxn_opcodes_h_l154_c7_1d93_iffalse,
tmp16_MUX_uxn_opcodes_h_l154_c7_1d93_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_1d93
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_1d93 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_1d93_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_1d93_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_1d93_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_1d93_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_1d93
result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_1d93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_1d93_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_1d93_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_1d93_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_1d93_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l154_c7_1d93
result_u16_value_MUX_uxn_opcodes_h_l154_c7_1d93 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l154_c7_1d93_cond,
result_u16_value_MUX_uxn_opcodes_h_l154_c7_1d93_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l154_c7_1d93_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l154_c7_1d93_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l154_c7_1d93
result_u8_value_MUX_uxn_opcodes_h_l154_c7_1d93 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l154_c7_1d93_cond,
result_u8_value_MUX_uxn_opcodes_h_l154_c7_1d93_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l154_c7_1d93_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l154_c7_1d93_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_1d93
result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_1d93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_1d93_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_1d93_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_1d93_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_1d93_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_1d93
result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_1d93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_1d93_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_1d93_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_1d93_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_1d93_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l154_c7_1d93
result_is_sp_shift_MUX_uxn_opcodes_h_l154_c7_1d93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l154_c7_1d93_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l154_c7_1d93_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l154_c7_1d93_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l154_c7_1d93_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l160_c11_229d
BIN_OP_EQ_uxn_opcodes_h_l160_c11_229d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l160_c11_229d_left,
BIN_OP_EQ_uxn_opcodes_h_l160_c11_229d_right,
BIN_OP_EQ_uxn_opcodes_h_l160_c11_229d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l160_c7_fff1
tmp16_MUX_uxn_opcodes_h_l160_c7_fff1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l160_c7_fff1_cond,
tmp16_MUX_uxn_opcodes_h_l160_c7_fff1_iftrue,
tmp16_MUX_uxn_opcodes_h_l160_c7_fff1_iffalse,
tmp16_MUX_uxn_opcodes_h_l160_c7_fff1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_fff1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_fff1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_fff1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_fff1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_fff1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_fff1_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_fff1
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_fff1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_fff1_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_fff1_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_fff1_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_fff1_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l160_c7_fff1
result_u16_value_MUX_uxn_opcodes_h_l160_c7_fff1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l160_c7_fff1_cond,
result_u16_value_MUX_uxn_opcodes_h_l160_c7_fff1_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l160_c7_fff1_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l160_c7_fff1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l160_c7_fff1
result_u8_value_MUX_uxn_opcodes_h_l160_c7_fff1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l160_c7_fff1_cond,
result_u8_value_MUX_uxn_opcodes_h_l160_c7_fff1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l160_c7_fff1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l160_c7_fff1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_fff1
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_fff1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_fff1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_fff1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_fff1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_fff1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_fff1
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_fff1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_fff1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_fff1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_fff1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_fff1_return_output);

-- CONST_SR_8_uxn_opcodes_h_l162_c31_b4b6
CONST_SR_8_uxn_opcodes_h_l162_c31_b4b6 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l162_c31_b4b6_x,
CONST_SR_8_uxn_opcodes_h_l162_c31_b4b6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l165_c11_d716
BIN_OP_EQ_uxn_opcodes_h_l165_c11_d716 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l165_c11_d716_left,
BIN_OP_EQ_uxn_opcodes_h_l165_c11_d716_right,
BIN_OP_EQ_uxn_opcodes_h_l165_c11_d716_return_output);

-- tmp16_MUX_uxn_opcodes_h_l165_c7_04fa
tmp16_MUX_uxn_opcodes_h_l165_c7_04fa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l165_c7_04fa_cond,
tmp16_MUX_uxn_opcodes_h_l165_c7_04fa_iftrue,
tmp16_MUX_uxn_opcodes_h_l165_c7_04fa_iffalse,
tmp16_MUX_uxn_opcodes_h_l165_c7_04fa_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_04fa
result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_04fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_04fa_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_04fa_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_04fa_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_04fa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_04fa
result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_04fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_04fa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_04fa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_04fa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_04fa_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l165_c7_04fa
result_u16_value_MUX_uxn_opcodes_h_l165_c7_04fa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l165_c7_04fa_cond,
result_u16_value_MUX_uxn_opcodes_h_l165_c7_04fa_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l165_c7_04fa_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l165_c7_04fa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_04fa
result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_04fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_04fa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_04fa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_04fa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_04fa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l169_c11_2430
BIN_OP_EQ_uxn_opcodes_h_l169_c11_2430 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l169_c11_2430_left,
BIN_OP_EQ_uxn_opcodes_h_l169_c11_2430_right,
BIN_OP_EQ_uxn_opcodes_h_l169_c11_2430_return_output);

-- tmp16_MUX_uxn_opcodes_h_l169_c7_d9f7
tmp16_MUX_uxn_opcodes_h_l169_c7_d9f7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l169_c7_d9f7_cond,
tmp16_MUX_uxn_opcodes_h_l169_c7_d9f7_iftrue,
tmp16_MUX_uxn_opcodes_h_l169_c7_d9f7_iffalse,
tmp16_MUX_uxn_opcodes_h_l169_c7_d9f7_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_d9f7
result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_d9f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_d9f7_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_d9f7_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_d9f7_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_d9f7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_d9f7
result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_d9f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_d9f7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_d9f7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_d9f7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_d9f7_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l169_c7_d9f7
result_u16_value_MUX_uxn_opcodes_h_l169_c7_d9f7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l169_c7_d9f7_cond,
result_u16_value_MUX_uxn_opcodes_h_l169_c7_d9f7_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l169_c7_d9f7_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l169_c7_d9f7_return_output);

-- CONST_SL_8_uxn_opcodes_h_l171_c3_060a
CONST_SL_8_uxn_opcodes_h_l171_c3_060a : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l171_c3_060a_x,
CONST_SL_8_uxn_opcodes_h_l171_c3_060a_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l172_c22_1674
BIN_OP_PLUS_uxn_opcodes_h_l172_c22_1674 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l172_c22_1674_left,
BIN_OP_PLUS_uxn_opcodes_h_l172_c22_1674_right,
BIN_OP_PLUS_uxn_opcodes_h_l172_c22_1674_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l174_c11_da6f
BIN_OP_EQ_uxn_opcodes_h_l174_c11_da6f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l174_c11_da6f_left,
BIN_OP_EQ_uxn_opcodes_h_l174_c11_da6f_right,
BIN_OP_EQ_uxn_opcodes_h_l174_c11_da6f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l174_c7_e86c
tmp16_MUX_uxn_opcodes_h_l174_c7_e86c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l174_c7_e86c_cond,
tmp16_MUX_uxn_opcodes_h_l174_c7_e86c_iftrue,
tmp16_MUX_uxn_opcodes_h_l174_c7_e86c_iffalse,
tmp16_MUX_uxn_opcodes_h_l174_c7_e86c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_e86c
result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_e86c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_e86c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_e86c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_e86c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_e86c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_e86c
result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_e86c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_e86c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_e86c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_e86c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_e86c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l174_c7_e86c
result_u16_value_MUX_uxn_opcodes_h_l174_c7_e86c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l174_c7_e86c_cond,
result_u16_value_MUX_uxn_opcodes_h_l174_c7_e86c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l174_c7_e86c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l174_c7_e86c_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l175_c22_132c
BIN_OP_PLUS_uxn_opcodes_h_l175_c22_132c : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l175_c22_132c_left,
BIN_OP_PLUS_uxn_opcodes_h_l175_c22_132c_right,
BIN_OP_PLUS_uxn_opcodes_h_l175_c22_132c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l177_c11_d9c4
BIN_OP_EQ_uxn_opcodes_h_l177_c11_d9c4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l177_c11_d9c4_left,
BIN_OP_EQ_uxn_opcodes_h_l177_c11_d9c4_right,
BIN_OP_EQ_uxn_opcodes_h_l177_c11_d9c4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l177_c7_1936
tmp16_MUX_uxn_opcodes_h_l177_c7_1936 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l177_c7_1936_cond,
tmp16_MUX_uxn_opcodes_h_l177_c7_1936_iftrue,
tmp16_MUX_uxn_opcodes_h_l177_c7_1936_iffalse,
tmp16_MUX_uxn_opcodes_h_l177_c7_1936_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_1936
result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_1936 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_1936_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_1936_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_1936_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_1936_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_1936
result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_1936 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_1936_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_1936_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_1936_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_1936_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l177_c7_1936
result_u16_value_MUX_uxn_opcodes_h_l177_c7_1936 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l177_c7_1936_cond,
result_u16_value_MUX_uxn_opcodes_h_l177_c7_1936_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l177_c7_1936_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l177_c7_1936_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l178_c3_95c1
BIN_OP_OR_uxn_opcodes_h_l178_c3_95c1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l178_c3_95c1_left,
BIN_OP_OR_uxn_opcodes_h_l178_c3_95c1_right,
BIN_OP_OR_uxn_opcodes_h_l178_c3_95c1_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l180_c22_2254
BIN_OP_PLUS_uxn_opcodes_h_l180_c22_2254 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l180_c22_2254_left,
BIN_OP_PLUS_uxn_opcodes_h_l180_c22_2254_right,
BIN_OP_PLUS_uxn_opcodes_h_l180_c22_2254_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l180_c22_048e
BIN_OP_PLUS_uxn_opcodes_h_l180_c22_048e : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l180_c22_048e_left,
BIN_OP_PLUS_uxn_opcodes_h_l180_c22_048e_right,
BIN_OP_PLUS_uxn_opcodes_h_l180_c22_048e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l182_c11_5550
BIN_OP_EQ_uxn_opcodes_h_l182_c11_5550 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l182_c11_5550_left,
BIN_OP_EQ_uxn_opcodes_h_l182_c11_5550_right,
BIN_OP_EQ_uxn_opcodes_h_l182_c11_5550_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_28fc
result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_28fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_28fc_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_28fc_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_28fc_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_28fc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_28fc
result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_28fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_28fc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_28fc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_28fc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_28fc_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l147_c6_3a1c_return_output,
 tmp16_MUX_uxn_opcodes_h_l147_c2_af37_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c2_af37_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l147_c2_af37_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l147_c2_af37_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l147_c2_af37_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l147_c2_af37_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l147_c2_af37_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l147_c2_af37_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l147_c2_af37_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l151_c11_8ac0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l154_c11_03cb_return_output,
 tmp16_MUX_uxn_opcodes_h_l154_c7_1d93_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_1d93_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_1d93_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l154_c7_1d93_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l154_c7_1d93_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_1d93_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_1d93_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l154_c7_1d93_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l160_c11_229d_return_output,
 tmp16_MUX_uxn_opcodes_h_l160_c7_fff1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_fff1_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_fff1_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l160_c7_fff1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l160_c7_fff1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_fff1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_fff1_return_output,
 CONST_SR_8_uxn_opcodes_h_l162_c31_b4b6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l165_c11_d716_return_output,
 tmp16_MUX_uxn_opcodes_h_l165_c7_04fa_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_04fa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_04fa_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l165_c7_04fa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_04fa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l169_c11_2430_return_output,
 tmp16_MUX_uxn_opcodes_h_l169_c7_d9f7_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_d9f7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_d9f7_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l169_c7_d9f7_return_output,
 CONST_SL_8_uxn_opcodes_h_l171_c3_060a_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l172_c22_1674_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l174_c11_da6f_return_output,
 tmp16_MUX_uxn_opcodes_h_l174_c7_e86c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_e86c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_e86c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l174_c7_e86c_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l175_c22_132c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l177_c11_d9c4_return_output,
 tmp16_MUX_uxn_opcodes_h_l177_c7_1936_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_1936_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_1936_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l177_c7_1936_return_output,
 BIN_OP_OR_uxn_opcodes_h_l178_c3_95c1_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l180_c22_2254_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l180_c22_048e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l182_c11_5550_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_28fc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_28fc_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c6_3a1c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c6_3a1c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c6_3a1c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l147_c2_af37_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l151_c3_70a2 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l147_c2_af37_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_1d93_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l147_c2_af37_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l147_c2_af37_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c2_af37_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c2_af37_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_1d93_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c2_af37_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c2_af37_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c2_af37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c2_af37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_1d93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c2_af37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c2_af37_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c2_af37_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c2_af37_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l154_c7_1d93_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c2_af37_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c2_af37_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c2_af37_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c2_af37_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l154_c7_1d93_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c2_af37_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c2_af37_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l147_c2_af37_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l150_c3_8b0a : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l147_c2_af37_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l147_c2_af37_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l147_c2_af37_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l147_c2_af37_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c2_af37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c2_af37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c7_1d93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c2_af37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c2_af37_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c2_af37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c2_af37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_1d93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c2_af37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c2_af37_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c2_af37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c2_af37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_1d93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c2_af37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c2_af37_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l151_c11_8ac0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l151_c11_8ac0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l151_c11_8ac0_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_03cb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_03cb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_03cb_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_1d93_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_1d93_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_fff1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_1d93_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_1d93_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l157_c3_3276 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_1d93_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_fff1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_1d93_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_1d93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_1d93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_fff1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_1d93_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l154_c7_1d93_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l154_c7_1d93_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_fff1_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l154_c7_1d93_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l154_c7_1d93_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l154_c7_1d93_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_fff1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l154_c7_1d93_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_1d93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_1d93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_fff1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_1d93_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_1d93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_1d93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_fff1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_1d93_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c7_1d93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c7_1d93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l154_c7_1d93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c7_1d93_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l158_c21_c125_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_229d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_229d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_229d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_fff1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_fff1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l165_c7_04fa_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_fff1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_fff1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l161_c3_c2d4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_fff1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_fff1_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_fff1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_fff1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_04fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_fff1_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_fff1_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_fff1_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l165_c7_04fa_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_fff1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_fff1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_fff1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_fff1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_fff1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_fff1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_04fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_fff1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_fff1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_fff1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_04fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_fff1_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l162_c31_b4b6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l162_c31_b4b6_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l162_c21_01d9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l165_c11_d716_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l165_c11_d716_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l165_c11_d716_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l165_c7_04fa_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l165_c7_04fa_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l169_c7_d9f7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l165_c7_04fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_04fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_04fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_d9f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_04fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_04fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_04fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_04fa_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l165_c7_04fa_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l165_c7_04fa_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l169_c7_d9f7_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l165_c7_04fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_04fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_04fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_d9f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_04fa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l169_c11_2430_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l169_c11_2430_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l169_c11_2430_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l169_c7_d9f7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l169_c7_d9f7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_e86c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l169_c7_d9f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_d9f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_d9f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_e86c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_d9f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_d9f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_d9f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_e86c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_d9f7_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l169_c7_d9f7_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l172_c3_cf0a : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l169_c7_d9f7_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l174_c7_e86c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l169_c7_d9f7_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l171_c3_060a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l171_c3_060a_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l172_c22_1674_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l172_c22_1674_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l172_c22_1674_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_da6f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_da6f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_da6f_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_e86c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_e86c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l177_c7_1936_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_e86c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_e86c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_e86c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_1936_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_e86c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_e86c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_e86c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_1936_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_e86c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l174_c7_e86c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l175_c3_6eb4 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l174_c7_e86c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l177_c7_1936_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l174_c7_e86c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l175_c22_132c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l175_c22_132c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l175_c22_132c_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l177_c11_d9c4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l177_c11_d9c4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l177_c11_d9c4_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l177_c7_1936_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l177_c7_1936_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l177_c7_1936_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_1936_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_1936_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_28fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_1936_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_1936_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_1936_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_28fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_1936_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l177_c7_1936_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l180_c3_fd68 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l177_c7_1936_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l177_c7_1936_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l178_c3_95c1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l178_c3_95c1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l178_c3_95c1_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l180_c22_2254_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l180_c22_2254_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l180_c22_2254_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l180_c22_048e_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l180_c22_048e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l180_c22_048e_return_output : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l182_c11_5550_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l182_c11_5550_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l182_c11_5550_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_28fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_28fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_28fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_28fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_28fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_28fc_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l160_l147_DUPLICATE_563d_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l174_l169_l165_l160_l154_l182_l147_DUPLICATE_f0b7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l177_l154_l147_DUPLICATE_0ccf_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l160_l147_DUPLICATE_e1c7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l160_l147_l165_DUPLICATE_3c56_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l177_l174_l169_l165_l160_l154_l182_DUPLICATE_5668_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l178_l170_DUPLICATE_2745_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e00b_uxn_opcodes_h_l143_l187_DUPLICATE_ae6a_return_output : opcode_result_t;
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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l151_c11_8ac0_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c6_3a1c_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l161_c3_c2d4 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_fff1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l161_c3_c2d4;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l157_c3_3276 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_1d93_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l157_c3_3276;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l177_c11_d9c4_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_04fa_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_1d93_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l182_c11_5550_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_03cb_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_1936_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_229d_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l165_c11_d716_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l169_c11_2430_right := to_unsigned(4, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l150_c3_8b0a := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l147_c2_af37_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l150_c3_8b0a;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c2_af37_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c7_1d93_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l172_c22_1674_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l175_c22_132c_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c2_af37_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_da6f_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_28fc_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_28fc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l180_c22_048e_right := to_unsigned(2, 2);

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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l151_c11_8ac0_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l172_c22_1674_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l175_c22_132c_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l180_c22_2254_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_fff1_iftrue := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l165_c7_04fa_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c6_3a1c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_03cb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_229d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l165_c11_d716_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l169_c11_2430_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_da6f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l177_c11_d9c4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l182_c11_5550_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l178_c3_95c1_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l162_c31_b4b6_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_1d93_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_fff1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l165_c7_04fa_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_e86c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l177_c7_1936_iffalse := tmp16;
     -- BIN_OP_PLUS[uxn_opcodes_h_l151_c11_8ac0] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l151_c11_8ac0_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l151_c11_8ac0_left;
     BIN_OP_PLUS_uxn_opcodes_h_l151_c11_8ac0_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l151_c11_8ac0_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l151_c11_8ac0_return_output := BIN_OP_PLUS_uxn_opcodes_h_l151_c11_8ac0_return_output;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l147_c2_af37] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l147_c2_af37_return_output := result.sp_relative_shift;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l158_c21_c125] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l158_c21_c125_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l154_c7_1d93] LATENCY=0
     VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l154_c7_1d93_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l160_c11_229d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l160_c11_229d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_229d_left;
     BIN_OP_EQ_uxn_opcodes_h_l160_c11_229d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_229d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_229d_return_output := BIN_OP_EQ_uxn_opcodes_h_l160_c11_229d_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l172_c22_1674] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l172_c22_1674_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l172_c22_1674_left;
     BIN_OP_PLUS_uxn_opcodes_h_l172_c22_1674_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l172_c22_1674_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l172_c22_1674_return_output := BIN_OP_PLUS_uxn_opcodes_h_l172_c22_1674_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l177_c11_d9c4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l177_c11_d9c4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l177_c11_d9c4_left;
     BIN_OP_EQ_uxn_opcodes_h_l177_c11_d9c4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l177_c11_d9c4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l177_c11_d9c4_return_output := BIN_OP_EQ_uxn_opcodes_h_l177_c11_d9c4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l147_c6_3a1c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l147_c6_3a1c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c6_3a1c_left;
     BIN_OP_EQ_uxn_opcodes_h_l147_c6_3a1c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c6_3a1c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c6_3a1c_return_output := BIN_OP_EQ_uxn_opcodes_h_l147_c6_3a1c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l174_l169_l165_l160_l154_l182_l147_DUPLICATE_f0b7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l174_l169_l165_l160_l154_l182_l147_DUPLICATE_f0b7_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l160_l147_l165_DUPLICATE_3c56 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l160_l147_l165_DUPLICATE_3c56_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l177_l154_l147_DUPLICATE_0ccf LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l177_l154_l147_DUPLICATE_0ccf_return_output := result.u16_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l178_l170_DUPLICATE_2745 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l178_l170_DUPLICATE_2745_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l160_l147_DUPLICATE_563d LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l160_l147_DUPLICATE_563d_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l177_l174_l169_l165_l160_l154_l182_DUPLICATE_5668 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l177_l174_l169_l165_l160_l154_l182_DUPLICATE_5668_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l160_l147_DUPLICATE_e1c7 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l160_l147_DUPLICATE_e1c7_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l182_c11_5550] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l182_c11_5550_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l182_c11_5550_left;
     BIN_OP_EQ_uxn_opcodes_h_l182_c11_5550_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l182_c11_5550_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l182_c11_5550_return_output := BIN_OP_EQ_uxn_opcodes_h_l182_c11_5550_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l154_c11_03cb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l154_c11_03cb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_03cb_left;
     BIN_OP_EQ_uxn_opcodes_h_l154_c11_03cb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_03cb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_03cb_return_output := BIN_OP_EQ_uxn_opcodes_h_l154_c11_03cb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l174_c11_da6f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l174_c11_da6f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_da6f_left;
     BIN_OP_EQ_uxn_opcodes_h_l174_c11_da6f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_da6f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_da6f_return_output := BIN_OP_EQ_uxn_opcodes_h_l174_c11_da6f_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l162_c31_b4b6] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l162_c31_b4b6_x <= VAR_CONST_SR_8_uxn_opcodes_h_l162_c31_b4b6_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l162_c31_b4b6_return_output := CONST_SR_8_uxn_opcodes_h_l162_c31_b4b6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l169_c11_2430] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l169_c11_2430_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l169_c11_2430_left;
     BIN_OP_EQ_uxn_opcodes_h_l169_c11_2430_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l169_c11_2430_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l169_c11_2430_return_output := BIN_OP_EQ_uxn_opcodes_h_l169_c11_2430_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l165_c11_d716] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l165_c11_d716_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l165_c11_d716_left;
     BIN_OP_EQ_uxn_opcodes_h_l165_c11_d716_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l165_c11_d716_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l165_c11_d716_return_output := BIN_OP_EQ_uxn_opcodes_h_l165_c11_d716_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l175_c22_132c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l175_c22_132c_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l175_c22_132c_left;
     BIN_OP_PLUS_uxn_opcodes_h_l175_c22_132c_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l175_c22_132c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l175_c22_132c_return_output := BIN_OP_PLUS_uxn_opcodes_h_l175_c22_132c_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c2_af37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c6_3a1c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c2_af37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c6_3a1c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c2_af37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c6_3a1c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c2_af37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c6_3a1c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l147_c2_af37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c6_3a1c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c2_af37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c6_3a1c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c2_af37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c6_3a1c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c2_af37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c6_3a1c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l147_c2_af37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c6_3a1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_1d93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_03cb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_1d93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_03cb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c7_1d93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_03cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_1d93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_03cb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_1d93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_03cb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l154_c7_1d93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_03cb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l154_c7_1d93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_03cb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_1d93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_03cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_fff1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_229d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_fff1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_229d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_fff1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_229d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_fff1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_229d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_fff1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_229d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_fff1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_229d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_fff1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_229d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_04fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l165_c11_d716_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_04fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l165_c11_d716_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_04fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l165_c11_d716_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l165_c7_04fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l165_c11_d716_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l165_c7_04fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l165_c11_d716_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_d9f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l169_c11_2430_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_d9f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l169_c11_2430_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l169_c7_d9f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l169_c11_2430_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l169_c7_d9f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l169_c11_2430_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_e86c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_da6f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_e86c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_da6f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l174_c7_e86c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_da6f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_e86c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_da6f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_1936_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l177_c11_d9c4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_1936_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l177_c11_d9c4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l177_c7_1936_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l177_c11_d9c4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l177_c7_1936_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l177_c11_d9c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_28fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l182_c11_5550_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_28fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l182_c11_5550_return_output;
     VAR_tmp16_uxn_opcodes_h_l151_c3_70a2 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l151_c11_8ac0_return_output, 16);
     VAR_result_u16_value_uxn_opcodes_h_l172_c3_cf0a := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l172_c22_1674_return_output, 16);
     VAR_result_u16_value_uxn_opcodes_h_l175_c3_6eb4 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l175_c22_132c_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l178_c3_95c1_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l178_l170_DUPLICATE_2745_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l171_c3_060a_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l178_l170_DUPLICATE_2745_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l154_c7_1d93_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l158_c21_c125_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c2_af37_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l177_l154_l147_DUPLICATE_0ccf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l154_c7_1d93_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l177_l154_l147_DUPLICATE_0ccf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l177_c7_1936_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l177_l154_l147_DUPLICATE_0ccf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_1d93_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l177_l174_l169_l165_l160_l154_l182_DUPLICATE_5668_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_fff1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l177_l174_l169_l165_l160_l154_l182_DUPLICATE_5668_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_04fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l177_l174_l169_l165_l160_l154_l182_DUPLICATE_5668_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_d9f7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l177_l174_l169_l165_l160_l154_l182_DUPLICATE_5668_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_e86c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l177_l174_l169_l165_l160_l154_l182_DUPLICATE_5668_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_1936_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l177_l174_l169_l165_l160_l154_l182_DUPLICATE_5668_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_28fc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l177_l174_l169_l165_l160_l154_l182_DUPLICATE_5668_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c2_af37_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l174_l169_l165_l160_l154_l182_l147_DUPLICATE_f0b7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_1d93_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l174_l169_l165_l160_l154_l182_l147_DUPLICATE_f0b7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_fff1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l174_l169_l165_l160_l154_l182_l147_DUPLICATE_f0b7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_04fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l174_l169_l165_l160_l154_l182_l147_DUPLICATE_f0b7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_d9f7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l174_l169_l165_l160_l154_l182_l147_DUPLICATE_f0b7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_e86c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l174_l169_l165_l160_l154_l182_l147_DUPLICATE_f0b7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_28fc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l174_l169_l165_l160_l154_l182_l147_DUPLICATE_f0b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c2_af37_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l160_l147_l165_DUPLICATE_3c56_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_fff1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l160_l147_l165_DUPLICATE_3c56_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_04fa_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l160_l147_l165_DUPLICATE_3c56_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c2_af37_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l160_l147_DUPLICATE_563d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_fff1_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l160_l147_DUPLICATE_563d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c2_af37_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l160_l147_DUPLICATE_e1c7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_fff1_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l160_l147_DUPLICATE_e1c7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c7_1d93_iffalse := VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l154_c7_1d93_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l147_c2_af37_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l147_c2_af37_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l169_c7_d9f7_iftrue := VAR_result_u16_value_uxn_opcodes_h_l172_c3_cf0a;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l174_c7_e86c_iftrue := VAR_result_u16_value_uxn_opcodes_h_l175_c3_6eb4;
     VAR_tmp16_MUX_uxn_opcodes_h_l147_c2_af37_iftrue := VAR_tmp16_uxn_opcodes_h_l151_c3_70a2;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l162_c21_01d9] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l162_c21_01d9_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l162_c31_b4b6_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l160_c7_fff1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_fff1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_fff1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_fff1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_fff1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_fff1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_fff1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_fff1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_fff1_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l178_c3_95c1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l178_c3_95c1_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l178_c3_95c1_left;
     BIN_OP_OR_uxn_opcodes_h_l178_c3_95c1_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l178_c3_95c1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l178_c3_95c1_return_output := BIN_OP_OR_uxn_opcodes_h_l178_c3_95c1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l147_c2_af37] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l147_c2_af37_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l147_c2_af37_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l147_c2_af37_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l147_c2_af37_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l147_c2_af37_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l147_c2_af37_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l147_c2_af37_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l147_c2_af37_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l182_c7_28fc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_28fc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_28fc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_28fc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_28fc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_28fc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_28fc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_28fc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_28fc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l154_c7_1d93] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l154_c7_1d93_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c7_1d93_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l154_c7_1d93_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c7_1d93_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l154_c7_1d93_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c7_1d93_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c7_1d93_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l154_c7_1d93_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l171_c3_060a] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l171_c3_060a_x <= VAR_CONST_SL_8_uxn_opcodes_h_l171_c3_060a_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l171_c3_060a_return_output := CONST_SL_8_uxn_opcodes_h_l171_c3_060a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l165_c7_04fa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_04fa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_04fa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_04fa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_04fa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_04fa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_04fa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_04fa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_04fa_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l182_c7_28fc] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_28fc_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_28fc_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_28fc_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_28fc_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_28fc_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_28fc_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_28fc_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_28fc_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l180_c22_2254_right := VAR_BIN_OP_OR_uxn_opcodes_h_l178_c3_95c1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l177_c7_1936_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l178_c3_95c1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_fff1_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l162_c21_01d9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l169_c7_d9f7_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l171_c3_060a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_1936_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_28fc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_1936_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_28fc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c2_af37_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c7_1d93_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_fff1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_04fa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_1d93_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_fff1_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l160_c7_fff1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_fff1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_fff1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_fff1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_fff1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_fff1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_fff1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_fff1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_fff1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l154_c7_1d93] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_1d93_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_1d93_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_1d93_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_1d93_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_1d93_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_1d93_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_1d93_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_1d93_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l147_c2_af37] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l147_c2_af37_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c2_af37_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l147_c2_af37_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c2_af37_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l147_c2_af37_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c2_af37_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c2_af37_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l147_c2_af37_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l160_c7_fff1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l160_c7_fff1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_fff1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l160_c7_fff1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_fff1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l160_c7_fff1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_fff1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_fff1_return_output := result_u8_value_MUX_uxn_opcodes_h_l160_c7_fff1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l177_c7_1936] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_1936_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_1936_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_1936_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_1936_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_1936_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_1936_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_1936_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_1936_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l180_c22_2254] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l180_c22_2254_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l180_c22_2254_left;
     BIN_OP_PLUS_uxn_opcodes_h_l180_c22_2254_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l180_c22_2254_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l180_c22_2254_return_output := BIN_OP_PLUS_uxn_opcodes_h_l180_c22_2254_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l177_c7_1936] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l177_c7_1936_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l177_c7_1936_cond;
     tmp16_MUX_uxn_opcodes_h_l177_c7_1936_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l177_c7_1936_iftrue;
     tmp16_MUX_uxn_opcodes_h_l177_c7_1936_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l177_c7_1936_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l177_c7_1936_return_output := tmp16_MUX_uxn_opcodes_h_l177_c7_1936_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l177_c7_1936] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_1936_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_1936_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_1936_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_1936_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_1936_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_1936_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_1936_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_1936_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l180_c22_048e_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l180_c22_2254_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_e86c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_1936_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_e86c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_1936_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_1d93_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_fff1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c2_af37_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_1d93_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l154_c7_1d93_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_fff1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_e86c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l177_c7_1936_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l154_c7_1d93] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_1d93_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_1d93_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_1d93_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_1d93_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_1d93_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_1d93_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_1d93_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_1d93_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l174_c7_e86c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_e86c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_e86c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_e86c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_e86c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_e86c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_e86c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_e86c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_e86c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l147_c2_af37] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c2_af37_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c2_af37_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c2_af37_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c2_af37_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c2_af37_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c2_af37_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c2_af37_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c2_af37_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l154_c7_1d93] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l154_c7_1d93_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l154_c7_1d93_cond;
     result_u8_value_MUX_uxn_opcodes_h_l154_c7_1d93_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l154_c7_1d93_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l154_c7_1d93_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l154_c7_1d93_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l154_c7_1d93_return_output := result_u8_value_MUX_uxn_opcodes_h_l154_c7_1d93_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l174_c7_e86c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l174_c7_e86c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_e86c_cond;
     tmp16_MUX_uxn_opcodes_h_l174_c7_e86c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_e86c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l174_c7_e86c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_e86c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_e86c_return_output := tmp16_MUX_uxn_opcodes_h_l174_c7_e86c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l174_c7_e86c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_e86c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_e86c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_e86c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_e86c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_e86c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_e86c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_e86c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_e86c_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l180_c22_048e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l180_c22_048e_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l180_c22_048e_left;
     BIN_OP_PLUS_uxn_opcodes_h_l180_c22_048e_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l180_c22_048e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l180_c22_048e_return_output := BIN_OP_PLUS_uxn_opcodes_h_l180_c22_048e_return_output;

     -- Submodule level 4
     VAR_result_u16_value_uxn_opcodes_h_l180_c3_fd68 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l180_c22_048e_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_d9f7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_e86c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_d9f7_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_e86c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c2_af37_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_1d93_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c2_af37_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l154_c7_1d93_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l169_c7_d9f7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_e86c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l177_c7_1936_iftrue := VAR_result_u16_value_uxn_opcodes_h_l180_c3_fd68;
     -- result_u8_value_MUX[uxn_opcodes_h_l147_c2_af37] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l147_c2_af37_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c2_af37_cond;
     result_u8_value_MUX_uxn_opcodes_h_l147_c2_af37_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c2_af37_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l147_c2_af37_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c2_af37_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c2_af37_return_output := result_u8_value_MUX_uxn_opcodes_h_l147_c2_af37_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l147_c2_af37] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l147_c2_af37_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c2_af37_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l147_c2_af37_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c2_af37_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l147_c2_af37_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c2_af37_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c2_af37_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l147_c2_af37_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l169_c7_d9f7] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_d9f7_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_d9f7_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_d9f7_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_d9f7_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_d9f7_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_d9f7_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_d9f7_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_d9f7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l169_c7_d9f7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l169_c7_d9f7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l169_c7_d9f7_cond;
     tmp16_MUX_uxn_opcodes_h_l169_c7_d9f7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l169_c7_d9f7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l169_c7_d9f7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l169_c7_d9f7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l169_c7_d9f7_return_output := tmp16_MUX_uxn_opcodes_h_l169_c7_d9f7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l169_c7_d9f7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_d9f7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_d9f7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_d9f7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_d9f7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_d9f7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_d9f7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_d9f7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_d9f7_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l177_c7_1936] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l177_c7_1936_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l177_c7_1936_cond;
     result_u16_value_MUX_uxn_opcodes_h_l177_c7_1936_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l177_c7_1936_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l177_c7_1936_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l177_c7_1936_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l177_c7_1936_return_output := result_u16_value_MUX_uxn_opcodes_h_l177_c7_1936_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_04fa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_d9f7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_04fa_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_d9f7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l174_c7_e86c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l177_c7_1936_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l165_c7_04fa_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l169_c7_d9f7_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l174_c7_e86c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l174_c7_e86c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l174_c7_e86c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l174_c7_e86c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l174_c7_e86c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l174_c7_e86c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l174_c7_e86c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l174_c7_e86c_return_output := result_u16_value_MUX_uxn_opcodes_h_l174_c7_e86c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l165_c7_04fa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_04fa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_04fa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_04fa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_04fa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_04fa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_04fa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_04fa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_04fa_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l165_c7_04fa] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_04fa_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_04fa_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_04fa_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_04fa_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_04fa_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_04fa_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_04fa_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_04fa_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l165_c7_04fa] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l165_c7_04fa_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l165_c7_04fa_cond;
     tmp16_MUX_uxn_opcodes_h_l165_c7_04fa_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l165_c7_04fa_iftrue;
     tmp16_MUX_uxn_opcodes_h_l165_c7_04fa_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l165_c7_04fa_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l165_c7_04fa_return_output := tmp16_MUX_uxn_opcodes_h_l165_c7_04fa_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_fff1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_04fa_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_fff1_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_04fa_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l169_c7_d9f7_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l174_c7_e86c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_fff1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l165_c7_04fa_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l160_c7_fff1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_fff1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_fff1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_fff1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_fff1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_fff1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_fff1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_fff1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_fff1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l160_c7_fff1] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_fff1_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_fff1_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_fff1_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_fff1_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_fff1_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_fff1_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_fff1_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_fff1_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l169_c7_d9f7] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l169_c7_d9f7_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l169_c7_d9f7_cond;
     result_u16_value_MUX_uxn_opcodes_h_l169_c7_d9f7_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l169_c7_d9f7_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l169_c7_d9f7_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l169_c7_d9f7_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l169_c7_d9f7_return_output := result_u16_value_MUX_uxn_opcodes_h_l169_c7_d9f7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l160_c7_fff1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l160_c7_fff1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_fff1_cond;
     tmp16_MUX_uxn_opcodes_h_l160_c7_fff1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_fff1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l160_c7_fff1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_fff1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_fff1_return_output := tmp16_MUX_uxn_opcodes_h_l160_c7_fff1_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_1d93_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_fff1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_1d93_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_fff1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l165_c7_04fa_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l169_c7_d9f7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_1d93_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_fff1_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l154_c7_1d93] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_1d93_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_1d93_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_1d93_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_1d93_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_1d93_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_1d93_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_1d93_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_1d93_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l165_c7_04fa] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l165_c7_04fa_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l165_c7_04fa_cond;
     result_u16_value_MUX_uxn_opcodes_h_l165_c7_04fa_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l165_c7_04fa_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l165_c7_04fa_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l165_c7_04fa_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l165_c7_04fa_return_output := result_u16_value_MUX_uxn_opcodes_h_l165_c7_04fa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l154_c7_1d93] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_1d93_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_1d93_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_1d93_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_1d93_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_1d93_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_1d93_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_1d93_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_1d93_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l154_c7_1d93] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l154_c7_1d93_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_1d93_cond;
     tmp16_MUX_uxn_opcodes_h_l154_c7_1d93_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_1d93_iftrue;
     tmp16_MUX_uxn_opcodes_h_l154_c7_1d93_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_1d93_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_1d93_return_output := tmp16_MUX_uxn_opcodes_h_l154_c7_1d93_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c2_af37_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_1d93_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c2_af37_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_1d93_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_fff1_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l165_c7_04fa_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l147_c2_af37_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_1d93_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l147_c2_af37] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l147_c2_af37_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l147_c2_af37_cond;
     tmp16_MUX_uxn_opcodes_h_l147_c2_af37_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l147_c2_af37_iftrue;
     tmp16_MUX_uxn_opcodes_h_l147_c2_af37_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l147_c2_af37_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l147_c2_af37_return_output := tmp16_MUX_uxn_opcodes_h_l147_c2_af37_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l147_c2_af37] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l147_c2_af37_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c2_af37_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l147_c2_af37_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c2_af37_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l147_c2_af37_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c2_af37_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c2_af37_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l147_c2_af37_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l147_c2_af37] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l147_c2_af37_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c2_af37_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l147_c2_af37_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c2_af37_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l147_c2_af37_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c2_af37_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c2_af37_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l147_c2_af37_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l160_c7_fff1] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l160_c7_fff1_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_fff1_cond;
     result_u16_value_MUX_uxn_opcodes_h_l160_c7_fff1_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_fff1_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l160_c7_fff1_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_fff1_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_fff1_return_output := result_u16_value_MUX_uxn_opcodes_h_l160_c7_fff1_return_output;

     -- Submodule level 9
     VAR_result_u16_value_MUX_uxn_opcodes_h_l154_c7_1d93_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_fff1_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l147_c2_af37_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l154_c7_1d93] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l154_c7_1d93_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l154_c7_1d93_cond;
     result_u16_value_MUX_uxn_opcodes_h_l154_c7_1d93_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l154_c7_1d93_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l154_c7_1d93_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l154_c7_1d93_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l154_c7_1d93_return_output := result_u16_value_MUX_uxn_opcodes_h_l154_c7_1d93_return_output;

     -- Submodule level 10
     VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c2_af37_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l154_c7_1d93_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l147_c2_af37] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l147_c2_af37_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c2_af37_cond;
     result_u16_value_MUX_uxn_opcodes_h_l147_c2_af37_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c2_af37_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l147_c2_af37_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c2_af37_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c2_af37_return_output := result_u16_value_MUX_uxn_opcodes_h_l147_c2_af37_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e00b_uxn_opcodes_h_l143_l187_DUPLICATE_ae6a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e00b_uxn_opcodes_h_l143_l187_DUPLICATE_ae6a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e00b(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c2_af37_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c2_af37_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c2_af37_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c2_af37_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l147_c2_af37_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c2_af37_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c2_af37_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c2_af37_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e00b_uxn_opcodes_h_l143_l187_DUPLICATE_ae6a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e00b_uxn_opcodes_h_l143_l187_DUPLICATE_ae6a_return_output;
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
