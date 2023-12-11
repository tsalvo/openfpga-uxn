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
-- BIN_OP_EQ[uxn_opcodes_h_l144_c6_ec31]
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_ec31_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_ec31_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_ec31_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l144_c2_0b05]
signal tmp16_MUX_uxn_opcodes_h_l144_c2_0b05_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_0b05_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l144_c2_0b05]
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_0b05_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_0b05_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l144_c2_0b05]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_0b05_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_0b05_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l144_c2_0b05]
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_0b05_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_0b05_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l144_c2_0b05]
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_0b05_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_0b05_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l144_c2_0b05]
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_0b05_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_0b05_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l144_c2_0b05]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_0b05_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_0b05_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l144_c2_0b05]
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_0b05_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_0b05_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l144_c2_0b05]
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_0b05_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_0b05_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l144_c2_0b05]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_0b05_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_0b05_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l144_c2_0b05]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_0b05_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_0b05_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l154_c11_6727]
signal BIN_OP_PLUS_uxn_opcodes_h_l154_c11_6727_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l154_c11_6727_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l154_c11_6727_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l157_c11_68f7]
signal BIN_OP_EQ_uxn_opcodes_h_l157_c11_68f7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l157_c11_68f7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l157_c11_68f7_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l157_c7_c409]
signal tmp16_MUX_uxn_opcodes_h_l157_c7_c409_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l157_c7_c409_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l157_c7_c409_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l157_c7_c409_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l157_c7_c409]
signal result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_c409_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_c409_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_c409_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_c409_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l157_c7_c409]
signal result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_c409_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_c409_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_c409_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_c409_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l157_c7_c409]
signal result_u16_value_MUX_uxn_opcodes_h_l157_c7_c409_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l157_c7_c409_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l157_c7_c409_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l157_c7_c409_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l157_c7_c409]
signal result_u8_value_MUX_uxn_opcodes_h_l157_c7_c409_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l157_c7_c409_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l157_c7_c409_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l157_c7_c409_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l157_c7_c409]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l157_c7_c409_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l157_c7_c409_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l157_c7_c409_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l157_c7_c409_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l157_c7_c409]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_c409_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_c409_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_c409_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_c409_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l157_c7_c409]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_c409_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_c409_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_c409_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_c409_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l163_c11_71d7]
signal BIN_OP_EQ_uxn_opcodes_h_l163_c11_71d7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l163_c11_71d7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l163_c11_71d7_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l163_c7_429f]
signal tmp16_MUX_uxn_opcodes_h_l163_c7_429f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l163_c7_429f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l163_c7_429f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l163_c7_429f_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l163_c7_429f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_429f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_429f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_429f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_429f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l163_c7_429f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l163_c7_429f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l163_c7_429f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l163_c7_429f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l163_c7_429f_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l163_c7_429f]
signal result_u16_value_MUX_uxn_opcodes_h_l163_c7_429f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l163_c7_429f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l163_c7_429f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l163_c7_429f_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l163_c7_429f]
signal result_u8_value_MUX_uxn_opcodes_h_l163_c7_429f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l163_c7_429f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l163_c7_429f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l163_c7_429f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l163_c7_429f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l163_c7_429f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l163_c7_429f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l163_c7_429f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l163_c7_429f_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l163_c7_429f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_429f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_429f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_429f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_429f_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l165_c31_f12a]
signal CONST_SR_8_uxn_opcodes_h_l165_c31_f12a_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l165_c31_f12a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l168_c11_2423]
signal BIN_OP_EQ_uxn_opcodes_h_l168_c11_2423_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l168_c11_2423_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l168_c11_2423_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l168_c7_1838]
signal tmp16_MUX_uxn_opcodes_h_l168_c7_1838_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l168_c7_1838_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l168_c7_1838_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l168_c7_1838_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l168_c7_1838]
signal result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_1838_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_1838_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_1838_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_1838_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l168_c7_1838]
signal result_is_stack_write_MUX_uxn_opcodes_h_l168_c7_1838_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l168_c7_1838_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l168_c7_1838_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l168_c7_1838_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l168_c7_1838]
signal result_u16_value_MUX_uxn_opcodes_h_l168_c7_1838_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l168_c7_1838_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l168_c7_1838_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l168_c7_1838_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l168_c7_1838]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_1838_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_1838_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_1838_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_1838_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l170_c22_fd99]
signal BIN_OP_PLUS_uxn_opcodes_h_l170_c22_fd99_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l170_c22_fd99_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l170_c22_fd99_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l172_c11_5c57]
signal BIN_OP_EQ_uxn_opcodes_h_l172_c11_5c57_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l172_c11_5c57_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l172_c11_5c57_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l172_c7_e861]
signal tmp16_MUX_uxn_opcodes_h_l172_c7_e861_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l172_c7_e861_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l172_c7_e861_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l172_c7_e861_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l172_c7_e861]
signal result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_e861_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_e861_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_e861_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_e861_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l172_c7_e861]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_e861_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_e861_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_e861_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_e861_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l172_c7_e861]
signal result_u16_value_MUX_uxn_opcodes_h_l172_c7_e861_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l172_c7_e861_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l172_c7_e861_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l172_c7_e861_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l174_c3_287a]
signal CONST_SL_8_uxn_opcodes_h_l174_c3_287a_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l174_c3_287a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l176_c11_314c]
signal BIN_OP_EQ_uxn_opcodes_h_l176_c11_314c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l176_c11_314c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l176_c11_314c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l176_c7_fafb]
signal tmp16_MUX_uxn_opcodes_h_l176_c7_fafb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l176_c7_fafb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l176_c7_fafb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l176_c7_fafb_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l176_c7_fafb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_fafb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_fafb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_fafb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_fafb_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l176_c7_fafb]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_fafb_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_fafb_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_fafb_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_fafb_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l176_c7_fafb]
signal result_u16_value_MUX_uxn_opcodes_h_l176_c7_fafb_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l176_c7_fafb_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l176_c7_fafb_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l176_c7_fafb_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l177_c3_4339]
signal BIN_OP_OR_uxn_opcodes_h_l177_c3_4339_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l177_c3_4339_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l177_c3_4339_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l179_c22_0af1]
signal BIN_OP_PLUS_uxn_opcodes_h_l179_c22_0af1_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l179_c22_0af1_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l179_c22_0af1_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l179_c22_8177]
signal BIN_OP_PLUS_uxn_opcodes_h_l179_c22_8177_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l179_c22_8177_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l179_c22_8177_return_output : unsigned(17 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_1a75( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_ram_write := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.u8_value := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;
      base.is_pc_updated := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l144_c6_ec31
BIN_OP_EQ_uxn_opcodes_h_l144_c6_ec31 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l144_c6_ec31_left,
BIN_OP_EQ_uxn_opcodes_h_l144_c6_ec31_right,
BIN_OP_EQ_uxn_opcodes_h_l144_c6_ec31_return_output);

-- tmp16_MUX_uxn_opcodes_h_l144_c2_0b05
tmp16_MUX_uxn_opcodes_h_l144_c2_0b05 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l144_c2_0b05_cond,
tmp16_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue,
tmp16_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse,
tmp16_MUX_uxn_opcodes_h_l144_c2_0b05_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_0b05
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_0b05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_0b05_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_0b05_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_0b05
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_0b05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_0b05_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_0b05_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l144_c2_0b05
result_u16_value_MUX_uxn_opcodes_h_l144_c2_0b05 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l144_c2_0b05_cond,
result_u16_value_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l144_c2_0b05_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_0b05
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_0b05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_0b05_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_0b05_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_0b05
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_0b05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_0b05_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_0b05_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_0b05
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_0b05 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_0b05_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_0b05_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_0b05
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_0b05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_0b05_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_0b05_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l144_c2_0b05
result_u8_value_MUX_uxn_opcodes_h_l144_c2_0b05 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l144_c2_0b05_cond,
result_u8_value_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l144_c2_0b05_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_0b05
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_0b05 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_0b05_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_0b05_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_0b05
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_0b05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_0b05_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_0b05_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l154_c11_6727
BIN_OP_PLUS_uxn_opcodes_h_l154_c11_6727 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l154_c11_6727_left,
BIN_OP_PLUS_uxn_opcodes_h_l154_c11_6727_right,
BIN_OP_PLUS_uxn_opcodes_h_l154_c11_6727_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l157_c11_68f7
BIN_OP_EQ_uxn_opcodes_h_l157_c11_68f7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l157_c11_68f7_left,
BIN_OP_EQ_uxn_opcodes_h_l157_c11_68f7_right,
BIN_OP_EQ_uxn_opcodes_h_l157_c11_68f7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l157_c7_c409
tmp16_MUX_uxn_opcodes_h_l157_c7_c409 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l157_c7_c409_cond,
tmp16_MUX_uxn_opcodes_h_l157_c7_c409_iftrue,
tmp16_MUX_uxn_opcodes_h_l157_c7_c409_iffalse,
tmp16_MUX_uxn_opcodes_h_l157_c7_c409_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_c409
result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_c409 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_c409_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_c409_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_c409_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_c409_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_c409
result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_c409 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_c409_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_c409_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_c409_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_c409_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l157_c7_c409
result_u16_value_MUX_uxn_opcodes_h_l157_c7_c409 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l157_c7_c409_cond,
result_u16_value_MUX_uxn_opcodes_h_l157_c7_c409_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l157_c7_c409_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l157_c7_c409_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l157_c7_c409
result_u8_value_MUX_uxn_opcodes_h_l157_c7_c409 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l157_c7_c409_cond,
result_u8_value_MUX_uxn_opcodes_h_l157_c7_c409_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l157_c7_c409_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l157_c7_c409_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l157_c7_c409
result_sp_relative_shift_MUX_uxn_opcodes_h_l157_c7_c409 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l157_c7_c409_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l157_c7_c409_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l157_c7_c409_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l157_c7_c409_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_c409
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_c409 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_c409_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_c409_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_c409_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_c409_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_c409
result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_c409 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_c409_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_c409_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_c409_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_c409_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l163_c11_71d7
BIN_OP_EQ_uxn_opcodes_h_l163_c11_71d7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l163_c11_71d7_left,
BIN_OP_EQ_uxn_opcodes_h_l163_c11_71d7_right,
BIN_OP_EQ_uxn_opcodes_h_l163_c11_71d7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l163_c7_429f
tmp16_MUX_uxn_opcodes_h_l163_c7_429f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l163_c7_429f_cond,
tmp16_MUX_uxn_opcodes_h_l163_c7_429f_iftrue,
tmp16_MUX_uxn_opcodes_h_l163_c7_429f_iffalse,
tmp16_MUX_uxn_opcodes_h_l163_c7_429f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_429f
result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_429f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_429f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_429f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_429f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_429f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l163_c7_429f
result_is_stack_write_MUX_uxn_opcodes_h_l163_c7_429f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l163_c7_429f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l163_c7_429f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l163_c7_429f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l163_c7_429f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l163_c7_429f
result_u16_value_MUX_uxn_opcodes_h_l163_c7_429f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l163_c7_429f_cond,
result_u16_value_MUX_uxn_opcodes_h_l163_c7_429f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l163_c7_429f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l163_c7_429f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l163_c7_429f
result_u8_value_MUX_uxn_opcodes_h_l163_c7_429f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l163_c7_429f_cond,
result_u8_value_MUX_uxn_opcodes_h_l163_c7_429f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l163_c7_429f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l163_c7_429f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l163_c7_429f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l163_c7_429f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l163_c7_429f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l163_c7_429f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l163_c7_429f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l163_c7_429f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_429f
result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_429f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_429f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_429f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_429f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_429f_return_output);

