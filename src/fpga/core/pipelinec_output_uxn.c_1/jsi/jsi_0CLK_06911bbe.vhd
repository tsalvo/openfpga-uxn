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
-- Submodules: 65
entity jsi_0CLK_06911bbe is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jsi_0CLK_06911bbe;
architecture arch of jsi_0CLK_06911bbe is
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
-- BIN_OP_EQ[uxn_opcodes_h_l147_c6_17e6]
signal BIN_OP_EQ_uxn_opcodes_h_l147_c6_17e6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l147_c6_17e6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l147_c6_17e6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l147_c1_542c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l147_c1_542c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l147_c1_542c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l147_c1_542c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l147_c1_542c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l147_c2_b96e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c2_b96e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c2_b96e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c2_b96e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c2_b96e_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l147_c2_b96e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l147_c2_b96e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l147_c2_b96e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l147_c2_b96e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l147_c2_b96e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l147_c2_b96e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l147_c2_b96e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l147_c2_b96e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l147_c2_b96e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l147_c2_b96e_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l147_c2_b96e]
signal result_u16_value_MUX_uxn_opcodes_h_l147_c2_b96e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l147_c2_b96e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l147_c2_b96e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l147_c2_b96e_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l147_c2_b96e]
signal result_u8_value_MUX_uxn_opcodes_h_l147_c2_b96e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l147_c2_b96e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l147_c2_b96e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l147_c2_b96e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l147_c2_b96e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l147_c2_b96e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l147_c2_b96e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l147_c2_b96e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l147_c2_b96e_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l147_c2_b96e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l147_c2_b96e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l147_c2_b96e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l147_c2_b96e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l147_c2_b96e_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l147_c2_b96e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l147_c2_b96e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l147_c2_b96e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l147_c2_b96e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l147_c2_b96e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l147_c2_b96e]
signal tmp16_MUX_uxn_opcodes_h_l147_c2_b96e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l147_c2_b96e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l147_c2_b96e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l147_c2_b96e_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l148_c3_3c15[uxn_opcodes_h_l148_c3_3c15]
signal printf_uxn_opcodes_h_l148_c3_3c15_uxn_opcodes_h_l148_c3_3c15_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l151_c11_2ab6]
signal BIN_OP_PLUS_uxn_opcodes_h_l151_c11_2ab6_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l151_c11_2ab6_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l151_c11_2ab6_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l154_c11_8fb2]
signal BIN_OP_EQ_uxn_opcodes_h_l154_c11_8fb2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l154_c11_8fb2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l154_c11_8fb2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l154_c7_2d37]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_2d37_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_2d37_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_2d37_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_2d37_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l154_c7_2d37]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_2d37_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_2d37_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_2d37_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_2d37_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l154_c7_2d37]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l154_c7_2d37_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l154_c7_2d37_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l154_c7_2d37_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l154_c7_2d37_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l154_c7_2d37]
signal result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_2d37_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_2d37_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_2d37_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_2d37_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l154_c7_2d37]
signal result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_2d37_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_2d37_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_2d37_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_2d37_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l154_c7_2d37]
signal result_u16_value_MUX_uxn_opcodes_h_l154_c7_2d37_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l154_c7_2d37_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l154_c7_2d37_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l154_c7_2d37_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l154_c7_2d37]
signal result_u8_value_MUX_uxn_opcodes_h_l154_c7_2d37_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l154_c7_2d37_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l154_c7_2d37_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l154_c7_2d37_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l154_c7_2d37]
signal tmp16_MUX_uxn_opcodes_h_l154_c7_2d37_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l154_c7_2d37_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l154_c7_2d37_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l154_c7_2d37_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l160_c11_57df]
signal BIN_OP_EQ_uxn_opcodes_h_l160_c11_57df_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l160_c11_57df_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l160_c11_57df_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l160_c7_1578]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_1578_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_1578_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_1578_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_1578_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l160_c7_1578]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_1578_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_1578_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_1578_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_1578_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l160_c7_1578]
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_1578_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_1578_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_1578_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_1578_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l160_c7_1578]
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_1578_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_1578_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_1578_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_1578_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l160_c7_1578]
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_1578_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_1578_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_1578_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_1578_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l160_c7_1578]
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_1578_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_1578_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_1578_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_1578_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l160_c7_1578]
signal tmp16_MUX_uxn_opcodes_h_l160_c7_1578_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l160_c7_1578_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l160_c7_1578_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l160_c7_1578_return_output : unsigned(15 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l162_c31_55ec]
signal CONST_SR_8_uxn_opcodes_h_l162_c31_55ec_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l162_c31_55ec_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l165_c11_e5ad]
signal BIN_OP_EQ_uxn_opcodes_h_l165_c11_e5ad_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l165_c11_e5ad_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l165_c11_e5ad_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l165_c7_676d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_676d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_676d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_676d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_676d_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l165_c7_676d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_676d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_676d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_676d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_676d_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l165_c7_676d]
signal result_u16_value_MUX_uxn_opcodes_h_l165_c7_676d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l165_c7_676d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l165_c7_676d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l165_c7_676d_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l165_c7_676d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_676d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_676d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_676d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_676d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l165_c7_676d]
signal tmp16_MUX_uxn_opcodes_h_l165_c7_676d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l165_c7_676d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l165_c7_676d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l165_c7_676d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l169_c11_3e05]
signal BIN_OP_EQ_uxn_opcodes_h_l169_c11_3e05_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l169_c11_3e05_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l169_c11_3e05_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l169_c7_f1c6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_f1c6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_f1c6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_f1c6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_f1c6_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l169_c7_f1c6]
signal result_u16_value_MUX_uxn_opcodes_h_l169_c7_f1c6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l169_c7_f1c6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l169_c7_f1c6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l169_c7_f1c6_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l169_c7_f1c6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_f1c6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_f1c6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_f1c6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_f1c6_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l169_c7_f1c6]
signal tmp16_MUX_uxn_opcodes_h_l169_c7_f1c6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l169_c7_f1c6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l169_c7_f1c6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l169_c7_f1c6_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l171_c3_998a]
signal CONST_SL_8_uxn_opcodes_h_l171_c3_998a_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l171_c3_998a_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l172_c22_6cd3]
signal BIN_OP_PLUS_uxn_opcodes_h_l172_c22_6cd3_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l172_c22_6cd3_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l172_c22_6cd3_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l174_c11_1f99]
signal BIN_OP_EQ_uxn_opcodes_h_l174_c11_1f99_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l174_c11_1f99_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l174_c11_1f99_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l174_c7_0b21]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_0b21_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_0b21_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_0b21_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_0b21_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l174_c7_0b21]
signal result_u16_value_MUX_uxn_opcodes_h_l174_c7_0b21_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l174_c7_0b21_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l174_c7_0b21_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l174_c7_0b21_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l174_c7_0b21]
signal result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_0b21_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_0b21_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_0b21_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_0b21_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l174_c7_0b21]
signal tmp16_MUX_uxn_opcodes_h_l174_c7_0b21_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l174_c7_0b21_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l174_c7_0b21_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l174_c7_0b21_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l175_c22_b4f1]
signal BIN_OP_PLUS_uxn_opcodes_h_l175_c22_b4f1_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l175_c22_b4f1_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l175_c22_b4f1_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l177_c11_4b64]
signal BIN_OP_EQ_uxn_opcodes_h_l177_c11_4b64_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l177_c11_4b64_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l177_c11_4b64_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l177_c7_70b2]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_70b2_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_70b2_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_70b2_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_70b2_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l177_c7_70b2]
signal result_u16_value_MUX_uxn_opcodes_h_l177_c7_70b2_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l177_c7_70b2_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l177_c7_70b2_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l177_c7_70b2_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l177_c7_70b2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_70b2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_70b2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_70b2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_70b2_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l177_c7_70b2]
signal tmp16_MUX_uxn_opcodes_h_l177_c7_70b2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l177_c7_70b2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l177_c7_70b2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l177_c7_70b2_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l178_c3_6b29]
signal BIN_OP_OR_uxn_opcodes_h_l178_c3_6b29_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l178_c3_6b29_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l178_c3_6b29_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l180_c22_ac15]
signal BIN_OP_PLUS_uxn_opcodes_h_l180_c22_ac15_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l180_c22_ac15_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l180_c22_ac15_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l180_c22_533f]
signal BIN_OP_PLUS_uxn_opcodes_h_l180_c22_533f_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l180_c22_533f_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l180_c22_533f_return_output : unsigned(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l182_c11_d39b]
signal BIN_OP_EQ_uxn_opcodes_h_l182_c11_d39b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l182_c11_d39b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l182_c11_d39b_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l182_c7_9d1c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_9d1c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_9d1c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_9d1c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_9d1c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l182_c7_9d1c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_9d1c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_9d1c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_9d1c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_9d1c_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_7de8( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.u16_value := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_opc_done := ref_toks_7;
      base.is_pc_updated := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l147_c6_17e6
BIN_OP_EQ_uxn_opcodes_h_l147_c6_17e6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l147_c6_17e6_left,
BIN_OP_EQ_uxn_opcodes_h_l147_c6_17e6_right,
BIN_OP_EQ_uxn_opcodes_h_l147_c6_17e6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l147_c1_542c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l147_c1_542c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l147_c1_542c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l147_c1_542c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l147_c1_542c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l147_c1_542c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c2_b96e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c2_b96e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c2_b96e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c2_b96e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c2_b96e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c2_b96e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l147_c2_b96e
result_is_sp_shift_MUX_uxn_opcodes_h_l147_c2_b96e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l147_c2_b96e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l147_c2_b96e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l147_c2_b96e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l147_c2_b96e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l147_c2_b96e
result_is_stack_write_MUX_uxn_opcodes_h_l147_c2_b96e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l147_c2_b96e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l147_c2_b96e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l147_c2_b96e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l147_c2_b96e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l147_c2_b96e
result_u16_value_MUX_uxn_opcodes_h_l147_c2_b96e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l147_c2_b96e_cond,
result_u16_value_MUX_uxn_opcodes_h_l147_c2_b96e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l147_c2_b96e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l147_c2_b96e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l147_c2_b96e
result_u8_value_MUX_uxn_opcodes_h_l147_c2_b96e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l147_c2_b96e_cond,
result_u8_value_MUX_uxn_opcodes_h_l147_c2_b96e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l147_c2_b96e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l147_c2_b96e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l147_c2_b96e
result_sp_relative_shift_MUX_uxn_opcodes_h_l147_c2_b96e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l147_c2_b96e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l147_c2_b96e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l147_c2_b96e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l147_c2_b96e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l147_c2_b96e
result_is_opc_done_MUX_uxn_opcodes_h_l147_c2_b96e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l147_c2_b96e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l147_c2_b96e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l147_c2_b96e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l147_c2_b96e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l147_c2_b96e
result_is_pc_updated_MUX_uxn_opcodes_h_l147_c2_b96e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l147_c2_b96e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l147_c2_b96e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l147_c2_b96e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l147_c2_b96e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l147_c2_b96e
tmp16_MUX_uxn_opcodes_h_l147_c2_b96e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l147_c2_b96e_cond,
tmp16_MUX_uxn_opcodes_h_l147_c2_b96e_iftrue,
tmp16_MUX_uxn_opcodes_h_l147_c2_b96e_iffalse,
tmp16_MUX_uxn_opcodes_h_l147_c2_b96e_return_output);

