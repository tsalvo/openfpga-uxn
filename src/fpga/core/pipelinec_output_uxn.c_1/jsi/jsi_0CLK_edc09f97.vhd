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
-- Submodules: 56
entity jsi_0CLK_edc09f97 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jsi_0CLK_edc09f97;
architecture arch of jsi_0CLK_edc09f97 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l139_c6_1958]
signal BIN_OP_EQ_uxn_opcodes_h_l139_c6_1958_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l139_c6_1958_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l139_c6_1958_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l139_c2_d120]
signal tmp16_MUX_uxn_opcodes_h_l139_c2_d120_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l139_c2_d120_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l139_c2_d120_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l139_c2_d120_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l139_c2_d120]
signal result_u16_value_MUX_uxn_opcodes_h_l139_c2_d120_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l139_c2_d120_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l139_c2_d120_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l139_c2_d120_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l139_c2_d120]
signal result_u8_value_MUX_uxn_opcodes_h_l139_c2_d120_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l139_c2_d120_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l139_c2_d120_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l139_c2_d120_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l139_c2_d120]
signal result_is_stack_write_MUX_uxn_opcodes_h_l139_c2_d120_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l139_c2_d120_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l139_c2_d120_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l139_c2_d120_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l139_c2_d120]
signal result_is_opc_done_MUX_uxn_opcodes_h_l139_c2_d120_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l139_c2_d120_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l139_c2_d120_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l139_c2_d120_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l139_c2_d120]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l139_c2_d120_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l139_c2_d120_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l139_c2_d120_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l139_c2_d120_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l139_c2_d120]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l139_c2_d120_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l139_c2_d120_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l139_c2_d120_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l139_c2_d120_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l139_c2_d120]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l139_c2_d120_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l139_c2_d120_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l139_c2_d120_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l139_c2_d120_return_output : unsigned(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l145_c11_9a55]
signal BIN_OP_PLUS_uxn_opcodes_h_l145_c11_9a55_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l145_c11_9a55_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l145_c11_9a55_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l148_c11_49ee]
signal BIN_OP_EQ_uxn_opcodes_h_l148_c11_49ee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l148_c11_49ee_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l148_c11_49ee_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l148_c7_357f]
signal tmp16_MUX_uxn_opcodes_h_l148_c7_357f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l148_c7_357f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l148_c7_357f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l148_c7_357f_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l148_c7_357f]
signal result_u16_value_MUX_uxn_opcodes_h_l148_c7_357f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l148_c7_357f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l148_c7_357f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l148_c7_357f_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l148_c7_357f]
signal result_u8_value_MUX_uxn_opcodes_h_l148_c7_357f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l148_c7_357f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l148_c7_357f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l148_c7_357f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l148_c7_357f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l148_c7_357f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l148_c7_357f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l148_c7_357f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l148_c7_357f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l148_c7_357f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l148_c7_357f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l148_c7_357f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l148_c7_357f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l148_c7_357f_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l148_c7_357f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l148_c7_357f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l148_c7_357f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l148_c7_357f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l148_c7_357f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l148_c7_357f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l148_c7_357f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l148_c7_357f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l148_c7_357f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l148_c7_357f_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l148_c7_357f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l148_c7_357f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l148_c7_357f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l148_c7_357f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l148_c7_357f_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l154_c11_6681]
signal BIN_OP_EQ_uxn_opcodes_h_l154_c11_6681_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l154_c11_6681_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l154_c11_6681_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l154_c7_58a0]
signal tmp16_MUX_uxn_opcodes_h_l154_c7_58a0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l154_c7_58a0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l154_c7_58a0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l154_c7_58a0_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l154_c7_58a0]
signal result_u16_value_MUX_uxn_opcodes_h_l154_c7_58a0_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l154_c7_58a0_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l154_c7_58a0_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l154_c7_58a0_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l154_c7_58a0]
signal result_u8_value_MUX_uxn_opcodes_h_l154_c7_58a0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l154_c7_58a0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l154_c7_58a0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l154_c7_58a0_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l154_c7_58a0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_58a0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_58a0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_58a0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_58a0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l154_c7_58a0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_58a0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_58a0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_58a0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_58a0_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l154_c7_58a0]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_58a0_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_58a0_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_58a0_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_58a0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l154_c7_58a0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_58a0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_58a0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_58a0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_58a0_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l156_c31_8bd2]
signal CONST_SR_8_uxn_opcodes_h_l156_c31_8bd2_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l156_c31_8bd2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l159_c11_ae2d]
signal BIN_OP_EQ_uxn_opcodes_h_l159_c11_ae2d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l159_c11_ae2d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l159_c11_ae2d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l159_c7_5c54]
signal tmp16_MUX_uxn_opcodes_h_l159_c7_5c54_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l159_c7_5c54_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l159_c7_5c54_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l159_c7_5c54_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l159_c7_5c54]
signal result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_5c54_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_5c54_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_5c54_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_5c54_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l159_c7_5c54]
signal result_u16_value_MUX_uxn_opcodes_h_l159_c7_5c54_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l159_c7_5c54_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l159_c7_5c54_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l159_c7_5c54_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l159_c7_5c54]
signal result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_5c54_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_5c54_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_5c54_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_5c54_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l159_c7_5c54]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_5c54_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_5c54_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_5c54_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_5c54_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l161_c22_1435]
signal BIN_OP_PLUS_uxn_opcodes_h_l161_c22_1435_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l161_c22_1435_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l161_c22_1435_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l163_c11_b5de]
signal BIN_OP_EQ_uxn_opcodes_h_l163_c11_b5de_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l163_c11_b5de_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l163_c11_b5de_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l163_c7_4e7a]
signal tmp16_MUX_uxn_opcodes_h_l163_c7_4e7a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l163_c7_4e7a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l163_c7_4e7a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l163_c7_4e7a_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l163_c7_4e7a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_4e7a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_4e7a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_4e7a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_4e7a_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l163_c7_4e7a]
signal result_u16_value_MUX_uxn_opcodes_h_l163_c7_4e7a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l163_c7_4e7a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l163_c7_4e7a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l163_c7_4e7a_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l163_c7_4e7a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_4e7a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_4e7a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_4e7a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_4e7a_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l165_c3_655f]
signal CONST_SL_8_uxn_opcodes_h_l165_c3_655f_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l165_c3_655f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l167_c11_2695]
signal BIN_OP_EQ_uxn_opcodes_h_l167_c11_2695_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l167_c11_2695_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l167_c11_2695_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l167_c7_d0f3]
signal tmp16_MUX_uxn_opcodes_h_l167_c7_d0f3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l167_c7_d0f3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l167_c7_d0f3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l167_c7_d0f3_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l167_c7_d0f3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_d0f3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_d0f3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_d0f3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_d0f3_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l167_c7_d0f3]
signal result_u16_value_MUX_uxn_opcodes_h_l167_c7_d0f3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l167_c7_d0f3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l167_c7_d0f3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l167_c7_d0f3_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l167_c7_d0f3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_d0f3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_d0f3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_d0f3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_d0f3_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l168_c3_c8c4]
signal BIN_OP_OR_uxn_opcodes_h_l168_c3_c8c4_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l168_c3_c8c4_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l168_c3_c8c4_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l170_c22_62e0]
signal BIN_OP_PLUS_uxn_opcodes_h_l170_c22_62e0_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l170_c22_62e0_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l170_c22_62e0_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l170_c22_4a78]
signal BIN_OP_PLUS_uxn_opcodes_h_l170_c22_4a78_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l170_c22_4a78_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l170_c22_4a78_return_output : unsigned(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l172_c11_47e8]
signal BIN_OP_EQ_uxn_opcodes_h_l172_c11_47e8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l172_c11_47e8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l172_c11_47e8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l172_c7_820e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_820e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_820e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_820e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_820e_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l172_c7_820e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_820e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_820e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_820e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_820e_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_f68f( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u16_value := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_pc_updated := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l139_c6_1958
BIN_OP_EQ_uxn_opcodes_h_l139_c6_1958 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l139_c6_1958_left,
BIN_OP_EQ_uxn_opcodes_h_l139_c6_1958_right,
BIN_OP_EQ_uxn_opcodes_h_l139_c6_1958_return_output);