-- CONST_SR_8_uxn_opcodes_h_l165_c31_f12a
CONST_SR_8_uxn_opcodes_h_l165_c31_f12a : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l165_c31_f12a_x,
CONST_SR_8_uxn_opcodes_h_l165_c31_f12a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l168_c11_2423
BIN_OP_EQ_uxn_opcodes_h_l168_c11_2423 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l168_c11_2423_left,
BIN_OP_EQ_uxn_opcodes_h_l168_c11_2423_right,
BIN_OP_EQ_uxn_opcodes_h_l168_c11_2423_return_output);

-- tmp16_MUX_uxn_opcodes_h_l168_c7_1838
tmp16_MUX_uxn_opcodes_h_l168_c7_1838 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l168_c7_1838_cond,
tmp16_MUX_uxn_opcodes_h_l168_c7_1838_iftrue,
tmp16_MUX_uxn_opcodes_h_l168_c7_1838_iffalse,
tmp16_MUX_uxn_opcodes_h_l168_c7_1838_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_1838
result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_1838 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_1838_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_1838_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_1838_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_1838_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l168_c7_1838
result_is_stack_write_MUX_uxn_opcodes_h_l168_c7_1838 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l168_c7_1838_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l168_c7_1838_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l168_c7_1838_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l168_c7_1838_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l168_c7_1838
result_u16_value_MUX_uxn_opcodes_h_l168_c7_1838 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l168_c7_1838_cond,
result_u16_value_MUX_uxn_opcodes_h_l168_c7_1838_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l168_c7_1838_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l168_c7_1838_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_1838
result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_1838 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_1838_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_1838_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_1838_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_1838_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l170_c22_fd99
BIN_OP_PLUS_uxn_opcodes_h_l170_c22_fd99 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l170_c22_fd99_left,
BIN_OP_PLUS_uxn_opcodes_h_l170_c22_fd99_right,
BIN_OP_PLUS_uxn_opcodes_h_l170_c22_fd99_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l172_c11_5c57
BIN_OP_EQ_uxn_opcodes_h_l172_c11_5c57 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l172_c11_5c57_left,
BIN_OP_EQ_uxn_opcodes_h_l172_c11_5c57_right,
BIN_OP_EQ_uxn_opcodes_h_l172_c11_5c57_return_output);

