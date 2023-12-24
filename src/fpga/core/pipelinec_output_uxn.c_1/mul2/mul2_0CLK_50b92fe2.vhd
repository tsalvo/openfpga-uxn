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
entity mul2_0CLK_50b92fe2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end mul2_0CLK_50b92fe2;
architecture arch of mul2_0CLK_50b92fe2 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2021_c6_cb00]
signal BIN_OP_EQ_uxn_opcodes_h_l2021_c6_cb00_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2021_c6_cb00_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2021_c6_cb00_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2021_c2_a6f0]
signal n16_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2021_c2_a6f0]
signal tmp16_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2021_c2_a6f0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2021_c2_a6f0]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2021_c2_a6f0]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2021_c2_a6f0]
signal result_u8_value_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2021_c2_a6f0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2021_c2_a6f0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2021_c2_a6f0]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2021_c2_a6f0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2021_c2_a6f0]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2021_c2_a6f0]
signal t16_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2034_c11_5651]
signal BIN_OP_EQ_uxn_opcodes_h_l2034_c11_5651_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2034_c11_5651_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2034_c11_5651_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2034_c7_1f3d]
signal n16_MUX_uxn_opcodes_h_l2034_c7_1f3d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2034_c7_1f3d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2034_c7_1f3d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2034_c7_1f3d]
signal tmp16_MUX_uxn_opcodes_h_l2034_c7_1f3d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2034_c7_1f3d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2034_c7_1f3d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2034_c7_1f3d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_1f3d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_1f3d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_1f3d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2034_c7_1f3d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_1f3d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_1f3d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_1f3d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2034_c7_1f3d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_1f3d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_1f3d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_1f3d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2034_c7_1f3d]
signal result_u8_value_MUX_uxn_opcodes_h_l2034_c7_1f3d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2034_c7_1f3d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2034_c7_1f3d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2034_c7_1f3d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_1f3d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_1f3d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_1f3d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2034_c7_1f3d]
signal t16_MUX_uxn_opcodes_h_l2034_c7_1f3d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2034_c7_1f3d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2034_c7_1f3d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2037_c11_2063]
signal BIN_OP_EQ_uxn_opcodes_h_l2037_c11_2063_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2037_c11_2063_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2037_c11_2063_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2037_c7_82bb]
signal n16_MUX_uxn_opcodes_h_l2037_c7_82bb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2037_c7_82bb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2037_c7_82bb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2037_c7_82bb]
signal tmp16_MUX_uxn_opcodes_h_l2037_c7_82bb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2037_c7_82bb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2037_c7_82bb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2037_c7_82bb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_82bb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_82bb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_82bb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2037_c7_82bb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_82bb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_82bb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_82bb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2037_c7_82bb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_82bb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_82bb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_82bb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2037_c7_82bb]
signal result_u8_value_MUX_uxn_opcodes_h_l2037_c7_82bb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2037_c7_82bb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2037_c7_82bb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2037_c7_82bb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_82bb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_82bb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_82bb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2037_c7_82bb]
signal t16_MUX_uxn_opcodes_h_l2037_c7_82bb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2037_c7_82bb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2037_c7_82bb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2042_c11_d5bf]
signal BIN_OP_EQ_uxn_opcodes_h_l2042_c11_d5bf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2042_c11_d5bf_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2042_c11_d5bf_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2042_c7_477a]
signal n16_MUX_uxn_opcodes_h_l2042_c7_477a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2042_c7_477a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2042_c7_477a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2042_c7_477a_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2042_c7_477a]
signal tmp16_MUX_uxn_opcodes_h_l2042_c7_477a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2042_c7_477a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2042_c7_477a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2042_c7_477a_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2042_c7_477a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_477a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_477a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_477a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_477a_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2042_c7_477a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_477a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_477a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_477a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_477a_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2042_c7_477a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2042_c7_477a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2042_c7_477a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2042_c7_477a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2042_c7_477a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2042_c7_477a]
signal result_u8_value_MUX_uxn_opcodes_h_l2042_c7_477a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2042_c7_477a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2042_c7_477a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2042_c7_477a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2042_c7_477a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_477a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_477a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_477a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_477a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2042_c7_477a]
signal t16_MUX_uxn_opcodes_h_l2042_c7_477a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2042_c7_477a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2042_c7_477a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2042_c7_477a_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2043_c3_4a52]
signal BIN_OP_OR_uxn_opcodes_h_l2043_c3_4a52_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2043_c3_4a52_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2043_c3_4a52_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2046_c11_e673]
signal BIN_OP_EQ_uxn_opcodes_h_l2046_c11_e673_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2046_c11_e673_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2046_c11_e673_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2046_c7_ee3e]
signal n16_MUX_uxn_opcodes_h_l2046_c7_ee3e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2046_c7_ee3e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2046_c7_ee3e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2046_c7_ee3e_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2046_c7_ee3e]
signal tmp16_MUX_uxn_opcodes_h_l2046_c7_ee3e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2046_c7_ee3e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2046_c7_ee3e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2046_c7_ee3e_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2046_c7_ee3e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2046_c7_ee3e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2046_c7_ee3e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2046_c7_ee3e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2046_c7_ee3e_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2046_c7_ee3e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2046_c7_ee3e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2046_c7_ee3e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2046_c7_ee3e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2046_c7_ee3e_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2046_c7_ee3e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2046_c7_ee3e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2046_c7_ee3e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2046_c7_ee3e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2046_c7_ee3e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2046_c7_ee3e]
signal result_u8_value_MUX_uxn_opcodes_h_l2046_c7_ee3e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2046_c7_ee3e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2046_c7_ee3e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2046_c7_ee3e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2046_c7_ee3e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2046_c7_ee3e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2046_c7_ee3e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2046_c7_ee3e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2046_c7_ee3e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2050_c11_5892]
signal BIN_OP_EQ_uxn_opcodes_h_l2050_c11_5892_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2050_c11_5892_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2050_c11_5892_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2050_c7_487f]
signal n16_MUX_uxn_opcodes_h_l2050_c7_487f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2050_c7_487f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2050_c7_487f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2050_c7_487f_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2050_c7_487f]
signal tmp16_MUX_uxn_opcodes_h_l2050_c7_487f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2050_c7_487f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2050_c7_487f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2050_c7_487f_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2050_c7_487f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_487f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_487f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_487f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_487f_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2050_c7_487f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_487f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_487f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_487f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_487f_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2050_c7_487f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_487f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_487f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_487f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_487f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2050_c7_487f]
signal result_u8_value_MUX_uxn_opcodes_h_l2050_c7_487f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2050_c7_487f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2050_c7_487f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2050_c7_487f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2050_c7_487f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_487f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_487f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_487f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_487f_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2051_c3_4eba]
signal BIN_OP_OR_uxn_opcodes_h_l2051_c3_4eba_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2051_c3_4eba_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2051_c3_4eba_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2052_c11_5282]
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2052_c11_5282_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2052_c11_5282_right : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2052_c11_5282_return_output : unsigned(31 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2053_c30_98ba]
signal sp_relative_shift_uxn_opcodes_h_l2053_c30_98ba_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2053_c30_98ba_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2053_c30_98ba_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2053_c30_98ba_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2058_c11_d590]
signal BIN_OP_EQ_uxn_opcodes_h_l2058_c11_d590_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2058_c11_d590_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2058_c11_d590_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2058_c7_ca98]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_ca98_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_ca98_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_ca98_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_ca98_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2058_c7_ca98]
signal result_u8_value_MUX_uxn_opcodes_h_l2058_c7_ca98_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2058_c7_ca98_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2058_c7_ca98_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2058_c7_ca98_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2058_c7_ca98]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_ca98_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_ca98_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_ca98_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_ca98_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2058_c7_ca98]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_ca98_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_ca98_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_ca98_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_ca98_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2061_c31_0bf1]
signal CONST_SR_8_uxn_opcodes_h_l2061_c31_0bf1_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2061_c31_0bf1_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2039_l2048_DUPLICATE_90b9
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2039_l2048_DUPLICATE_90b9_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2039_l2048_DUPLICATE_90b9_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_188e( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_ram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2021_c6_cb00
BIN_OP_EQ_uxn_opcodes_h_l2021_c6_cb00 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2021_c6_cb00_left,
BIN_OP_EQ_uxn_opcodes_h_l2021_c6_cb00_right,
BIN_OP_EQ_uxn_opcodes_h_l2021_c6_cb00_return_output);