-- tmp16_MUX_uxn_opcodes_h_l139_c2_d120
tmp16_MUX_uxn_opcodes_h_l139_c2_d120 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l139_c2_d120_cond,
tmp16_MUX_uxn_opcodes_h_l139_c2_d120_iftrue,
tmp16_MUX_uxn_opcodes_h_l139_c2_d120_iffalse,
tmp16_MUX_uxn_opcodes_h_l139_c2_d120_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l139_c2_d120
result_u16_value_MUX_uxn_opcodes_h_l139_c2_d120 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l139_c2_d120_cond,
result_u16_value_MUX_uxn_opcodes_h_l139_c2_d120_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l139_c2_d120_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l139_c2_d120_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l139_c2_d120
result_u8_value_MUX_uxn_opcodes_h_l139_c2_d120 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l139_c2_d120_cond,
result_u8_value_MUX_uxn_opcodes_h_l139_c2_d120_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l139_c2_d120_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l139_c2_d120_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l139_c2_d120
result_is_stack_write_MUX_uxn_opcodes_h_l139_c2_d120 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l139_c2_d120_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l139_c2_d120_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l139_c2_d120_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l139_c2_d120_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l139_c2_d120
result_is_opc_done_MUX_uxn_opcodes_h_l139_c2_d120 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l139_c2_d120_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l139_c2_d120_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l139_c2_d120_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l139_c2_d120_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l139_c2_d120
result_is_pc_updated_MUX_uxn_opcodes_h_l139_c2_d120 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l139_c2_d120_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l139_c2_d120_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l139_c2_d120_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l139_c2_d120_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l139_c2_d120
result_sp_relative_shift_MUX_uxn_opcodes_h_l139_c2_d120 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l139_c2_d120_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l139_c2_d120_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l139_c2_d120_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l139_c2_d120_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l139_c2_d120
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l139_c2_d120 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l139_c2_d120_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l139_c2_d120_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l139_c2_d120_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l139_c2_d120_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l145_c11_9a55
BIN_OP_PLUS_uxn_opcodes_h_l145_c11_9a55 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l145_c11_9a55_left,
BIN_OP_PLUS_uxn_opcodes_h_l145_c11_9a55_right,
BIN_OP_PLUS_uxn_opcodes_h_l145_c11_9a55_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l148_c11_49ee
BIN_OP_EQ_uxn_opcodes_h_l148_c11_49ee : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l148_c11_49ee_left,
BIN_OP_EQ_uxn_opcodes_h_l148_c11_49ee_right,
BIN_OP_EQ_uxn_opcodes_h_l148_c11_49ee_return_output);

-- tmp16_MUX_uxn_opcodes_h_l148_c7_357f
tmp16_MUX_uxn_opcodes_h_l148_c7_357f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l148_c7_357f_cond,
tmp16_MUX_uxn_opcodes_h_l148_c7_357f_iftrue,
tmp16_MUX_uxn_opcodes_h_l148_c7_357f_iffalse,
tmp16_MUX_uxn_opcodes_h_l148_c7_357f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l148_c7_357f
result_u16_value_MUX_uxn_opcodes_h_l148_c7_357f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l148_c7_357f_cond,
result_u16_value_MUX_uxn_opcodes_h_l148_c7_357f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l148_c7_357f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l148_c7_357f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l148_c7_357f
result_u8_value_MUX_uxn_opcodes_h_l148_c7_357f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l148_c7_357f_cond,
result_u8_value_MUX_uxn_opcodes_h_l148_c7_357f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l148_c7_357f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l148_c7_357f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l148_c7_357f
result_is_stack_write_MUX_uxn_opcodes_h_l148_c7_357f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l148_c7_357f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l148_c7_357f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l148_c7_357f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l148_c7_357f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l148_c7_357f
result_is_opc_done_MUX_uxn_opcodes_h_l148_c7_357f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l148_c7_357f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l148_c7_357f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l148_c7_357f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l148_c7_357f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l148_c7_357f
result_is_pc_updated_MUX_uxn_opcodes_h_l148_c7_357f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l148_c7_357f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l148_c7_357f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l148_c7_357f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l148_c7_357f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l148_c7_357f
result_sp_relative_shift_MUX_uxn_opcodes_h_l148_c7_357f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l148_c7_357f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l148_c7_357f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l148_c7_357f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l148_c7_357f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l148_c7_357f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l148_c7_357f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l148_c7_357f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l148_c7_357f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l148_c7_357f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l148_c7_357f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l154_c11_6681
BIN_OP_EQ_uxn_opcodes_h_l154_c11_6681 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l154_c11_6681_left,
BIN_OP_EQ_uxn_opcodes_h_l154_c11_6681_right,
BIN_OP_EQ_uxn_opcodes_h_l154_c11_6681_return_output);

