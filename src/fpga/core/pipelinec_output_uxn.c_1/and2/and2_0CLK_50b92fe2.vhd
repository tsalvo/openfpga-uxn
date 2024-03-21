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
-- Submodules: 71
entity and2_0CLK_50b92fe2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end and2_0CLK_50b92fe2;
architecture arch of and2_0CLK_50b92fe2 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l940_c6_8150]
signal BIN_OP_EQ_uxn_opcodes_h_l940_c6_8150_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l940_c6_8150_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l940_c6_8150_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l940_c2_d47d]
signal n16_MUX_uxn_opcodes_h_l940_c2_d47d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l940_c2_d47d_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l940_c2_d47d]
signal t16_MUX_uxn_opcodes_h_l940_c2_d47d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l940_c2_d47d_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l940_c2_d47d]
signal tmp16_MUX_uxn_opcodes_h_l940_c2_d47d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l940_c2_d47d_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l940_c2_d47d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_d47d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_d47d_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l940_c2_d47d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_d47d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_d47d_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l940_c2_d47d]
signal result_u8_value_MUX_uxn_opcodes_h_l940_c2_d47d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l940_c2_d47d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l940_c2_d47d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_d47d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_d47d_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l940_c2_d47d]
signal result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_d47d_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_d47d_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l940_c2_d47d]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_d47d_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_d47d_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l940_c2_d47d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_d47d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_d47d_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l940_c2_d47d]
signal result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_d47d_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_d47d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l940_c2_d47d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_d47d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_d47d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l953_c11_e63d]
signal BIN_OP_EQ_uxn_opcodes_h_l953_c11_e63d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l953_c11_e63d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l953_c11_e63d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l953_c7_a795]
signal n16_MUX_uxn_opcodes_h_l953_c7_a795_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l953_c7_a795_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l953_c7_a795_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l953_c7_a795_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l953_c7_a795]
signal t16_MUX_uxn_opcodes_h_l953_c7_a795_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l953_c7_a795_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l953_c7_a795_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l953_c7_a795_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l953_c7_a795]
signal tmp16_MUX_uxn_opcodes_h_l953_c7_a795_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l953_c7_a795_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l953_c7_a795_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l953_c7_a795_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l953_c7_a795]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_a795_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_a795_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_a795_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_a795_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l953_c7_a795]
signal result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_a795_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_a795_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_a795_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_a795_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l953_c7_a795]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_a795_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_a795_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_a795_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_a795_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l953_c7_a795]
signal result_u8_value_MUX_uxn_opcodes_h_l953_c7_a795_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l953_c7_a795_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l953_c7_a795_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l953_c7_a795_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l953_c7_a795]
signal result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_a795_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_a795_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_a795_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_a795_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l956_c11_3498]
signal BIN_OP_EQ_uxn_opcodes_h_l956_c11_3498_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l956_c11_3498_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l956_c11_3498_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l956_c7_d79b]
signal n16_MUX_uxn_opcodes_h_l956_c7_d79b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l956_c7_d79b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l956_c7_d79b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l956_c7_d79b_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l956_c7_d79b]
signal t16_MUX_uxn_opcodes_h_l956_c7_d79b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l956_c7_d79b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l956_c7_d79b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l956_c7_d79b_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l956_c7_d79b]
signal tmp16_MUX_uxn_opcodes_h_l956_c7_d79b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l956_c7_d79b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l956_c7_d79b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l956_c7_d79b_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l956_c7_d79b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_d79b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_d79b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_d79b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_d79b_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l956_c7_d79b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_d79b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_d79b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_d79b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_d79b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l956_c7_d79b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_d79b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_d79b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_d79b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_d79b_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l956_c7_d79b]
signal result_u8_value_MUX_uxn_opcodes_h_l956_c7_d79b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l956_c7_d79b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l956_c7_d79b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l956_c7_d79b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l956_c7_d79b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_d79b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_d79b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_d79b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_d79b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l961_c11_c3dc]
signal BIN_OP_EQ_uxn_opcodes_h_l961_c11_c3dc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l961_c11_c3dc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l961_c11_c3dc_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l961_c7_3274]
signal n16_MUX_uxn_opcodes_h_l961_c7_3274_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l961_c7_3274_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l961_c7_3274_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l961_c7_3274_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l961_c7_3274]
signal t16_MUX_uxn_opcodes_h_l961_c7_3274_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l961_c7_3274_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l961_c7_3274_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l961_c7_3274_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l961_c7_3274]
signal tmp16_MUX_uxn_opcodes_h_l961_c7_3274_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l961_c7_3274_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l961_c7_3274_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l961_c7_3274_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l961_c7_3274]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_3274_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_3274_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_3274_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_3274_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l961_c7_3274]
signal result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_3274_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_3274_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_3274_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_3274_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l961_c7_3274]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_3274_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_3274_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_3274_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_3274_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l961_c7_3274]
signal result_u8_value_MUX_uxn_opcodes_h_l961_c7_3274_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l961_c7_3274_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l961_c7_3274_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l961_c7_3274_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l961_c7_3274]
signal result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_3274_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_3274_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_3274_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_3274_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l962_c3_c2ac]
signal BIN_OP_OR_uxn_opcodes_h_l962_c3_c2ac_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l962_c3_c2ac_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l962_c3_c2ac_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l965_c11_6ec8]
signal BIN_OP_EQ_uxn_opcodes_h_l965_c11_6ec8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l965_c11_6ec8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l965_c11_6ec8_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l965_c7_5802]
signal n16_MUX_uxn_opcodes_h_l965_c7_5802_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l965_c7_5802_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l965_c7_5802_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l965_c7_5802_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l965_c7_5802]
signal tmp16_MUX_uxn_opcodes_h_l965_c7_5802_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l965_c7_5802_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l965_c7_5802_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l965_c7_5802_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l965_c7_5802]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_5802_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_5802_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_5802_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_5802_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l965_c7_5802]
signal result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_5802_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_5802_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_5802_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_5802_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l965_c7_5802]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_5802_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_5802_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_5802_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_5802_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l965_c7_5802]
signal result_u8_value_MUX_uxn_opcodes_h_l965_c7_5802_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l965_c7_5802_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l965_c7_5802_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l965_c7_5802_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l965_c7_5802]
signal result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_5802_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_5802_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_5802_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_5802_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l969_c11_ddc7]
signal BIN_OP_EQ_uxn_opcodes_h_l969_c11_ddc7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l969_c11_ddc7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l969_c11_ddc7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l969_c7_9e9a]
signal n16_MUX_uxn_opcodes_h_l969_c7_9e9a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l969_c7_9e9a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l969_c7_9e9a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l969_c7_9e9a_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l969_c7_9e9a]
signal tmp16_MUX_uxn_opcodes_h_l969_c7_9e9a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l969_c7_9e9a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l969_c7_9e9a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l969_c7_9e9a_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l969_c7_9e9a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_9e9a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_9e9a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_9e9a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_9e9a_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l969_c7_9e9a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_9e9a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_9e9a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_9e9a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_9e9a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l969_c7_9e9a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_9e9a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_9e9a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_9e9a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_9e9a_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l969_c7_9e9a]
signal result_u8_value_MUX_uxn_opcodes_h_l969_c7_9e9a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l969_c7_9e9a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l969_c7_9e9a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l969_c7_9e9a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l969_c7_9e9a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_9e9a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_9e9a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_9e9a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_9e9a_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l970_c3_5d8d]
signal BIN_OP_OR_uxn_opcodes_h_l970_c3_5d8d_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l970_c3_5d8d_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l970_c3_5d8d_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l971_c11_8407]
signal BIN_OP_AND_uxn_opcodes_h_l971_c11_8407_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l971_c11_8407_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l971_c11_8407_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l972_c30_f30b]
signal sp_relative_shift_uxn_opcodes_h_l972_c30_f30b_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l972_c30_f30b_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l972_c30_f30b_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l972_c30_f30b_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l977_c11_7a29]
signal BIN_OP_EQ_uxn_opcodes_h_l977_c11_7a29_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l977_c11_7a29_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l977_c11_7a29_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l977_c7_6fc6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6fc6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6fc6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6fc6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6fc6_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l977_c7_6fc6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6fc6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6fc6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6fc6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6fc6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l977_c7_6fc6]
signal result_u8_value_MUX_uxn_opcodes_h_l977_c7_6fc6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l977_c7_6fc6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l977_c7_6fc6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l977_c7_6fc6_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l977_c7_6fc6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6fc6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6fc6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6fc6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6fc6_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l980_c31_e185]
signal CONST_SR_8_uxn_opcodes_h_l980_c31_e185_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l980_c31_e185_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l958_l967_DUPLICATE_4ca9
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l958_l967_DUPLICATE_4ca9_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l958_l967_DUPLICATE_4ca9_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_a6df( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_vram_write := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.is_stack_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l940_c6_8150
BIN_OP_EQ_uxn_opcodes_h_l940_c6_8150 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l940_c6_8150_left,
BIN_OP_EQ_uxn_opcodes_h_l940_c6_8150_right,
BIN_OP_EQ_uxn_opcodes_h_l940_c6_8150_return_output);

