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
entity jsi_0CLK_1c7b7172 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jsi_0CLK_1c7b7172;
architecture arch of jsi_0CLK_1c7b7172 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l144_c6_bf95]
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_bf95_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_bf95_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_bf95_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l144_c2_97fe]
signal tmp16_MUX_uxn_opcodes_h_l144_c2_97fe_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_97fe_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l144_c2_97fe]
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_97fe_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_97fe_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l144_c2_97fe]
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_97fe_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_97fe_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l144_c2_97fe]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_97fe_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_97fe_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l144_c2_97fe]
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_97fe_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_97fe_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l144_c2_97fe]
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_97fe_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_97fe_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l144_c2_97fe]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_97fe_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_97fe_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l144_c2_97fe]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_97fe_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_97fe_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l144_c2_97fe]
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_97fe_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_97fe_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l144_c2_97fe]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_97fe_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_97fe_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l144_c2_97fe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_97fe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_97fe_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l154_c11_186e]
signal BIN_OP_PLUS_uxn_opcodes_h_l154_c11_186e_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l154_c11_186e_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l154_c11_186e_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l157_c11_2ef6]
signal BIN_OP_EQ_uxn_opcodes_h_l157_c11_2ef6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l157_c11_2ef6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l157_c11_2ef6_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l157_c7_8066]
signal tmp16_MUX_uxn_opcodes_h_l157_c7_8066_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l157_c7_8066_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l157_c7_8066_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l157_c7_8066_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l157_c7_8066]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_8066_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_8066_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_8066_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_8066_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l157_c7_8066]
signal result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_8066_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_8066_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_8066_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_8066_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l157_c7_8066]
signal result_u16_value_MUX_uxn_opcodes_h_l157_c7_8066_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l157_c7_8066_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l157_c7_8066_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l157_c7_8066_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l157_c7_8066]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l157_c7_8066_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l157_c7_8066_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l157_c7_8066_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l157_c7_8066_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l157_c7_8066]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_8066_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_8066_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_8066_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_8066_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l157_c7_8066]
signal result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_8066_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_8066_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_8066_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_8066_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l157_c7_8066]
signal result_u8_value_MUX_uxn_opcodes_h_l157_c7_8066_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l157_c7_8066_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l157_c7_8066_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l157_c7_8066_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l163_c11_a5ff]
signal BIN_OP_EQ_uxn_opcodes_h_l163_c11_a5ff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l163_c11_a5ff_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l163_c11_a5ff_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l163_c7_9e19]
signal tmp16_MUX_uxn_opcodes_h_l163_c7_9e19_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l163_c7_9e19_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l163_c7_9e19_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l163_c7_9e19_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l163_c7_9e19]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l163_c7_9e19_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l163_c7_9e19_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l163_c7_9e19_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l163_c7_9e19_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l163_c7_9e19]
signal result_is_stack_write_MUX_uxn_opcodes_h_l163_c7_9e19_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l163_c7_9e19_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l163_c7_9e19_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l163_c7_9e19_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l163_c7_9e19]
signal result_u16_value_MUX_uxn_opcodes_h_l163_c7_9e19_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l163_c7_9e19_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l163_c7_9e19_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l163_c7_9e19_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l163_c7_9e19]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_9e19_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_9e19_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_9e19_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_9e19_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l163_c7_9e19]
signal result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_9e19_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_9e19_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_9e19_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_9e19_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l163_c7_9e19]
signal result_u8_value_MUX_uxn_opcodes_h_l163_c7_9e19_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l163_c7_9e19_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l163_c7_9e19_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l163_c7_9e19_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l165_c31_d799]
signal CONST_SR_8_uxn_opcodes_h_l165_c31_d799_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l165_c31_d799_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l168_c11_dae9]
signal BIN_OP_EQ_uxn_opcodes_h_l168_c11_dae9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l168_c11_dae9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l168_c11_dae9_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l168_c7_1166]
signal tmp16_MUX_uxn_opcodes_h_l168_c7_1166_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l168_c7_1166_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l168_c7_1166_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l168_c7_1166_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l168_c7_1166]
signal result_u16_value_MUX_uxn_opcodes_h_l168_c7_1166_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l168_c7_1166_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l168_c7_1166_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l168_c7_1166_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l168_c7_1166]
signal result_is_stack_write_MUX_uxn_opcodes_h_l168_c7_1166_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l168_c7_1166_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l168_c7_1166_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l168_c7_1166_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l168_c7_1166]
signal result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_1166_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_1166_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_1166_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_1166_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l168_c7_1166]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_1166_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_1166_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_1166_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_1166_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l170_c22_8dff]
signal BIN_OP_PLUS_uxn_opcodes_h_l170_c22_8dff_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l170_c22_8dff_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l170_c22_8dff_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l172_c11_977c]
signal BIN_OP_EQ_uxn_opcodes_h_l172_c11_977c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l172_c11_977c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l172_c11_977c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l172_c7_c928]
signal tmp16_MUX_uxn_opcodes_h_l172_c7_c928_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l172_c7_c928_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l172_c7_c928_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l172_c7_c928_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l172_c7_c928]
signal result_u16_value_MUX_uxn_opcodes_h_l172_c7_c928_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l172_c7_c928_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l172_c7_c928_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l172_c7_c928_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l172_c7_c928]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_c928_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_c928_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_c928_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_c928_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l172_c7_c928]
signal result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_c928_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_c928_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_c928_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_c928_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l174_c3_4bbe]
signal CONST_SL_8_uxn_opcodes_h_l174_c3_4bbe_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l174_c3_4bbe_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l176_c11_bc9f]
signal BIN_OP_EQ_uxn_opcodes_h_l176_c11_bc9f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l176_c11_bc9f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l176_c11_bc9f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l176_c7_6c97]
signal tmp16_MUX_uxn_opcodes_h_l176_c7_6c97_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l176_c7_6c97_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l176_c7_6c97_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l176_c7_6c97_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l176_c7_6c97]
signal result_u16_value_MUX_uxn_opcodes_h_l176_c7_6c97_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l176_c7_6c97_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l176_c7_6c97_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l176_c7_6c97_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l176_c7_6c97]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_6c97_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_6c97_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_6c97_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_6c97_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l176_c7_6c97]
signal result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_6c97_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_6c97_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_6c97_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_6c97_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l177_c3_9b41]
signal BIN_OP_OR_uxn_opcodes_h_l177_c3_9b41_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l177_c3_9b41_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l177_c3_9b41_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l179_c22_96cb]
signal BIN_OP_PLUS_uxn_opcodes_h_l179_c22_96cb_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l179_c22_96cb_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l179_c22_96cb_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l179_c22_f8c7]
signal BIN_OP_PLUS_uxn_opcodes_h_l179_c22_f8c7_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l179_c22_f8c7_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l179_c22_f8c7_return_output : unsigned(17 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.u16_value := ref_toks_8;
      base.is_pc_updated := ref_toks_9;
      base.is_opc_done := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l144_c6_bf95
BIN_OP_EQ_uxn_opcodes_h_l144_c6_bf95 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l144_c6_bf95_left,
BIN_OP_EQ_uxn_opcodes_h_l144_c6_bf95_right,
BIN_OP_EQ_uxn_opcodes_h_l144_c6_bf95_return_output);