-- printf_uxn_opcodes_h_l148_c3_3c15_uxn_opcodes_h_l148_c3_3c15
printf_uxn_opcodes_h_l148_c3_3c15_uxn_opcodes_h_l148_c3_3c15 : entity work.printf_uxn_opcodes_h_l148_c3_3c15_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l148_c3_3c15_uxn_opcodes_h_l148_c3_3c15_CLOCK_ENABLE);

-- BIN_OP_PLUS_uxn_opcodes_h_l151_c11_2ab6
BIN_OP_PLUS_uxn_opcodes_h_l151_c11_2ab6 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l151_c11_2ab6_left,
BIN_OP_PLUS_uxn_opcodes_h_l151_c11_2ab6_right,
BIN_OP_PLUS_uxn_opcodes_h_l151_c11_2ab6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l154_c11_8fb2
BIN_OP_EQ_uxn_opcodes_h_l154_c11_8fb2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l154_c11_8fb2_left,
BIN_OP_EQ_uxn_opcodes_h_l154_c11_8fb2_right,
BIN_OP_EQ_uxn_opcodes_h_l154_c11_8fb2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_2d37
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_2d37 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_2d37_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_2d37_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_2d37_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_2d37_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_2d37
result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_2d37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_2d37_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_2d37_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_2d37_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_2d37_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l154_c7_2d37
result_is_sp_shift_MUX_uxn_opcodes_h_l154_c7_2d37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l154_c7_2d37_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l154_c7_2d37_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l154_c7_2d37_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l154_c7_2d37_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_2d37
result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_2d37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_2d37_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_2d37_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_2d37_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_2d37_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_2d37
result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_2d37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_2d37_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_2d37_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_2d37_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_2d37_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l154_c7_2d37
result_u16_value_MUX_uxn_opcodes_h_l154_c7_2d37 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l154_c7_2d37_cond,
result_u16_value_MUX_uxn_opcodes_h_l154_c7_2d37_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l154_c7_2d37_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l154_c7_2d37_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l154_c7_2d37
result_u8_value_MUX_uxn_opcodes_h_l154_c7_2d37 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l154_c7_2d37_cond,
result_u8_value_MUX_uxn_opcodes_h_l154_c7_2d37_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l154_c7_2d37_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l154_c7_2d37_return_output);