-- tmp16_MUX_uxn_opcodes_h_l154_c7_58a0
tmp16_MUX_uxn_opcodes_h_l154_c7_58a0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l154_c7_58a0_cond,
tmp16_MUX_uxn_opcodes_h_l154_c7_58a0_iftrue,
tmp16_MUX_uxn_opcodes_h_l154_c7_58a0_iffalse,
tmp16_MUX_uxn_opcodes_h_l154_c7_58a0_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l154_c7_58a0
result_u16_value_MUX_uxn_opcodes_h_l154_c7_58a0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l154_c7_58a0_cond,
result_u16_value_MUX_uxn_opcodes_h_l154_c7_58a0_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l154_c7_58a0_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l154_c7_58a0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l154_c7_58a0
result_u8_value_MUX_uxn_opcodes_h_l154_c7_58a0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l154_c7_58a0_cond,
result_u8_value_MUX_uxn_opcodes_h_l154_c7_58a0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l154_c7_58a0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l154_c7_58a0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_58a0
result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_58a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_58a0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_58a0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_58a0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_58a0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_58a0
result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_58a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_58a0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_58a0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_58a0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_58a0_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_58a0
result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_58a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_58a0_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_58a0_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_58a0_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_58a0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_58a0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_58a0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_58a0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_58a0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_58a0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_58a0_return_output);

-- CONST_SR_8_uxn_opcodes_h_l156_c31_8bd2
CONST_SR_8_uxn_opcodes_h_l156_c31_8bd2 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l156_c31_8bd2_x,
CONST_SR_8_uxn_opcodes_h_l156_c31_8bd2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l159_c11_ae2d
BIN_OP_EQ_uxn_opcodes_h_l159_c11_ae2d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l159_c11_ae2d_left,
BIN_OP_EQ_uxn_opcodes_h_l159_c11_ae2d_right,
BIN_OP_EQ_uxn_opcodes_h_l159_c11_ae2d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l159_c7_5c54
tmp16_MUX_uxn_opcodes_h_l159_c7_5c54 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l159_c7_5c54_cond,
tmp16_MUX_uxn_opcodes_h_l159_c7_5c54_iftrue,
tmp16_MUX_uxn_opcodes_h_l159_c7_5c54_iffalse,
tmp16_MUX_uxn_opcodes_h_l159_c7_5c54_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_5c54
result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_5c54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_5c54_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_5c54_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_5c54_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_5c54_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l159_c7_5c54
result_u16_value_MUX_uxn_opcodes_h_l159_c7_5c54 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l159_c7_5c54_cond,
result_u16_value_MUX_uxn_opcodes_h_l159_c7_5c54_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l159_c7_5c54_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l159_c7_5c54_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_5c54
result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_5c54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_5c54_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_5c54_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_5c54_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_5c54_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_5c54
result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_5c54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_5c54_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_5c54_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_5c54_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_5c54_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l161_c22_1435
BIN_OP_PLUS_uxn_opcodes_h_l161_c22_1435 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l161_c22_1435_left,
BIN_OP_PLUS_uxn_opcodes_h_l161_c22_1435_right,
BIN_OP_PLUS_uxn_opcodes_h_l161_c22_1435_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l163_c11_b5de
BIN_OP_EQ_uxn_opcodes_h_l163_c11_b5de : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l163_c11_b5de_left,
BIN_OP_EQ_uxn_opcodes_h_l163_c11_b5de_right,
BIN_OP_EQ_uxn_opcodes_h_l163_c11_b5de_return_output);

-- tmp16_MUX_uxn_opcodes_h_l163_c7_4e7a
tmp16_MUX_uxn_opcodes_h_l163_c7_4e7a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l163_c7_4e7a_cond,
tmp16_MUX_uxn_opcodes_h_l163_c7_4e7a_iftrue,
tmp16_MUX_uxn_opcodes_h_l163_c7_4e7a_iffalse,
tmp16_MUX_uxn_opcodes_h_l163_c7_4e7a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_4e7a
result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_4e7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_4e7a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_4e7a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_4e7a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_4e7a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l163_c7_4e7a
result_u16_value_MUX_uxn_opcodes_h_l163_c7_4e7a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l163_c7_4e7a_cond,
result_u16_value_MUX_uxn_opcodes_h_l163_c7_4e7a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l163_c7_4e7a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l163_c7_4e7a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_4e7a
result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_4e7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_4e7a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_4e7a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_4e7a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_4e7a_return_output);

-- CONST_SL_8_uxn_opcodes_h_l165_c3_655f
CONST_SL_8_uxn_opcodes_h_l165_c3_655f : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l165_c3_655f_x,
CONST_SL_8_uxn_opcodes_h_l165_c3_655f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l167_c11_2695
BIN_OP_EQ_uxn_opcodes_h_l167_c11_2695 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l167_c11_2695_left,
BIN_OP_EQ_uxn_opcodes_h_l167_c11_2695_right,
BIN_OP_EQ_uxn_opcodes_h_l167_c11_2695_return_output);