-- tmp16_MUX_uxn_opcodes_h_l144_c2_97fe
tmp16_MUX_uxn_opcodes_h_l144_c2_97fe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l144_c2_97fe_cond,
tmp16_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue,
tmp16_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse,
tmp16_MUX_uxn_opcodes_h_l144_c2_97fe_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_97fe
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_97fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_97fe_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_97fe_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_97fe
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_97fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_97fe_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_97fe_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_97fe
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_97fe : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_97fe_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_97fe_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_97fe
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_97fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_97fe_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_97fe_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l144_c2_97fe
result_u8_value_MUX_uxn_opcodes_h_l144_c2_97fe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l144_c2_97fe_cond,
result_u8_value_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l144_c2_97fe_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_97fe
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_97fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_97fe_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_97fe_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_97fe
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_97fe : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_97fe_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_97fe_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l144_c2_97fe
result_u16_value_MUX_uxn_opcodes_h_l144_c2_97fe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l144_c2_97fe_cond,
result_u16_value_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l144_c2_97fe_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_97fe
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_97fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_97fe_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_97fe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_97fe
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_97fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_97fe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_97fe_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l154_c11_186e
BIN_OP_PLUS_uxn_opcodes_h_l154_c11_186e : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l154_c11_186e_left,
BIN_OP_PLUS_uxn_opcodes_h_l154_c11_186e_right,
BIN_OP_PLUS_uxn_opcodes_h_l154_c11_186e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l157_c11_2ef6
BIN_OP_EQ_uxn_opcodes_h_l157_c11_2ef6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l157_c11_2ef6_left,
BIN_OP_EQ_uxn_opcodes_h_l157_c11_2ef6_right,
BIN_OP_EQ_uxn_opcodes_h_l157_c11_2ef6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l157_c7_8066
tmp16_MUX_uxn_opcodes_h_l157_c7_8066 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l157_c7_8066_cond,
tmp16_MUX_uxn_opcodes_h_l157_c7_8066_iftrue,
tmp16_MUX_uxn_opcodes_h_l157_c7_8066_iffalse,
tmp16_MUX_uxn_opcodes_h_l157_c7_8066_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_8066
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_8066 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_8066_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_8066_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_8066_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_8066_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_8066
result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_8066 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_8066_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_8066_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_8066_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_8066_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l157_c7_8066
result_u16_value_MUX_uxn_opcodes_h_l157_c7_8066 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l157_c7_8066_cond,
result_u16_value_MUX_uxn_opcodes_h_l157_c7_8066_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l157_c7_8066_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l157_c7_8066_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l157_c7_8066
result_sp_relative_shift_MUX_uxn_opcodes_h_l157_c7_8066 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l157_c7_8066_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l157_c7_8066_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l157_c7_8066_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l157_c7_8066_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_8066
result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_8066 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_8066_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_8066_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_8066_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_8066_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_8066
result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_8066 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_8066_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_8066_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_8066_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_8066_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l157_c7_8066
result_u8_value_MUX_uxn_opcodes_h_l157_c7_8066 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l157_c7_8066_cond,
result_u8_value_MUX_uxn_opcodes_h_l157_c7_8066_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l157_c7_8066_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l157_c7_8066_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l163_c11_a5ff
BIN_OP_EQ_uxn_opcodes_h_l163_c11_a5ff : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l163_c11_a5ff_left,
BIN_OP_EQ_uxn_opcodes_h_l163_c11_a5ff_right,
BIN_OP_EQ_uxn_opcodes_h_l163_c11_a5ff_return_output);