-- tmp16_MUX_uxn_opcodes_h_l154_c7_2d37
tmp16_MUX_uxn_opcodes_h_l154_c7_2d37 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l154_c7_2d37_cond,
tmp16_MUX_uxn_opcodes_h_l154_c7_2d37_iftrue,
tmp16_MUX_uxn_opcodes_h_l154_c7_2d37_iffalse,
tmp16_MUX_uxn_opcodes_h_l154_c7_2d37_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l160_c11_57df
BIN_OP_EQ_uxn_opcodes_h_l160_c11_57df : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l160_c11_57df_left,
BIN_OP_EQ_uxn_opcodes_h_l160_c11_57df_right,
BIN_OP_EQ_uxn_opcodes_h_l160_c11_57df_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_1578
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_1578 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_1578_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_1578_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_1578_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_1578_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_1578
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_1578 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_1578_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_1578_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_1578_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_1578_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_1578
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_1578 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_1578_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_1578_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_1578_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_1578_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_1578
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_1578 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_1578_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_1578_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_1578_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_1578_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l160_c7_1578
result_u16_value_MUX_uxn_opcodes_h_l160_c7_1578 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l160_c7_1578_cond,
result_u16_value_MUX_uxn_opcodes_h_l160_c7_1578_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l160_c7_1578_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l160_c7_1578_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l160_c7_1578
result_u8_value_MUX_uxn_opcodes_h_l160_c7_1578 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l160_c7_1578_cond,
result_u8_value_MUX_uxn_opcodes_h_l160_c7_1578_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l160_c7_1578_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l160_c7_1578_return_output);

-- tmp16_MUX_uxn_opcodes_h_l160_c7_1578
tmp16_MUX_uxn_opcodes_h_l160_c7_1578 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l160_c7_1578_cond,
tmp16_MUX_uxn_opcodes_h_l160_c7_1578_iftrue,
tmp16_MUX_uxn_opcodes_h_l160_c7_1578_iffalse,
tmp16_MUX_uxn_opcodes_h_l160_c7_1578_return_output);

-- CONST_SR_8_uxn_opcodes_h_l162_c31_55ec
CONST_SR_8_uxn_opcodes_h_l162_c31_55ec : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l162_c31_55ec_x,
CONST_SR_8_uxn_opcodes_h_l162_c31_55ec_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l165_c11_e5ad
BIN_OP_EQ_uxn_opcodes_h_l165_c11_e5ad : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l165_c11_e5ad_left,
BIN_OP_EQ_uxn_opcodes_h_l165_c11_e5ad_right,
BIN_OP_EQ_uxn_opcodes_h_l165_c11_e5ad_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_676d
result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_676d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_676d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_676d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_676d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_676d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_676d
result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_676d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_676d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_676d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_676d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_676d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l165_c7_676d
result_u16_value_MUX_uxn_opcodes_h_l165_c7_676d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l165_c7_676d_cond,
result_u16_value_MUX_uxn_opcodes_h_l165_c7_676d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l165_c7_676d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l165_c7_676d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_676d
result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_676d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_676d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_676d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_676d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_676d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l165_c7_676d
tmp16_MUX_uxn_opcodes_h_l165_c7_676d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l165_c7_676d_cond,
tmp16_MUX_uxn_opcodes_h_l165_c7_676d_iftrue,
tmp16_MUX_uxn_opcodes_h_l165_c7_676d_iffalse,
tmp16_MUX_uxn_opcodes_h_l165_c7_676d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l169_c11_3e05
BIN_OP_EQ_uxn_opcodes_h_l169_c11_3e05 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l169_c11_3e05_left,
BIN_OP_EQ_uxn_opcodes_h_l169_c11_3e05_right,
BIN_OP_EQ_uxn_opcodes_h_l169_c11_3e05_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_f1c6
result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_f1c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_f1c6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_f1c6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_f1c6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_f1c6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l169_c7_f1c6
result_u16_value_MUX_uxn_opcodes_h_l169_c7_f1c6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l169_c7_f1c6_cond,
result_u16_value_MUX_uxn_opcodes_h_l169_c7_f1c6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l169_c7_f1c6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l169_c7_f1c6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_f1c6
result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_f1c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_f1c6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_f1c6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_f1c6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_f1c6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l169_c7_f1c6
tmp16_MUX_uxn_opcodes_h_l169_c7_f1c6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l169_c7_f1c6_cond,
tmp16_MUX_uxn_opcodes_h_l169_c7_f1c6_iftrue,
tmp16_MUX_uxn_opcodes_h_l169_c7_f1c6_iffalse,
tmp16_MUX_uxn_opcodes_h_l169_c7_f1c6_return_output);

-- CONST_SL_8_uxn_opcodes_h_l171_c3_998a
CONST_SL_8_uxn_opcodes_h_l171_c3_998a : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l171_c3_998a_x,
CONST_SL_8_uxn_opcodes_h_l171_c3_998a_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l172_c22_6cd3
BIN_OP_PLUS_uxn_opcodes_h_l172_c22_6cd3 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l172_c22_6cd3_left,
BIN_OP_PLUS_uxn_opcodes_h_l172_c22_6cd3_right,
BIN_OP_PLUS_uxn_opcodes_h_l172_c22_6cd3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l174_c11_1f99
BIN_OP_EQ_uxn_opcodes_h_l174_c11_1f99 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l174_c11_1f99_left,
BIN_OP_EQ_uxn_opcodes_h_l174_c11_1f99_right,
BIN_OP_EQ_uxn_opcodes_h_l174_c11_1f99_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_0b21
result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_0b21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_0b21_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_0b21_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_0b21_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_0b21_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l174_c7_0b21
result_u16_value_MUX_uxn_opcodes_h_l174_c7_0b21 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l174_c7_0b21_cond,
result_u16_value_MUX_uxn_opcodes_h_l174_c7_0b21_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l174_c7_0b21_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l174_c7_0b21_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_0b21
result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_0b21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_0b21_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_0b21_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_0b21_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_0b21_return_output);