-- n16_MUX_uxn_opcodes_h_l940_c2_d47d
n16_MUX_uxn_opcodes_h_l940_c2_d47d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l940_c2_d47d_cond,
n16_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue,
n16_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse,
n16_MUX_uxn_opcodes_h_l940_c2_d47d_return_output);

-- t16_MUX_uxn_opcodes_h_l940_c2_d47d
t16_MUX_uxn_opcodes_h_l940_c2_d47d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l940_c2_d47d_cond,
t16_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue,
t16_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse,
t16_MUX_uxn_opcodes_h_l940_c2_d47d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l940_c2_d47d
tmp16_MUX_uxn_opcodes_h_l940_c2_d47d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l940_c2_d47d_cond,
tmp16_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue,
tmp16_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse,
tmp16_MUX_uxn_opcodes_h_l940_c2_d47d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_d47d
result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_d47d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_d47d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_d47d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_d47d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_d47d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_d47d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_d47d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l940_c2_d47d
result_u8_value_MUX_uxn_opcodes_h_l940_c2_d47d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l940_c2_d47d_cond,
result_u8_value_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l940_c2_d47d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_d47d
result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_d47d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_d47d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_d47d_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_d47d
result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_d47d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_d47d_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_d47d_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_d47d
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_d47d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_d47d_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_d47d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_d47d
result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_d47d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_d47d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_d47d_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_d47d
result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_d47d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_d47d_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_d47d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_d47d
result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_d47d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_d47d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_d47d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l953_c11_e63d
BIN_OP_EQ_uxn_opcodes_h_l953_c11_e63d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l953_c11_e63d_left,
BIN_OP_EQ_uxn_opcodes_h_l953_c11_e63d_right,
BIN_OP_EQ_uxn_opcodes_h_l953_c11_e63d_return_output);

-- n16_MUX_uxn_opcodes_h_l953_c7_a795
n16_MUX_uxn_opcodes_h_l953_c7_a795 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l953_c7_a795_cond,
n16_MUX_uxn_opcodes_h_l953_c7_a795_iftrue,
n16_MUX_uxn_opcodes_h_l953_c7_a795_iffalse,
n16_MUX_uxn_opcodes_h_l953_c7_a795_return_output);

-- t16_MUX_uxn_opcodes_h_l953_c7_a795
t16_MUX_uxn_opcodes_h_l953_c7_a795 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l953_c7_a795_cond,
t16_MUX_uxn_opcodes_h_l953_c7_a795_iftrue,
t16_MUX_uxn_opcodes_h_l953_c7_a795_iffalse,
t16_MUX_uxn_opcodes_h_l953_c7_a795_return_output);

-- tmp16_MUX_uxn_opcodes_h_l953_c7_a795
tmp16_MUX_uxn_opcodes_h_l953_c7_a795 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l953_c7_a795_cond,
tmp16_MUX_uxn_opcodes_h_l953_c7_a795_iftrue,
tmp16_MUX_uxn_opcodes_h_l953_c7_a795_iffalse,
tmp16_MUX_uxn_opcodes_h_l953_c7_a795_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_a795
result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_a795 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_a795_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_a795_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_a795_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_a795_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_a795
result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_a795 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_a795_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_a795_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_a795_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_a795_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_a795
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_a795 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_a795_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_a795_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_a795_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_a795_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l953_c7_a795
result_u8_value_MUX_uxn_opcodes_h_l953_c7_a795 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l953_c7_a795_cond,
result_u8_value_MUX_uxn_opcodes_h_l953_c7_a795_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l953_c7_a795_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l953_c7_a795_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_a795
result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_a795 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_a795_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_a795_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_a795_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_a795_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l956_c11_3498
BIN_OP_EQ_uxn_opcodes_h_l956_c11_3498 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l956_c11_3498_left,
BIN_OP_EQ_uxn_opcodes_h_l956_c11_3498_right,
BIN_OP_EQ_uxn_opcodes_h_l956_c11_3498_return_output);

-- n16_MUX_uxn_opcodes_h_l956_c7_d79b
n16_MUX_uxn_opcodes_h_l956_c7_d79b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l956_c7_d79b_cond,
n16_MUX_uxn_opcodes_h_l956_c7_d79b_iftrue,
n16_MUX_uxn_opcodes_h_l956_c7_d79b_iffalse,
n16_MUX_uxn_opcodes_h_l956_c7_d79b_return_output);