-- tmp16_MUX_uxn_opcodes_h_l163_c7_9e19
tmp16_MUX_uxn_opcodes_h_l163_c7_9e19 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l163_c7_9e19_cond,
tmp16_MUX_uxn_opcodes_h_l163_c7_9e19_iftrue,
tmp16_MUX_uxn_opcodes_h_l163_c7_9e19_iffalse,
tmp16_MUX_uxn_opcodes_h_l163_c7_9e19_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l163_c7_9e19
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l163_c7_9e19 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l163_c7_9e19_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l163_c7_9e19_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l163_c7_9e19_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l163_c7_9e19_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l163_c7_9e19
result_is_stack_write_MUX_uxn_opcodes_h_l163_c7_9e19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l163_c7_9e19_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l163_c7_9e19_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l163_c7_9e19_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l163_c7_9e19_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l163_c7_9e19
result_u16_value_MUX_uxn_opcodes_h_l163_c7_9e19 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l163_c7_9e19_cond,
result_u16_value_MUX_uxn_opcodes_h_l163_c7_9e19_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l163_c7_9e19_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l163_c7_9e19_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_9e19
result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_9e19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_9e19_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_9e19_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_9e19_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_9e19_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_9e19
result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_9e19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_9e19_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_9e19_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_9e19_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_9e19_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l163_c7_9e19
result_u8_value_MUX_uxn_opcodes_h_l163_c7_9e19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l163_c7_9e19_cond,
result_u8_value_MUX_uxn_opcodes_h_l163_c7_9e19_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l163_c7_9e19_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l163_c7_9e19_return_output);

-- CONST_SR_8_uxn_opcodes_h_l165_c31_d799
CONST_SR_8_uxn_opcodes_h_l165_c31_d799 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l165_c31_d799_x,
CONST_SR_8_uxn_opcodes_h_l165_c31_d799_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l168_c11_dae9
BIN_OP_EQ_uxn_opcodes_h_l168_c11_dae9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l168_c11_dae9_left,
BIN_OP_EQ_uxn_opcodes_h_l168_c11_dae9_right,
BIN_OP_EQ_uxn_opcodes_h_l168_c11_dae9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l168_c7_1166
tmp16_MUX_uxn_opcodes_h_l168_c7_1166 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l168_c7_1166_cond,
tmp16_MUX_uxn_opcodes_h_l168_c7_1166_iftrue,
tmp16_MUX_uxn_opcodes_h_l168_c7_1166_iffalse,
tmp16_MUX_uxn_opcodes_h_l168_c7_1166_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l168_c7_1166
result_u16_value_MUX_uxn_opcodes_h_l168_c7_1166 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l168_c7_1166_cond,
result_u16_value_MUX_uxn_opcodes_h_l168_c7_1166_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l168_c7_1166_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l168_c7_1166_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l168_c7_1166
result_is_stack_write_MUX_uxn_opcodes_h_l168_c7_1166 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l168_c7_1166_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l168_c7_1166_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l168_c7_1166_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l168_c7_1166_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_1166
result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_1166 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_1166_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_1166_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_1166_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_1166_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_1166
result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_1166 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_1166_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_1166_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_1166_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_1166_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l170_c22_8dff
BIN_OP_PLUS_uxn_opcodes_h_l170_c22_8dff : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l170_c22_8dff_left,
BIN_OP_PLUS_uxn_opcodes_h_l170_c22_8dff_right,
BIN_OP_PLUS_uxn_opcodes_h_l170_c22_8dff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l172_c11_977c
BIN_OP_EQ_uxn_opcodes_h_l172_c11_977c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l172_c11_977c_left,
BIN_OP_EQ_uxn_opcodes_h_l172_c11_977c_right,
BIN_OP_EQ_uxn_opcodes_h_l172_c11_977c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l172_c7_c928
tmp16_MUX_uxn_opcodes_h_l172_c7_c928 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l172_c7_c928_cond,
tmp16_MUX_uxn_opcodes_h_l172_c7_c928_iftrue,
tmp16_MUX_uxn_opcodes_h_l172_c7_c928_iffalse,
tmp16_MUX_uxn_opcodes_h_l172_c7_c928_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l172_c7_c928
result_u16_value_MUX_uxn_opcodes_h_l172_c7_c928 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l172_c7_c928_cond,
result_u16_value_MUX_uxn_opcodes_h_l172_c7_c928_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l172_c7_c928_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l172_c7_c928_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_c928
result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_c928 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_c928_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_c928_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_c928_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_c928_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_c928
result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_c928 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_c928_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_c928_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_c928_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_c928_return_output);