-- n16_MUX_uxn_opcodes_h_l2021_c2_a6f0
n16_MUX_uxn_opcodes_h_l2021_c2_a6f0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond,
n16_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue,
n16_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse,
n16_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2021_c2_a6f0
tmp16_MUX_uxn_opcodes_h_l2021_c2_a6f0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond,
tmp16_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue,
tmp16_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse,
tmp16_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2021_c2_a6f0
result_is_stack_write_MUX_uxn_opcodes_h_l2021_c2_a6f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2021_c2_a6f0
result_is_vram_write_MUX_uxn_opcodes_h_l2021_c2_a6f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2021_c2_a6f0
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2021_c2_a6f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2021_c2_a6f0
result_u8_value_MUX_uxn_opcodes_h_l2021_c2_a6f0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond,
result_u8_value_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2021_c2_a6f0
result_is_opc_done_MUX_uxn_opcodes_h_l2021_c2_a6f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c2_a6f0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c2_a6f0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2021_c2_a6f0
result_is_pc_updated_MUX_uxn_opcodes_h_l2021_c2_a6f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c2_a6f0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c2_a6f0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2021_c2_a6f0
result_is_ram_write_MUX_uxn_opcodes_h_l2021_c2_a6f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output);

-- t16_MUX_uxn_opcodes_h_l2021_c2_a6f0
t16_MUX_uxn_opcodes_h_l2021_c2_a6f0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond,
t16_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue,
t16_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse,
t16_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2034_c11_5651
BIN_OP_EQ_uxn_opcodes_h_l2034_c11_5651 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2034_c11_5651_left,
BIN_OP_EQ_uxn_opcodes_h_l2034_c11_5651_right,
BIN_OP_EQ_uxn_opcodes_h_l2034_c11_5651_return_output);

-- n16_MUX_uxn_opcodes_h_l2034_c7_1f3d
n16_MUX_uxn_opcodes_h_l2034_c7_1f3d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2034_c7_1f3d_cond,
n16_MUX_uxn_opcodes_h_l2034_c7_1f3d_iftrue,
n16_MUX_uxn_opcodes_h_l2034_c7_1f3d_iffalse,
n16_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2034_c7_1f3d
tmp16_MUX_uxn_opcodes_h_l2034_c7_1f3d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2034_c7_1f3d_cond,
tmp16_MUX_uxn_opcodes_h_l2034_c7_1f3d_iftrue,
tmp16_MUX_uxn_opcodes_h_l2034_c7_1f3d_iffalse,
tmp16_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_1f3d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_1f3d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_1f3d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_1f3d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_1f3d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_1f3d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_1f3d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_1f3d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_1f3d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_1f3d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_1f3d
result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_1f3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_1f3d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_1f3d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_1f3d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2034_c7_1f3d
result_u8_value_MUX_uxn_opcodes_h_l2034_c7_1f3d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2034_c7_1f3d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2034_c7_1f3d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2034_c7_1f3d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_1f3d
result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_1f3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_1f3d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_1f3d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_1f3d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output);

-- t16_MUX_uxn_opcodes_h_l2034_c7_1f3d
t16_MUX_uxn_opcodes_h_l2034_c7_1f3d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2034_c7_1f3d_cond,
t16_MUX_uxn_opcodes_h_l2034_c7_1f3d_iftrue,
t16_MUX_uxn_opcodes_h_l2034_c7_1f3d_iffalse,
t16_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2037_c11_2063
BIN_OP_EQ_uxn_opcodes_h_l2037_c11_2063 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2037_c11_2063_left,
BIN_OP_EQ_uxn_opcodes_h_l2037_c11_2063_right,
BIN_OP_EQ_uxn_opcodes_h_l2037_c11_2063_return_output);

-- n16_MUX_uxn_opcodes_h_l2037_c7_82bb
n16_MUX_uxn_opcodes_h_l2037_c7_82bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2037_c7_82bb_cond,
n16_MUX_uxn_opcodes_h_l2037_c7_82bb_iftrue,
n16_MUX_uxn_opcodes_h_l2037_c7_82bb_iffalse,
n16_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2037_c7_82bb
tmp16_MUX_uxn_opcodes_h_l2037_c7_82bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2037_c7_82bb_cond,
tmp16_MUX_uxn_opcodes_h_l2037_c7_82bb_iftrue,
tmp16_MUX_uxn_opcodes_h_l2037_c7_82bb_iffalse,
tmp16_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_82bb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_82bb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_82bb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_82bb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_82bb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_82bb
result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_82bb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_82bb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_82bb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_82bb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_82bb
result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_82bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_82bb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_82bb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_82bb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2037_c7_82bb
result_u8_value_MUX_uxn_opcodes_h_l2037_c7_82bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2037_c7_82bb_cond,
result_u8_value_MUX_uxn_opcodes_h_l2037_c7_82bb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2037_c7_82bb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_82bb
result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_82bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_82bb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_82bb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_82bb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output);