-- tmp16_MUX_uxn_opcodes_h_l172_c7_e861
tmp16_MUX_uxn_opcodes_h_l172_c7_e861 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l172_c7_e861_cond,
tmp16_MUX_uxn_opcodes_h_l172_c7_e861_iftrue,
tmp16_MUX_uxn_opcodes_h_l172_c7_e861_iffalse,
tmp16_MUX_uxn_opcodes_h_l172_c7_e861_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_e861
result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_e861 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_e861_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_e861_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_e861_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_e861_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_e861
result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_e861 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_e861_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_e861_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_e861_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_e861_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l172_c7_e861
result_u16_value_MUX_uxn_opcodes_h_l172_c7_e861 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l172_c7_e861_cond,
result_u16_value_MUX_uxn_opcodes_h_l172_c7_e861_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l172_c7_e861_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l172_c7_e861_return_output);

-- CONST_SL_8_uxn_opcodes_h_l174_c3_287a
CONST_SL_8_uxn_opcodes_h_l174_c3_287a : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l174_c3_287a_x,
CONST_SL_8_uxn_opcodes_h_l174_c3_287a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l176_c11_314c
BIN_OP_EQ_uxn_opcodes_h_l176_c11_314c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l176_c11_314c_left,
BIN_OP_EQ_uxn_opcodes_h_l176_c11_314c_right,
BIN_OP_EQ_uxn_opcodes_h_l176_c11_314c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l176_c7_fafb
tmp16_MUX_uxn_opcodes_h_l176_c7_fafb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l176_c7_fafb_cond,
tmp16_MUX_uxn_opcodes_h_l176_c7_fafb_iftrue,
tmp16_MUX_uxn_opcodes_h_l176_c7_fafb_iffalse,
tmp16_MUX_uxn_opcodes_h_l176_c7_fafb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_fafb
result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_fafb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_fafb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_fafb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_fafb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_fafb_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_fafb
result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_fafb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_fafb_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_fafb_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_fafb_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_fafb_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l176_c7_fafb
result_u16_value_MUX_uxn_opcodes_h_l176_c7_fafb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l176_c7_fafb_cond,
result_u16_value_MUX_uxn_opcodes_h_l176_c7_fafb_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l176_c7_fafb_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l176_c7_fafb_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l177_c3_4339
BIN_OP_OR_uxn_opcodes_h_l177_c3_4339 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l177_c3_4339_left,
BIN_OP_OR_uxn_opcodes_h_l177_c3_4339_right,
BIN_OP_OR_uxn_opcodes_h_l177_c3_4339_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l179_c22_0af1
BIN_OP_PLUS_uxn_opcodes_h_l179_c22_0af1 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l179_c22_0af1_left,
BIN_OP_PLUS_uxn_opcodes_h_l179_c22_0af1_right,
BIN_OP_PLUS_uxn_opcodes_h_l179_c22_0af1_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l179_c22_8177
BIN_OP_PLUS_uxn_opcodes_h_l179_c22_8177 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l179_c22_8177_left,
BIN_OP_PLUS_uxn_opcodes_h_l179_c22_8177_right,
BIN_OP_PLUS_uxn_opcodes_h_l179_c22_8177_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l144_c6_ec31_return_output,
 tmp16_MUX_uxn_opcodes_h_l144_c2_0b05_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_0b05_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_0b05_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l144_c2_0b05_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_0b05_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_0b05_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_0b05_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_0b05_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l144_c2_0b05_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_0b05_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_0b05_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l154_c11_6727_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l157_c11_68f7_return_output,
 tmp16_MUX_uxn_opcodes_h_l157_c7_c409_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_c409_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_c409_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l157_c7_c409_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l157_c7_c409_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l157_c7_c409_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_c409_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_c409_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l163_c11_71d7_return_output,
 tmp16_MUX_uxn_opcodes_h_l163_c7_429f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_429f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l163_c7_429f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l163_c7_429f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l163_c7_429f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l163_c7_429f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_429f_return_output,
 CONST_SR_8_uxn_opcodes_h_l165_c31_f12a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l168_c11_2423_return_output,
 tmp16_MUX_uxn_opcodes_h_l168_c7_1838_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_1838_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l168_c7_1838_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l168_c7_1838_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_1838_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l170_c22_fd99_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l172_c11_5c57_return_output,
 tmp16_MUX_uxn_opcodes_h_l172_c7_e861_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_e861_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_e861_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l172_c7_e861_return_output,
 CONST_SL_8_uxn_opcodes_h_l174_c3_287a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l176_c11_314c_return_output,
 tmp16_MUX_uxn_opcodes_h_l176_c7_fafb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_fafb_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_fafb_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l176_c7_fafb_return_output,
 BIN_OP_OR_uxn_opcodes_h_l177_c3_4339_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l179_c22_0af1_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l179_c22_8177_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_ec31_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_ec31_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_ec31_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l154_c3_9478 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_c409_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_0b05_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_0b05_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_c409_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_0b05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_0b05_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l144_c2_0b05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_0b05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_0b05_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l157_c7_c409_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_0b05_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_0b05_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l144_c2_0b05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_0b05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_0b05_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_c409_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_0b05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_0b05_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l153_c3_0e4e : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l157_c7_c409_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_0b05_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_0b05_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l144_c2_0b05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_0b05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_0b05_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l157_c7_c409_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_0b05_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_0b05_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_c409_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_0b05_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_0b05_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_c409_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_0b05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_0b05_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l154_c11_6727_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l154_c11_6727_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l154_c11_6727_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_68f7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_68f7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_68f7_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_c409_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_c409_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l163_c7_429f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_c409_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_c409_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_c409_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_429f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_c409_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_c409_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_c409_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l163_c7_429f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_c409_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l157_c7_c409_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l157_c7_c409_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l163_c7_429f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l157_c7_c409_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l157_c7_c409_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l157_c7_c409_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l163_c7_429f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l157_c7_c409_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l157_c7_c409_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l158_c3_b2bb : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l157_c7_c409_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l157_c7_c409_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l157_c7_c409_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_c409_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l160_c3_43fb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_c409_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l163_c7_429f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_c409_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_c409_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_c409_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_429f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_c409_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l161_c21_09de_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l163_c11_71d7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l163_c11_71d7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l163_c11_71d7_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l163_c7_429f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l163_c7_429f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l168_c7_1838_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l163_c7_429f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_429f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_429f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_1838_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_429f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l163_c7_429f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l163_c7_429f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l168_c7_1838_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l163_c7_429f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l163_c7_429f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l163_c7_429f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l168_c7_1838_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l163_c7_429f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l163_c7_429f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l163_c7_429f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l163_c7_429f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l163_c7_429f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l164_c3_30b0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l163_c7_429f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l163_c7_429f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_429f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_429f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_1838_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_429f_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l165_c31_f12a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l165_c31_f12a_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l165_c21_1295_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l168_c11_2423_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l168_c11_2423_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l168_c11_2423_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l168_c7_1838_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l168_c7_1838_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l172_c7_e861_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l168_c7_1838_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_1838_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_1838_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_e861_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_1838_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l168_c7_1838_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l168_c7_1838_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l168_c7_1838_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l168_c7_1838_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l170_c3_7e1c : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l168_c7_1838_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l172_c7_e861_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l168_c7_1838_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_1838_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_1838_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_e861_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_1838_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l170_c22_fd99_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l170_c22_fd99_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l170_c22_fd99_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l172_c11_5c57_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l172_c11_5c57_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l172_c11_5c57_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l172_c7_e861_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l172_c7_e861_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_fafb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l172_c7_e861_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_e861_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_e861_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_fafb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_e861_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_e861_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_e861_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_fafb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_e861_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l172_c7_e861_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l172_c7_e861_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l176_c7_fafb_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l172_c7_e861_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l174_c3_287a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l174_c3_287a_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_314c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_314c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_314c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_fafb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_fafb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_fafb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_fafb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_fafb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_fafb_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_fafb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_fafb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_fafb_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l176_c7_fafb_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l179_c3_de05 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l176_c7_fafb_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l176_c7_fafb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l177_c3_4339_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l177_c3_4339_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l177_c3_4339_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l179_c22_0af1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l179_c22_0af1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l179_c22_0af1_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l179_c22_8177_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l179_c22_8177_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l179_c22_8177_return_output : unsigned(17 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l144_l157_l172_l176_DUPLICATE_531e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l144_l163_DUPLICATE_f03e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l144_l163_DUPLICATE_aff4_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l157_l176_l172_l168_l163_DUPLICATE_004f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l157_l176_l172_l168_l163_DUPLICATE_1337_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l168_l163_DUPLICATE_e096_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l173_l177_DUPLICATE_a80c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1a75_uxn_opcodes_h_l183_l140_DUPLICATE_0386_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_68f7_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l172_c11_5c57_right := to_unsigned(4, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_fafb_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l179_c22_8177_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l163_c11_71d7_right := to_unsigned(2, 2);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l158_c3_b2bb := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l157_c7_c409_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l158_c3_b2bb;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l160_c3_43fb := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_c409_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l160_c3_43fb;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_fafb_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l168_c11_2423_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l164_c3_30b0 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l163_c7_429f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l164_c3_30b0;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_314c_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_c409_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l153_c3_0e4e := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l153_c3_0e4e;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l154_c11_6727_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_ec31_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l170_c22_fd99_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l168_c7_1838_iftrue := to_unsigned(0, 1);

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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l154_c11_6727_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l170_c22_fd99_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l179_c22_0af1_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l163_c7_429f_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_ec31_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_68f7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l163_c11_71d7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l168_c11_2423_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l172_c11_5c57_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_314c_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l177_c3_4339_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l165_c31_f12a_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_c409_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l163_c7_429f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l168_c7_1838_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_fafb_iffalse := tmp16;
     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l144_c2_0b05] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l144_c2_0b05_return_output := result.is_ram_write;

     -- BIN_OP_PLUS[uxn_opcodes_h_l170_c22_fd99] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l170_c22_fd99_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l170_c22_fd99_left;
     BIN_OP_PLUS_uxn_opcodes_h_l170_c22_fd99_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l170_c22_fd99_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l170_c22_fd99_return_output := BIN_OP_PLUS_uxn_opcodes_h_l170_c22_fd99_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l176_c11_314c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l176_c11_314c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_314c_left;
     BIN_OP_EQ_uxn_opcodes_h_l176_c11_314c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_314c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_314c_return_output := BIN_OP_EQ_uxn_opcodes_h_l176_c11_314c_return_output;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l157_c7_c409] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l157_c7_c409_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l144_l163_DUPLICATE_aff4 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l144_l163_DUPLICATE_aff4_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l144_l163_DUPLICATE_f03e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l144_l163_DUPLICATE_f03e_return_output := result.u8_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l173_l177_DUPLICATE_a80c LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l173_l177_DUPLICATE_a80c_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l168_c11_2423] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l168_c11_2423_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l168_c11_2423_left;
     BIN_OP_EQ_uxn_opcodes_h_l168_c11_2423_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l168_c11_2423_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l168_c11_2423_return_output := BIN_OP_EQ_uxn_opcodes_h_l168_c11_2423_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l144_c6_ec31] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l144_c6_ec31_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_ec31_left;
     BIN_OP_EQ_uxn_opcodes_h_l144_c6_ec31_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_ec31_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_ec31_return_output := BIN_OP_EQ_uxn_opcodes_h_l144_c6_ec31_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l154_c11_6727] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l154_c11_6727_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l154_c11_6727_left;
     BIN_OP_PLUS_uxn_opcodes_h_l154_c11_6727_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l154_c11_6727_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l154_c11_6727_return_output := BIN_OP_PLUS_uxn_opcodes_h_l154_c11_6727_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l144_l157_l172_l176_DUPLICATE_531e LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l144_l157_l172_l176_DUPLICATE_531e_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l168_l163_DUPLICATE_e096 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l168_l163_DUPLICATE_e096_return_output := result.is_stack_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l144_c2_0b05] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l144_c2_0b05_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l163_c11_71d7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l163_c11_71d7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l163_c11_71d7_left;
     BIN_OP_EQ_uxn_opcodes_h_l163_c11_71d7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l163_c11_71d7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l163_c11_71d7_return_output := BIN_OP_EQ_uxn_opcodes_h_l163_c11_71d7_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l165_c31_f12a] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l165_c31_f12a_x <= VAR_CONST_SR_8_uxn_opcodes_h_l165_c31_f12a_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l165_c31_f12a_return_output := CONST_SR_8_uxn_opcodes_h_l165_c31_f12a_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l144_c2_0b05] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l144_c2_0b05_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l172_c11_5c57] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l172_c11_5c57_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l172_c11_5c57_left;
     BIN_OP_EQ_uxn_opcodes_h_l172_c11_5c57_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l172_c11_5c57_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l172_c11_5c57_return_output := BIN_OP_EQ_uxn_opcodes_h_l172_c11_5c57_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l157_l176_l172_l168_l163_DUPLICATE_1337 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l157_l176_l172_l168_l163_DUPLICATE_1337_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l157_c11_68f7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l157_c11_68f7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_68f7_left;
     BIN_OP_EQ_uxn_opcodes_h_l157_c11_68f7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_68f7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_68f7_return_output := BIN_OP_EQ_uxn_opcodes_h_l157_c11_68f7_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l157_l176_l172_l168_l163_DUPLICATE_004f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l157_l176_l172_l168_l163_DUPLICATE_004f_return_output := result.is_opc_done;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l161_c21_09de] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l161_c21_09de_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_0b05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_ec31_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_0b05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_ec31_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_0b05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_ec31_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_0b05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_ec31_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_0b05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_ec31_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_0b05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_ec31_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_0b05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_ec31_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_0b05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_ec31_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_0b05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_ec31_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_0b05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_ec31_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_0b05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_ec31_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_c409_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_68f7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_c409_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_68f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_c409_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_68f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l157_c7_c409_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_68f7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_c409_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_68f7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l157_c7_c409_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_68f7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l157_c7_c409_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_68f7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_c409_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l157_c11_68f7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_429f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l163_c11_71d7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_429f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l163_c11_71d7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l163_c7_429f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l163_c11_71d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l163_c7_429f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l163_c11_71d7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l163_c7_429f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l163_c11_71d7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l163_c7_429f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l163_c11_71d7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l163_c7_429f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l163_c11_71d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_1838_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l168_c11_2423_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_1838_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l168_c11_2423_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l168_c7_1838_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l168_c11_2423_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l168_c7_1838_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l168_c11_2423_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l168_c7_1838_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l168_c11_2423_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_e861_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l172_c11_5c57_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_e861_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l172_c11_5c57_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l172_c7_e861_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l172_c11_5c57_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l172_c7_e861_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l172_c11_5c57_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_fafb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_314c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_fafb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_314c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l176_c7_fafb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_314c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_fafb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_314c_return_output;
     VAR_tmp16_uxn_opcodes_h_l154_c3_9478 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l154_c11_6727_return_output, 16);
     VAR_result_u16_value_uxn_opcodes_h_l170_c3_7e1c := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l170_c22_fd99_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l177_c3_4339_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l173_l177_DUPLICATE_a80c_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l174_c3_287a_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l173_l177_DUPLICATE_a80c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l157_c7_c409_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l161_c21_09de_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l144_l157_l172_l176_DUPLICATE_531e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l157_c7_c409_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l144_l157_l172_l176_DUPLICATE_531e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l172_c7_e861_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l144_l157_l172_l176_DUPLICATE_531e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l176_c7_fafb_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l144_l157_l172_l176_DUPLICATE_531e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_c409_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l157_l176_l172_l168_l163_DUPLICATE_004f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_429f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l157_l176_l172_l168_l163_DUPLICATE_004f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_1838_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l157_l176_l172_l168_l163_DUPLICATE_004f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_e861_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l157_l176_l172_l168_l163_DUPLICATE_004f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_fafb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l157_l176_l172_l168_l163_DUPLICATE_004f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_c409_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l157_l176_l172_l168_l163_DUPLICATE_1337_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_429f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l157_l176_l172_l168_l163_DUPLICATE_1337_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_1838_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l157_l176_l172_l168_l163_DUPLICATE_1337_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_e861_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l157_l176_l172_l168_l163_DUPLICATE_1337_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_fafb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l157_l176_l172_l168_l163_DUPLICATE_1337_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l163_c7_429f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l168_l163_DUPLICATE_e096_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l168_c7_1838_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l168_l163_DUPLICATE_e096_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l144_l163_DUPLICATE_aff4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l163_c7_429f_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l144_l163_DUPLICATE_aff4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l144_l163_DUPLICATE_f03e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l163_c7_429f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l144_l163_DUPLICATE_f03e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l144_c2_0b05_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l144_c2_0b05_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l144_c2_0b05_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l157_c7_c409_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l157_c7_c409_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l168_c7_1838_iftrue := VAR_result_u16_value_uxn_opcodes_h_l170_c3_7e1c;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue := VAR_tmp16_uxn_opcodes_h_l154_c3_9478;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l157_c7_c409] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l157_c7_c409_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l157_c7_c409_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l157_c7_c409_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l157_c7_c409_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l157_c7_c409_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l157_c7_c409_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l157_c7_c409_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l157_c7_c409_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l168_c7_1838] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l168_c7_1838_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l168_c7_1838_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l168_c7_1838_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l168_c7_1838_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l168_c7_1838_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l168_c7_1838_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l168_c7_1838_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l168_c7_1838_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l144_c2_0b05] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_0b05_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_0b05_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_0b05_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_0b05_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l163_c7_429f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l163_c7_429f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l163_c7_429f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l163_c7_429f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l163_c7_429f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l163_c7_429f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l163_c7_429f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l163_c7_429f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l163_c7_429f_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l144_c2_0b05] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_0b05_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_0b05_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_0b05_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_0b05_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l165_c21_1295] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l165_c21_1295_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l165_c31_f12a_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l177_c3_4339] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l177_c3_4339_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l177_c3_4339_left;
     BIN_OP_OR_uxn_opcodes_h_l177_c3_4339_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l177_c3_4339_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l177_c3_4339_return_output := BIN_OP_OR_uxn_opcodes_h_l177_c3_4339_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l174_c3_287a] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l174_c3_287a_x <= VAR_CONST_SL_8_uxn_opcodes_h_l174_c3_287a_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l174_c3_287a_return_output := CONST_SL_8_uxn_opcodes_h_l174_c3_287a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l176_c7_fafb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_fafb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_fafb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_fafb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_fafb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_fafb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_fafb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_fafb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_fafb_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l144_c2_0b05] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_0b05_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_0b05_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_0b05_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_0b05_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l176_c7_fafb] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_fafb_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_fafb_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_fafb_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_fafb_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_fafb_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_fafb_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_fafb_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_fafb_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l179_c22_0af1_right := VAR_BIN_OP_OR_uxn_opcodes_h_l177_c3_4339_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_fafb_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l177_c3_4339_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l163_c7_429f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l165_c21_1295_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l172_c7_e861_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l174_c3_287a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_e861_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_fafb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_e861_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_fafb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l163_c7_429f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l168_c7_1838_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l157_c7_c409_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_c409_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l163_c7_429f_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l176_c7_fafb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l176_c7_fafb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_fafb_cond;
     tmp16_MUX_uxn_opcodes_h_l176_c7_fafb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_fafb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l176_c7_fafb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_fafb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_fafb_return_output := tmp16_MUX_uxn_opcodes_h_l176_c7_fafb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l172_c7_e861] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_e861_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_e861_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_e861_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_e861_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_e861_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_e861_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_e861_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_e861_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l144_c2_0b05] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_0b05_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_0b05_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_0b05_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_0b05_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l163_c7_429f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l163_c7_429f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l163_c7_429f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l163_c7_429f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l163_c7_429f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l163_c7_429f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l163_c7_429f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l163_c7_429f_return_output := result_u8_value_MUX_uxn_opcodes_h_l163_c7_429f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l172_c7_e861] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_e861_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_e861_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_e861_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_e861_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_e861_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_e861_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_e861_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_e861_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l163_c7_429f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l163_c7_429f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l163_c7_429f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l163_c7_429f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l163_c7_429f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l163_c7_429f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l163_c7_429f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l163_c7_429f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l163_c7_429f_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l179_c22_0af1] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l179_c22_0af1_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l179_c22_0af1_left;
     BIN_OP_PLUS_uxn_opcodes_h_l179_c22_0af1_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l179_c22_0af1_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l179_c22_0af1_return_output := BIN_OP_PLUS_uxn_opcodes_h_l179_c22_0af1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l157_c7_c409] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_c409_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_c409_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_c409_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_c409_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_c409_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_c409_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_c409_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_c409_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l179_c22_8177_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l179_c22_0af1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_1838_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_e861_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_1838_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_e861_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_c409_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l163_c7_429f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l157_c7_c409_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l157_c7_c409_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l163_c7_429f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l172_c7_e861_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_fafb_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l179_c22_8177] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l179_c22_8177_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l179_c22_8177_left;
     BIN_OP_PLUS_uxn_opcodes_h_l179_c22_8177_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l179_c22_8177_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l179_c22_8177_return_output := BIN_OP_PLUS_uxn_opcodes_h_l179_c22_8177_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l168_c7_1838] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_1838_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_1838_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_1838_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_1838_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_1838_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_1838_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_1838_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_1838_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l168_c7_1838] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_1838_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_1838_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_1838_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_1838_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_1838_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_1838_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_1838_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_1838_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l172_c7_e861] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l172_c7_e861_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l172_c7_e861_cond;
     tmp16_MUX_uxn_opcodes_h_l172_c7_e861_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l172_c7_e861_iftrue;
     tmp16_MUX_uxn_opcodes_h_l172_c7_e861_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l172_c7_e861_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l172_c7_e861_return_output := tmp16_MUX_uxn_opcodes_h_l172_c7_e861_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l157_c7_c409] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l157_c7_c409_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l157_c7_c409_cond;
     result_u8_value_MUX_uxn_opcodes_h_l157_c7_c409_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l157_c7_c409_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l157_c7_c409_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l157_c7_c409_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l157_c7_c409_return_output := result_u8_value_MUX_uxn_opcodes_h_l157_c7_c409_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l144_c2_0b05] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_0b05_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_0b05_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_0b05_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_0b05_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l157_c7_c409] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_c409_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_c409_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_c409_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_c409_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_c409_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_c409_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_c409_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_c409_return_output;

     -- Submodule level 4
     VAR_result_u16_value_uxn_opcodes_h_l179_c3_de05 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l179_c22_8177_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_429f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l168_c7_1838_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_429f_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l168_c7_1838_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l157_c7_c409_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l157_c7_c409_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l168_c7_1838_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l172_c7_e861_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l176_c7_fafb_iftrue := VAR_result_u16_value_uxn_opcodes_h_l179_c3_de05;
     -- result_u16_value_MUX[uxn_opcodes_h_l176_c7_fafb] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l176_c7_fafb_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l176_c7_fafb_cond;
     result_u16_value_MUX_uxn_opcodes_h_l176_c7_fafb_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l176_c7_fafb_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l176_c7_fafb_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l176_c7_fafb_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l176_c7_fafb_return_output := result_u16_value_MUX_uxn_opcodes_h_l176_c7_fafb_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l168_c7_1838] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l168_c7_1838_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l168_c7_1838_cond;
     tmp16_MUX_uxn_opcodes_h_l168_c7_1838_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l168_c7_1838_iftrue;
     tmp16_MUX_uxn_opcodes_h_l168_c7_1838_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l168_c7_1838_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l168_c7_1838_return_output := tmp16_MUX_uxn_opcodes_h_l168_c7_1838_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l163_c7_429f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_429f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_429f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_429f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_429f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_429f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_429f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_429f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_429f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l163_c7_429f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_429f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_429f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_429f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_429f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_429f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_429f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_429f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_429f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l144_c2_0b05] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_0b05_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_0b05_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_0b05_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_0b05_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l144_c2_0b05] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l144_c2_0b05_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_0b05_cond;
     result_u8_value_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_0b05_return_output := result_u8_value_MUX_uxn_opcodes_h_l144_c2_0b05_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_c409_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l163_c7_429f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_c409_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l163_c7_429f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l172_c7_e861_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l176_c7_fafb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l163_c7_429f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l168_c7_1838_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l157_c7_c409] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_c409_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_c409_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_c409_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_c409_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_c409_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_c409_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_c409_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_c409_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l163_c7_429f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l163_c7_429f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l163_c7_429f_cond;
     tmp16_MUX_uxn_opcodes_h_l163_c7_429f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l163_c7_429f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l163_c7_429f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l163_c7_429f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l163_c7_429f_return_output := tmp16_MUX_uxn_opcodes_h_l163_c7_429f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l157_c7_c409] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_c409_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_c409_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_c409_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_c409_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_c409_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_c409_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_c409_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_c409_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l172_c7_e861] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l172_c7_e861_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l172_c7_e861_cond;
     result_u16_value_MUX_uxn_opcodes_h_l172_c7_e861_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l172_c7_e861_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l172_c7_e861_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l172_c7_e861_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l172_c7_e861_return_output := result_u16_value_MUX_uxn_opcodes_h_l172_c7_e861_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l157_c7_c409_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l157_c7_c409_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l168_c7_1838_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l172_c7_e861_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_c409_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l163_c7_429f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l144_c2_0b05] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_0b05_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_0b05_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_0b05_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_0b05_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l168_c7_1838] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l168_c7_1838_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l168_c7_1838_cond;
     result_u16_value_MUX_uxn_opcodes_h_l168_c7_1838_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l168_c7_1838_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l168_c7_1838_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l168_c7_1838_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l168_c7_1838_return_output := result_u16_value_MUX_uxn_opcodes_h_l168_c7_1838_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l144_c2_0b05] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_0b05_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_0b05_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_0b05_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_0b05_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l157_c7_c409] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l157_c7_c409_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_c409_cond;
     tmp16_MUX_uxn_opcodes_h_l157_c7_c409_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_c409_iftrue;
     tmp16_MUX_uxn_opcodes_h_l157_c7_c409_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_c409_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_c409_return_output := tmp16_MUX_uxn_opcodes_h_l157_c7_c409_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l163_c7_429f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l168_c7_1838_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l157_c7_c409_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l163_c7_429f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l163_c7_429f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l163_c7_429f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l163_c7_429f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l163_c7_429f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l163_c7_429f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l163_c7_429f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l163_c7_429f_return_output := result_u16_value_MUX_uxn_opcodes_h_l163_c7_429f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l144_c2_0b05] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l144_c2_0b05_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_0b05_cond;
     tmp16_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue;
     tmp16_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_0b05_return_output := tmp16_MUX_uxn_opcodes_h_l144_c2_0b05_return_output;

     -- Submodule level 8
     VAR_result_u16_value_MUX_uxn_opcodes_h_l157_c7_c409_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l163_c7_429f_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_0b05_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l157_c7_c409] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l157_c7_c409_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l157_c7_c409_cond;
     result_u16_value_MUX_uxn_opcodes_h_l157_c7_c409_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l157_c7_c409_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l157_c7_c409_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l157_c7_c409_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l157_c7_c409_return_output := result_u16_value_MUX_uxn_opcodes_h_l157_c7_c409_return_output;

     -- Submodule level 9
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l157_c7_c409_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l144_c2_0b05] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l144_c2_0b05_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_0b05_cond;
     result_u16_value_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_0b05_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_0b05_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_0b05_return_output := result_u16_value_MUX_uxn_opcodes_h_l144_c2_0b05_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1a75_uxn_opcodes_h_l183_l140_DUPLICATE_0386 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1a75_uxn_opcodes_h_l183_l140_DUPLICATE_0386_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1a75(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_0b05_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_0b05_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_0b05_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_0b05_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_0b05_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_0b05_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_0b05_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_0b05_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_0b05_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_0b05_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1a75_uxn_opcodes_h_l183_l140_DUPLICATE_0386_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1a75_uxn_opcodes_h_l183_l140_DUPLICATE_0386_return_output;
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