-- tmp16_MUX_uxn_opcodes_h_l167_c7_d0f3
tmp16_MUX_uxn_opcodes_h_l167_c7_d0f3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l167_c7_d0f3_cond,
tmp16_MUX_uxn_opcodes_h_l167_c7_d0f3_iftrue,
tmp16_MUX_uxn_opcodes_h_l167_c7_d0f3_iffalse,
tmp16_MUX_uxn_opcodes_h_l167_c7_d0f3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_d0f3
result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_d0f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_d0f3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_d0f3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_d0f3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_d0f3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l167_c7_d0f3
result_u16_value_MUX_uxn_opcodes_h_l167_c7_d0f3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l167_c7_d0f3_cond,
result_u16_value_MUX_uxn_opcodes_h_l167_c7_d0f3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l167_c7_d0f3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l167_c7_d0f3_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_d0f3
result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_d0f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_d0f3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_d0f3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_d0f3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_d0f3_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l168_c3_c8c4
BIN_OP_OR_uxn_opcodes_h_l168_c3_c8c4 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l168_c3_c8c4_left,
BIN_OP_OR_uxn_opcodes_h_l168_c3_c8c4_right,
BIN_OP_OR_uxn_opcodes_h_l168_c3_c8c4_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l170_c22_62e0
BIN_OP_PLUS_uxn_opcodes_h_l170_c22_62e0 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l170_c22_62e0_left,
BIN_OP_PLUS_uxn_opcodes_h_l170_c22_62e0_right,
BIN_OP_PLUS_uxn_opcodes_h_l170_c22_62e0_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l170_c22_4a78
BIN_OP_PLUS_uxn_opcodes_h_l170_c22_4a78 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l170_c22_4a78_left,
BIN_OP_PLUS_uxn_opcodes_h_l170_c22_4a78_right,
BIN_OP_PLUS_uxn_opcodes_h_l170_c22_4a78_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l172_c11_47e8
BIN_OP_EQ_uxn_opcodes_h_l172_c11_47e8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l172_c11_47e8_left,
BIN_OP_EQ_uxn_opcodes_h_l172_c11_47e8_right,
BIN_OP_EQ_uxn_opcodes_h_l172_c11_47e8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_820e
result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_820e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_820e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_820e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_820e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_820e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_820e
result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_820e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_820e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_820e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_820e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_820e_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l139_c6_1958_return_output,
 tmp16_MUX_uxn_opcodes_h_l139_c2_d120_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l139_c2_d120_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l139_c2_d120_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l139_c2_d120_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l139_c2_d120_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l139_c2_d120_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l139_c2_d120_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l139_c2_d120_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l145_c11_9a55_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l148_c11_49ee_return_output,
 tmp16_MUX_uxn_opcodes_h_l148_c7_357f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l148_c7_357f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l148_c7_357f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l148_c7_357f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l148_c7_357f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l148_c7_357f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l148_c7_357f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l148_c7_357f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l154_c11_6681_return_output,
 tmp16_MUX_uxn_opcodes_h_l154_c7_58a0_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l154_c7_58a0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l154_c7_58a0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_58a0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_58a0_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_58a0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_58a0_return_output,
 CONST_SR_8_uxn_opcodes_h_l156_c31_8bd2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l159_c11_ae2d_return_output,
 tmp16_MUX_uxn_opcodes_h_l159_c7_5c54_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_5c54_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l159_c7_5c54_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_5c54_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_5c54_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l161_c22_1435_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l163_c11_b5de_return_output,
 tmp16_MUX_uxn_opcodes_h_l163_c7_4e7a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_4e7a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l163_c7_4e7a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_4e7a_return_output,
 CONST_SL_8_uxn_opcodes_h_l165_c3_655f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l167_c11_2695_return_output,
 tmp16_MUX_uxn_opcodes_h_l167_c7_d0f3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_d0f3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l167_c7_d0f3_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_d0f3_return_output,
 BIN_OP_OR_uxn_opcodes_h_l168_c3_c8c4_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l170_c22_62e0_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l170_c22_4a78_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l172_c11_47e8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_820e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_820e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l139_c6_1958_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l139_c6_1958_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l139_c6_1958_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l139_c2_d120_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l145_c3_8dae : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l139_c2_d120_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l148_c7_357f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l139_c2_d120_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l139_c2_d120_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l139_c2_d120_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l139_c2_d120_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l148_c7_357f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l139_c2_d120_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l139_c2_d120_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l139_c2_d120_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l139_c2_d120_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l148_c7_357f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l139_c2_d120_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l139_c2_d120_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l139_c2_d120_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l139_c2_d120_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l148_c7_357f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l139_c2_d120_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l139_c2_d120_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l139_c2_d120_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l139_c2_d120_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l148_c7_357f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l139_c2_d120_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l139_c2_d120_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l139_c2_d120_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l139_c2_d120_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l148_c7_357f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l139_c2_d120_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l139_c2_d120_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l139_c2_d120_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l144_c3_c698 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l139_c2_d120_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l148_c7_357f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l139_c2_d120_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l139_c2_d120_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l139_c2_d120_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l139_c2_d120_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l148_c7_357f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l139_c2_d120_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l139_c2_d120_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l145_c11_9a55_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l145_c11_9a55_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l145_c11_9a55_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l148_c11_49ee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l148_c11_49ee_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l148_c11_49ee_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l148_c7_357f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l148_c7_357f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_58a0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l148_c7_357f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l148_c7_357f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l148_c7_357f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l154_c7_58a0_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l148_c7_357f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l148_c7_357f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l148_c7_357f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l154_c7_58a0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l148_c7_357f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l148_c7_357f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l148_c7_357f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_58a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l148_c7_357f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l148_c7_357f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l148_c7_357f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_58a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l148_c7_357f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l148_c7_357f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l148_c7_357f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_58a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l148_c7_357f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l148_c7_357f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l149_c3_e44d : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l148_c7_357f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l148_c7_357f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l148_c7_357f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l148_c7_357f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l151_c3_bffc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l148_c7_357f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_58a0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l148_c7_357f_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l152_c21_32dc_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_6681_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_6681_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_6681_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_58a0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_58a0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l159_c7_5c54_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_58a0_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l154_c7_58a0_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l154_c7_58a0_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l159_c7_5c54_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l154_c7_58a0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l154_c7_58a0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l154_c7_58a0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l154_c7_58a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_58a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_58a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_5c54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_58a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_58a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_58a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_5c54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_58a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_58a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_58a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_5c54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_58a0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_58a0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l155_c3_1330 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_58a0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_58a0_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l156_c31_8bd2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l156_c31_8bd2_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l156_c21_5e27_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l159_c11_ae2d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l159_c11_ae2d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l159_c11_ae2d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l159_c7_5c54_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l159_c7_5c54_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l163_c7_4e7a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l159_c7_5c54_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_5c54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_5c54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_4e7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_5c54_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l159_c7_5c54_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l161_c3_d6e0 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l159_c7_5c54_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l163_c7_4e7a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l159_c7_5c54_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_5c54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_5c54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_5c54_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_5c54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_5c54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_4e7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_5c54_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l161_c22_1435_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l161_c22_1435_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l161_c22_1435_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l163_c11_b5de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l163_c11_b5de_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l163_c11_b5de_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l163_c7_4e7a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l163_c7_4e7a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_d0f3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l163_c7_4e7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_4e7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_4e7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_d0f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_4e7a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l163_c7_4e7a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l163_c7_4e7a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l167_c7_d0f3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l163_c7_4e7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_4e7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_4e7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_d0f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_4e7a_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l165_c3_655f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l165_c3_655f_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_2695_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_2695_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_2695_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_d0f3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_d0f3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_d0f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_d0f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_d0f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_820e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_d0f3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l167_c7_d0f3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l170_c3_3cbd : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l167_c7_d0f3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l167_c7_d0f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_d0f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_d0f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_820e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_d0f3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l168_c3_c8c4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l168_c3_c8c4_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l168_c3_c8c4_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l170_c22_62e0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l170_c22_62e0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l170_c22_62e0_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l170_c22_4a78_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l170_c22_4a78_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l170_c22_4a78_return_output : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l172_c11_47e8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l172_c11_47e8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l172_c11_47e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_820e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_820e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_820e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_820e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_820e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_820e_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l148_l163_l167_l139_DUPLICATE_b067_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l154_l139_DUPLICATE_c4b6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l154_l139_l159_DUPLICATE_6185_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l148_l139_l172_l163_l159_l154_DUPLICATE_28f2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l154_l139_DUPLICATE_2756_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l148_l172_l167_l163_l159_l154_DUPLICATE_e8d7_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l164_l168_DUPLICATE_4167_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f68f_uxn_opcodes_h_l177_l135_DUPLICATE_c90e_return_output : opcode_result_t;
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
     VAR_result_sp_relative_shift_uxn_opcodes_h_l144_c3_c698 := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l139_c2_d120_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l144_c3_c698;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_6681_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l170_c22_4a78_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l149_c3_e44d := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l148_c7_357f_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l149_c3_e44d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_2695_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l155_c3_1330 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_58a0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l155_c3_1330;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l151_c3_bffc := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l148_c7_357f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l151_c3_bffc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l145_c11_9a55_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l139_c2_d120_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l148_c7_357f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l139_c6_1958_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_5c54_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_820e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l172_c11_47e8_right := to_unsigned(6, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l161_c22_1435_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l159_c11_ae2d_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l148_c11_49ee_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_d0f3_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l163_c11_b5de_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_820e_iftrue := to_unsigned(1, 1);

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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l145_c11_9a55_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l161_c22_1435_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l170_c22_62e0_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l154_c7_58a0_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l139_c6_1958_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l148_c11_49ee_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_6681_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l159_c11_ae2d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l163_c11_b5de_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_2695_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l172_c11_47e8_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l168_c3_c8c4_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l156_c31_8bd2_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l148_c7_357f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_58a0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l159_c7_5c54_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_d0f3_iffalse := tmp16;
     -- CONST_SR_8[uxn_opcodes_h_l156_c31_8bd2] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l156_c31_8bd2_x <= VAR_CONST_SR_8_uxn_opcodes_h_l156_c31_8bd2_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l156_c31_8bd2_return_output := CONST_SR_8_uxn_opcodes_h_l156_c31_8bd2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l154_c11_6681] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l154_c11_6681_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_6681_left;
     BIN_OP_EQ_uxn_opcodes_h_l154_c11_6681_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_6681_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_6681_return_output := BIN_OP_EQ_uxn_opcodes_h_l154_c11_6681_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l161_c22_1435] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l161_c22_1435_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l161_c22_1435_left;
     BIN_OP_PLUS_uxn_opcodes_h_l161_c22_1435_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l161_c22_1435_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l161_c22_1435_return_output := BIN_OP_PLUS_uxn_opcodes_h_l161_c22_1435_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l139_c6_1958] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l139_c6_1958_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l139_c6_1958_left;
     BIN_OP_EQ_uxn_opcodes_h_l139_c6_1958_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l139_c6_1958_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l139_c6_1958_return_output := BIN_OP_EQ_uxn_opcodes_h_l139_c6_1958_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l154_l139_l159_DUPLICATE_6185 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l154_l139_l159_DUPLICATE_6185_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l148_l139_l172_l163_l159_l154_DUPLICATE_28f2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l148_l139_l172_l163_l159_l154_DUPLICATE_28f2_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l159_c11_ae2d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l159_c11_ae2d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l159_c11_ae2d_left;
     BIN_OP_EQ_uxn_opcodes_h_l159_c11_ae2d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l159_c11_ae2d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l159_c11_ae2d_return_output := BIN_OP_EQ_uxn_opcodes_h_l159_c11_ae2d_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l152_c21_32dc] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l152_c21_32dc_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_PLUS[uxn_opcodes_h_l145_c11_9a55] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l145_c11_9a55_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l145_c11_9a55_left;
     BIN_OP_PLUS_uxn_opcodes_h_l145_c11_9a55_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l145_c11_9a55_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l145_c11_9a55_return_output := BIN_OP_PLUS_uxn_opcodes_h_l145_c11_9a55_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l164_l168_DUPLICATE_4167 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l164_l168_DUPLICATE_4167_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l148_c7_357f] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l148_c7_357f_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l148_l172_l167_l163_l159_l154_DUPLICATE_e8d7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l148_l172_l167_l163_l159_l154_DUPLICATE_e8d7_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l163_c11_b5de] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l163_c11_b5de_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l163_c11_b5de_left;
     BIN_OP_EQ_uxn_opcodes_h_l163_c11_b5de_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l163_c11_b5de_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l163_c11_b5de_return_output := BIN_OP_EQ_uxn_opcodes_h_l163_c11_b5de_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l154_l139_DUPLICATE_c4b6 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l154_l139_DUPLICATE_c4b6_return_output := result.u8_value;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l148_l163_l167_l139_DUPLICATE_b067 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l148_l163_l167_l139_DUPLICATE_b067_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l167_c11_2695] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l167_c11_2695_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_2695_left;
     BIN_OP_EQ_uxn_opcodes_h_l167_c11_2695_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_2695_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_2695_return_output := BIN_OP_EQ_uxn_opcodes_h_l167_c11_2695_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l154_l139_DUPLICATE_2756 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l154_l139_DUPLICATE_2756_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l148_c11_49ee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l148_c11_49ee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l148_c11_49ee_left;
     BIN_OP_EQ_uxn_opcodes_h_l148_c11_49ee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l148_c11_49ee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l148_c11_49ee_return_output := BIN_OP_EQ_uxn_opcodes_h_l148_c11_49ee_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l172_c11_47e8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l172_c11_47e8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l172_c11_47e8_left;
     BIN_OP_EQ_uxn_opcodes_h_l172_c11_47e8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l172_c11_47e8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l172_c11_47e8_return_output := BIN_OP_EQ_uxn_opcodes_h_l172_c11_47e8_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l139_c2_d120_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l139_c6_1958_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l139_c2_d120_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l139_c6_1958_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l139_c2_d120_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l139_c6_1958_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l139_c2_d120_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l139_c6_1958_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l139_c2_d120_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l139_c6_1958_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l139_c2_d120_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l139_c6_1958_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l139_c2_d120_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l139_c6_1958_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l139_c2_d120_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l139_c6_1958_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l148_c7_357f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l148_c11_49ee_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l148_c7_357f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l148_c11_49ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l148_c7_357f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l148_c11_49ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l148_c7_357f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l148_c11_49ee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l148_c7_357f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l148_c11_49ee_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l148_c7_357f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l148_c11_49ee_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l148_c7_357f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l148_c11_49ee_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l148_c7_357f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l148_c11_49ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_58a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_6681_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_58a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_6681_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_58a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_6681_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_58a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_6681_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l154_c7_58a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_6681_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l154_c7_58a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_6681_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_58a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c11_6681_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_5c54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l159_c11_ae2d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_5c54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l159_c11_ae2d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_5c54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l159_c11_ae2d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l159_c7_5c54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l159_c11_ae2d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l159_c7_5c54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l159_c11_ae2d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_4e7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l163_c11_b5de_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_4e7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l163_c11_b5de_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l163_c7_4e7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l163_c11_b5de_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l163_c7_4e7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l163_c11_b5de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_d0f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_2695_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_d0f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_2695_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l167_c7_d0f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_2695_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_d0f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_2695_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_820e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l172_c11_47e8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_820e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l172_c11_47e8_return_output;
     VAR_tmp16_uxn_opcodes_h_l145_c3_8dae := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l145_c11_9a55_return_output, 16);
     VAR_result_u16_value_uxn_opcodes_h_l161_c3_d6e0 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l161_c22_1435_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l168_c3_c8c4_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l164_l168_DUPLICATE_4167_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l165_c3_655f_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l164_l168_DUPLICATE_4167_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l148_c7_357f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l152_c21_32dc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l139_c2_d120_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l148_l163_l167_l139_DUPLICATE_b067_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l148_c7_357f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l148_l163_l167_l139_DUPLICATE_b067_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l163_c7_4e7a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l148_l163_l167_l139_DUPLICATE_b067_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l167_c7_d0f3_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l148_l163_l167_l139_DUPLICATE_b067_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l148_c7_357f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l148_l172_l167_l163_l159_l154_DUPLICATE_e8d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_58a0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l148_l172_l167_l163_l159_l154_DUPLICATE_e8d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_5c54_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l148_l172_l167_l163_l159_l154_DUPLICATE_e8d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_4e7a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l148_l172_l167_l163_l159_l154_DUPLICATE_e8d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_d0f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l148_l172_l167_l163_l159_l154_DUPLICATE_e8d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_820e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l148_l172_l167_l163_l159_l154_DUPLICATE_e8d7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l139_c2_d120_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l148_l139_l172_l163_l159_l154_DUPLICATE_28f2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l148_c7_357f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l148_l139_l172_l163_l159_l154_DUPLICATE_28f2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_58a0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l148_l139_l172_l163_l159_l154_DUPLICATE_28f2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_5c54_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l148_l139_l172_l163_l159_l154_DUPLICATE_28f2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_4e7a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l148_l139_l172_l163_l159_l154_DUPLICATE_28f2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_820e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l148_l139_l172_l163_l159_l154_DUPLICATE_28f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l139_c2_d120_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l154_l139_l159_DUPLICATE_6185_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_58a0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l154_l139_l159_DUPLICATE_6185_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_5c54_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l154_l139_l159_DUPLICATE_6185_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l139_c2_d120_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l154_l139_DUPLICATE_2756_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_58a0_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l154_l139_DUPLICATE_2756_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l139_c2_d120_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l154_l139_DUPLICATE_c4b6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l154_c7_58a0_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l154_l139_DUPLICATE_c4b6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l148_c7_357f_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l148_c7_357f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l159_c7_5c54_iftrue := VAR_result_u16_value_uxn_opcodes_h_l161_c3_d6e0;
     VAR_tmp16_MUX_uxn_opcodes_h_l139_c2_d120_iftrue := VAR_tmp16_uxn_opcodes_h_l145_c3_8dae;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l172_c7_820e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_820e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_820e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_820e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_820e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_820e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_820e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_820e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_820e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l159_c7_5c54] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_5c54_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_5c54_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_5c54_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_5c54_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_5c54_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_5c54_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_5c54_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_5c54_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l172_c7_820e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_820e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_820e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_820e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_820e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_820e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_820e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_820e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_820e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l148_c7_357f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l148_c7_357f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l148_c7_357f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l148_c7_357f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l148_c7_357f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l148_c7_357f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l148_c7_357f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l148_c7_357f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l148_c7_357f_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l165_c3_655f] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l165_c3_655f_x <= VAR_CONST_SL_8_uxn_opcodes_h_l165_c3_655f_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l165_c3_655f_return_output := CONST_SL_8_uxn_opcodes_h_l165_c3_655f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l154_c7_58a0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_58a0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_58a0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_58a0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_58a0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_58a0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_58a0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_58a0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_58a0_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l168_c3_c8c4] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l168_c3_c8c4_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l168_c3_c8c4_left;
     BIN_OP_OR_uxn_opcodes_h_l168_c3_c8c4_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l168_c3_c8c4_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l168_c3_c8c4_return_output := BIN_OP_OR_uxn_opcodes_h_l168_c3_c8c4_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l156_c21_5e27] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l156_c21_5e27_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l156_c31_8bd2_return_output);

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l170_c22_62e0_right := VAR_BIN_OP_OR_uxn_opcodes_h_l168_c3_c8c4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_d0f3_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l168_c3_c8c4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l154_c7_58a0_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l156_c21_5e27_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l163_c7_4e7a_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l165_c3_655f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_d0f3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_820e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_d0f3_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_820e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_58a0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_5c54_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l139_c2_d120_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l148_c7_357f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l148_c7_357f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c7_58a0_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l170_c22_62e0] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l170_c22_62e0_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l170_c22_62e0_left;
     BIN_OP_PLUS_uxn_opcodes_h_l170_c22_62e0_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l170_c22_62e0_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l170_c22_62e0_return_output := BIN_OP_PLUS_uxn_opcodes_h_l170_c22_62e0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l167_c7_d0f3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_d0f3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_d0f3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_d0f3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_d0f3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_d0f3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_d0f3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_d0f3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_d0f3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l167_c7_d0f3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l167_c7_d0f3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_d0f3_cond;
     tmp16_MUX_uxn_opcodes_h_l167_c7_d0f3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_d0f3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l167_c7_d0f3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_d0f3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_d0f3_return_output := tmp16_MUX_uxn_opcodes_h_l167_c7_d0f3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l148_c7_357f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l148_c7_357f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l148_c7_357f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l148_c7_357f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l148_c7_357f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l148_c7_357f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l148_c7_357f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l148_c7_357f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l148_c7_357f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l154_c7_58a0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_58a0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_58a0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_58a0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_58a0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_58a0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_58a0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_58a0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_58a0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l154_c7_58a0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l154_c7_58a0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l154_c7_58a0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l154_c7_58a0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l154_c7_58a0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l154_c7_58a0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l154_c7_58a0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l154_c7_58a0_return_output := result_u8_value_MUX_uxn_opcodes_h_l154_c7_58a0_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l167_c7_d0f3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_d0f3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_d0f3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_d0f3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_d0f3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_d0f3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_d0f3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_d0f3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_d0f3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l139_c2_d120] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l139_c2_d120_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l139_c2_d120_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l139_c2_d120_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l139_c2_d120_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l139_c2_d120_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l139_c2_d120_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l139_c2_d120_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l139_c2_d120_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l170_c22_4a78_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l170_c22_62e0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_4e7a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_d0f3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_4e7a_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_d0f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l148_c7_357f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c7_58a0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l139_c2_d120_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l148_c7_357f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l148_c7_357f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l154_c7_58a0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l163_c7_4e7a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_d0f3_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l163_c7_4e7a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l163_c7_4e7a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l163_c7_4e7a_cond;
     tmp16_MUX_uxn_opcodes_h_l163_c7_4e7a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l163_c7_4e7a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l163_c7_4e7a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l163_c7_4e7a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l163_c7_4e7a_return_output := tmp16_MUX_uxn_opcodes_h_l163_c7_4e7a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l148_c7_357f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l148_c7_357f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l148_c7_357f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l148_c7_357f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l148_c7_357f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l148_c7_357f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l148_c7_357f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l148_c7_357f_return_output := result_u8_value_MUX_uxn_opcodes_h_l148_c7_357f_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l170_c22_4a78] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l170_c22_4a78_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l170_c22_4a78_left;
     BIN_OP_PLUS_uxn_opcodes_h_l170_c22_4a78_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l170_c22_4a78_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l170_c22_4a78_return_output := BIN_OP_PLUS_uxn_opcodes_h_l170_c22_4a78_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l163_c7_4e7a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_4e7a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_4e7a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_4e7a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_4e7a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_4e7a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_4e7a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_4e7a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_4e7a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l139_c2_d120] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l139_c2_d120_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l139_c2_d120_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l139_c2_d120_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l139_c2_d120_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l139_c2_d120_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l139_c2_d120_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l139_c2_d120_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l139_c2_d120_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l163_c7_4e7a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_4e7a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_4e7a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_4e7a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_4e7a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_4e7a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_4e7a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_4e7a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_4e7a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l148_c7_357f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l148_c7_357f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l148_c7_357f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l148_c7_357f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l148_c7_357f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l148_c7_357f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l148_c7_357f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l148_c7_357f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l148_c7_357f_return_output;

     -- Submodule level 4
     VAR_result_u16_value_uxn_opcodes_h_l170_c3_3cbd := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l170_c22_4a78_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_5c54_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_4e7a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_5c54_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_4e7a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l139_c2_d120_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l148_c7_357f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l139_c2_d120_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l148_c7_357f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l159_c7_5c54_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l163_c7_4e7a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l167_c7_d0f3_iftrue := VAR_result_u16_value_uxn_opcodes_h_l170_c3_3cbd;
     -- result_u16_value_MUX[uxn_opcodes_h_l167_c7_d0f3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l167_c7_d0f3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l167_c7_d0f3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l167_c7_d0f3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l167_c7_d0f3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l167_c7_d0f3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l167_c7_d0f3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l167_c7_d0f3_return_output := result_u16_value_MUX_uxn_opcodes_h_l167_c7_d0f3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l159_c7_5c54] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_5c54_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_5c54_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_5c54_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_5c54_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_5c54_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_5c54_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_5c54_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_5c54_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l139_c2_d120] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l139_c2_d120_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l139_c2_d120_cond;
     result_u8_value_MUX_uxn_opcodes_h_l139_c2_d120_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l139_c2_d120_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l139_c2_d120_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l139_c2_d120_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l139_c2_d120_return_output := result_u8_value_MUX_uxn_opcodes_h_l139_c2_d120_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l139_c2_d120] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l139_c2_d120_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l139_c2_d120_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l139_c2_d120_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l139_c2_d120_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l139_c2_d120_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l139_c2_d120_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l139_c2_d120_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l139_c2_d120_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l159_c7_5c54] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l159_c7_5c54_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l159_c7_5c54_cond;
     tmp16_MUX_uxn_opcodes_h_l159_c7_5c54_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l159_c7_5c54_iftrue;
     tmp16_MUX_uxn_opcodes_h_l159_c7_5c54_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l159_c7_5c54_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l159_c7_5c54_return_output := tmp16_MUX_uxn_opcodes_h_l159_c7_5c54_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l159_c7_5c54] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_5c54_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_5c54_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_5c54_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_5c54_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_5c54_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_5c54_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_5c54_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_5c54_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_58a0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_5c54_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_58a0_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_5c54_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l163_c7_4e7a_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l167_c7_d0f3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_58a0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l159_c7_5c54_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l154_c7_58a0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l154_c7_58a0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_58a0_cond;
     tmp16_MUX_uxn_opcodes_h_l154_c7_58a0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_58a0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l154_c7_58a0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_58a0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_58a0_return_output := tmp16_MUX_uxn_opcodes_h_l154_c7_58a0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l154_c7_58a0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_58a0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_58a0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_58a0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_58a0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_58a0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_58a0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_58a0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_58a0_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l154_c7_58a0] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_58a0_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_58a0_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_58a0_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_58a0_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_58a0_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_58a0_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_58a0_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_58a0_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l163_c7_4e7a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l163_c7_4e7a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l163_c7_4e7a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l163_c7_4e7a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l163_c7_4e7a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l163_c7_4e7a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l163_c7_4e7a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l163_c7_4e7a_return_output := result_u16_value_MUX_uxn_opcodes_h_l163_c7_4e7a_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l148_c7_357f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c7_58a0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l148_c7_357f_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c7_58a0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l159_c7_5c54_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l163_c7_4e7a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l148_c7_357f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l154_c7_58a0_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l159_c7_5c54] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l159_c7_5c54_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l159_c7_5c54_cond;
     result_u16_value_MUX_uxn_opcodes_h_l159_c7_5c54_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l159_c7_5c54_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l159_c7_5c54_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l159_c7_5c54_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l159_c7_5c54_return_output := result_u16_value_MUX_uxn_opcodes_h_l159_c7_5c54_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l148_c7_357f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l148_c7_357f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l148_c7_357f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l148_c7_357f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l148_c7_357f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l148_c7_357f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l148_c7_357f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l148_c7_357f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l148_c7_357f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l148_c7_357f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l148_c7_357f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l148_c7_357f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l148_c7_357f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l148_c7_357f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l148_c7_357f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l148_c7_357f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l148_c7_357f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l148_c7_357f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l148_c7_357f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l148_c7_357f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l148_c7_357f_cond;
     tmp16_MUX_uxn_opcodes_h_l148_c7_357f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l148_c7_357f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l148_c7_357f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l148_c7_357f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l148_c7_357f_return_output := tmp16_MUX_uxn_opcodes_h_l148_c7_357f_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l139_c2_d120_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l148_c7_357f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l139_c2_d120_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l148_c7_357f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l154_c7_58a0_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l159_c7_5c54_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l139_c2_d120_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l148_c7_357f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l139_c2_d120] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l139_c2_d120_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l139_c2_d120_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l139_c2_d120_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l139_c2_d120_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l139_c2_d120_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l139_c2_d120_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l139_c2_d120_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l139_c2_d120_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l154_c7_58a0] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l154_c7_58a0_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l154_c7_58a0_cond;
     result_u16_value_MUX_uxn_opcodes_h_l154_c7_58a0_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l154_c7_58a0_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l154_c7_58a0_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l154_c7_58a0_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l154_c7_58a0_return_output := result_u16_value_MUX_uxn_opcodes_h_l154_c7_58a0_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l139_c2_d120] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l139_c2_d120_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l139_c2_d120_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l139_c2_d120_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l139_c2_d120_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l139_c2_d120_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l139_c2_d120_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l139_c2_d120_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l139_c2_d120_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l139_c2_d120] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l139_c2_d120_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l139_c2_d120_cond;
     tmp16_MUX_uxn_opcodes_h_l139_c2_d120_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l139_c2_d120_iftrue;
     tmp16_MUX_uxn_opcodes_h_l139_c2_d120_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l139_c2_d120_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l139_c2_d120_return_output := tmp16_MUX_uxn_opcodes_h_l139_c2_d120_return_output;

     -- Submodule level 8
     VAR_result_u16_value_MUX_uxn_opcodes_h_l148_c7_357f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l154_c7_58a0_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l139_c2_d120_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l148_c7_357f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l148_c7_357f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l148_c7_357f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l148_c7_357f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l148_c7_357f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l148_c7_357f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l148_c7_357f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l148_c7_357f_return_output := result_u16_value_MUX_uxn_opcodes_h_l148_c7_357f_return_output;

     -- Submodule level 9
     VAR_result_u16_value_MUX_uxn_opcodes_h_l139_c2_d120_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l148_c7_357f_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l139_c2_d120] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l139_c2_d120_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l139_c2_d120_cond;
     result_u16_value_MUX_uxn_opcodes_h_l139_c2_d120_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l139_c2_d120_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l139_c2_d120_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l139_c2_d120_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l139_c2_d120_return_output := result_u16_value_MUX_uxn_opcodes_h_l139_c2_d120_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_f68f_uxn_opcodes_h_l177_l135_DUPLICATE_c90e LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f68f_uxn_opcodes_h_l177_l135_DUPLICATE_c90e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_f68f(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l139_c2_d120_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l139_c2_d120_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l139_c2_d120_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l139_c2_d120_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l139_c2_d120_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l139_c2_d120_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l139_c2_d120_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f68f_uxn_opcodes_h_l177_l135_DUPLICATE_c90e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f68f_uxn_opcodes_h_l177_l135_DUPLICATE_c90e_return_output;
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