-- t16_MUX_uxn_opcodes_h_l956_c7_d79b
t16_MUX_uxn_opcodes_h_l956_c7_d79b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l956_c7_d79b_cond,
t16_MUX_uxn_opcodes_h_l956_c7_d79b_iftrue,
t16_MUX_uxn_opcodes_h_l956_c7_d79b_iffalse,
t16_MUX_uxn_opcodes_h_l956_c7_d79b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l956_c7_d79b
tmp16_MUX_uxn_opcodes_h_l956_c7_d79b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l956_c7_d79b_cond,
tmp16_MUX_uxn_opcodes_h_l956_c7_d79b_iftrue,
tmp16_MUX_uxn_opcodes_h_l956_c7_d79b_iffalse,
tmp16_MUX_uxn_opcodes_h_l956_c7_d79b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_d79b
result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_d79b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_d79b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_d79b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_d79b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_d79b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_d79b
result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_d79b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_d79b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_d79b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_d79b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_d79b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_d79b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_d79b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_d79b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_d79b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_d79b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_d79b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l956_c7_d79b
result_u8_value_MUX_uxn_opcodes_h_l956_c7_d79b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l956_c7_d79b_cond,
result_u8_value_MUX_uxn_opcodes_h_l956_c7_d79b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l956_c7_d79b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l956_c7_d79b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_d79b
result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_d79b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_d79b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_d79b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_d79b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_d79b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l961_c11_c3dc
BIN_OP_EQ_uxn_opcodes_h_l961_c11_c3dc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l961_c11_c3dc_left,
BIN_OP_EQ_uxn_opcodes_h_l961_c11_c3dc_right,
BIN_OP_EQ_uxn_opcodes_h_l961_c11_c3dc_return_output);

-- n16_MUX_uxn_opcodes_h_l961_c7_3274
n16_MUX_uxn_opcodes_h_l961_c7_3274 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l961_c7_3274_cond,
n16_MUX_uxn_opcodes_h_l961_c7_3274_iftrue,
n16_MUX_uxn_opcodes_h_l961_c7_3274_iffalse,
n16_MUX_uxn_opcodes_h_l961_c7_3274_return_output);

-- t16_MUX_uxn_opcodes_h_l961_c7_3274
t16_MUX_uxn_opcodes_h_l961_c7_3274 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l961_c7_3274_cond,
t16_MUX_uxn_opcodes_h_l961_c7_3274_iftrue,
t16_MUX_uxn_opcodes_h_l961_c7_3274_iffalse,
t16_MUX_uxn_opcodes_h_l961_c7_3274_return_output);

-- tmp16_MUX_uxn_opcodes_h_l961_c7_3274
tmp16_MUX_uxn_opcodes_h_l961_c7_3274 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l961_c7_3274_cond,
tmp16_MUX_uxn_opcodes_h_l961_c7_3274_iftrue,
tmp16_MUX_uxn_opcodes_h_l961_c7_3274_iffalse,
tmp16_MUX_uxn_opcodes_h_l961_c7_3274_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_3274
result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_3274 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_3274_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_3274_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_3274_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_3274_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_3274
result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_3274 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_3274_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_3274_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_3274_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_3274_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_3274
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_3274 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_3274_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_3274_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_3274_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_3274_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l961_c7_3274
result_u8_value_MUX_uxn_opcodes_h_l961_c7_3274 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l961_c7_3274_cond,
result_u8_value_MUX_uxn_opcodes_h_l961_c7_3274_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l961_c7_3274_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l961_c7_3274_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_3274
result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_3274 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_3274_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_3274_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_3274_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_3274_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l962_c3_c2ac
BIN_OP_OR_uxn_opcodes_h_l962_c3_c2ac : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l962_c3_c2ac_left,
BIN_OP_OR_uxn_opcodes_h_l962_c3_c2ac_right,
BIN_OP_OR_uxn_opcodes_h_l962_c3_c2ac_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l965_c11_6ec8
BIN_OP_EQ_uxn_opcodes_h_l965_c11_6ec8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l965_c11_6ec8_left,
BIN_OP_EQ_uxn_opcodes_h_l965_c11_6ec8_right,
BIN_OP_EQ_uxn_opcodes_h_l965_c11_6ec8_return_output);

-- n16_MUX_uxn_opcodes_h_l965_c7_5802
n16_MUX_uxn_opcodes_h_l965_c7_5802 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l965_c7_5802_cond,
n16_MUX_uxn_opcodes_h_l965_c7_5802_iftrue,
n16_MUX_uxn_opcodes_h_l965_c7_5802_iffalse,
n16_MUX_uxn_opcodes_h_l965_c7_5802_return_output);

-- tmp16_MUX_uxn_opcodes_h_l965_c7_5802
tmp16_MUX_uxn_opcodes_h_l965_c7_5802 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l965_c7_5802_cond,
tmp16_MUX_uxn_opcodes_h_l965_c7_5802_iftrue,
tmp16_MUX_uxn_opcodes_h_l965_c7_5802_iffalse,
tmp16_MUX_uxn_opcodes_h_l965_c7_5802_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_5802
result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_5802 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_5802_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_5802_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_5802_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_5802_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_5802
result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_5802 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_5802_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_5802_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_5802_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_5802_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_5802
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_5802 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_5802_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_5802_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_5802_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_5802_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l965_c7_5802
result_u8_value_MUX_uxn_opcodes_h_l965_c7_5802 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l965_c7_5802_cond,
result_u8_value_MUX_uxn_opcodes_h_l965_c7_5802_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l965_c7_5802_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l965_c7_5802_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_5802
result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_5802 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_5802_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_5802_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_5802_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_5802_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l969_c11_ddc7
BIN_OP_EQ_uxn_opcodes_h_l969_c11_ddc7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l969_c11_ddc7_left,
BIN_OP_EQ_uxn_opcodes_h_l969_c11_ddc7_right,
BIN_OP_EQ_uxn_opcodes_h_l969_c11_ddc7_return_output);

-- n16_MUX_uxn_opcodes_h_l969_c7_9e9a
n16_MUX_uxn_opcodes_h_l969_c7_9e9a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l969_c7_9e9a_cond,
n16_MUX_uxn_opcodes_h_l969_c7_9e9a_iftrue,
n16_MUX_uxn_opcodes_h_l969_c7_9e9a_iffalse,
n16_MUX_uxn_opcodes_h_l969_c7_9e9a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l969_c7_9e9a
tmp16_MUX_uxn_opcodes_h_l969_c7_9e9a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l969_c7_9e9a_cond,
tmp16_MUX_uxn_opcodes_h_l969_c7_9e9a_iftrue,
tmp16_MUX_uxn_opcodes_h_l969_c7_9e9a_iffalse,
tmp16_MUX_uxn_opcodes_h_l969_c7_9e9a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_9e9a
result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_9e9a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_9e9a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_9e9a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_9e9a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_9e9a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_9e9a
result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_9e9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_9e9a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_9e9a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_9e9a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_9e9a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_9e9a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_9e9a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_9e9a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_9e9a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_9e9a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_9e9a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l969_c7_9e9a
result_u8_value_MUX_uxn_opcodes_h_l969_c7_9e9a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l969_c7_9e9a_cond,
result_u8_value_MUX_uxn_opcodes_h_l969_c7_9e9a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l969_c7_9e9a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l969_c7_9e9a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_9e9a
result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_9e9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_9e9a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_9e9a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_9e9a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_9e9a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l970_c3_5d8d
BIN_OP_OR_uxn_opcodes_h_l970_c3_5d8d : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l970_c3_5d8d_left,
BIN_OP_OR_uxn_opcodes_h_l970_c3_5d8d_right,
BIN_OP_OR_uxn_opcodes_h_l970_c3_5d8d_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l971_c11_8407
BIN_OP_AND_uxn_opcodes_h_l971_c11_8407 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l971_c11_8407_left,
BIN_OP_AND_uxn_opcodes_h_l971_c11_8407_right,
BIN_OP_AND_uxn_opcodes_h_l971_c11_8407_return_output);