-- t16_MUX_uxn_opcodes_h_l2037_c7_82bb
t16_MUX_uxn_opcodes_h_l2037_c7_82bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2037_c7_82bb_cond,
t16_MUX_uxn_opcodes_h_l2037_c7_82bb_iftrue,
t16_MUX_uxn_opcodes_h_l2037_c7_82bb_iffalse,
t16_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2042_c11_d5bf
BIN_OP_EQ_uxn_opcodes_h_l2042_c11_d5bf : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2042_c11_d5bf_left,
BIN_OP_EQ_uxn_opcodes_h_l2042_c11_d5bf_right,
BIN_OP_EQ_uxn_opcodes_h_l2042_c11_d5bf_return_output);

-- n16_MUX_uxn_opcodes_h_l2042_c7_477a
n16_MUX_uxn_opcodes_h_l2042_c7_477a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2042_c7_477a_cond,
n16_MUX_uxn_opcodes_h_l2042_c7_477a_iftrue,
n16_MUX_uxn_opcodes_h_l2042_c7_477a_iffalse,
n16_MUX_uxn_opcodes_h_l2042_c7_477a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2042_c7_477a
tmp16_MUX_uxn_opcodes_h_l2042_c7_477a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2042_c7_477a_cond,
tmp16_MUX_uxn_opcodes_h_l2042_c7_477a_iftrue,
tmp16_MUX_uxn_opcodes_h_l2042_c7_477a_iffalse,
tmp16_MUX_uxn_opcodes_h_l2042_c7_477a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_477a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_477a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_477a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_477a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_477a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_477a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_477a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_477a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_477a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_477a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_477a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_477a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2042_c7_477a
result_is_stack_write_MUX_uxn_opcodes_h_l2042_c7_477a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2042_c7_477a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2042_c7_477a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2042_c7_477a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2042_c7_477a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2042_c7_477a
result_u8_value_MUX_uxn_opcodes_h_l2042_c7_477a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2042_c7_477a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2042_c7_477a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2042_c7_477a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2042_c7_477a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_477a
result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_477a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_477a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_477a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_477a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_477a_return_output);

-- t16_MUX_uxn_opcodes_h_l2042_c7_477a
t16_MUX_uxn_opcodes_h_l2042_c7_477a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2042_c7_477a_cond,
t16_MUX_uxn_opcodes_h_l2042_c7_477a_iftrue,
t16_MUX_uxn_opcodes_h_l2042_c7_477a_iffalse,
t16_MUX_uxn_opcodes_h_l2042_c7_477a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2043_c3_4a52
BIN_OP_OR_uxn_opcodes_h_l2043_c3_4a52 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2043_c3_4a52_left,
BIN_OP_OR_uxn_opcodes_h_l2043_c3_4a52_right,
BIN_OP_OR_uxn_opcodes_h_l2043_c3_4a52_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2046_c11_e673
BIN_OP_EQ_uxn_opcodes_h_l2046_c11_e673 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2046_c11_e673_left,
BIN_OP_EQ_uxn_opcodes_h_l2046_c11_e673_right,
BIN_OP_EQ_uxn_opcodes_h_l2046_c11_e673_return_output);

-- n16_MUX_uxn_opcodes_h_l2046_c7_ee3e
n16_MUX_uxn_opcodes_h_l2046_c7_ee3e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2046_c7_ee3e_cond,
n16_MUX_uxn_opcodes_h_l2046_c7_ee3e_iftrue,
n16_MUX_uxn_opcodes_h_l2046_c7_ee3e_iffalse,
n16_MUX_uxn_opcodes_h_l2046_c7_ee3e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2046_c7_ee3e
tmp16_MUX_uxn_opcodes_h_l2046_c7_ee3e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2046_c7_ee3e_cond,
tmp16_MUX_uxn_opcodes_h_l2046_c7_ee3e_iftrue,
tmp16_MUX_uxn_opcodes_h_l2046_c7_ee3e_iffalse,
tmp16_MUX_uxn_opcodes_h_l2046_c7_ee3e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2046_c7_ee3e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2046_c7_ee3e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2046_c7_ee3e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2046_c7_ee3e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2046_c7_ee3e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2046_c7_ee3e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2046_c7_ee3e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2046_c7_ee3e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2046_c7_ee3e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2046_c7_ee3e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2046_c7_ee3e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2046_c7_ee3e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2046_c7_ee3e
result_is_stack_write_MUX_uxn_opcodes_h_l2046_c7_ee3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2046_c7_ee3e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2046_c7_ee3e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2046_c7_ee3e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2046_c7_ee3e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2046_c7_ee3e
result_u8_value_MUX_uxn_opcodes_h_l2046_c7_ee3e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2046_c7_ee3e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2046_c7_ee3e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2046_c7_ee3e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2046_c7_ee3e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2046_c7_ee3e
result_is_opc_done_MUX_uxn_opcodes_h_l2046_c7_ee3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2046_c7_ee3e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2046_c7_ee3e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2046_c7_ee3e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2046_c7_ee3e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2050_c11_5892
BIN_OP_EQ_uxn_opcodes_h_l2050_c11_5892 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2050_c11_5892_left,
BIN_OP_EQ_uxn_opcodes_h_l2050_c11_5892_right,
BIN_OP_EQ_uxn_opcodes_h_l2050_c11_5892_return_output);