-- tmp16_MUX_uxn_opcodes_h_l174_c7_0b21
tmp16_MUX_uxn_opcodes_h_l174_c7_0b21 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l174_c7_0b21_cond,
tmp16_MUX_uxn_opcodes_h_l174_c7_0b21_iftrue,
tmp16_MUX_uxn_opcodes_h_l174_c7_0b21_iffalse,
tmp16_MUX_uxn_opcodes_h_l174_c7_0b21_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l175_c22_b4f1
BIN_OP_PLUS_uxn_opcodes_h_l175_c22_b4f1 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l175_c22_b4f1_left,
BIN_OP_PLUS_uxn_opcodes_h_l175_c22_b4f1_right,
BIN_OP_PLUS_uxn_opcodes_h_l175_c22_b4f1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l177_c11_4b64
BIN_OP_EQ_uxn_opcodes_h_l177_c11_4b64 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l177_c11_4b64_left,
BIN_OP_EQ_uxn_opcodes_h_l177_c11_4b64_right,
BIN_OP_EQ_uxn_opcodes_h_l177_c11_4b64_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_70b2
result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_70b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_70b2_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_70b2_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_70b2_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_70b2_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l177_c7_70b2
result_u16_value_MUX_uxn_opcodes_h_l177_c7_70b2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l177_c7_70b2_cond,
result_u16_value_MUX_uxn_opcodes_h_l177_c7_70b2_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l177_c7_70b2_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l177_c7_70b2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_70b2
result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_70b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_70b2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_70b2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_70b2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_70b2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l177_c7_70b2
tmp16_MUX_uxn_opcodes_h_l177_c7_70b2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l177_c7_70b2_cond,
tmp16_MUX_uxn_opcodes_h_l177_c7_70b2_iftrue,
tmp16_MUX_uxn_opcodes_h_l177_c7_70b2_iffalse,
tmp16_MUX_uxn_opcodes_h_l177_c7_70b2_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l178_c3_6b29
BIN_OP_OR_uxn_opcodes_h_l178_c3_6b29 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l178_c3_6b29_left,
BIN_OP_OR_uxn_opcodes_h_l178_c3_6b29_right,
BIN_OP_OR_uxn_opcodes_h_l178_c3_6b29_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l180_c22_ac15
BIN_OP_PLUS_uxn_opcodes_h_l180_c22_ac15 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l180_c22_ac15_left,
BIN_OP_PLUS_uxn_opcodes_h_l180_c22_ac15_right,
BIN_OP_PLUS_uxn_opcodes_h_l180_c22_ac15_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l180_c22_533f
BIN_OP_PLUS_uxn_opcodes_h_l180_c22_533f : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l180_c22_533f_left,
BIN_OP_PLUS_uxn_opcodes_h_l180_c22_533f_right,
BIN_OP_PLUS_uxn_opcodes_h_l180_c22_533f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l182_c11_d39b
BIN_OP_EQ_uxn_opcodes_h_l182_c11_d39b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l182_c11_d39b_left,
BIN_OP_EQ_uxn_opcodes_h_l182_c11_d39b_right,
BIN_OP_EQ_uxn_opcodes_h_l182_c11_d39b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_9d1c
result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_9d1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_9d1c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_9d1c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_9d1c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_9d1c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_9d1c
result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_9d1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_9d1c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_9d1c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_9d1c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_9d1c_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l147_c6_17e6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l147_c1_542c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c2_b96e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l147_c2_b96e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l147_c2_b96e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l147_c2_b96e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l147_c2_b96e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l147_c2_b96e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l147_c2_b96e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l147_c2_b96e_return_output,
 tmp16_MUX_uxn_opcodes_h_l147_c2_b96e_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l151_c11_2ab6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l154_c11_8fb2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_2d37_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_2d37_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l154_c7_2d37_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_2d37_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_2d37_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l154_c7_2d37_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l154_c7_2d37_return_output,
 tmp16_MUX_uxn_opcodes_h_l154_c7_2d37_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l160_c11_57df_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_1578_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_1578_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_1578_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_1578_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l160_c7_1578_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l160_c7_1578_return_output,
 tmp16_MUX_uxn_opcodes_h_l160_c7_1578_return_output,
 CONST_SR_8_uxn_opcodes_h_l162_c31_55ec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l165_c11_e5ad_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_676d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_676d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l165_c7_676d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_676d_return_output,
 tmp16_MUX_uxn_opcodes_h_l165_c7_676d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l169_c11_3e05_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_f1c6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l169_c7_f1c6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_f1c6_return_output,
 tmp16_MUX_uxn_opcodes_h_l169_c7_f1c6_return_output,
 CONST_SL_8_uxn_opcodes_h_l171_c3_998a_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l172_c22_6cd3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l174_c11_1f99_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_0b21_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l174_c7_0b21_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_0b21_return_output,
 tmp16_MUX_uxn_opcodes_h_l174_c7_0b21_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l175_c22_b4f1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l177_c11_4b64_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_70b2_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l177_c7_70b2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_70b2_return_output,
 tmp16_MUX_uxn_opcodes_h_l177_c7_70b2_return_output,
 BIN_OP_OR_uxn_opcodes_h_l178_c3_6b29_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l180_c22_ac15_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l180_c22_533f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l182_c11_d39b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_9d1c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_9d1c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c6_17e6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c6_17e6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c6_17e6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l147_c1_542c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l147_c1_542c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l147_c1_542c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l147_c1_542c_iffalse : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c2_b96e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c2_b96e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_2d37_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c2_b96e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c2_b96e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c2_b96e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c2_b96e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c7_2d37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c2_b96e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c2_b96e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c2_b96e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c2_b96e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_2d37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c2_b96e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c2_b96e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c2_b96e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c2_b96e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l154_c7_2d37_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c2_b96e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c2_b96e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c2_b96e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c2_b96e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l154_c7_2d37_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c2_b96e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c2_b96e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l147_c2_b96e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l150_c3_e79e : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l147_c2_b96e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l147_c2_b96e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l147_c2_b96e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l147_c2_b96e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c2_b96e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c2_b96e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_2d37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c2_b96e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c2_b96e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c2_b96e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c2_b96e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_2d37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c2_b96e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c2_b96e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l147_c2_b96e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l151_c3_aa9a : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l147_c2_b96e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_2d37_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l147_c2_b96e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l147_c2_b96e_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l148_c3_3c15_uxn_opcodes_h_l148_c3_3c15_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l151_c11_2ab6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l151_c11_2ab6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l151_c11_2ab6_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_8fb2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_8fb2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_8fb2_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_2d37_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l157_c3_e58c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_2d37_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_1578_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_2d37_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_2d37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_2d37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_1578_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_2d37_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c7_2d37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c7_2d37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l154_c7_2d37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c7_2d37_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_2d37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_2d37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_1578_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_2d37_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_2d37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_2d37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_1578_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_2d37_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l154_c7_2d37_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l154_c7_2d37_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_1578_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l154_c7_2d37_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l154_c7_2d37_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l154_c7_2d37_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_1578_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l154_c7_2d37_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_2d37_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_2d37_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_1578_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_2d37_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l158_c21_7e67_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_57df_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_57df_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_57df_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_1578_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l161_c3_b54a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_1578_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_1578_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_1578_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_1578_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_676d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_1578_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_1578_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_1578_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_676d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_1578_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_1578_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_1578_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_676d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_1578_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_1578_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_1578_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l165_c7_676d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_1578_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_1578_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_1578_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_1578_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_1578_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_1578_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l165_c7_676d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_1578_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l162_c31_55ec_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l162_c31_55ec_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l162_c21_5728_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l165_c11_e5ad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l165_c11_e5ad_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l165_c11_e5ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_676d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_676d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_676d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_676d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_676d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_f1c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_676d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l165_c7_676d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l165_c7_676d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l169_c7_f1c6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l165_c7_676d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_676d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_676d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_f1c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_676d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l165_c7_676d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l165_c7_676d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l169_c7_f1c6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l165_c7_676d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l169_c11_3e05_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l169_c11_3e05_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l169_c11_3e05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_f1c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_f1c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_0b21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_f1c6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l169_c7_f1c6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l172_c3_1628 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l169_c7_f1c6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l174_c7_0b21_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l169_c7_f1c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_f1c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_f1c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_0b21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_f1c6_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l169_c7_f1c6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l169_c7_f1c6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_0b21_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l169_c7_f1c6_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l171_c3_998a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l171_c3_998a_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l172_c22_6cd3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l172_c22_6cd3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l172_c22_6cd3_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_1f99_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_1f99_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_1f99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_0b21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_0b21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_70b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_0b21_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l174_c7_0b21_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l175_c3_3628 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l174_c7_0b21_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l177_c7_70b2_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l174_c7_0b21_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_0b21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_0b21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_70b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_0b21_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_0b21_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_0b21_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l177_c7_70b2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_0b21_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l175_c22_b4f1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l175_c22_b4f1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l175_c22_b4f1_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l177_c11_4b64_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l177_c11_4b64_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l177_c11_4b64_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_70b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_70b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_9d1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_70b2_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l177_c7_70b2_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l180_c3_d899 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l177_c7_70b2_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l177_c7_70b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_70b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_70b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_9d1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_70b2_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l177_c7_70b2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l177_c7_70b2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l177_c7_70b2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l178_c3_6b29_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l178_c3_6b29_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l178_c3_6b29_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l180_c22_ac15_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l180_c22_ac15_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l180_c22_ac15_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l180_c22_533f_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l180_c22_533f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l180_c22_533f_return_output : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l182_c11_d39b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l182_c11_d39b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l182_c11_d39b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_9d1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_9d1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_9d1c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_9d1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_9d1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_9d1c_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l160_l147_DUPLICATE_d1be_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l160_l165_l147_DUPLICATE_451a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l154_l177_l147_DUPLICATE_e04e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l160_l147_DUPLICATE_1916_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l165_l174_l154_l182_l160_l147_l169_DUPLICATE_7343_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l165_l174_l177_l154_l182_l160_l169_DUPLICATE_accf_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l178_l170_DUPLICATE_7b63_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7de8_uxn_opcodes_h_l143_l187_DUPLICATE_62da_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_1f99_right := to_unsigned(5, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_9d1c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l165_c11_e5ad_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c6_17e6_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l182_c11_d39b_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l177_c11_4b64_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l169_c11_3e05_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c7_2d37_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l157_c3_e58c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_2d37_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l157_c3_e58c;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l175_c22_b4f1_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l150_c3_e79e := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l147_c2_b96e_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l150_c3_e79e;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l172_c22_6cd3_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_2d37_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_57df_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_8fb2_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_9d1c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l151_c11_2ab6_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l180_c22_533f_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l161_c3_b54a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_1578_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l161_c3_b54a;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_70b2_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l147_c1_542c_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_676d_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c2_b96e_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c2_b96e_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l147_c1_542c_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l151_c11_2ab6_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l172_c22_6cd3_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l175_c22_b4f1_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l180_c22_ac15_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_1578_iftrue := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l165_c7_676d_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c6_17e6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_8fb2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_57df_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l165_c11_e5ad_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l169_c11_3e05_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_1f99_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l177_c11_4b64_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l182_c11_d39b_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l178_c3_6b29_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l162_c31_55ec_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_2d37_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_1578_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l165_c7_676d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_0b21_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l177_c7_70b2_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l165_c11_e5ad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l165_c11_e5ad_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l165_c11_e5ad_left;
     BIN_OP_EQ_uxn_opcodes_h_l165_c11_e5ad_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l165_c11_e5ad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l165_c11_e5ad_return_output := BIN_OP_EQ_uxn_opcodes_h_l165_c11_e5ad_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l174_c11_1f99] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l174_c11_1f99_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_1f99_left;
     BIN_OP_EQ_uxn_opcodes_h_l174_c11_1f99_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_1f99_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_1f99_return_output := BIN_OP_EQ_uxn_opcodes_h_l174_c11_1f99_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l160_l165_l147_DUPLICATE_451a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l160_l165_l147_DUPLICATE_451a_return_output := result.is_stack_write;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l147_c2_b96e] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l147_c2_b96e_return_output := result.sp_relative_shift;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l158_c21_7e67] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l158_c21_7e67_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l165_l174_l154_l182_l160_l147_l169_DUPLICATE_7343 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l165_l174_l154_l182_l160_l147_l169_DUPLICATE_7343_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l160_l147_DUPLICATE_d1be LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l160_l147_DUPLICATE_d1be_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l182_c11_d39b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l182_c11_d39b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l182_c11_d39b_left;
     BIN_OP_EQ_uxn_opcodes_h_l182_c11_d39b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l182_c11_d39b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l182_c11_d39b_return_output := BIN_OP_EQ_uxn_opcodes_h_l182_c11_d39b_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l154_l177_l147_DUPLICATE_e04e LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l154_l177_l147_DUPLICATE_e04e_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l177_c11_4b64] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l177_c11_4b64_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l177_c11_4b64_left;
     BIN_OP_EQ_uxn_opcodes_h_l177_c11_4b64_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l177_c11_4b64_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l177_c11_4b64_return_output := BIN_OP_EQ_uxn_opcodes_h_l177_c11_4b64_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l162_c31_55ec] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l162_c31_55ec_x <= VAR_CONST_SR_8_uxn_opcodes_h_l162_c31_55ec_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l162_c31_55ec_return_output := CONST_SR_8_uxn_opcodes_h_l162_c31_55ec_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l178_l170_DUPLICATE_7b63 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l178_l170_DUPLICATE_7b63_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l154_c7_2d37] LATENCY=0
     VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l154_c7_2d37_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l165_l174_l177_l154_l182_l160_l169_DUPLICATE_accf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l165_l174_l177_l154_l182_l160_l169_DUPLICATE_accf_return_output := result.is_opc_done;

     -- BIN_OP_PLUS[uxn_opcodes_h_l151_c11_2ab6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l151_c11_2ab6_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l151_c11_2ab6_left;
     BIN_OP_PLUS_uxn_opcodes_h_l151_c11_2ab6_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l151_c11_2ab6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l151_c11_2ab6_return_output := BIN_OP_PLUS_uxn_opcodes_h_l151_c11_2ab6_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l160_l147_DUPLICATE_1916 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l160_l147_DUPLICATE_1916_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l169_c11_3e05] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l169_c11_3e05_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l169_c11_3e05_left;
     BIN_OP_EQ_uxn_opcodes_h_l169_c11_3e05_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l169_c11_3e05_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l169_c11_3e05_return_output := BIN_OP_EQ_uxn_opcodes_h_l169_c11_3e05_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l172_c22_6cd3] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l172_c22_6cd3_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l172_c22_6cd3_left;
     BIN_OP_PLUS_uxn_opcodes_h_l172_c22_6cd3_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l172_c22_6cd3_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l172_c22_6cd3_return_output := BIN_OP_PLUS_uxn_opcodes_h_l172_c22_6cd3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l147_c6_17e6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l147_c6_17e6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c6_17e6_left;
     BIN_OP_EQ_uxn_opcodes_h_l147_c6_17e6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c6_17e6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c6_17e6_return_output := BIN_OP_EQ_uxn_opcodes_h_l147_c6_17e6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l160_c11_57df] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l160_c11_57df_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_57df_left;
     BIN_OP_EQ_uxn_opcodes_h_l160_c11_57df_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_57df_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_57df_return_output := BIN_OP_EQ_uxn_opcodes_h_l160_c11_57df_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l175_c22_b4f1] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l175_c22_b4f1_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l175_c22_b4f1_left;
     BIN_OP_PLUS_uxn_opcodes_h_l175_c22_b4f1_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l175_c22_b4f1_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l175_c22_b4f1_return_output := BIN_OP_PLUS_uxn_opcodes_h_l175_c22_b4f1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l154_c11_8fb2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l154_c11_8fb2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_8fb2_left;
     BIN_OP_EQ_uxn_opcodes_h_l154_c11_8fb2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_8fb2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_8fb2_return_output := BIN_OP_EQ_uxn_opcodes_h_l154_c11_8fb2_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l147_c1_542c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c6_17e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c2_b96e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c6_17e6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c2_b96e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c6_17e6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c2_b96e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c6_17e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c2_b96e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c6_17e6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l147_c2_b96e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c6_17e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c2_b96e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c6_17e6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c2_b96e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c6_17e6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c2_b96e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c6_17e6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l147_c2_b96e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l147_c6_17e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_2d37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_8fb2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_2d37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_8fb2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c7_2d37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_8fb2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_2d37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_8fb2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_2d37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_8fb2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l154_c7_2d37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_8fb2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l154_c7_2d37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_8fb2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_2d37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_8fb2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_1578_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_57df_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_1578_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_57df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_1578_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_57df_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_1578_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_57df_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_1578_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_57df_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_1578_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_57df_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_1578_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_57df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_676d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l165_c11_e5ad_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_676d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l165_c11_e5ad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_676d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l165_c11_e5ad_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l165_c7_676d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l165_c11_e5ad_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l165_c7_676d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l165_c11_e5ad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_f1c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l169_c11_3e05_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_f1c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l169_c11_3e05_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l169_c7_f1c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l169_c11_3e05_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l169_c7_f1c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l169_c11_3e05_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_0b21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_1f99_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_0b21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_1f99_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l174_c7_0b21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_1f99_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_0b21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l174_c11_1f99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_70b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l177_c11_4b64_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_70b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l177_c11_4b64_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l177_c7_70b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l177_c11_4b64_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l177_c7_70b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l177_c11_4b64_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_9d1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l182_c11_d39b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_9d1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l182_c11_d39b_return_output;
     VAR_tmp16_uxn_opcodes_h_l151_c3_aa9a := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l151_c11_2ab6_return_output, 16);
     VAR_result_u16_value_uxn_opcodes_h_l172_c3_1628 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l172_c22_6cd3_return_output, 16);
     VAR_result_u16_value_uxn_opcodes_h_l175_c3_3628 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l175_c22_b4f1_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l178_c3_6b29_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l178_l170_DUPLICATE_7b63_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l171_c3_998a_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l178_l170_DUPLICATE_7b63_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l154_c7_2d37_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l158_c21_7e67_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c2_b96e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l154_l177_l147_DUPLICATE_e04e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l154_c7_2d37_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l154_l177_l147_DUPLICATE_e04e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l177_c7_70b2_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l154_l177_l147_DUPLICATE_e04e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_2d37_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l165_l174_l177_l154_l182_l160_l169_DUPLICATE_accf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_1578_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l165_l174_l177_l154_l182_l160_l169_DUPLICATE_accf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_676d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l165_l174_l177_l154_l182_l160_l169_DUPLICATE_accf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_f1c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l165_l174_l177_l154_l182_l160_l169_DUPLICATE_accf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_0b21_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l165_l174_l177_l154_l182_l160_l169_DUPLICATE_accf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_70b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l165_l174_l177_l154_l182_l160_l169_DUPLICATE_accf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_9d1c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l165_l174_l177_l154_l182_l160_l169_DUPLICATE_accf_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c2_b96e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l165_l174_l154_l182_l160_l147_l169_DUPLICATE_7343_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_2d37_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l165_l174_l154_l182_l160_l147_l169_DUPLICATE_7343_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_1578_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l165_l174_l154_l182_l160_l147_l169_DUPLICATE_7343_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_676d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l165_l174_l154_l182_l160_l147_l169_DUPLICATE_7343_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_f1c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l165_l174_l154_l182_l160_l147_l169_DUPLICATE_7343_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_0b21_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l165_l174_l154_l182_l160_l147_l169_DUPLICATE_7343_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_9d1c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l165_l174_l154_l182_l160_l147_l169_DUPLICATE_7343_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c2_b96e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l160_l165_l147_DUPLICATE_451a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_1578_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l160_l165_l147_DUPLICATE_451a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_676d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l160_l165_l147_DUPLICATE_451a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c2_b96e_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l160_l147_DUPLICATE_d1be_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_1578_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l160_l147_DUPLICATE_d1be_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c2_b96e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l160_l147_DUPLICATE_1916_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_1578_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l160_l147_DUPLICATE_1916_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c7_2d37_iffalse := VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l154_c7_2d37_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l147_c2_b96e_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l147_c2_b96e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l169_c7_f1c6_iftrue := VAR_result_u16_value_uxn_opcodes_h_l172_c3_1628;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l174_c7_0b21_iftrue := VAR_result_u16_value_uxn_opcodes_h_l175_c3_3628;
     VAR_tmp16_MUX_uxn_opcodes_h_l147_c2_b96e_iftrue := VAR_tmp16_uxn_opcodes_h_l151_c3_aa9a;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l182_c7_9d1c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_9d1c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_9d1c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_9d1c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_9d1c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_9d1c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_9d1c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_9d1c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_9d1c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l182_c7_9d1c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_9d1c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_9d1c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_9d1c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_9d1c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_9d1c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_9d1c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_9d1c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_9d1c_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l178_c3_6b29] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l178_c3_6b29_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l178_c3_6b29_left;
     BIN_OP_OR_uxn_opcodes_h_l178_c3_6b29_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l178_c3_6b29_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l178_c3_6b29_return_output := BIN_OP_OR_uxn_opcodes_h_l178_c3_6b29_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l147_c2_b96e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l147_c2_b96e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l147_c2_b96e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l147_c2_b96e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l147_c2_b96e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l147_c2_b96e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l147_c2_b96e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l147_c2_b96e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l147_c2_b96e_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l171_c3_998a] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l171_c3_998a_x <= VAR_CONST_SL_8_uxn_opcodes_h_l171_c3_998a_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l171_c3_998a_return_output := CONST_SL_8_uxn_opcodes_h_l171_c3_998a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l160_c7_1578] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_1578_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_1578_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_1578_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_1578_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_1578_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_1578_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_1578_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_1578_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l165_c7_676d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_676d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_676d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_676d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_676d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_676d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_676d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_676d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_676d_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l162_c21_5728] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l162_c21_5728_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l162_c31_55ec_return_output);

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l147_c1_542c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l147_c1_542c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l147_c1_542c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l147_c1_542c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l147_c1_542c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l147_c1_542c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l147_c1_542c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l147_c1_542c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l147_c1_542c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l154_c7_2d37] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l154_c7_2d37_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c7_2d37_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l154_c7_2d37_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c7_2d37_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l154_c7_2d37_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c7_2d37_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c7_2d37_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l154_c7_2d37_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l180_c22_ac15_right := VAR_BIN_OP_OR_uxn_opcodes_h_l178_c3_6b29_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l177_c7_70b2_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l178_c3_6b29_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_1578_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l162_c21_5728_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l169_c7_f1c6_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l171_c3_998a_return_output;
     VAR_printf_uxn_opcodes_h_l148_c3_3c15_uxn_opcodes_h_l148_c3_3c15_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l147_c1_542c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_70b2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l182_c7_9d1c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_70b2_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l182_c7_9d1c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c2_b96e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c7_2d37_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_1578_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_676d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_2d37_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_1578_return_output;
     -- printf_uxn_opcodes_h_l148_c3_3c15[uxn_opcodes_h_l148_c3_3c15] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l148_c3_3c15_uxn_opcodes_h_l148_c3_3c15_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l148_c3_3c15_uxn_opcodes_h_l148_c3_3c15_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- BIN_OP_PLUS[uxn_opcodes_h_l180_c22_ac15] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l180_c22_ac15_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l180_c22_ac15_left;
     BIN_OP_PLUS_uxn_opcodes_h_l180_c22_ac15_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l180_c22_ac15_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l180_c22_ac15_return_output := BIN_OP_PLUS_uxn_opcodes_h_l180_c22_ac15_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l160_c7_1578] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l160_c7_1578_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_1578_cond;
     result_u8_value_MUX_uxn_opcodes_h_l160_c7_1578_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_1578_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l160_c7_1578_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_1578_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_1578_return_output := result_u8_value_MUX_uxn_opcodes_h_l160_c7_1578_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l160_c7_1578] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_1578_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_1578_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_1578_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_1578_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_1578_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_1578_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_1578_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_1578_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l177_c7_70b2] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_70b2_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_70b2_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_70b2_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_70b2_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_70b2_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_70b2_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_70b2_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_70b2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l147_c2_b96e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l147_c2_b96e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c2_b96e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l147_c2_b96e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c2_b96e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l147_c2_b96e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c2_b96e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c2_b96e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l147_c2_b96e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l177_c7_70b2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l177_c7_70b2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l177_c7_70b2_cond;
     tmp16_MUX_uxn_opcodes_h_l177_c7_70b2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l177_c7_70b2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l177_c7_70b2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l177_c7_70b2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l177_c7_70b2_return_output := tmp16_MUX_uxn_opcodes_h_l177_c7_70b2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l177_c7_70b2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_70b2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_70b2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_70b2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_70b2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_70b2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_70b2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_70b2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_70b2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l154_c7_2d37] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_2d37_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_2d37_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_2d37_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_2d37_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_2d37_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_2d37_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_2d37_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_2d37_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l180_c22_533f_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l180_c22_ac15_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_0b21_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_70b2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_0b21_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_70b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_2d37_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_1578_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c2_b96e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_2d37_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l154_c7_2d37_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_1578_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_0b21_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l177_c7_70b2_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l174_c7_0b21] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_0b21_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_0b21_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_0b21_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_0b21_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_0b21_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_0b21_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_0b21_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_0b21_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l154_c7_2d37] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l154_c7_2d37_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l154_c7_2d37_cond;
     result_u8_value_MUX_uxn_opcodes_h_l154_c7_2d37_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l154_c7_2d37_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l154_c7_2d37_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l154_c7_2d37_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l154_c7_2d37_return_output := result_u8_value_MUX_uxn_opcodes_h_l154_c7_2d37_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l147_c2_b96e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c2_b96e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c2_b96e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c2_b96e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c2_b96e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c2_b96e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c2_b96e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c2_b96e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c2_b96e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l154_c7_2d37] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_2d37_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_2d37_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_2d37_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_2d37_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_2d37_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_2d37_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_2d37_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_2d37_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l174_c7_0b21] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_0b21_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_0b21_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_0b21_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_0b21_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_0b21_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_0b21_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_0b21_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_0b21_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l174_c7_0b21] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l174_c7_0b21_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_0b21_cond;
     tmp16_MUX_uxn_opcodes_h_l174_c7_0b21_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_0b21_iftrue;
     tmp16_MUX_uxn_opcodes_h_l174_c7_0b21_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_0b21_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_0b21_return_output := tmp16_MUX_uxn_opcodes_h_l174_c7_0b21_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l180_c22_533f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l180_c22_533f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l180_c22_533f_left;
     BIN_OP_PLUS_uxn_opcodes_h_l180_c22_533f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l180_c22_533f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l180_c22_533f_return_output := BIN_OP_PLUS_uxn_opcodes_h_l180_c22_533f_return_output;

     -- Submodule level 4
     VAR_result_u16_value_uxn_opcodes_h_l180_c3_d899 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l180_c22_533f_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_f1c6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l174_c7_0b21_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_f1c6_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l174_c7_0b21_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c2_b96e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_2d37_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c2_b96e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l154_c7_2d37_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l169_c7_f1c6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l174_c7_0b21_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l177_c7_70b2_iftrue := VAR_result_u16_value_uxn_opcodes_h_l180_c3_d899;
     -- result_u8_value_MUX[uxn_opcodes_h_l147_c2_b96e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l147_c2_b96e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c2_b96e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l147_c2_b96e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c2_b96e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l147_c2_b96e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c2_b96e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c2_b96e_return_output := result_u8_value_MUX_uxn_opcodes_h_l147_c2_b96e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l147_c2_b96e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l147_c2_b96e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c2_b96e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l147_c2_b96e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c2_b96e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l147_c2_b96e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c2_b96e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c2_b96e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l147_c2_b96e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l169_c7_f1c6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_f1c6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_f1c6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_f1c6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_f1c6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_f1c6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_f1c6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_f1c6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_f1c6_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l169_c7_f1c6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_f1c6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_f1c6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_f1c6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_f1c6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_f1c6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_f1c6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_f1c6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_f1c6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l169_c7_f1c6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l169_c7_f1c6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l169_c7_f1c6_cond;
     tmp16_MUX_uxn_opcodes_h_l169_c7_f1c6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l169_c7_f1c6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l169_c7_f1c6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l169_c7_f1c6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l169_c7_f1c6_return_output := tmp16_MUX_uxn_opcodes_h_l169_c7_f1c6_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l177_c7_70b2] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l177_c7_70b2_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l177_c7_70b2_cond;
     result_u16_value_MUX_uxn_opcodes_h_l177_c7_70b2_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l177_c7_70b2_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l177_c7_70b2_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l177_c7_70b2_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l177_c7_70b2_return_output := result_u16_value_MUX_uxn_opcodes_h_l177_c7_70b2_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_676d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_f1c6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_676d_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_f1c6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l174_c7_0b21_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l177_c7_70b2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l165_c7_676d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l169_c7_f1c6_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l165_c7_676d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_676d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_676d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_676d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_676d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_676d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_676d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_676d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_676d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l174_c7_0b21] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l174_c7_0b21_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l174_c7_0b21_cond;
     result_u16_value_MUX_uxn_opcodes_h_l174_c7_0b21_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l174_c7_0b21_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l174_c7_0b21_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l174_c7_0b21_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l174_c7_0b21_return_output := result_u16_value_MUX_uxn_opcodes_h_l174_c7_0b21_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l165_c7_676d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_676d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_676d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_676d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_676d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_676d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_676d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_676d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_676d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l165_c7_676d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l165_c7_676d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l165_c7_676d_cond;
     tmp16_MUX_uxn_opcodes_h_l165_c7_676d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l165_c7_676d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l165_c7_676d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l165_c7_676d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l165_c7_676d_return_output := tmp16_MUX_uxn_opcodes_h_l165_c7_676d_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_1578_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_676d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_1578_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_676d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l169_c7_f1c6_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l174_c7_0b21_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_1578_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l165_c7_676d_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l160_c7_1578] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_1578_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_1578_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_1578_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_1578_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_1578_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_1578_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_1578_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_1578_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l169_c7_f1c6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l169_c7_f1c6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l169_c7_f1c6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l169_c7_f1c6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l169_c7_f1c6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l169_c7_f1c6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l169_c7_f1c6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l169_c7_f1c6_return_output := result_u16_value_MUX_uxn_opcodes_h_l169_c7_f1c6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l160_c7_1578] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l160_c7_1578_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_1578_cond;
     tmp16_MUX_uxn_opcodes_h_l160_c7_1578_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_1578_iftrue;
     tmp16_MUX_uxn_opcodes_h_l160_c7_1578_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_1578_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_1578_return_output := tmp16_MUX_uxn_opcodes_h_l160_c7_1578_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l160_c7_1578] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_1578_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_1578_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_1578_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_1578_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_1578_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_1578_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_1578_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_1578_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_2d37_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_1578_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_2d37_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_1578_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l165_c7_676d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l169_c7_f1c6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_2d37_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_1578_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l154_c7_2d37] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_2d37_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_2d37_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_2d37_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_2d37_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_2d37_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_2d37_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_2d37_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_2d37_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l165_c7_676d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l165_c7_676d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l165_c7_676d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l165_c7_676d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l165_c7_676d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l165_c7_676d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l165_c7_676d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l165_c7_676d_return_output := result_u16_value_MUX_uxn_opcodes_h_l165_c7_676d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l154_c7_2d37] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_2d37_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_2d37_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_2d37_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_2d37_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_2d37_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_2d37_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_2d37_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_2d37_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l154_c7_2d37] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l154_c7_2d37_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_2d37_cond;
     tmp16_MUX_uxn_opcodes_h_l154_c7_2d37_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_2d37_iftrue;
     tmp16_MUX_uxn_opcodes_h_l154_c7_2d37_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_2d37_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_2d37_return_output := tmp16_MUX_uxn_opcodes_h_l154_c7_2d37_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c2_b96e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_2d37_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c2_b96e_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_2d37_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_1578_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l165_c7_676d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l147_c2_b96e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_2d37_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l160_c7_1578] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l160_c7_1578_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_1578_cond;
     result_u16_value_MUX_uxn_opcodes_h_l160_c7_1578_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_1578_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l160_c7_1578_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_1578_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_1578_return_output := result_u16_value_MUX_uxn_opcodes_h_l160_c7_1578_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l147_c2_b96e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l147_c2_b96e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c2_b96e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l147_c2_b96e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c2_b96e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l147_c2_b96e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c2_b96e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c2_b96e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l147_c2_b96e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l147_c2_b96e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l147_c2_b96e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c2_b96e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l147_c2_b96e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c2_b96e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l147_c2_b96e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c2_b96e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c2_b96e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l147_c2_b96e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l147_c2_b96e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l147_c2_b96e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l147_c2_b96e_cond;
     tmp16_MUX_uxn_opcodes_h_l147_c2_b96e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l147_c2_b96e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l147_c2_b96e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l147_c2_b96e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l147_c2_b96e_return_output := tmp16_MUX_uxn_opcodes_h_l147_c2_b96e_return_output;

     -- Submodule level 9
     VAR_result_u16_value_MUX_uxn_opcodes_h_l154_c7_2d37_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_1578_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l147_c2_b96e_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l154_c7_2d37] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l154_c7_2d37_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l154_c7_2d37_cond;
     result_u16_value_MUX_uxn_opcodes_h_l154_c7_2d37_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l154_c7_2d37_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l154_c7_2d37_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l154_c7_2d37_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l154_c7_2d37_return_output := result_u16_value_MUX_uxn_opcodes_h_l154_c7_2d37_return_output;

     -- Submodule level 10
     VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c2_b96e_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l154_c7_2d37_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l147_c2_b96e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l147_c2_b96e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c2_b96e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l147_c2_b96e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c2_b96e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l147_c2_b96e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c2_b96e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c2_b96e_return_output := result_u16_value_MUX_uxn_opcodes_h_l147_c2_b96e_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_7de8_uxn_opcodes_h_l143_l187_DUPLICATE_62da LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7de8_uxn_opcodes_h_l143_l187_DUPLICATE_62da_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_7de8(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l147_c2_b96e_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l147_c2_b96e_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l147_c2_b96e_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l147_c2_b96e_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l147_c2_b96e_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l147_c2_b96e_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l147_c2_b96e_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l147_c2_b96e_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7de8_uxn_opcodes_h_l143_l187_DUPLICATE_62da_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7de8_uxn_opcodes_h_l143_l187_DUPLICATE_62da_return_output;
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