-- CONST_SL_8_uxn_opcodes_h_l174_c3_4bbe
CONST_SL_8_uxn_opcodes_h_l174_c3_4bbe : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l174_c3_4bbe_x,
CONST_SL_8_uxn_opcodes_h_l174_c3_4bbe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l176_c11_bc9f
BIN_OP_EQ_uxn_opcodes_h_l176_c11_bc9f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l176_c11_bc9f_left,
BIN_OP_EQ_uxn_opcodes_h_l176_c11_bc9f_right,
BIN_OP_EQ_uxn_opcodes_h_l176_c11_bc9f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l176_c7_6c97
tmp16_MUX_uxn_opcodes_h_l176_c7_6c97 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l176_c7_6c97_cond,
tmp16_MUX_uxn_opcodes_h_l176_c7_6c97_iftrue,
tmp16_MUX_uxn_opcodes_h_l176_c7_6c97_iffalse,
tmp16_MUX_uxn_opcodes_h_l176_c7_6c97_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l176_c7_6c97
result_u16_value_MUX_uxn_opcodes_h_l176_c7_6c97 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l176_c7_6c97_cond,
result_u16_value_MUX_uxn_opcodes_h_l176_c7_6c97_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l176_c7_6c97_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l176_c7_6c97_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_6c97
result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_6c97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_6c97_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_6c97_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_6c97_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_6c97_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_6c97
result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_6c97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_6c97_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_6c97_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_6c97_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_6c97_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l177_c3_9b41
BIN_OP_OR_uxn_opcodes_h_l177_c3_9b41 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l177_c3_9b41_left,
BIN_OP_OR_uxn_opcodes_h_l177_c3_9b41_right,
BIN_OP_OR_uxn_opcodes_h_l177_c3_9b41_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l179_c22_96cb
BIN_OP_PLUS_uxn_opcodes_h_l179_c22_96cb : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l179_c22_96cb_left,
BIN_OP_PLUS_uxn_opcodes_h_l179_c22_96cb_right,
BIN_OP_PLUS_uxn_opcodes_h_l179_c22_96cb_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l179_c22_f8c7
BIN_OP_PLUS_uxn_opcodes_h_l179_c22_f8c7 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l179_c22_f8c7_left,
BIN_OP_PLUS_uxn_opcodes_h_l179_c22_f8c7_right,
BIN_OP_PLUS_uxn_opcodes_h_l179_c22_f8c7_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l144_c6_bf95_return_output,
 tmp16_MUX_uxn_opcodes_h_l144_c2_97fe_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_97fe_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_97fe_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_97fe_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_97fe_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l144_c2_97fe_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_97fe_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_97fe_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l144_c2_97fe_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_97fe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_97fe_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l154_c11_186e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l157_c11_2ef6_return_output,
 tmp16_MUX_uxn_opcodes_h_l157_c7_8066_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_8066_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_8066_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l157_c7_8066_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l157_c7_8066_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_8066_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_8066_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l157_c7_8066_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l163_c11_a5ff_return_output,
 tmp16_MUX_uxn_opcodes_h_l163_c7_9e19_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l163_c7_9e19_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l163_c7_9e19_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l163_c7_9e19_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_9e19_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_9e19_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l163_c7_9e19_return_output,
 CONST_SR_8_uxn_opcodes_h_l165_c31_d799_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l168_c11_dae9_return_output,
 tmp16_MUX_uxn_opcodes_h_l168_c7_1166_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l168_c7_1166_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l168_c7_1166_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_1166_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_1166_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l170_c22_8dff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l172_c11_977c_return_output,
 tmp16_MUX_uxn_opcodes_h_l172_c7_c928_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l172_c7_c928_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_c928_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_c928_return_output,
 CONST_SL_8_uxn_opcodes_h_l174_c3_4bbe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l176_c11_bc9f_return_output,
 tmp16_MUX_uxn_opcodes_h_l176_c7_6c97_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l176_c7_6c97_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_6c97_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_6c97_return_output,
 BIN_OP_OR_uxn_opcodes_h_l177_c3_9b41_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l179_c22_96cb_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l179_c22_f8c7_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_bf95_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_bf95_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_bf95_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l154_c3_efa6 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_8066_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_97fe_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_97fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_8066_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_97fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_97fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l144_c2_97fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_97fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_97fe_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l153_c3_f3dd : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l157_c7_8066_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_97fe_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_97fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l144_c2_97fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_97fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_97fe_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l157_c7_8066_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_97fe_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_97fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l144_c2_97fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_97fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_97fe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_8066_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_97fe_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_97fe_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l157_c7_8066_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_97fe_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_97fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_8066_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_97fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_97fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_8066_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_97fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_97fe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l154_c11_186e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l154_c11_186e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l154_c11_186e_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_2ef6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_2ef6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_2ef6_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_8066_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_8066_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l163_c7_9e19_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_8066_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_8066_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l160_c3_2dd2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_8066_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l163_c7_9e19_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_8066_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_8066_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_8066_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l163_c7_9e19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_8066_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l157_c7_8066_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l157_c7_8066_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l163_c7_9e19_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l157_c7_8066_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l157_c7_8066_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l158_c3_50a3 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l157_c7_8066_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l157_c7_8066_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l157_c7_8066_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_8066_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_8066_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_9e19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_8066_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_8066_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_8066_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_9e19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_8066_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l157_c7_8066_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l157_c7_8066_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l163_c7_9e19_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l157_c7_8066_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l161_c21_af96_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l163_c11_a5ff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l163_c11_a5ff_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l163_c11_a5ff_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l163_c7_9e19_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l163_c7_9e19_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l168_c7_1166_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l163_c7_9e19_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l163_c7_9e19_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l164_c3_f022 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l163_c7_9e19_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l163_c7_9e19_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l163_c7_9e19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l163_c7_9e19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l168_c7_1166_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l163_c7_9e19_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l163_c7_9e19_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l163_c7_9e19_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l168_c7_1166_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l163_c7_9e19_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_9e19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_9e19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_1166_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_9e19_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_9e19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_9e19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_1166_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_9e19_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l163_c7_9e19_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l163_c7_9e19_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l163_c7_9e19_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l165_c31_d799_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l165_c31_d799_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l165_c21_9acf_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l168_c11_dae9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l168_c11_dae9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l168_c11_dae9_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l168_c7_1166_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l168_c7_1166_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l172_c7_c928_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l168_c7_1166_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l168_c7_1166_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l170_c3_43b1 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l168_c7_1166_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l172_c7_c928_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l168_c7_1166_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l168_c7_1166_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l168_c7_1166_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l168_c7_1166_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_1166_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_1166_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_c928_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_1166_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_1166_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_1166_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_c928_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_1166_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l170_c22_8dff_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l170_c22_8dff_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l170_c22_8dff_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l172_c11_977c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l172_c11_977c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l172_c11_977c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l172_c7_c928_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l172_c7_c928_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_6c97_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l172_c7_c928_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l172_c7_c928_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l172_c7_c928_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l176_c7_6c97_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l172_c7_c928_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_c928_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_c928_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_6c97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_c928_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_c928_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_c928_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_6c97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_c928_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l174_c3_4bbe_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l174_c3_4bbe_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_bc9f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_bc9f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_bc9f_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_6c97_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_6c97_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_6c97_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l176_c7_6c97_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l179_c3_9a8e : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l176_c7_6c97_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l176_c7_6c97_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_6c97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_6c97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_6c97_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_6c97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_6c97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_6c97_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l177_c3_9b41_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l177_c3_9b41_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l177_c3_9b41_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l179_c22_96cb_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l179_c22_96cb_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l179_c22_96cb_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l179_c22_f8c7_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l179_c22_f8c7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l179_c22_f8c7_return_output : unsigned(17 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l163_l144_DUPLICATE_f2ca_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l163_l144_DUPLICATE_9284_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l176_l144_l157_l172_DUPLICATE_1702_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l163_l157_l176_l172_l168_DUPLICATE_2239_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l163_l157_l176_l172_l168_DUPLICATE_39e6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l163_l168_DUPLICATE_0192_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l173_l177_DUPLICATE_3748_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4_uxn_opcodes_h_l183_l140_DUPLICATE_5019_return_output : opcode_result_t;
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
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l160_c3_2dd2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_8066_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l160_c3_2dd2;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l179_c22_f8c7_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l153_c3_f3dd := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l153_c3_f3dd;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l163_c11_a5ff_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l172_c11_977c_right := to_unsigned(4, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l154_c11_186e_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l168_c7_1166_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_bf95_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l164_c3_f022 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l163_c7_9e19_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l164_c3_f022;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_2ef6_right := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l158_c3_50a3 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l157_c7_8066_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l158_c3_50a3;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_6c97_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_bc9f_right := to_unsigned(5, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l168_c11_dae9_right := to_unsigned(3, 2);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_6c97_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l170_c22_8dff_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_8066_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue := to_unsigned(0, 1);

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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l154_c11_186e_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l170_c22_8dff_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l179_c22_96cb_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l163_c7_9e19_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_bf95_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_2ef6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l163_c11_a5ff_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l168_c11_dae9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l172_c11_977c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_bc9f_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l177_c3_9b41_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l165_c31_d799_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_8066_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l163_c7_9e19_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l168_c7_1166_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_6c97_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l176_c11_bc9f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l176_c11_bc9f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_bc9f_left;
     BIN_OP_EQ_uxn_opcodes_h_l176_c11_bc9f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_bc9f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_bc9f_return_output := BIN_OP_EQ_uxn_opcodes_h_l176_c11_bc9f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l144_c6_bf95] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l144_c6_bf95_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_bf95_left;
     BIN_OP_EQ_uxn_opcodes_h_l144_c6_bf95_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_bf95_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_bf95_return_output := BIN_OP_EQ_uxn_opcodes_h_l144_c6_bf95_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l161_c21_af96] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l161_c21_af96_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l163_l157_l176_l172_l168_DUPLICATE_39e6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l163_l157_l176_l172_l168_DUPLICATE_39e6_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l176_l144_l157_l172_DUPLICATE_1702 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l176_l144_l157_l172_DUPLICATE_1702_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l168_c11_dae9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l168_c11_dae9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l168_c11_dae9_left;
     BIN_OP_EQ_uxn_opcodes_h_l168_c11_dae9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l168_c11_dae9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l168_c11_dae9_return_output := BIN_OP_EQ_uxn_opcodes_h_l168_c11_dae9_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l163_l157_l176_l172_l168_DUPLICATE_2239 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l163_l157_l176_l172_l168_DUPLICATE_2239_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l163_c11_a5ff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l163_c11_a5ff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l163_c11_a5ff_left;
     BIN_OP_EQ_uxn_opcodes_h_l163_c11_a5ff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l163_c11_a5ff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l163_c11_a5ff_return_output := BIN_OP_EQ_uxn_opcodes_h_l163_c11_a5ff_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l163_l144_DUPLICATE_9284 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l163_l144_DUPLICATE_9284_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l173_l177_DUPLICATE_3748 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l173_l177_DUPLICATE_3748_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_PLUS[uxn_opcodes_h_l154_c11_186e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l154_c11_186e_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l154_c11_186e_left;
     BIN_OP_PLUS_uxn_opcodes_h_l154_c11_186e_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l154_c11_186e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l154_c11_186e_return_output := BIN_OP_PLUS_uxn_opcodes_h_l154_c11_186e_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l144_c2_97fe] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l144_c2_97fe_return_output := result.is_vram_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l144_c2_97fe] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l144_c2_97fe_return_output := result.is_stack_index_flipped;

     -- CONST_SR_8[uxn_opcodes_h_l165_c31_d799] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l165_c31_d799_x <= VAR_CONST_SR_8_uxn_opcodes_h_l165_c31_d799_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l165_c31_d799_return_output := CONST_SR_8_uxn_opcodes_h_l165_c31_d799_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l170_c22_8dff] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l170_c22_8dff_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l170_c22_8dff_left;
     BIN_OP_PLUS_uxn_opcodes_h_l170_c22_8dff_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l170_c22_8dff_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l170_c22_8dff_return_output := BIN_OP_PLUS_uxn_opcodes_h_l170_c22_8dff_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l172_c11_977c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l172_c11_977c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l172_c11_977c_left;
     BIN_OP_EQ_uxn_opcodes_h_l172_c11_977c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l172_c11_977c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l172_c11_977c_return_output := BIN_OP_EQ_uxn_opcodes_h_l172_c11_977c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l163_l168_DUPLICATE_0192 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l163_l168_DUPLICATE_0192_return_output := result.is_stack_write;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l157_c7_8066] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l157_c7_8066_return_output := result.sp_relative_shift;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l144_c2_97fe] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l144_c2_97fe_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l157_c11_2ef6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l157_c11_2ef6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_2ef6_left;
     BIN_OP_EQ_uxn_opcodes_h_l157_c11_2ef6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_2ef6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_2ef6_return_output := BIN_OP_EQ_uxn_opcodes_h_l157_c11_2ef6_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l163_l144_DUPLICATE_f2ca LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l163_l144_DUPLICATE_f2ca_return_output := result.u8_value;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_97fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_bf95_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_97fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_bf95_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_97fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_bf95_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_97fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_bf95_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_97fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_bf95_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_97fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_bf95_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_97fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_bf95_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_97fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_bf95_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_97fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_bf95_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_97fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_bf95_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_97fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_bf95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_8066_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_2ef6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_8066_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_2ef6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_8066_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_2ef6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l157_c7_8066_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_2ef6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_8066_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_2ef6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l157_c7_8066_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_2ef6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l157_c7_8066_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_2ef6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_8066_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_2ef6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_9e19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l163_c11_a5ff_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_9e19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l163_c11_a5ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l163_c7_9e19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l163_c11_a5ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l163_c7_9e19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l163_c11_a5ff_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l163_c7_9e19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l163_c11_a5ff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l163_c7_9e19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l163_c11_a5ff_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l163_c7_9e19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l163_c11_a5ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_1166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l168_c11_dae9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_1166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l168_c11_dae9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l168_c7_1166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l168_c11_dae9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l168_c7_1166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l168_c11_dae9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l168_c7_1166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l168_c11_dae9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_c928_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l172_c11_977c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_c928_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l172_c11_977c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l172_c7_c928_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l172_c11_977c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l172_c7_c928_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l172_c11_977c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_6c97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_bc9f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_6c97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_bc9f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l176_c7_6c97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_bc9f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_6c97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_bc9f_return_output;
     VAR_tmp16_uxn_opcodes_h_l154_c3_efa6 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l154_c11_186e_return_output, 16);
     VAR_result_u16_value_uxn_opcodes_h_l170_c3_43b1 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l170_c22_8dff_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l177_c3_9b41_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l173_l177_DUPLICATE_3748_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l174_c3_4bbe_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l173_l177_DUPLICATE_3748_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l157_c7_8066_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l161_c21_af96_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l176_l144_l157_l172_DUPLICATE_1702_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l157_c7_8066_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l176_l144_l157_l172_DUPLICATE_1702_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l172_c7_c928_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l176_l144_l157_l172_DUPLICATE_1702_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l176_c7_6c97_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l176_l144_l157_l172_DUPLICATE_1702_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_8066_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l163_l157_l176_l172_l168_DUPLICATE_39e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_9e19_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l163_l157_l176_l172_l168_DUPLICATE_39e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_1166_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l163_l157_l176_l172_l168_DUPLICATE_39e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_c928_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l163_l157_l176_l172_l168_DUPLICATE_39e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_6c97_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l163_l157_l176_l172_l168_DUPLICATE_39e6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_8066_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l163_l157_l176_l172_l168_DUPLICATE_2239_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_9e19_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l163_l157_l176_l172_l168_DUPLICATE_2239_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_1166_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l163_l157_l176_l172_l168_DUPLICATE_2239_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_c928_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l163_l157_l176_l172_l168_DUPLICATE_2239_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_6c97_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l163_l157_l176_l172_l168_DUPLICATE_2239_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l163_c7_9e19_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l163_l168_DUPLICATE_0192_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l168_c7_1166_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l163_l168_DUPLICATE_0192_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l163_l144_DUPLICATE_9284_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l163_c7_9e19_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l163_l144_DUPLICATE_9284_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l163_l144_DUPLICATE_f2ca_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l163_c7_9e19_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l163_l144_DUPLICATE_f2ca_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l144_c2_97fe_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l144_c2_97fe_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l144_c2_97fe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l157_c7_8066_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l157_c7_8066_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l168_c7_1166_iftrue := VAR_result_u16_value_uxn_opcodes_h_l170_c3_43b1;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue := VAR_tmp16_uxn_opcodes_h_l154_c3_efa6;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l176_c7_6c97] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_6c97_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_6c97_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_6c97_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_6c97_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_6c97_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_6c97_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_6c97_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_6c97_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l144_c2_97fe] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_97fe_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_97fe_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_97fe_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_97fe_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l144_c2_97fe] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_97fe_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_97fe_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_97fe_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_97fe_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l174_c3_4bbe] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l174_c3_4bbe_x <= VAR_CONST_SL_8_uxn_opcodes_h_l174_c3_4bbe_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l174_c3_4bbe_return_output := CONST_SL_8_uxn_opcodes_h_l174_c3_4bbe_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l157_c7_8066] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l157_c7_8066_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l157_c7_8066_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l157_c7_8066_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l157_c7_8066_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l157_c7_8066_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l157_c7_8066_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l157_c7_8066_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l157_c7_8066_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l168_c7_1166] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l168_c7_1166_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l168_c7_1166_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l168_c7_1166_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l168_c7_1166_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l168_c7_1166_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l168_c7_1166_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l168_c7_1166_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l168_c7_1166_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l144_c2_97fe] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_97fe_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_97fe_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_97fe_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_97fe_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l176_c7_6c97] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_6c97_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_6c97_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_6c97_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_6c97_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_6c97_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_6c97_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_6c97_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_6c97_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l163_c7_9e19] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l163_c7_9e19_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l163_c7_9e19_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l163_c7_9e19_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l163_c7_9e19_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l163_c7_9e19_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l163_c7_9e19_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l163_c7_9e19_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l163_c7_9e19_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l165_c21_9acf] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l165_c21_9acf_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l165_c31_d799_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l177_c3_9b41] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l177_c3_9b41_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l177_c3_9b41_left;
     BIN_OP_OR_uxn_opcodes_h_l177_c3_9b41_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l177_c3_9b41_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l177_c3_9b41_return_output := BIN_OP_OR_uxn_opcodes_h_l177_c3_9b41_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l179_c22_96cb_right := VAR_BIN_OP_OR_uxn_opcodes_h_l177_c3_9b41_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_6c97_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l177_c3_9b41_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l163_c7_9e19_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l165_c21_9acf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l172_c7_c928_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l174_c3_4bbe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_c928_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_6c97_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_c928_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_6c97_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l163_c7_9e19_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l168_c7_1166_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l157_c7_8066_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_8066_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l163_c7_9e19_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l157_c7_8066] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_8066_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_8066_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_8066_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_8066_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_8066_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_8066_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_8066_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_8066_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l179_c22_96cb] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l179_c22_96cb_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l179_c22_96cb_left;
     BIN_OP_PLUS_uxn_opcodes_h_l179_c22_96cb_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l179_c22_96cb_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l179_c22_96cb_return_output := BIN_OP_PLUS_uxn_opcodes_h_l179_c22_96cb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l172_c7_c928] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_c928_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_c928_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_c928_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_c928_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_c928_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_c928_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_c928_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_c928_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l163_c7_9e19] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l163_c7_9e19_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l163_c7_9e19_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l163_c7_9e19_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l163_c7_9e19_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l163_c7_9e19_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l163_c7_9e19_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l163_c7_9e19_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l163_c7_9e19_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l144_c2_97fe] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_97fe_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_97fe_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_97fe_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_97fe_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l163_c7_9e19] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l163_c7_9e19_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l163_c7_9e19_cond;
     result_u8_value_MUX_uxn_opcodes_h_l163_c7_9e19_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l163_c7_9e19_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l163_c7_9e19_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l163_c7_9e19_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l163_c7_9e19_return_output := result_u8_value_MUX_uxn_opcodes_h_l163_c7_9e19_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l172_c7_c928] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_c928_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_c928_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_c928_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_c928_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_c928_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_c928_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_c928_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_c928_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l176_c7_6c97] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l176_c7_6c97_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_6c97_cond;
     tmp16_MUX_uxn_opcodes_h_l176_c7_6c97_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_6c97_iftrue;
     tmp16_MUX_uxn_opcodes_h_l176_c7_6c97_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_6c97_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_6c97_return_output := tmp16_MUX_uxn_opcodes_h_l176_c7_6c97_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l179_c22_f8c7_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l179_c22_96cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_1166_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_c928_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_1166_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_c928_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_8066_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l163_c7_9e19_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_8066_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l157_c7_8066_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l163_c7_9e19_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l172_c7_c928_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_6c97_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l179_c22_f8c7] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l179_c22_f8c7_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l179_c22_f8c7_left;
     BIN_OP_PLUS_uxn_opcodes_h_l179_c22_f8c7_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l179_c22_f8c7_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l179_c22_f8c7_return_output := BIN_OP_PLUS_uxn_opcodes_h_l179_c22_f8c7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l144_c2_97fe] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_97fe_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_97fe_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_97fe_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_97fe_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l172_c7_c928] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l172_c7_c928_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l172_c7_c928_cond;
     tmp16_MUX_uxn_opcodes_h_l172_c7_c928_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l172_c7_c928_iftrue;
     tmp16_MUX_uxn_opcodes_h_l172_c7_c928_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l172_c7_c928_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l172_c7_c928_return_output := tmp16_MUX_uxn_opcodes_h_l172_c7_c928_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l157_c7_8066] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l157_c7_8066_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l157_c7_8066_cond;
     result_u8_value_MUX_uxn_opcodes_h_l157_c7_8066_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l157_c7_8066_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l157_c7_8066_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l157_c7_8066_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l157_c7_8066_return_output := result_u8_value_MUX_uxn_opcodes_h_l157_c7_8066_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l168_c7_1166] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_1166_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_1166_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_1166_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_1166_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_1166_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_1166_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_1166_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_1166_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l157_c7_8066] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_8066_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_8066_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_8066_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_8066_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_8066_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_8066_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_8066_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_8066_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l168_c7_1166] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_1166_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_1166_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_1166_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_1166_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_1166_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_1166_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_1166_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_1166_return_output;

     -- Submodule level 4
     VAR_result_u16_value_uxn_opcodes_h_l179_c3_9a8e := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l179_c22_f8c7_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_9e19_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_1166_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_9e19_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_1166_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_8066_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l157_c7_8066_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l168_c7_1166_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l172_c7_c928_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l176_c7_6c97_iftrue := VAR_result_u16_value_uxn_opcodes_h_l179_c3_9a8e;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l144_c2_97fe] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_97fe_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_97fe_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_97fe_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_97fe_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l163_c7_9e19] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_9e19_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_9e19_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_9e19_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_9e19_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_9e19_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_9e19_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_9e19_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_9e19_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l163_c7_9e19] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_9e19_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_9e19_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_9e19_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_9e19_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_9e19_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_9e19_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_9e19_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_9e19_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l176_c7_6c97] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l176_c7_6c97_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l176_c7_6c97_cond;
     result_u16_value_MUX_uxn_opcodes_h_l176_c7_6c97_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l176_c7_6c97_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l176_c7_6c97_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l176_c7_6c97_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l176_c7_6c97_return_output := result_u16_value_MUX_uxn_opcodes_h_l176_c7_6c97_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l144_c2_97fe] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l144_c2_97fe_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_97fe_cond;
     result_u8_value_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_97fe_return_output := result_u8_value_MUX_uxn_opcodes_h_l144_c2_97fe_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l168_c7_1166] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l168_c7_1166_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l168_c7_1166_cond;
     tmp16_MUX_uxn_opcodes_h_l168_c7_1166_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l168_c7_1166_iftrue;
     tmp16_MUX_uxn_opcodes_h_l168_c7_1166_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l168_c7_1166_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l168_c7_1166_return_output := tmp16_MUX_uxn_opcodes_h_l168_c7_1166_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_8066_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_9e19_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_8066_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_9e19_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l172_c7_c928_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l176_c7_6c97_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l163_c7_9e19_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l168_c7_1166_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l172_c7_c928] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l172_c7_c928_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l172_c7_c928_cond;
     result_u16_value_MUX_uxn_opcodes_h_l172_c7_c928_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l172_c7_c928_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l172_c7_c928_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l172_c7_c928_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l172_c7_c928_return_output := result_u16_value_MUX_uxn_opcodes_h_l172_c7_c928_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l157_c7_8066] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_8066_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_8066_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_8066_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_8066_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_8066_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_8066_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_8066_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_8066_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l157_c7_8066] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_8066_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_8066_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_8066_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_8066_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_8066_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_8066_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_8066_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_8066_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l163_c7_9e19] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l163_c7_9e19_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l163_c7_9e19_cond;
     tmp16_MUX_uxn_opcodes_h_l163_c7_9e19_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l163_c7_9e19_iftrue;
     tmp16_MUX_uxn_opcodes_h_l163_c7_9e19_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l163_c7_9e19_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l163_c7_9e19_return_output := tmp16_MUX_uxn_opcodes_h_l163_c7_9e19_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_8066_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_8066_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l168_c7_1166_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l172_c7_c928_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_8066_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l163_c7_9e19_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l144_c2_97fe] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_97fe_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_97fe_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_97fe_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_97fe_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l144_c2_97fe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_97fe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_97fe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_97fe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_97fe_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l168_c7_1166] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l168_c7_1166_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l168_c7_1166_cond;
     result_u16_value_MUX_uxn_opcodes_h_l168_c7_1166_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l168_c7_1166_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l168_c7_1166_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l168_c7_1166_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l168_c7_1166_return_output := result_u16_value_MUX_uxn_opcodes_h_l168_c7_1166_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l157_c7_8066] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l157_c7_8066_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_8066_cond;
     tmp16_MUX_uxn_opcodes_h_l157_c7_8066_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_8066_iftrue;
     tmp16_MUX_uxn_opcodes_h_l157_c7_8066_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_8066_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_8066_return_output := tmp16_MUX_uxn_opcodes_h_l157_c7_8066_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l163_c7_9e19_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l168_c7_1166_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_8066_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l163_c7_9e19] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l163_c7_9e19_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l163_c7_9e19_cond;
     result_u16_value_MUX_uxn_opcodes_h_l163_c7_9e19_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l163_c7_9e19_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l163_c7_9e19_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l163_c7_9e19_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l163_c7_9e19_return_output := result_u16_value_MUX_uxn_opcodes_h_l163_c7_9e19_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l144_c2_97fe] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l144_c2_97fe_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_97fe_cond;
     tmp16_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue;
     tmp16_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_97fe_return_output := tmp16_MUX_uxn_opcodes_h_l144_c2_97fe_return_output;

     -- Submodule level 8
     VAR_result_u16_value_MUX_uxn_opcodes_h_l157_c7_8066_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l163_c7_9e19_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_97fe_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l157_c7_8066] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l157_c7_8066_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l157_c7_8066_cond;
     result_u16_value_MUX_uxn_opcodes_h_l157_c7_8066_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l157_c7_8066_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l157_c7_8066_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l157_c7_8066_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l157_c7_8066_return_output := result_u16_value_MUX_uxn_opcodes_h_l157_c7_8066_return_output;

     -- Submodule level 9
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l157_c7_8066_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l144_c2_97fe] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l144_c2_97fe_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_97fe_cond;
     result_u16_value_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_97fe_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_97fe_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_97fe_return_output := result_u16_value_MUX_uxn_opcodes_h_l144_c2_97fe_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4_uxn_opcodes_h_l183_l140_DUPLICATE_5019 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4_uxn_opcodes_h_l183_l140_DUPLICATE_5019_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_97fe_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_97fe_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_97fe_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_97fe_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_97fe_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_97fe_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_97fe_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_97fe_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_97fe_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_97fe_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4_uxn_opcodes_h_l183_l140_DUPLICATE_5019_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4_uxn_opcodes_h_l183_l140_DUPLICATE_5019_return_output;
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