-- sp_relative_shift_uxn_opcodes_h_l972_c30_f30b
sp_relative_shift_uxn_opcodes_h_l972_c30_f30b : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l972_c30_f30b_ins,
sp_relative_shift_uxn_opcodes_h_l972_c30_f30b_x,
sp_relative_shift_uxn_opcodes_h_l972_c30_f30b_y,
sp_relative_shift_uxn_opcodes_h_l972_c30_f30b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l977_c11_7a29
BIN_OP_EQ_uxn_opcodes_h_l977_c11_7a29 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l977_c11_7a29_left,
BIN_OP_EQ_uxn_opcodes_h_l977_c11_7a29_right,
BIN_OP_EQ_uxn_opcodes_h_l977_c11_7a29_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6fc6
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6fc6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6fc6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6fc6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6fc6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6fc6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6fc6
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6fc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6fc6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6fc6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6fc6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6fc6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l977_c7_6fc6
result_u8_value_MUX_uxn_opcodes_h_l977_c7_6fc6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l977_c7_6fc6_cond,
result_u8_value_MUX_uxn_opcodes_h_l977_c7_6fc6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l977_c7_6fc6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l977_c7_6fc6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6fc6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6fc6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6fc6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6fc6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6fc6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6fc6_return_output);

-- CONST_SR_8_uxn_opcodes_h_l980_c31_e185
CONST_SR_8_uxn_opcodes_h_l980_c31_e185 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l980_c31_e185_x,
CONST_SR_8_uxn_opcodes_h_l980_c31_e185_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l958_l967_DUPLICATE_4ca9
CONST_SL_8_uint16_t_uxn_opcodes_h_l958_l967_DUPLICATE_4ca9 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l958_l967_DUPLICATE_4ca9_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l958_l967_DUPLICATE_4ca9_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l940_c6_8150_return_output,
 n16_MUX_uxn_opcodes_h_l940_c2_d47d_return_output,
 t16_MUX_uxn_opcodes_h_l940_c2_d47d_return_output,
 tmp16_MUX_uxn_opcodes_h_l940_c2_d47d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_d47d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_d47d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l940_c2_d47d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_d47d_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_d47d_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_d47d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_d47d_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_d47d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_d47d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l953_c11_e63d_return_output,
 n16_MUX_uxn_opcodes_h_l953_c7_a795_return_output,
 t16_MUX_uxn_opcodes_h_l953_c7_a795_return_output,
 tmp16_MUX_uxn_opcodes_h_l953_c7_a795_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_a795_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_a795_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_a795_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l953_c7_a795_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_a795_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l956_c11_3498_return_output,
 n16_MUX_uxn_opcodes_h_l956_c7_d79b_return_output,
 t16_MUX_uxn_opcodes_h_l956_c7_d79b_return_output,
 tmp16_MUX_uxn_opcodes_h_l956_c7_d79b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_d79b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_d79b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_d79b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l956_c7_d79b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_d79b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l961_c11_c3dc_return_output,
 n16_MUX_uxn_opcodes_h_l961_c7_3274_return_output,
 t16_MUX_uxn_opcodes_h_l961_c7_3274_return_output,
 tmp16_MUX_uxn_opcodes_h_l961_c7_3274_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_3274_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_3274_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_3274_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l961_c7_3274_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_3274_return_output,
 BIN_OP_OR_uxn_opcodes_h_l962_c3_c2ac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l965_c11_6ec8_return_output,
 n16_MUX_uxn_opcodes_h_l965_c7_5802_return_output,
 tmp16_MUX_uxn_opcodes_h_l965_c7_5802_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_5802_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_5802_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_5802_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l965_c7_5802_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_5802_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l969_c11_ddc7_return_output,
 n16_MUX_uxn_opcodes_h_l969_c7_9e9a_return_output,
 tmp16_MUX_uxn_opcodes_h_l969_c7_9e9a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_9e9a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_9e9a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_9e9a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l969_c7_9e9a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_9e9a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l970_c3_5d8d_return_output,
 BIN_OP_AND_uxn_opcodes_h_l971_c11_8407_return_output,
 sp_relative_shift_uxn_opcodes_h_l972_c30_f30b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l977_c11_7a29_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6fc6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6fc6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l977_c7_6fc6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6fc6_return_output,
 CONST_SR_8_uxn_opcodes_h_l980_c31_e185_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l958_l967_DUPLICATE_4ca9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_8150_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_8150_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_8150_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l953_c7_a795_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l940_c2_d47d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l940_c2_d47d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l953_c7_a795_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l940_c2_d47d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l940_c2_d47d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l953_c7_a795_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l940_c2_d47d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l940_c2_d47d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l945_c3_268f : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_a795_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_d47d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_d47d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l950_c3_ed77 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_a795_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_d47d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_d47d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l953_c7_a795_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c2_d47d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c2_d47d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_a795_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_d47d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_d47d_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l940_c2_d47d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_d47d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_d47d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l940_c2_d47d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_d47d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_d47d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l940_c2_d47d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_d47d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_d47d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l940_c2_d47d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_d47d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_d47d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_a795_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_d47d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_d47d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_e63d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_e63d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_e63d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l953_c7_a795_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l953_c7_a795_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l956_c7_d79b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l953_c7_a795_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l953_c7_a795_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l953_c7_a795_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l956_c7_d79b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l953_c7_a795_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l953_c7_a795_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l953_c7_a795_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l956_c7_d79b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l953_c7_a795_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_a795_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_a795_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_d79b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_a795_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_a795_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_a795_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_d79b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_a795_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_a795_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l954_c3_6288 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_a795_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_d79b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_a795_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l953_c7_a795_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l953_c7_a795_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c7_d79b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l953_c7_a795_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_a795_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_a795_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_d79b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_a795_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_3498_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_3498_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_3498_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l956_c7_d79b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l956_c7_d79b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l961_c7_3274_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l956_c7_d79b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l956_c7_d79b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l956_c7_d79b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l961_c7_3274_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l956_c7_d79b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l956_c7_d79b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l956_c7_d79b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l961_c7_3274_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l956_c7_d79b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_d79b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_d79b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_3274_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_d79b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_d79b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_d79b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_3274_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_d79b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_d79b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l959_c3_fe86 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_d79b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_3274_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_d79b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c7_d79b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c7_d79b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l961_c7_3274_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c7_d79b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_d79b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_d79b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_3274_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_d79b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_c3dc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_c3dc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_c3dc_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l961_c7_3274_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l961_c7_3274_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l965_c7_5802_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l961_c7_3274_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l961_c7_3274_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l961_c7_3274_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l961_c7_3274_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l961_c7_3274_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l961_c7_3274_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_5802_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l961_c7_3274_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_3274_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_3274_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_5802_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_3274_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_3274_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_3274_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_5802_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_3274_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_3274_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l963_c3_a5a9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_3274_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_5802_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_3274_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l961_c7_3274_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l961_c7_3274_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l965_c7_5802_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l961_c7_3274_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_3274_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_3274_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_5802_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_3274_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l962_c3_c2ac_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l962_c3_c2ac_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l962_c3_c2ac_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_6ec8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_6ec8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_6ec8_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l965_c7_5802_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l965_c7_5802_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l969_c7_9e9a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l965_c7_5802_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_5802_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_5802_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_9e9a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_5802_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_5802_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_5802_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_9e9a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_5802_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_5802_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_5802_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_9e9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_5802_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_5802_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_5802_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_9e9a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_5802_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l965_c7_5802_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l965_c7_5802_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_9e9a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l965_c7_5802_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_5802_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_5802_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_9e9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_5802_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_ddc7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_ddc7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_ddc7_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l969_c7_9e9a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l969_c7_9e9a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l969_c7_9e9a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_9e9a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_9e9a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_9e9a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_9e9a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_9e9a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6fc6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_9e9a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_9e9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_9e9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6fc6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_9e9a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_9e9a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l974_c3_ecd2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_9e9a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6fc6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_9e9a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_9e9a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_9e9a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_6fc6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_9e9a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_9e9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_9e9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_9e9a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l970_c3_5d8d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l970_c3_5d8d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l970_c3_5d8d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l971_c11_8407_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l971_c11_8407_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l971_c11_8407_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l972_c30_f30b_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l972_c30_f30b_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l972_c30_f30b_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l972_c30_f30b_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l975_c21_115f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_7a29_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_7a29_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_7a29_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6fc6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l978_c3_ab53 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6fc6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6fc6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6fc6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6fc6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6fc6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_6fc6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_6fc6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_6fc6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6fc6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l979_c3_fa01 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6fc6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6fc6_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l980_c31_e185_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l980_c31_e185_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l980_c21_b086_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l956_l953_l940_l977_l965_l961_DUPLICATE_786d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l956_l953_l977_l965_l961_DUPLICATE_5b6d_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l956_l953_l977_l969_l965_l961_DUPLICATE_f7ac_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l956_l953_l969_l965_l961_DUPLICATE_5173_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l957_l962_l970_l966_DUPLICATE_065f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l958_l967_DUPLICATE_4ca9_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l958_l967_DUPLICATE_4ca9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l965_l977_DUPLICATE_35e4_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l984_l936_DUPLICATE_6ef5_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_3498_right := to_unsigned(2, 2);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_8150_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l974_c3_ecd2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_9e9a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l974_c3_ecd2;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l954_c3_6288 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_a795_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l954_c3_6288;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6fc6_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l972_c30_f30b_y := resize(to_signed(-2, 3), 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l972_c30_f30b_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l950_c3_ed77 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l950_c3_ed77;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_ddc7_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_9e9a_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l945_c3_268f := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l945_c3_268f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l959_c3_fe86 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_d79b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l959_c3_fe86;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l979_c3_fa01 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6fc6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l979_c3_fa01;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l978_c3_ab53 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6fc6_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l978_c3_ab53;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_6ec8_right := to_unsigned(4, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_c3dc_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_e63d_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_7a29_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l963_c3_a5a9 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_3274_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l963_c3_a5a9;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l972_c30_f30b_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l970_c3_5d8d_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l953_c7_a795_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l956_c7_d79b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l961_c7_3274_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l969_c7_9e9a_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_8150_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_e63d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_3498_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_c3dc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_6ec8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_ddc7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_7a29_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_opcodes_h_l971_c11_8407_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l962_c3_c2ac_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l953_c7_a795_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l961_c7_3274_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l980_c31_e185_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l953_c7_a795_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l956_c7_d79b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l961_c7_3274_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_5802_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_9e9a_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l940_c6_8150] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l940_c6_8150_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_8150_left;
     BIN_OP_EQ_uxn_opcodes_h_l940_c6_8150_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_8150_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_8150_return_output := BIN_OP_EQ_uxn_opcodes_h_l940_c6_8150_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l969_c11_ddc7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l969_c11_ddc7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_ddc7_left;
     BIN_OP_EQ_uxn_opcodes_h_l969_c11_ddc7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_ddc7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_ddc7_return_output := BIN_OP_EQ_uxn_opcodes_h_l969_c11_ddc7_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l940_c2_d47d] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l940_c2_d47d_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l956_l953_l969_l965_l961_DUPLICATE_5173 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l956_l953_l969_l965_l961_DUPLICATE_5173_return_output := result.is_stack_write;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l940_c2_d47d] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l940_c2_d47d_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l956_l953_l977_l969_l965_l961_DUPLICATE_f7ac LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l956_l953_l977_l969_l965_l961_DUPLICATE_f7ac_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l956_c11_3498] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l956_c11_3498_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_3498_left;
     BIN_OP_EQ_uxn_opcodes_h_l956_c11_3498_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_3498_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_3498_return_output := BIN_OP_EQ_uxn_opcodes_h_l956_c11_3498_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l940_c2_d47d] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l940_c2_d47d_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l977_c11_7a29] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l977_c11_7a29_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_7a29_left;
     BIN_OP_EQ_uxn_opcodes_h_l977_c11_7a29_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_7a29_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_7a29_return_output := BIN_OP_EQ_uxn_opcodes_h_l977_c11_7a29_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l953_c11_e63d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l953_c11_e63d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_e63d_left;
     BIN_OP_EQ_uxn_opcodes_h_l953_c11_e63d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_e63d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_e63d_return_output := BIN_OP_EQ_uxn_opcodes_h_l953_c11_e63d_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l957_l962_l970_l966_DUPLICATE_065f LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l957_l962_l970_l966_DUPLICATE_065f_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l965_c11_6ec8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l965_c11_6ec8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_6ec8_left;
     BIN_OP_EQ_uxn_opcodes_h_l965_c11_6ec8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_6ec8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_6ec8_return_output := BIN_OP_EQ_uxn_opcodes_h_l965_c11_6ec8_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l956_l953_l940_l977_l965_l961_DUPLICATE_786d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l956_l953_l940_l977_l965_l961_DUPLICATE_786d_return_output := result.u8_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l956_l953_l977_l965_l961_DUPLICATE_5b6d LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l956_l953_l977_l965_l961_DUPLICATE_5b6d_return_output := result.sp_relative_shift;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l940_c2_d47d] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l940_c2_d47d_return_output := result.is_vram_write;

     -- sp_relative_shift[uxn_opcodes_h_l972_c30_f30b] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l972_c30_f30b_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l972_c30_f30b_ins;
     sp_relative_shift_uxn_opcodes_h_l972_c30_f30b_x <= VAR_sp_relative_shift_uxn_opcodes_h_l972_c30_f30b_x;
     sp_relative_shift_uxn_opcodes_h_l972_c30_f30b_y <= VAR_sp_relative_shift_uxn_opcodes_h_l972_c30_f30b_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l972_c30_f30b_return_output := sp_relative_shift_uxn_opcodes_h_l972_c30_f30b_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l965_l977_DUPLICATE_35e4 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l965_l977_DUPLICATE_35e4_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l961_c11_c3dc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l961_c11_c3dc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_c3dc_left;
     BIN_OP_EQ_uxn_opcodes_h_l961_c11_c3dc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_c3dc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_c3dc_return_output := BIN_OP_EQ_uxn_opcodes_h_l961_c11_c3dc_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l980_c31_e185] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l980_c31_e185_x <= VAR_CONST_SR_8_uxn_opcodes_h_l980_c31_e185_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l980_c31_e185_return_output := CONST_SR_8_uxn_opcodes_h_l980_c31_e185_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l940_c2_d47d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_8150_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_d47d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_8150_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_d47d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_8150_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_d47d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_8150_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_d47d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_8150_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_d47d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_8150_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_d47d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_8150_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_d47d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_8150_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_d47d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_8150_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c2_d47d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_8150_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l940_c2_d47d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_8150_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l940_c2_d47d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c6_8150_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l953_c7_a795_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_e63d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_a795_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_e63d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_a795_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_e63d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_a795_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_e63d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_a795_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_e63d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l953_c7_a795_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_e63d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l953_c7_a795_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_e63d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l953_c7_a795_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_e63d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l956_c7_d79b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_3498_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_d79b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_3498_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_d79b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_3498_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_d79b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_3498_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_d79b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_3498_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c7_d79b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_3498_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l956_c7_d79b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_3498_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l956_c7_d79b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_3498_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l961_c7_3274_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_c3dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_3274_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_c3dc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_3274_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_c3dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_3274_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_c3dc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_3274_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_c3dc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l961_c7_3274_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_c3dc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l961_c7_3274_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_c3dc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l961_c7_3274_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l961_c11_c3dc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l965_c7_5802_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_6ec8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_5802_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_6ec8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_5802_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_6ec8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_5802_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_6ec8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_5802_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_6ec8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l965_c7_5802_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_6ec8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_5802_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l965_c11_6ec8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l969_c7_9e9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_ddc7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_9e9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_ddc7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_9e9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_ddc7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_9e9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_ddc7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_9e9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_ddc7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_9e9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_ddc7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_9e9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_ddc7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6fc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_7a29_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6fc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_7a29_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6fc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_7a29_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_6fc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_7a29_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l962_c3_c2ac_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l957_l962_l970_l966_DUPLICATE_065f_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l970_c3_5d8d_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l957_l962_l970_l966_DUPLICATE_065f_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l958_l967_DUPLICATE_4ca9_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l957_l962_l970_l966_DUPLICATE_065f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_a795_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l956_l953_l977_l965_l961_DUPLICATE_5b6d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_d79b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l956_l953_l977_l965_l961_DUPLICATE_5b6d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_3274_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l956_l953_l977_l965_l961_DUPLICATE_5b6d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_5802_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l956_l953_l977_l965_l961_DUPLICATE_5b6d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6fc6_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l956_l953_l977_l965_l961_DUPLICATE_5b6d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_a795_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l956_l953_l977_l969_l965_l961_DUPLICATE_f7ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_d79b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l956_l953_l977_l969_l965_l961_DUPLICATE_f7ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_3274_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l956_l953_l977_l969_l965_l961_DUPLICATE_f7ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_5802_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l956_l953_l977_l969_l965_l961_DUPLICATE_f7ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_9e9a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l956_l953_l977_l969_l965_l961_DUPLICATE_f7ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6fc6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l956_l953_l977_l969_l965_l961_DUPLICATE_f7ac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_a795_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l956_l953_l969_l965_l961_DUPLICATE_5173_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_d79b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l956_l953_l969_l965_l961_DUPLICATE_5173_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_3274_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l956_l953_l969_l965_l961_DUPLICATE_5173_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_5802_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l956_l953_l969_l965_l961_DUPLICATE_5173_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_9e9a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l956_l953_l969_l965_l961_DUPLICATE_5173_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_5802_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l965_l977_DUPLICATE_35e4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6fc6_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l965_l977_DUPLICATE_35e4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l956_l953_l940_l977_l965_l961_DUPLICATE_786d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l953_c7_a795_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l956_l953_l940_l977_l965_l961_DUPLICATE_786d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c7_d79b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l956_l953_l940_l977_l965_l961_DUPLICATE_786d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l961_c7_3274_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l956_l953_l940_l977_l965_l961_DUPLICATE_786d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l965_c7_5802_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l956_l953_l940_l977_l965_l961_DUPLICATE_786d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_6fc6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l956_l953_l940_l977_l965_l961_DUPLICATE_786d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l940_c2_d47d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l940_c2_d47d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l940_c2_d47d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l940_c2_d47d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_9e9a_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l972_c30_f30b_return_output;
     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l958_l967_DUPLICATE_4ca9 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l958_l967_DUPLICATE_4ca9_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l958_l967_DUPLICATE_4ca9_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l958_l967_DUPLICATE_4ca9_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l958_l967_DUPLICATE_4ca9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l977_c7_6fc6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6fc6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6fc6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6fc6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6fc6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6fc6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6fc6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6fc6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6fc6_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l940_c2_d47d] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_d47d_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_d47d_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_d47d_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_d47d_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l940_c2_d47d] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_d47d_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_d47d_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_d47d_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_d47d_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l940_c2_d47d] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_d47d_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_d47d_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_d47d_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_d47d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l970_c3_5d8d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l970_c3_5d8d_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l970_c3_5d8d_left;
     BIN_OP_OR_uxn_opcodes_h_l970_c3_5d8d_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l970_c3_5d8d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l970_c3_5d8d_return_output := BIN_OP_OR_uxn_opcodes_h_l970_c3_5d8d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l977_c7_6fc6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6fc6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6fc6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6fc6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6fc6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6fc6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6fc6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6fc6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6fc6_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l980_c21_b086] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l980_c21_b086_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l980_c31_e185_return_output);

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l940_c2_d47d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_d47d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_d47d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_d47d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_d47d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l977_c7_6fc6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6fc6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6fc6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6fc6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6fc6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6fc6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6fc6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6fc6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6fc6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l969_c7_9e9a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_9e9a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_9e9a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_9e9a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_9e9a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_9e9a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_9e9a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_9e9a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_9e9a_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l962_c3_c2ac] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l962_c3_c2ac_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l962_c3_c2ac_left;
     BIN_OP_OR_uxn_opcodes_h_l962_c3_c2ac_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l962_c3_c2ac_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l962_c3_c2ac_return_output := BIN_OP_OR_uxn_opcodes_h_l962_c3_c2ac_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l961_c7_3274_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l962_c3_c2ac_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l971_c11_8407_right := VAR_BIN_OP_OR_uxn_opcodes_h_l970_c3_5d8d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l969_c7_9e9a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l970_c3_5d8d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_6fc6_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l980_c21_b086_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l965_c7_5802_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l958_l967_DUPLICATE_4ca9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l956_c7_d79b_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l958_l967_DUPLICATE_4ca9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_9e9a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_6fc6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_5802_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_9e9a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_9e9a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_6fc6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_9e9a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_6fc6_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l965_c7_5802] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_5802_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_5802_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_5802_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_5802_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_5802_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_5802_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_5802_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_5802_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l969_c7_9e9a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_9e9a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_9e9a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_9e9a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_9e9a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_9e9a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_9e9a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_9e9a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_9e9a_return_output;

     -- n16_MUX[uxn_opcodes_h_l969_c7_9e9a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l969_c7_9e9a_cond <= VAR_n16_MUX_uxn_opcodes_h_l969_c7_9e9a_cond;
     n16_MUX_uxn_opcodes_h_l969_c7_9e9a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l969_c7_9e9a_iftrue;
     n16_MUX_uxn_opcodes_h_l969_c7_9e9a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l969_c7_9e9a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l969_c7_9e9a_return_output := n16_MUX_uxn_opcodes_h_l969_c7_9e9a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l969_c7_9e9a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_9e9a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_9e9a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_9e9a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_9e9a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_9e9a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_9e9a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_9e9a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_9e9a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l977_c7_6fc6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l977_c7_6fc6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_6fc6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l977_c7_6fc6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_6fc6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l977_c7_6fc6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_6fc6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_6fc6_return_output := result_u8_value_MUX_uxn_opcodes_h_l977_c7_6fc6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l969_c7_9e9a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_9e9a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_9e9a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_9e9a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_9e9a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_9e9a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_9e9a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_9e9a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_9e9a_return_output;

     -- t16_MUX[uxn_opcodes_h_l961_c7_3274] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l961_c7_3274_cond <= VAR_t16_MUX_uxn_opcodes_h_l961_c7_3274_cond;
     t16_MUX_uxn_opcodes_h_l961_c7_3274_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l961_c7_3274_iftrue;
     t16_MUX_uxn_opcodes_h_l961_c7_3274_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l961_c7_3274_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l961_c7_3274_return_output := t16_MUX_uxn_opcodes_h_l961_c7_3274_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l971_c11_8407] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l971_c11_8407_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l971_c11_8407_left;
     BIN_OP_AND_uxn_opcodes_h_l971_c11_8407_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l971_c11_8407_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l971_c11_8407_return_output := BIN_OP_AND_uxn_opcodes_h_l971_c11_8407_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_9e9a_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l971_c11_8407_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l965_c7_5802_iffalse := VAR_n16_MUX_uxn_opcodes_h_l969_c7_9e9a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_5802_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_9e9a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_3274_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l965_c7_5802_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_5802_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l969_c7_9e9a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_5802_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_9e9a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_9e9a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l977_c7_6fc6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l956_c7_d79b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l961_c7_3274_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l961_c7_3274] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_3274_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_3274_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_3274_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_3274_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_3274_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_3274_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_3274_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_3274_return_output;

     -- n16_MUX[uxn_opcodes_h_l965_c7_5802] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l965_c7_5802_cond <= VAR_n16_MUX_uxn_opcodes_h_l965_c7_5802_cond;
     n16_MUX_uxn_opcodes_h_l965_c7_5802_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l965_c7_5802_iftrue;
     n16_MUX_uxn_opcodes_h_l965_c7_5802_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l965_c7_5802_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l965_c7_5802_return_output := n16_MUX_uxn_opcodes_h_l965_c7_5802_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l965_c7_5802] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_5802_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_5802_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_5802_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_5802_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_5802_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_5802_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_5802_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_5802_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l975_c21_115f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l975_c21_115f_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_AND_uxn_opcodes_h_l971_c11_8407_return_output);

     -- t16_MUX[uxn_opcodes_h_l956_c7_d79b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l956_c7_d79b_cond <= VAR_t16_MUX_uxn_opcodes_h_l956_c7_d79b_cond;
     t16_MUX_uxn_opcodes_h_l956_c7_d79b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l956_c7_d79b_iftrue;
     t16_MUX_uxn_opcodes_h_l956_c7_d79b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l956_c7_d79b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l956_c7_d79b_return_output := t16_MUX_uxn_opcodes_h_l956_c7_d79b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l965_c7_5802] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_5802_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_5802_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_5802_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_5802_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_5802_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_5802_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_5802_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_5802_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l965_c7_5802] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_5802_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_5802_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_5802_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_5802_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_5802_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_5802_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_5802_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_5802_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l969_c7_9e9a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l969_c7_9e9a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_9e9a_cond;
     tmp16_MUX_uxn_opcodes_h_l969_c7_9e9a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_9e9a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l969_c7_9e9a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_9e9a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_9e9a_return_output := tmp16_MUX_uxn_opcodes_h_l969_c7_9e9a_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_9e9a_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l975_c21_115f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l961_c7_3274_iffalse := VAR_n16_MUX_uxn_opcodes_h_l965_c7_5802_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_3274_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l965_c7_5802_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_d79b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l961_c7_3274_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_3274_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l965_c7_5802_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_3274_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l965_c7_5802_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l953_c7_a795_iffalse := VAR_t16_MUX_uxn_opcodes_h_l956_c7_d79b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_5802_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l969_c7_9e9a_return_output;
     -- n16_MUX[uxn_opcodes_h_l961_c7_3274] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l961_c7_3274_cond <= VAR_n16_MUX_uxn_opcodes_h_l961_c7_3274_cond;
     n16_MUX_uxn_opcodes_h_l961_c7_3274_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l961_c7_3274_iftrue;
     n16_MUX_uxn_opcodes_h_l961_c7_3274_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l961_c7_3274_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l961_c7_3274_return_output := n16_MUX_uxn_opcodes_h_l961_c7_3274_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l956_c7_d79b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_d79b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_d79b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_d79b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_d79b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_d79b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_d79b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_d79b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_d79b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l965_c7_5802] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l965_c7_5802_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_5802_cond;
     tmp16_MUX_uxn_opcodes_h_l965_c7_5802_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_5802_iftrue;
     tmp16_MUX_uxn_opcodes_h_l965_c7_5802_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_5802_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_5802_return_output := tmp16_MUX_uxn_opcodes_h_l965_c7_5802_return_output;

     -- t16_MUX[uxn_opcodes_h_l953_c7_a795] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l953_c7_a795_cond <= VAR_t16_MUX_uxn_opcodes_h_l953_c7_a795_cond;
     t16_MUX_uxn_opcodes_h_l953_c7_a795_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l953_c7_a795_iftrue;
     t16_MUX_uxn_opcodes_h_l953_c7_a795_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l953_c7_a795_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l953_c7_a795_return_output := t16_MUX_uxn_opcodes_h_l953_c7_a795_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l961_c7_3274] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_3274_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_3274_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_3274_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_3274_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_3274_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_3274_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_3274_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_3274_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l969_c7_9e9a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l969_c7_9e9a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_9e9a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l969_c7_9e9a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_9e9a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l969_c7_9e9a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_9e9a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_9e9a_return_output := result_u8_value_MUX_uxn_opcodes_h_l969_c7_9e9a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l961_c7_3274] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_3274_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_3274_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_3274_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_3274_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_3274_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_3274_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_3274_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_3274_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l961_c7_3274] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_3274_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_3274_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_3274_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_3274_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_3274_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_3274_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_3274_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_3274_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l956_c7_d79b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l961_c7_3274_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_d79b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l961_c7_3274_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_a795_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_d79b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_d79b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l961_c7_3274_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_d79b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l961_c7_3274_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l965_c7_5802_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l969_c7_9e9a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l953_c7_a795_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l961_c7_3274_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l965_c7_5802_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l956_c7_d79b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_d79b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_d79b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_d79b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_d79b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_d79b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_d79b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_d79b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_d79b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l956_c7_d79b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_d79b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_d79b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_d79b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_d79b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_d79b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_d79b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_d79b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_d79b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l961_c7_3274] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l961_c7_3274_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l961_c7_3274_cond;
     tmp16_MUX_uxn_opcodes_h_l961_c7_3274_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l961_c7_3274_iftrue;
     tmp16_MUX_uxn_opcodes_h_l961_c7_3274_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l961_c7_3274_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l961_c7_3274_return_output := tmp16_MUX_uxn_opcodes_h_l961_c7_3274_return_output;

     -- t16_MUX[uxn_opcodes_h_l940_c2_d47d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l940_c2_d47d_cond <= VAR_t16_MUX_uxn_opcodes_h_l940_c2_d47d_cond;
     t16_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue;
     t16_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l940_c2_d47d_return_output := t16_MUX_uxn_opcodes_h_l940_c2_d47d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l956_c7_d79b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_d79b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_d79b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_d79b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_d79b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_d79b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_d79b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_d79b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_d79b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l965_c7_5802] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l965_c7_5802_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l965_c7_5802_cond;
     result_u8_value_MUX_uxn_opcodes_h_l965_c7_5802_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l965_c7_5802_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l965_c7_5802_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l965_c7_5802_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l965_c7_5802_return_output := result_u8_value_MUX_uxn_opcodes_h_l965_c7_5802_return_output;

     -- n16_MUX[uxn_opcodes_h_l956_c7_d79b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l956_c7_d79b_cond <= VAR_n16_MUX_uxn_opcodes_h_l956_c7_d79b_cond;
     n16_MUX_uxn_opcodes_h_l956_c7_d79b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l956_c7_d79b_iftrue;
     n16_MUX_uxn_opcodes_h_l956_c7_d79b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l956_c7_d79b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l956_c7_d79b_return_output := n16_MUX_uxn_opcodes_h_l956_c7_d79b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l953_c7_a795] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_a795_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_a795_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_a795_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_a795_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_a795_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_a795_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_a795_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_a795_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l953_c7_a795_iffalse := VAR_n16_MUX_uxn_opcodes_h_l956_c7_d79b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_a795_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_d79b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_a795_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_a795_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l956_c7_d79b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_a795_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_d79b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l961_c7_3274_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l965_c7_5802_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l940_c2_d47d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l956_c7_d79b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l961_c7_3274_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l953_c7_a795] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_a795_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_a795_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_a795_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_a795_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_a795_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_a795_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_a795_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_a795_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l961_c7_3274] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l961_c7_3274_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l961_c7_3274_cond;
     result_u8_value_MUX_uxn_opcodes_h_l961_c7_3274_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l961_c7_3274_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l961_c7_3274_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l961_c7_3274_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l961_c7_3274_return_output := result_u8_value_MUX_uxn_opcodes_h_l961_c7_3274_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l940_c2_d47d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_d47d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_d47d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_d47d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_d47d_return_output;

     -- n16_MUX[uxn_opcodes_h_l953_c7_a795] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l953_c7_a795_cond <= VAR_n16_MUX_uxn_opcodes_h_l953_c7_a795_cond;
     n16_MUX_uxn_opcodes_h_l953_c7_a795_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l953_c7_a795_iftrue;
     n16_MUX_uxn_opcodes_h_l953_c7_a795_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l953_c7_a795_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l953_c7_a795_return_output := n16_MUX_uxn_opcodes_h_l953_c7_a795_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l953_c7_a795] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_a795_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_a795_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_a795_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_a795_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_a795_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_a795_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_a795_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_a795_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l956_c7_d79b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l956_c7_d79b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l956_c7_d79b_cond;
     tmp16_MUX_uxn_opcodes_h_l956_c7_d79b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l956_c7_d79b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l956_c7_d79b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l956_c7_d79b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l956_c7_d79b_return_output := tmp16_MUX_uxn_opcodes_h_l956_c7_d79b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l953_c7_a795] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_a795_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_a795_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_a795_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_a795_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_a795_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_a795_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_a795_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_a795_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l953_c7_a795_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_a795_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l953_c7_a795_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_a795_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c7_d79b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l961_c7_3274_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l953_c7_a795_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l956_c7_d79b_return_output;
     -- n16_MUX[uxn_opcodes_h_l940_c2_d47d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l940_c2_d47d_cond <= VAR_n16_MUX_uxn_opcodes_h_l940_c2_d47d_cond;
     n16_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue;
     n16_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l940_c2_d47d_return_output := n16_MUX_uxn_opcodes_h_l940_c2_d47d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l953_c7_a795] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l953_c7_a795_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l953_c7_a795_cond;
     tmp16_MUX_uxn_opcodes_h_l953_c7_a795_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l953_c7_a795_iftrue;
     tmp16_MUX_uxn_opcodes_h_l953_c7_a795_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l953_c7_a795_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l953_c7_a795_return_output := tmp16_MUX_uxn_opcodes_h_l953_c7_a795_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l940_c2_d47d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_d47d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_d47d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_d47d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_d47d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l940_c2_d47d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_d47d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_d47d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_d47d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_d47d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l940_c2_d47d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_d47d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_d47d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_d47d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_d47d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l956_c7_d79b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l956_c7_d79b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c7_d79b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l956_c7_d79b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c7_d79b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l956_c7_d79b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c7_d79b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c7_d79b_return_output := result_u8_value_MUX_uxn_opcodes_h_l956_c7_d79b_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l940_c2_d47d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l953_c7_a795_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l956_c7_d79b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l953_c7_a795_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l953_c7_a795] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l953_c7_a795_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l953_c7_a795_cond;
     result_u8_value_MUX_uxn_opcodes_h_l953_c7_a795_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l953_c7_a795_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l953_c7_a795_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l953_c7_a795_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l953_c7_a795_return_output := result_u8_value_MUX_uxn_opcodes_h_l953_c7_a795_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l940_c2_d47d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l940_c2_d47d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l940_c2_d47d_cond;
     tmp16_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l940_c2_d47d_return_output := tmp16_MUX_uxn_opcodes_h_l940_c2_d47d_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l953_c7_a795_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l940_c2_d47d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l940_c2_d47d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l940_c2_d47d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c2_d47d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c2_d47d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c2_d47d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c2_d47d_return_output := result_u8_value_MUX_uxn_opcodes_h_l940_c2_d47d_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l984_l936_DUPLICATE_6ef5 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l984_l936_DUPLICATE_6ef5_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a6df(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c2_d47d_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c2_d47d_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c2_d47d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c2_d47d_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l940_c2_d47d_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l940_c2_d47d_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l940_c2_d47d_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l940_c2_d47d_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c2_d47d_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l984_l936_DUPLICATE_6ef5_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l984_l936_DUPLICATE_6ef5_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