-- n16_MUX_uxn_opcodes_h_l2050_c7_487f
n16_MUX_uxn_opcodes_h_l2050_c7_487f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2050_c7_487f_cond,
n16_MUX_uxn_opcodes_h_l2050_c7_487f_iftrue,
n16_MUX_uxn_opcodes_h_l2050_c7_487f_iffalse,
n16_MUX_uxn_opcodes_h_l2050_c7_487f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2050_c7_487f
tmp16_MUX_uxn_opcodes_h_l2050_c7_487f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2050_c7_487f_cond,
tmp16_MUX_uxn_opcodes_h_l2050_c7_487f_iftrue,
tmp16_MUX_uxn_opcodes_h_l2050_c7_487f_iffalse,
tmp16_MUX_uxn_opcodes_h_l2050_c7_487f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_487f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_487f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_487f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_487f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_487f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_487f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_487f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_487f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_487f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_487f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_487f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_487f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_487f
result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_487f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_487f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_487f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_487f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_487f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2050_c7_487f
result_u8_value_MUX_uxn_opcodes_h_l2050_c7_487f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2050_c7_487f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2050_c7_487f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2050_c7_487f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2050_c7_487f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_487f
result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_487f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_487f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_487f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_487f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_487f_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2051_c3_4eba
BIN_OP_OR_uxn_opcodes_h_l2051_c3_4eba : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2051_c3_4eba_left,
BIN_OP_OR_uxn_opcodes_h_l2051_c3_4eba_right,
BIN_OP_OR_uxn_opcodes_h_l2051_c3_4eba_return_output);

-- BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2052_c11_5282
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2052_c11_5282 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2052_c11_5282_left,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2052_c11_5282_right,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2052_c11_5282_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2053_c30_98ba
sp_relative_shift_uxn_opcodes_h_l2053_c30_98ba : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2053_c30_98ba_ins,
sp_relative_shift_uxn_opcodes_h_l2053_c30_98ba_x,
sp_relative_shift_uxn_opcodes_h_l2053_c30_98ba_y,
sp_relative_shift_uxn_opcodes_h_l2053_c30_98ba_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2058_c11_d590
BIN_OP_EQ_uxn_opcodes_h_l2058_c11_d590 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2058_c11_d590_left,
BIN_OP_EQ_uxn_opcodes_h_l2058_c11_d590_right,
BIN_OP_EQ_uxn_opcodes_h_l2058_c11_d590_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_ca98
result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_ca98 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_ca98_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_ca98_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_ca98_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_ca98_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2058_c7_ca98
result_u8_value_MUX_uxn_opcodes_h_l2058_c7_ca98 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2058_c7_ca98_cond,
result_u8_value_MUX_uxn_opcodes_h_l2058_c7_ca98_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2058_c7_ca98_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2058_c7_ca98_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_ca98
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_ca98 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_ca98_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_ca98_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_ca98_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_ca98_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_ca98
result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_ca98 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_ca98_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_ca98_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_ca98_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_ca98_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2061_c31_0bf1
CONST_SR_8_uxn_opcodes_h_l2061_c31_0bf1 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2061_c31_0bf1_x,
CONST_SR_8_uxn_opcodes_h_l2061_c31_0bf1_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2039_l2048_DUPLICATE_90b9
CONST_SL_8_uint16_t_uxn_opcodes_h_l2039_l2048_DUPLICATE_90b9 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2039_l2048_DUPLICATE_90b9_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2039_l2048_DUPLICATE_90b9_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2021_c6_cb00_return_output,
 n16_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output,
 tmp16_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output,
 t16_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2034_c11_5651_return_output,
 n16_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output,
 tmp16_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output,
 t16_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2037_c11_2063_return_output,
 n16_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output,
 tmp16_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output,
 t16_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2042_c11_d5bf_return_output,
 n16_MUX_uxn_opcodes_h_l2042_c7_477a_return_output,
 tmp16_MUX_uxn_opcodes_h_l2042_c7_477a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_477a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_477a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2042_c7_477a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2042_c7_477a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_477a_return_output,
 t16_MUX_uxn_opcodes_h_l2042_c7_477a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2043_c3_4a52_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2046_c11_e673_return_output,
 n16_MUX_uxn_opcodes_h_l2046_c7_ee3e_return_output,
 tmp16_MUX_uxn_opcodes_h_l2046_c7_ee3e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2046_c7_ee3e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2046_c7_ee3e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2046_c7_ee3e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2046_c7_ee3e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2046_c7_ee3e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2050_c11_5892_return_output,
 n16_MUX_uxn_opcodes_h_l2050_c7_487f_return_output,
 tmp16_MUX_uxn_opcodes_h_l2050_c7_487f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_487f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_487f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_487f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2050_c7_487f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_487f_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2051_c3_4eba_return_output,
 BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2052_c11_5282_return_output,
 sp_relative_shift_uxn_opcodes_h_l2053_c30_98ba_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2058_c11_d590_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_ca98_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2058_c7_ca98_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_ca98_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_ca98_return_output,
 CONST_SR_8_uxn_opcodes_h_l2061_c31_0bf1_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2039_l2048_DUPLICATE_90b9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c6_cb00_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c6_cb00_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c6_cb00_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2021_c2_a6f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2021_c2_a6f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2026_c3_0256 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2021_c2_a6f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2031_c3_b7c0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2021_c2_a6f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_5651_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_5651_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_5651_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2034_c7_1f3d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2034_c7_1f3d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2034_c7_1f3d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_1f3d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_1f3d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_1f3d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_1f3d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2035_c3_9a1b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_1f3d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_1f3d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_1f3d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_1f3d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_1f3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_1f3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_1f3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_1f3d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_1f3d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_1f3d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_1f3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_1f3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_1f3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_1f3d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2034_c7_1f3d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2034_c7_1f3d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2034_c7_1f3d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_2063_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_2063_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_2063_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2037_c7_82bb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2037_c7_82bb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2042_c7_477a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2037_c7_82bb_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2037_c7_82bb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2037_c7_82bb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2042_c7_477a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2037_c7_82bb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_82bb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2040_c3_2059 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_82bb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_477a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_82bb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_82bb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_82bb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_477a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_82bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_82bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_82bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2042_c7_477a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_82bb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_82bb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_82bb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_477a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_82bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_82bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_82bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_477a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_82bb_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2037_c7_82bb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2037_c7_82bb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2042_c7_477a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2037_c7_82bb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_d5bf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_d5bf_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_d5bf_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2042_c7_477a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2042_c7_477a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2046_c7_ee3e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2042_c7_477a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2042_c7_477a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2042_c7_477a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2046_c7_ee3e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2042_c7_477a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_477a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2044_c3_6137 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_477a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2046_c7_ee3e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_477a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_477a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_477a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2046_c7_ee3e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_477a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2042_c7_477a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2042_c7_477a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2046_c7_ee3e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2042_c7_477a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_477a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_477a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2046_c7_ee3e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_477a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_477a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_477a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2046_c7_ee3e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_477a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2042_c7_477a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2042_c7_477a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2042_c7_477a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2043_c3_4a52_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2043_c3_4a52_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2043_c3_4a52_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_e673_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_e673_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_e673_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2046_c7_ee3e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2046_c7_ee3e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2050_c7_487f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2046_c7_ee3e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2046_c7_ee3e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2046_c7_ee3e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2050_c7_487f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2046_c7_ee3e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2046_c7_ee3e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2046_c7_ee3e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_487f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2046_c7_ee3e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2046_c7_ee3e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2046_c7_ee3e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_487f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2046_c7_ee3e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2046_c7_ee3e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2046_c7_ee3e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_487f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2046_c7_ee3e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2046_c7_ee3e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2046_c7_ee3e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2050_c7_487f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2046_c7_ee3e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2046_c7_ee3e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2046_c7_ee3e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_487f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2046_c7_ee3e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_5892_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_5892_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_5892_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2050_c7_487f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2050_c7_487f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2050_c7_487f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2050_c7_487f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l2052_c3_682e : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2050_c7_487f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2050_c7_487f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_487f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2055_c3_3401 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_487f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_ca98_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_487f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_487f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_487f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_ca98_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_487f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_487f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_487f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_487f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2050_c7_487f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2050_c7_487f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2058_c7_ca98_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2050_c7_487f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_487f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_487f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_ca98_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_487f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2051_c3_4eba_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2051_c3_4eba_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2051_c3_4eba_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2052_c11_5282_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2052_c11_5282_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2052_c11_5282_return_output : unsigned(31 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2053_c30_98ba_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2053_c30_98ba_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2053_c30_98ba_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2053_c30_98ba_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2056_c21_341e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_d590_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_d590_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_d590_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_ca98_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2059_c3_7abf : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_ca98_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_ca98_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2058_c7_ca98_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2058_c7_ca98_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2058_c7_ca98_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_ca98_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2060_c3_c083 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_ca98_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_ca98_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_ca98_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_ca98_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_ca98_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2061_c31_0bf1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2061_c31_0bf1_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2061_c21_b155_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2046_l2042_l2037_l2034_l2058_l2021_DUPLICATE_f371_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2046_l2042_l2037_l2034_l2058_DUPLICATE_8873_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2046_l2042_l2037_l2034_l2050_DUPLICATE_204d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2046_l2042_l2037_l2034_l2058_l2050_DUPLICATE_b4a5_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2038_l2051_l2043_l2047_DUPLICATE_fc68_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2039_l2048_DUPLICATE_90b9_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2039_l2048_DUPLICATE_90b9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2046_l2058_DUPLICATE_909c_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l2065_l2017_DUPLICATE_10da_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2035_c3_9a1b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_1f3d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2035_c3_9a1b;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_ca98_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_d590_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2031_c3_b7c0 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2031_c3_b7c0;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2060_c3_c083 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_ca98_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2060_c3_c083;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2040_c3_2059 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_82bb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2040_c3_2059;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2053_c30_98ba_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_487f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_2063_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2059_c3_7abf := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_ca98_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2059_c3_7abf;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c6_cb00_right := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2026_c3_0256 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2026_c3_0256;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2055_c3_3401 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_487f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2055_c3_3401;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_d5bf_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l2053_c30_98ba_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_e673_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2044_c3_6137 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_477a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2044_c3_6137;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_5892_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_5651_right := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2053_c30_98ba_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2051_c3_4eba_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2034_c7_1f3d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2037_c7_82bb_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2042_c7_477a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2050_c7_487f_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c6_cb00_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_5651_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_2063_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_d5bf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_e673_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_5892_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_d590_left := VAR_phase;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2052_c11_5282_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2043_c3_4a52_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2034_c7_1f3d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2042_c7_477a_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2061_c31_0bf1_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_1f3d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2037_c7_82bb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2042_c7_477a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2046_c7_ee3e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2050_c7_487f_iffalse := tmp16;
     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2021_c2_a6f0] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2021_c2_a6f0_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2050_c11_5892] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2050_c11_5892_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_5892_left;
     BIN_OP_EQ_uxn_opcodes_h_l2050_c11_5892_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_5892_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_5892_return_output := BIN_OP_EQ_uxn_opcodes_h_l2050_c11_5892_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2037_c11_2063] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2037_c11_2063_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_2063_left;
     BIN_OP_EQ_uxn_opcodes_h_l2037_c11_2063_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_2063_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_2063_return_output := BIN_OP_EQ_uxn_opcodes_h_l2037_c11_2063_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2046_c11_e673] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2046_c11_e673_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_e673_left;
     BIN_OP_EQ_uxn_opcodes_h_l2046_c11_e673_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_e673_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_e673_return_output := BIN_OP_EQ_uxn_opcodes_h_l2046_c11_e673_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2042_c11_d5bf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2042_c11_d5bf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_d5bf_left;
     BIN_OP_EQ_uxn_opcodes_h_l2042_c11_d5bf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_d5bf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_d5bf_return_output := BIN_OP_EQ_uxn_opcodes_h_l2042_c11_d5bf_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2053_c30_98ba] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2053_c30_98ba_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2053_c30_98ba_ins;
     sp_relative_shift_uxn_opcodes_h_l2053_c30_98ba_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2053_c30_98ba_x;
     sp_relative_shift_uxn_opcodes_h_l2053_c30_98ba_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2053_c30_98ba_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2053_c30_98ba_return_output := sp_relative_shift_uxn_opcodes_h_l2053_c30_98ba_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2038_l2051_l2043_l2047_DUPLICATE_fc68 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2038_l2051_l2043_l2047_DUPLICATE_fc68_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2021_c2_a6f0] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2021_c2_a6f0_return_output := result.is_pc_updated;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2021_c2_a6f0] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2021_c2_a6f0_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2034_c11_5651] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2034_c11_5651_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_5651_left;
     BIN_OP_EQ_uxn_opcodes_h_l2034_c11_5651_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_5651_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_5651_return_output := BIN_OP_EQ_uxn_opcodes_h_l2034_c11_5651_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2046_l2042_l2037_l2034_l2058_l2050_DUPLICATE_b4a5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2046_l2042_l2037_l2034_l2058_l2050_DUPLICATE_b4a5_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2046_l2042_l2037_l2034_l2058_l2021_DUPLICATE_f371 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2046_l2042_l2037_l2034_l2058_l2021_DUPLICATE_f371_return_output := result.u8_value;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2046_l2058_DUPLICATE_909c LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2046_l2058_DUPLICATE_909c_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2046_l2042_l2037_l2034_l2050_DUPLICATE_204d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2046_l2042_l2037_l2034_l2050_DUPLICATE_204d_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2021_c6_cb00] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2021_c6_cb00_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c6_cb00_left;
     BIN_OP_EQ_uxn_opcodes_h_l2021_c6_cb00_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c6_cb00_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c6_cb00_return_output := BIN_OP_EQ_uxn_opcodes_h_l2021_c6_cb00_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2058_c11_d590] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2058_c11_d590_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_d590_left;
     BIN_OP_EQ_uxn_opcodes_h_l2058_c11_d590_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_d590_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_d590_return_output := BIN_OP_EQ_uxn_opcodes_h_l2058_c11_d590_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2021_c2_a6f0] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2021_c2_a6f0_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2046_l2042_l2037_l2034_l2058_DUPLICATE_8873 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2046_l2042_l2037_l2034_l2058_DUPLICATE_8873_return_output := result.sp_relative_shift;

     -- CONST_SR_8[uxn_opcodes_h_l2061_c31_0bf1] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2061_c31_0bf1_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2061_c31_0bf1_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2061_c31_0bf1_return_output := CONST_SR_8_uxn_opcodes_h_l2061_c31_0bf1_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c6_cb00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c6_cb00_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c6_cb00_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c6_cb00_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c6_cb00_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c6_cb00_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c6_cb00_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c6_cb00_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c6_cb00_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c6_cb00_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c6_cb00_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c6_cb00_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2034_c7_1f3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_5651_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_1f3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_5651_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_1f3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_5651_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_1f3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_5651_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_1f3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_5651_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_1f3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_5651_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2034_c7_1f3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_5651_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_1f3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_5651_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2037_c7_82bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_2063_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_82bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_2063_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_82bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_2063_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_82bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_2063_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_82bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_2063_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_82bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_2063_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2037_c7_82bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_2063_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2037_c7_82bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_2063_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2042_c7_477a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_d5bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_477a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_d5bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2042_c7_477a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_d5bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_477a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_d5bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_477a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_d5bf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_477a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_d5bf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2042_c7_477a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_d5bf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2042_c7_477a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_d5bf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2046_c7_ee3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_e673_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2046_c7_ee3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_e673_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2046_c7_ee3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_e673_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2046_c7_ee3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_e673_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2046_c7_ee3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_e673_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2046_c7_ee3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_e673_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2046_c7_ee3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_e673_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2050_c7_487f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_5892_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_487f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_5892_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_487f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_5892_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_487f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_5892_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_487f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_5892_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2050_c7_487f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_5892_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2050_c7_487f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_5892_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_ca98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_d590_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_ca98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_d590_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_ca98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_d590_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2058_c7_ca98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_d590_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2043_c3_4a52_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2038_l2051_l2043_l2047_DUPLICATE_fc68_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2051_c3_4eba_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2038_l2051_l2043_l2047_DUPLICATE_fc68_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2039_l2048_DUPLICATE_90b9_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2038_l2051_l2043_l2047_DUPLICATE_fc68_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_1f3d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2046_l2042_l2037_l2034_l2058_DUPLICATE_8873_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_82bb_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2046_l2042_l2037_l2034_l2058_DUPLICATE_8873_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_477a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2046_l2042_l2037_l2034_l2058_DUPLICATE_8873_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2046_c7_ee3e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2046_l2042_l2037_l2034_l2058_DUPLICATE_8873_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_ca98_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2046_l2042_l2037_l2034_l2058_DUPLICATE_8873_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_1f3d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2046_l2042_l2037_l2034_l2058_l2050_DUPLICATE_b4a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_82bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2046_l2042_l2037_l2034_l2058_l2050_DUPLICATE_b4a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_477a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2046_l2042_l2037_l2034_l2058_l2050_DUPLICATE_b4a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2046_c7_ee3e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2046_l2042_l2037_l2034_l2058_l2050_DUPLICATE_b4a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_487f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2046_l2042_l2037_l2034_l2058_l2050_DUPLICATE_b4a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_ca98_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2046_l2042_l2037_l2034_l2058_l2050_DUPLICATE_b4a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_1f3d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2046_l2042_l2037_l2034_l2050_DUPLICATE_204d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_82bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2046_l2042_l2037_l2034_l2050_DUPLICATE_204d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2042_c7_477a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2046_l2042_l2037_l2034_l2050_DUPLICATE_204d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2046_c7_ee3e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2046_l2042_l2037_l2034_l2050_DUPLICATE_204d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_487f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2046_l2042_l2037_l2034_l2050_DUPLICATE_204d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2046_c7_ee3e_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2046_l2058_DUPLICATE_909c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_ca98_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2046_l2058_DUPLICATE_909c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2046_l2042_l2037_l2034_l2058_l2021_DUPLICATE_f371_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_1f3d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2046_l2042_l2037_l2034_l2058_l2021_DUPLICATE_f371_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_82bb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2046_l2042_l2037_l2034_l2058_l2021_DUPLICATE_f371_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_477a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2046_l2042_l2037_l2034_l2058_l2021_DUPLICATE_f371_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2046_c7_ee3e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2046_l2042_l2037_l2034_l2058_l2021_DUPLICATE_f371_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2058_c7_ca98_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2046_l2042_l2037_l2034_l2058_l2021_DUPLICATE_f371_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2021_c2_a6f0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2021_c2_a6f0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2021_c2_a6f0_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2021_c2_a6f0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_487f_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2053_c30_98ba_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2021_c2_a6f0] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2043_c3_4a52] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2043_c3_4a52_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2043_c3_4a52_left;
     BIN_OP_OR_uxn_opcodes_h_l2043_c3_4a52_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2043_c3_4a52_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2043_c3_4a52_return_output := BIN_OP_OR_uxn_opcodes_h_l2043_c3_4a52_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2050_c7_487f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_487f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_487f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_487f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_487f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_487f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_487f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_487f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_487f_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2061_c21_b155] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2061_c21_b155_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2061_c31_0bf1_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2058_c7_ca98] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_ca98_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_ca98_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_ca98_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_ca98_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_ca98_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_ca98_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_ca98_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_ca98_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2039_l2048_DUPLICATE_90b9 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2039_l2048_DUPLICATE_90b9_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2039_l2048_DUPLICATE_90b9_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2039_l2048_DUPLICATE_90b9_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2039_l2048_DUPLICATE_90b9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2058_c7_ca98] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_ca98_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_ca98_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_ca98_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_ca98_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_ca98_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_ca98_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_ca98_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_ca98_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2058_c7_ca98] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_ca98_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_ca98_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_ca98_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_ca98_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_ca98_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_ca98_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_ca98_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_ca98_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2021_c2_a6f0] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2051_c3_4eba] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2051_c3_4eba_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2051_c3_4eba_left;
     BIN_OP_OR_uxn_opcodes_h_l2051_c3_4eba_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2051_c3_4eba_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2051_c3_4eba_return_output := BIN_OP_OR_uxn_opcodes_h_l2051_c3_4eba_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2021_c2_a6f0] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2021_c2_a6f0] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2042_c7_477a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2043_c3_4a52_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2052_c11_5282_right := VAR_BIN_OP_OR_uxn_opcodes_h_l2051_c3_4eba_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2050_c7_487f_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2051_c3_4eba_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2058_c7_ca98_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2061_c21_b155_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2046_c7_ee3e_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2039_l2048_DUPLICATE_90b9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2037_c7_82bb_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2039_l2048_DUPLICATE_90b9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_487f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_ca98_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2046_c7_ee3e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_487f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_487f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_ca98_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_487f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_ca98_return_output;
     -- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2052_c11_5282] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2052_c11_5282_left <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2052_c11_5282_left;
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2052_c11_5282_right <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2052_c11_5282_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2052_c11_5282_return_output := BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2052_c11_5282_return_output;

     -- n16_MUX[uxn_opcodes_h_l2050_c7_487f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2050_c7_487f_cond <= VAR_n16_MUX_uxn_opcodes_h_l2050_c7_487f_cond;
     n16_MUX_uxn_opcodes_h_l2050_c7_487f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2050_c7_487f_iftrue;
     n16_MUX_uxn_opcodes_h_l2050_c7_487f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2050_c7_487f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2050_c7_487f_return_output := n16_MUX_uxn_opcodes_h_l2050_c7_487f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2050_c7_487f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_487f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_487f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_487f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_487f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_487f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_487f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_487f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_487f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2050_c7_487f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_487f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_487f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_487f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_487f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_487f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_487f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_487f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_487f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2050_c7_487f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_487f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_487f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_487f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_487f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_487f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_487f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_487f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_487f_return_output;

     -- t16_MUX[uxn_opcodes_h_l2042_c7_477a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2042_c7_477a_cond <= VAR_t16_MUX_uxn_opcodes_h_l2042_c7_477a_cond;
     t16_MUX_uxn_opcodes_h_l2042_c7_477a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2042_c7_477a_iftrue;
     t16_MUX_uxn_opcodes_h_l2042_c7_477a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2042_c7_477a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2042_c7_477a_return_output := t16_MUX_uxn_opcodes_h_l2042_c7_477a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2058_c7_ca98] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2058_c7_ca98_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2058_c7_ca98_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2058_c7_ca98_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2058_c7_ca98_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2058_c7_ca98_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2058_c7_ca98_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2058_c7_ca98_return_output := result_u8_value_MUX_uxn_opcodes_h_l2058_c7_ca98_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2046_c7_ee3e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2046_c7_ee3e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2046_c7_ee3e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2046_c7_ee3e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2046_c7_ee3e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2046_c7_ee3e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2046_c7_ee3e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2046_c7_ee3e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2046_c7_ee3e_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l2052_c3_682e := resize(VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2052_c11_5282_return_output, 16);
     VAR_n16_MUX_uxn_opcodes_h_l2046_c7_ee3e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2050_c7_487f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2046_c7_ee3e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_487f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2042_c7_477a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2046_c7_ee3e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2046_c7_ee3e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_487f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2046_c7_ee3e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_487f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2050_c7_487f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2058_c7_ca98_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2037_c7_82bb_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2042_c7_477a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2050_c7_487f_iftrue := VAR_tmp16_uxn_opcodes_h_l2052_c3_682e;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2046_c7_ee3e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2046_c7_ee3e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2046_c7_ee3e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2046_c7_ee3e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2046_c7_ee3e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2046_c7_ee3e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2046_c7_ee3e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2046_c7_ee3e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2046_c7_ee3e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2042_c7_477a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2042_c7_477a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2042_c7_477a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2042_c7_477a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2042_c7_477a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2042_c7_477a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2042_c7_477a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2042_c7_477a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2042_c7_477a_return_output;

     -- n16_MUX[uxn_opcodes_h_l2046_c7_ee3e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2046_c7_ee3e_cond <= VAR_n16_MUX_uxn_opcodes_h_l2046_c7_ee3e_cond;
     n16_MUX_uxn_opcodes_h_l2046_c7_ee3e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2046_c7_ee3e_iftrue;
     n16_MUX_uxn_opcodes_h_l2046_c7_ee3e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2046_c7_ee3e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2046_c7_ee3e_return_output := n16_MUX_uxn_opcodes_h_l2046_c7_ee3e_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2056_c21_341e] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2056_c21_341e_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l2052_c3_682e);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2046_c7_ee3e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2046_c7_ee3e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2046_c7_ee3e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2046_c7_ee3e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2046_c7_ee3e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2046_c7_ee3e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2046_c7_ee3e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2046_c7_ee3e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2046_c7_ee3e_return_output;

     -- t16_MUX[uxn_opcodes_h_l2037_c7_82bb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2037_c7_82bb_cond <= VAR_t16_MUX_uxn_opcodes_h_l2037_c7_82bb_cond;
     t16_MUX_uxn_opcodes_h_l2037_c7_82bb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2037_c7_82bb_iftrue;
     t16_MUX_uxn_opcodes_h_l2037_c7_82bb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2037_c7_82bb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output := t16_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2050_c7_487f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2050_c7_487f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2050_c7_487f_cond;
     tmp16_MUX_uxn_opcodes_h_l2050_c7_487f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2050_c7_487f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2050_c7_487f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2050_c7_487f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2050_c7_487f_return_output := tmp16_MUX_uxn_opcodes_h_l2050_c7_487f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2046_c7_ee3e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2046_c7_ee3e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2046_c7_ee3e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2046_c7_ee3e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2046_c7_ee3e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2046_c7_ee3e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2046_c7_ee3e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2046_c7_ee3e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2046_c7_ee3e_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2050_c7_487f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2056_c21_341e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2042_c7_477a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2046_c7_ee3e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_477a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2046_c7_ee3e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_82bb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2042_c7_477a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_477a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2046_c7_ee3e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_477a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2046_c7_ee3e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2034_c7_1f3d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2046_c7_ee3e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2050_c7_487f_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2046_c7_ee3e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2046_c7_ee3e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2046_c7_ee3e_cond;
     tmp16_MUX_uxn_opcodes_h_l2046_c7_ee3e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2046_c7_ee3e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2046_c7_ee3e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2046_c7_ee3e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2046_c7_ee3e_return_output := tmp16_MUX_uxn_opcodes_h_l2046_c7_ee3e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2042_c7_477a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_477a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_477a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_477a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_477a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_477a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_477a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_477a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_477a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2042_c7_477a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_477a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_477a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_477a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_477a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_477a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_477a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_477a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_477a_return_output;

     -- n16_MUX[uxn_opcodes_h_l2042_c7_477a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2042_c7_477a_cond <= VAR_n16_MUX_uxn_opcodes_h_l2042_c7_477a_cond;
     n16_MUX_uxn_opcodes_h_l2042_c7_477a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2042_c7_477a_iftrue;
     n16_MUX_uxn_opcodes_h_l2042_c7_477a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2042_c7_477a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2042_c7_477a_return_output := n16_MUX_uxn_opcodes_h_l2042_c7_477a_return_output;

     -- t16_MUX[uxn_opcodes_h_l2034_c7_1f3d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2034_c7_1f3d_cond <= VAR_t16_MUX_uxn_opcodes_h_l2034_c7_1f3d_cond;
     t16_MUX_uxn_opcodes_h_l2034_c7_1f3d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2034_c7_1f3d_iftrue;
     t16_MUX_uxn_opcodes_h_l2034_c7_1f3d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2034_c7_1f3d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output := t16_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2042_c7_477a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_477a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_477a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_477a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_477a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_477a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_477a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_477a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_477a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2050_c7_487f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2050_c7_487f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2050_c7_487f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2050_c7_487f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2050_c7_487f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2050_c7_487f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2050_c7_487f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2050_c7_487f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2050_c7_487f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2037_c7_82bb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_82bb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_82bb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_82bb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_82bb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_82bb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_82bb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2037_c7_82bb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2042_c7_477a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_82bb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_477a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_1f3d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_82bb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_477a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_82bb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_477a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2046_c7_ee3e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2050_c7_487f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2042_c7_477a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2046_c7_ee3e_return_output;
     -- n16_MUX[uxn_opcodes_h_l2037_c7_82bb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2037_c7_82bb_cond <= VAR_n16_MUX_uxn_opcodes_h_l2037_c7_82bb_cond;
     n16_MUX_uxn_opcodes_h_l2037_c7_82bb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2037_c7_82bb_iftrue;
     n16_MUX_uxn_opcodes_h_l2037_c7_82bb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2037_c7_82bb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output := n16_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2037_c7_82bb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_82bb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_82bb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_82bb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_82bb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_82bb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_82bb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2042_c7_477a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2042_c7_477a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2042_c7_477a_cond;
     tmp16_MUX_uxn_opcodes_h_l2042_c7_477a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2042_c7_477a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2042_c7_477a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2042_c7_477a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2042_c7_477a_return_output := tmp16_MUX_uxn_opcodes_h_l2042_c7_477a_return_output;

     -- t16_MUX[uxn_opcodes_h_l2021_c2_a6f0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond <= VAR_t16_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond;
     t16_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue;
     t16_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output := t16_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2034_c7_1f3d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_1f3d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_1f3d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_1f3d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_1f3d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_1f3d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_1f3d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2037_c7_82bb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_82bb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_82bb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_82bb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_82bb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_82bb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_82bb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2037_c7_82bb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_82bb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_82bb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_82bb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_82bb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_82bb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_82bb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2046_c7_ee3e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2046_c7_ee3e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2046_c7_ee3e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2046_c7_ee3e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2046_c7_ee3e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2046_c7_ee3e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2046_c7_ee3e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2046_c7_ee3e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2046_c7_ee3e_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2034_c7_1f3d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_1f3d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_1f3d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_1f3d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_477a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2046_c7_ee3e_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2037_c7_82bb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2042_c7_477a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2021_c2_a6f0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2042_c7_477a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2042_c7_477a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_477a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2042_c7_477a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_477a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2042_c7_477a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_477a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_477a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2042_c7_477a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2034_c7_1f3d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_1f3d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_1f3d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_1f3d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_1f3d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_1f3d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_1f3d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output;

     -- n16_MUX[uxn_opcodes_h_l2034_c7_1f3d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2034_c7_1f3d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2034_c7_1f3d_cond;
     n16_MUX_uxn_opcodes_h_l2034_c7_1f3d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2034_c7_1f3d_iftrue;
     n16_MUX_uxn_opcodes_h_l2034_c7_1f3d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2034_c7_1f3d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output := n16_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2034_c7_1f3d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_1f3d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_1f3d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_1f3d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_1f3d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_1f3d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_1f3d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2037_c7_82bb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2037_c7_82bb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2037_c7_82bb_cond;
     tmp16_MUX_uxn_opcodes_h_l2037_c7_82bb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2037_c7_82bb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2037_c7_82bb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2037_c7_82bb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output := tmp16_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2034_c7_1f3d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_1f3d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_1f3d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_1f3d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_1f3d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_1f3d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_1f3d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_82bb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_477a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_1f3d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2021_c2_a6f0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2034_c7_1f3d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2034_c7_1f3d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_1f3d_cond;
     tmp16_MUX_uxn_opcodes_h_l2034_c7_1f3d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_1f3d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2034_c7_1f3d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_1f3d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output := tmp16_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2021_c2_a6f0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output;

     -- n16_MUX[uxn_opcodes_h_l2021_c2_a6f0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond <= VAR_n16_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond;
     n16_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue;
     n16_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output := n16_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2021_c2_a6f0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2037_c7_82bb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2037_c7_82bb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_82bb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2037_c7_82bb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_82bb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2037_c7_82bb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_82bb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output := result_u8_value_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_1f3d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_82bb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2034_c7_1f3d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2034_c7_1f3d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_1f3d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2034_c7_1f3d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_1f3d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2034_c7_1f3d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_1f3d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2021_c2_a6f0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond;
     tmp16_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output := tmp16_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_1f3d_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2021_c2_a6f0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c2_a6f0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c2_a6f0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c2_a6f0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output := result_u8_value_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l2065_l2017_DUPLICATE_10da LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l2065_l2017_DUPLICATE_10da_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_188e(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2021_c2_a6f0_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l2065_l2017_DUPLICATE_10da_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l2065_l2017_DUPLICATE_10da_return_output;
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
