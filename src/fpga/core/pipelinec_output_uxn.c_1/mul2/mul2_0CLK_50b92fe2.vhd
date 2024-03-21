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
-- BIN_OP_EQ[uxn_opcodes_h_l2005_c6_2d92]
signal BIN_OP_EQ_uxn_opcodes_h_l2005_c6_2d92_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2005_c6_2d92_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2005_c6_2d92_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2005_c2_326e]
signal n16_MUX_uxn_opcodes_h_l2005_c2_326e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2005_c2_326e_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2005_c2_326e]
signal t16_MUX_uxn_opcodes_h_l2005_c2_326e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2005_c2_326e_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2005_c2_326e]
signal tmp16_MUX_uxn_opcodes_h_l2005_c2_326e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2005_c2_326e_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2005_c2_326e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_326e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_326e_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2005_c2_326e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_326e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_326e_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2005_c2_326e]
signal result_u8_value_MUX_uxn_opcodes_h_l2005_c2_326e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2005_c2_326e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2005_c2_326e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_326e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_326e_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2005_c2_326e]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_326e_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_326e_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2005_c2_326e]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_326e_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_326e_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2005_c2_326e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_326e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_326e_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2005_c2_326e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_326e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_326e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2005_c2_326e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_326e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_326e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2018_c11_f548]
signal BIN_OP_EQ_uxn_opcodes_h_l2018_c11_f548_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2018_c11_f548_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2018_c11_f548_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2018_c7_7f6b]
signal n16_MUX_uxn_opcodes_h_l2018_c7_7f6b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2018_c7_7f6b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2018_c7_7f6b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2018_c7_7f6b]
signal t16_MUX_uxn_opcodes_h_l2018_c7_7f6b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2018_c7_7f6b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2018_c7_7f6b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2018_c7_7f6b]
signal tmp16_MUX_uxn_opcodes_h_l2018_c7_7f6b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2018_c7_7f6b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2018_c7_7f6b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2018_c7_7f6b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_7f6b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_7f6b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_7f6b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2018_c7_7f6b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_7f6b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_7f6b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_7f6b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2018_c7_7f6b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_7f6b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_7f6b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_7f6b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2018_c7_7f6b]
signal result_u8_value_MUX_uxn_opcodes_h_l2018_c7_7f6b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2018_c7_7f6b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2018_c7_7f6b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2018_c7_7f6b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_7f6b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_7f6b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_7f6b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2021_c11_6162]
signal BIN_OP_EQ_uxn_opcodes_h_l2021_c11_6162_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2021_c11_6162_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2021_c11_6162_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2021_c7_afbe]
signal n16_MUX_uxn_opcodes_h_l2021_c7_afbe_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2021_c7_afbe_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2021_c7_afbe_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2021_c7_afbe]
signal t16_MUX_uxn_opcodes_h_l2021_c7_afbe_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2021_c7_afbe_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2021_c7_afbe_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2021_c7_afbe]
signal tmp16_MUX_uxn_opcodes_h_l2021_c7_afbe_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2021_c7_afbe_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2021_c7_afbe_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2021_c7_afbe]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_afbe_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_afbe_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_afbe_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2021_c7_afbe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_afbe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_afbe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_afbe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2021_c7_afbe]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_afbe_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_afbe_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_afbe_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2021_c7_afbe]
signal result_u8_value_MUX_uxn_opcodes_h_l2021_c7_afbe_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2021_c7_afbe_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2021_c7_afbe_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2021_c7_afbe]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_afbe_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_afbe_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_afbe_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2026_c11_3116]
signal BIN_OP_EQ_uxn_opcodes_h_l2026_c11_3116_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2026_c11_3116_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2026_c11_3116_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2026_c7_8596]
signal n16_MUX_uxn_opcodes_h_l2026_c7_8596_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2026_c7_8596_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2026_c7_8596_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2026_c7_8596_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2026_c7_8596]
signal t16_MUX_uxn_opcodes_h_l2026_c7_8596_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2026_c7_8596_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2026_c7_8596_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2026_c7_8596_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2026_c7_8596]
signal tmp16_MUX_uxn_opcodes_h_l2026_c7_8596_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2026_c7_8596_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2026_c7_8596_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2026_c7_8596_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2026_c7_8596]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_8596_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_8596_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_8596_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_8596_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2026_c7_8596]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_8596_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_8596_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_8596_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_8596_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2026_c7_8596]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_8596_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_8596_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_8596_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_8596_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2026_c7_8596]
signal result_u8_value_MUX_uxn_opcodes_h_l2026_c7_8596_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2026_c7_8596_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2026_c7_8596_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2026_c7_8596_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2026_c7_8596]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_8596_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_8596_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_8596_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_8596_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2027_c3_63d0]
signal BIN_OP_OR_uxn_opcodes_h_l2027_c3_63d0_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2027_c3_63d0_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2027_c3_63d0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2030_c11_f6a6]
signal BIN_OP_EQ_uxn_opcodes_h_l2030_c11_f6a6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2030_c11_f6a6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2030_c11_f6a6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2030_c7_83db]
signal n16_MUX_uxn_opcodes_h_l2030_c7_83db_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2030_c7_83db_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2030_c7_83db_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2030_c7_83db_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2030_c7_83db]
signal tmp16_MUX_uxn_opcodes_h_l2030_c7_83db_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2030_c7_83db_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2030_c7_83db_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2030_c7_83db_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2030_c7_83db]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_83db_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_83db_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_83db_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_83db_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2030_c7_83db]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_83db_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_83db_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_83db_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_83db_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2030_c7_83db]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_83db_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_83db_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_83db_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_83db_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2030_c7_83db]
signal result_u8_value_MUX_uxn_opcodes_h_l2030_c7_83db_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2030_c7_83db_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2030_c7_83db_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2030_c7_83db_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2030_c7_83db]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_83db_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_83db_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_83db_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_83db_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2034_c11_21d7]
signal BIN_OP_EQ_uxn_opcodes_h_l2034_c11_21d7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2034_c11_21d7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2034_c11_21d7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2034_c7_d0d4]
signal n16_MUX_uxn_opcodes_h_l2034_c7_d0d4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2034_c7_d0d4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2034_c7_d0d4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2034_c7_d0d4_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2034_c7_d0d4]
signal tmp16_MUX_uxn_opcodes_h_l2034_c7_d0d4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2034_c7_d0d4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2034_c7_d0d4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2034_c7_d0d4_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2034_c7_d0d4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_d0d4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_d0d4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_d0d4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_d0d4_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2034_c7_d0d4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_d0d4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_d0d4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_d0d4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_d0d4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2034_c7_d0d4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_d0d4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_d0d4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_d0d4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_d0d4_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2034_c7_d0d4]
signal result_u8_value_MUX_uxn_opcodes_h_l2034_c7_d0d4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2034_c7_d0d4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2034_c7_d0d4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2034_c7_d0d4_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2034_c7_d0d4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_d0d4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_d0d4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_d0d4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_d0d4_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2035_c3_dc56]
signal BIN_OP_OR_uxn_opcodes_h_l2035_c3_dc56_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2035_c3_dc56_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2035_c3_dc56_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2036_c11_f106]
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_f106_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_f106_right : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_f106_return_output : unsigned(31 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2037_c30_c054]
signal sp_relative_shift_uxn_opcodes_h_l2037_c30_c054_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2037_c30_c054_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2037_c30_c054_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2037_c30_c054_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2042_c11_e0d3]
signal BIN_OP_EQ_uxn_opcodes_h_l2042_c11_e0d3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2042_c11_e0d3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2042_c11_e0d3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2042_c7_c8e7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_c8e7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_c8e7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_c8e7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_c8e7_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2042_c7_c8e7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_c8e7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_c8e7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_c8e7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_c8e7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2042_c7_c8e7]
signal result_u8_value_MUX_uxn_opcodes_h_l2042_c7_c8e7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2042_c7_c8e7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2042_c7_c8e7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2042_c7_c8e7_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2042_c7_c8e7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_c8e7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_c8e7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_c8e7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_c8e7_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2045_c31_05ee]
signal CONST_SR_8_uxn_opcodes_h_l2045_c31_05ee_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2045_c31_05ee_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2032_l2023_DUPLICATE_5b6f
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2032_l2023_DUPLICATE_5b6f_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2032_l2023_DUPLICATE_5b6f_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2005_c6_2d92
BIN_OP_EQ_uxn_opcodes_h_l2005_c6_2d92 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2005_c6_2d92_left,
BIN_OP_EQ_uxn_opcodes_h_l2005_c6_2d92_right,
BIN_OP_EQ_uxn_opcodes_h_l2005_c6_2d92_return_output);

-- n16_MUX_uxn_opcodes_h_l2005_c2_326e
n16_MUX_uxn_opcodes_h_l2005_c2_326e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2005_c2_326e_cond,
n16_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue,
n16_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse,
n16_MUX_uxn_opcodes_h_l2005_c2_326e_return_output);

-- t16_MUX_uxn_opcodes_h_l2005_c2_326e
t16_MUX_uxn_opcodes_h_l2005_c2_326e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2005_c2_326e_cond,
t16_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue,
t16_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse,
t16_MUX_uxn_opcodes_h_l2005_c2_326e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2005_c2_326e
tmp16_MUX_uxn_opcodes_h_l2005_c2_326e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2005_c2_326e_cond,
tmp16_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue,
tmp16_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse,
tmp16_MUX_uxn_opcodes_h_l2005_c2_326e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_326e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_326e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_326e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_326e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_326e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_326e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_326e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_326e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2005_c2_326e
result_u8_value_MUX_uxn_opcodes_h_l2005_c2_326e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2005_c2_326e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2005_c2_326e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_326e
result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_326e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_326e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_326e_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_326e
result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_326e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_326e_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_326e_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_326e
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_326e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_326e_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_326e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_326e
result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_326e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_326e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_326e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_326e
result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_326e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_326e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_326e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_326e
result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_326e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_326e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_326e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2018_c11_f548
BIN_OP_EQ_uxn_opcodes_h_l2018_c11_f548 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2018_c11_f548_left,
BIN_OP_EQ_uxn_opcodes_h_l2018_c11_f548_right,
BIN_OP_EQ_uxn_opcodes_h_l2018_c11_f548_return_output);

-- n16_MUX_uxn_opcodes_h_l2018_c7_7f6b
n16_MUX_uxn_opcodes_h_l2018_c7_7f6b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2018_c7_7f6b_cond,
n16_MUX_uxn_opcodes_h_l2018_c7_7f6b_iftrue,
n16_MUX_uxn_opcodes_h_l2018_c7_7f6b_iffalse,
n16_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output);

-- t16_MUX_uxn_opcodes_h_l2018_c7_7f6b
t16_MUX_uxn_opcodes_h_l2018_c7_7f6b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2018_c7_7f6b_cond,
t16_MUX_uxn_opcodes_h_l2018_c7_7f6b_iftrue,
t16_MUX_uxn_opcodes_h_l2018_c7_7f6b_iffalse,
t16_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2018_c7_7f6b
tmp16_MUX_uxn_opcodes_h_l2018_c7_7f6b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2018_c7_7f6b_cond,
tmp16_MUX_uxn_opcodes_h_l2018_c7_7f6b_iftrue,
tmp16_MUX_uxn_opcodes_h_l2018_c7_7f6b_iffalse,
tmp16_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_7f6b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_7f6b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_7f6b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_7f6b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_7f6b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_7f6b
result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_7f6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_7f6b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_7f6b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_7f6b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_7f6b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_7f6b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_7f6b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_7f6b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_7f6b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2018_c7_7f6b
result_u8_value_MUX_uxn_opcodes_h_l2018_c7_7f6b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2018_c7_7f6b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2018_c7_7f6b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2018_c7_7f6b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_7f6b
result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_7f6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_7f6b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_7f6b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_7f6b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2021_c11_6162
BIN_OP_EQ_uxn_opcodes_h_l2021_c11_6162 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2021_c11_6162_left,
BIN_OP_EQ_uxn_opcodes_h_l2021_c11_6162_right,
BIN_OP_EQ_uxn_opcodes_h_l2021_c11_6162_return_output);

-- n16_MUX_uxn_opcodes_h_l2021_c7_afbe
n16_MUX_uxn_opcodes_h_l2021_c7_afbe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2021_c7_afbe_cond,
n16_MUX_uxn_opcodes_h_l2021_c7_afbe_iftrue,
n16_MUX_uxn_opcodes_h_l2021_c7_afbe_iffalse,
n16_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output);

-- t16_MUX_uxn_opcodes_h_l2021_c7_afbe
t16_MUX_uxn_opcodes_h_l2021_c7_afbe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2021_c7_afbe_cond,
t16_MUX_uxn_opcodes_h_l2021_c7_afbe_iftrue,
t16_MUX_uxn_opcodes_h_l2021_c7_afbe_iffalse,
t16_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2021_c7_afbe
tmp16_MUX_uxn_opcodes_h_l2021_c7_afbe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2021_c7_afbe_cond,
tmp16_MUX_uxn_opcodes_h_l2021_c7_afbe_iftrue,
tmp16_MUX_uxn_opcodes_h_l2021_c7_afbe_iffalse,
tmp16_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_afbe
result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_afbe : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_afbe_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_afbe_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_afbe_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_afbe
result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_afbe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_afbe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_afbe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_afbe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_afbe
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_afbe : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_afbe_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_afbe_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_afbe_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2021_c7_afbe
result_u8_value_MUX_uxn_opcodes_h_l2021_c7_afbe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2021_c7_afbe_cond,
result_u8_value_MUX_uxn_opcodes_h_l2021_c7_afbe_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2021_c7_afbe_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_afbe
result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_afbe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_afbe_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_afbe_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_afbe_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2026_c11_3116
BIN_OP_EQ_uxn_opcodes_h_l2026_c11_3116 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2026_c11_3116_left,
BIN_OP_EQ_uxn_opcodes_h_l2026_c11_3116_right,
BIN_OP_EQ_uxn_opcodes_h_l2026_c11_3116_return_output);

-- n16_MUX_uxn_opcodes_h_l2026_c7_8596
n16_MUX_uxn_opcodes_h_l2026_c7_8596 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2026_c7_8596_cond,
n16_MUX_uxn_opcodes_h_l2026_c7_8596_iftrue,
n16_MUX_uxn_opcodes_h_l2026_c7_8596_iffalse,
n16_MUX_uxn_opcodes_h_l2026_c7_8596_return_output);

-- t16_MUX_uxn_opcodes_h_l2026_c7_8596
t16_MUX_uxn_opcodes_h_l2026_c7_8596 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2026_c7_8596_cond,
t16_MUX_uxn_opcodes_h_l2026_c7_8596_iftrue,
t16_MUX_uxn_opcodes_h_l2026_c7_8596_iffalse,
t16_MUX_uxn_opcodes_h_l2026_c7_8596_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2026_c7_8596
tmp16_MUX_uxn_opcodes_h_l2026_c7_8596 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2026_c7_8596_cond,
tmp16_MUX_uxn_opcodes_h_l2026_c7_8596_iftrue,
tmp16_MUX_uxn_opcodes_h_l2026_c7_8596_iffalse,
tmp16_MUX_uxn_opcodes_h_l2026_c7_8596_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_8596
result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_8596 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_8596_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_8596_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_8596_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_8596_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_8596
result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_8596 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_8596_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_8596_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_8596_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_8596_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_8596
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_8596 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_8596_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_8596_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_8596_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_8596_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2026_c7_8596
result_u8_value_MUX_uxn_opcodes_h_l2026_c7_8596 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2026_c7_8596_cond,
result_u8_value_MUX_uxn_opcodes_h_l2026_c7_8596_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2026_c7_8596_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2026_c7_8596_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_8596
result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_8596 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_8596_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_8596_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_8596_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_8596_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2027_c3_63d0
BIN_OP_OR_uxn_opcodes_h_l2027_c3_63d0 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2027_c3_63d0_left,
BIN_OP_OR_uxn_opcodes_h_l2027_c3_63d0_right,
BIN_OP_OR_uxn_opcodes_h_l2027_c3_63d0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2030_c11_f6a6
BIN_OP_EQ_uxn_opcodes_h_l2030_c11_f6a6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2030_c11_f6a6_left,
BIN_OP_EQ_uxn_opcodes_h_l2030_c11_f6a6_right,
BIN_OP_EQ_uxn_opcodes_h_l2030_c11_f6a6_return_output);

-- n16_MUX_uxn_opcodes_h_l2030_c7_83db
n16_MUX_uxn_opcodes_h_l2030_c7_83db : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2030_c7_83db_cond,
n16_MUX_uxn_opcodes_h_l2030_c7_83db_iftrue,
n16_MUX_uxn_opcodes_h_l2030_c7_83db_iffalse,
n16_MUX_uxn_opcodes_h_l2030_c7_83db_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2030_c7_83db
tmp16_MUX_uxn_opcodes_h_l2030_c7_83db : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2030_c7_83db_cond,
tmp16_MUX_uxn_opcodes_h_l2030_c7_83db_iftrue,
tmp16_MUX_uxn_opcodes_h_l2030_c7_83db_iffalse,
tmp16_MUX_uxn_opcodes_h_l2030_c7_83db_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_83db
result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_83db : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_83db_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_83db_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_83db_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_83db_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_83db
result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_83db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_83db_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_83db_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_83db_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_83db_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_83db
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_83db : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_83db_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_83db_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_83db_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_83db_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2030_c7_83db
result_u8_value_MUX_uxn_opcodes_h_l2030_c7_83db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2030_c7_83db_cond,
result_u8_value_MUX_uxn_opcodes_h_l2030_c7_83db_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2030_c7_83db_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2030_c7_83db_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_83db
result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_83db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_83db_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_83db_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_83db_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_83db_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2034_c11_21d7
BIN_OP_EQ_uxn_opcodes_h_l2034_c11_21d7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2034_c11_21d7_left,
BIN_OP_EQ_uxn_opcodes_h_l2034_c11_21d7_right,
BIN_OP_EQ_uxn_opcodes_h_l2034_c11_21d7_return_output);

-- n16_MUX_uxn_opcodes_h_l2034_c7_d0d4
n16_MUX_uxn_opcodes_h_l2034_c7_d0d4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2034_c7_d0d4_cond,
n16_MUX_uxn_opcodes_h_l2034_c7_d0d4_iftrue,
n16_MUX_uxn_opcodes_h_l2034_c7_d0d4_iffalse,
n16_MUX_uxn_opcodes_h_l2034_c7_d0d4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2034_c7_d0d4
tmp16_MUX_uxn_opcodes_h_l2034_c7_d0d4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2034_c7_d0d4_cond,
tmp16_MUX_uxn_opcodes_h_l2034_c7_d0d4_iftrue,
tmp16_MUX_uxn_opcodes_h_l2034_c7_d0d4_iffalse,
tmp16_MUX_uxn_opcodes_h_l2034_c7_d0d4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_d0d4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_d0d4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_d0d4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_d0d4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_d0d4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_d0d4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_d0d4
result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_d0d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_d0d4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_d0d4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_d0d4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_d0d4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_d0d4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_d0d4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_d0d4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_d0d4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_d0d4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_d0d4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2034_c7_d0d4
result_u8_value_MUX_uxn_opcodes_h_l2034_c7_d0d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2034_c7_d0d4_cond,
result_u8_value_MUX_uxn_opcodes_h_l2034_c7_d0d4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2034_c7_d0d4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2034_c7_d0d4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_d0d4
result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_d0d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_d0d4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_d0d4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_d0d4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_d0d4_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2035_c3_dc56
BIN_OP_OR_uxn_opcodes_h_l2035_c3_dc56 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2035_c3_dc56_left,
BIN_OP_OR_uxn_opcodes_h_l2035_c3_dc56_right,
BIN_OP_OR_uxn_opcodes_h_l2035_c3_dc56_return_output);

-- BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_f106
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_f106 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_f106_left,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_f106_right,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_f106_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2037_c30_c054
sp_relative_shift_uxn_opcodes_h_l2037_c30_c054 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2037_c30_c054_ins,
sp_relative_shift_uxn_opcodes_h_l2037_c30_c054_x,
sp_relative_shift_uxn_opcodes_h_l2037_c30_c054_y,
sp_relative_shift_uxn_opcodes_h_l2037_c30_c054_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2042_c11_e0d3
BIN_OP_EQ_uxn_opcodes_h_l2042_c11_e0d3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2042_c11_e0d3_left,
BIN_OP_EQ_uxn_opcodes_h_l2042_c11_e0d3_right,
BIN_OP_EQ_uxn_opcodes_h_l2042_c11_e0d3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_c8e7
result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_c8e7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_c8e7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_c8e7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_c8e7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_c8e7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_c8e7
result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_c8e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_c8e7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_c8e7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_c8e7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_c8e7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2042_c7_c8e7
result_u8_value_MUX_uxn_opcodes_h_l2042_c7_c8e7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2042_c7_c8e7_cond,
result_u8_value_MUX_uxn_opcodes_h_l2042_c7_c8e7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2042_c7_c8e7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2042_c7_c8e7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_c8e7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_c8e7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_c8e7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_c8e7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_c8e7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_c8e7_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2045_c31_05ee
CONST_SR_8_uxn_opcodes_h_l2045_c31_05ee : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2045_c31_05ee_x,
CONST_SR_8_uxn_opcodes_h_l2045_c31_05ee_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2032_l2023_DUPLICATE_5b6f
CONST_SL_8_uint16_t_uxn_opcodes_h_l2032_l2023_DUPLICATE_5b6f : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2032_l2023_DUPLICATE_5b6f_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2032_l2023_DUPLICATE_5b6f_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2005_c6_2d92_return_output,
 n16_MUX_uxn_opcodes_h_l2005_c2_326e_return_output,
 t16_MUX_uxn_opcodes_h_l2005_c2_326e_return_output,
 tmp16_MUX_uxn_opcodes_h_l2005_c2_326e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_326e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_326e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2005_c2_326e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_326e_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_326e_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_326e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_326e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_326e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_326e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2018_c11_f548_return_output,
 n16_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output,
 t16_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output,
 tmp16_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2021_c11_6162_return_output,
 n16_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output,
 t16_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output,
 tmp16_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2026_c11_3116_return_output,
 n16_MUX_uxn_opcodes_h_l2026_c7_8596_return_output,
 t16_MUX_uxn_opcodes_h_l2026_c7_8596_return_output,
 tmp16_MUX_uxn_opcodes_h_l2026_c7_8596_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_8596_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_8596_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_8596_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2026_c7_8596_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_8596_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2027_c3_63d0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2030_c11_f6a6_return_output,
 n16_MUX_uxn_opcodes_h_l2030_c7_83db_return_output,
 tmp16_MUX_uxn_opcodes_h_l2030_c7_83db_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_83db_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_83db_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_83db_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2030_c7_83db_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_83db_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2034_c11_21d7_return_output,
 n16_MUX_uxn_opcodes_h_l2034_c7_d0d4_return_output,
 tmp16_MUX_uxn_opcodes_h_l2034_c7_d0d4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_d0d4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_d0d4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_d0d4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2034_c7_d0d4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_d0d4_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2035_c3_dc56_return_output,
 BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_f106_return_output,
 sp_relative_shift_uxn_opcodes_h_l2037_c30_c054_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2042_c11_e0d3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_c8e7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_c8e7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2042_c7_c8e7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_c8e7_return_output,
 CONST_SR_8_uxn_opcodes_h_l2045_c31_05ee_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2032_l2023_DUPLICATE_5b6f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_2d92_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_2d92_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_2d92_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2005_c2_326e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2005_c2_326e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2005_c2_326e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2005_c2_326e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2005_c2_326e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2005_c2_326e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2010_c3_5f86 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_326e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_326e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2015_c3_581d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_326e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_326e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c2_326e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c2_326e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_326e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_326e_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2005_c2_326e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_326e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_326e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2005_c2_326e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_326e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_326e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2005_c2_326e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_326e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_326e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2005_c2_326e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_326e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_326e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_326e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_326e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_f548_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_f548_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_f548_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2018_c7_7f6b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2018_c7_7f6b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2018_c7_7f6b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2018_c7_7f6b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2018_c7_7f6b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2018_c7_7f6b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2018_c7_7f6b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2018_c7_7f6b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2018_c7_7f6b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_7f6b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_7f6b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_7f6b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_7f6b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_7f6b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_7f6b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_7f6b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2019_c3_d9f0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_7f6b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_7f6b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2018_c7_7f6b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2018_c7_7f6b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2018_c7_7f6b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_7f6b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_7f6b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_7f6b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_6162_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_6162_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_6162_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2021_c7_afbe_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2021_c7_afbe_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2026_c7_8596_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2021_c7_afbe_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2021_c7_afbe_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2021_c7_afbe_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2026_c7_8596_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2021_c7_afbe_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_afbe_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_afbe_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2026_c7_8596_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_afbe_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_afbe_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_afbe_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_8596_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_afbe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_afbe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_afbe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_8596_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_afbe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_afbe_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2024_c3_cfcf : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_afbe_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_8596_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_afbe_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c7_afbe_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c7_afbe_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2026_c7_8596_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c7_afbe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_afbe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_afbe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_8596_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_afbe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_3116_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_3116_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_3116_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2026_c7_8596_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2026_c7_8596_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2030_c7_83db_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2026_c7_8596_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2026_c7_8596_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2026_c7_8596_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2026_c7_8596_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2026_c7_8596_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2026_c7_8596_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2030_c7_83db_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2026_c7_8596_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_8596_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_8596_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_83db_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_8596_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_8596_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_8596_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_83db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_8596_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_8596_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2028_c3_13cb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_8596_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_83db_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_8596_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2026_c7_8596_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2026_c7_8596_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2030_c7_83db_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2026_c7_8596_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_8596_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_8596_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_83db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_8596_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2027_c3_63d0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2027_c3_63d0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2027_c3_63d0_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_f6a6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_f6a6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_f6a6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2030_c7_83db_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2030_c7_83db_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2034_c7_d0d4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2030_c7_83db_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2030_c7_83db_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2030_c7_83db_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_d0d4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2030_c7_83db_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_83db_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_83db_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_d0d4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_83db_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_83db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_83db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_d0d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_83db_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_83db_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_83db_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_d0d4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_83db_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2030_c7_83db_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2030_c7_83db_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_d0d4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2030_c7_83db_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_83db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_83db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_d0d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_83db_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_21d7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_21d7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_21d7_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2034_c7_d0d4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2034_c7_d0d4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2034_c7_d0d4_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_d0d4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l2036_c3_41f9 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_d0d4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_d0d4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_d0d4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_d0d4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_c8e7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_d0d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_d0d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_d0d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_c8e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_d0d4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_d0d4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2039_c3_3e55 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_d0d4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_c8e7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_d0d4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_d0d4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_d0d4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_c8e7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_d0d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_d0d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_d0d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_d0d4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2035_c3_dc56_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2035_c3_dc56_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2035_c3_dc56_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_f106_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_f106_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_f106_return_output : unsigned(31 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2037_c30_c054_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2037_c30_c054_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2037_c30_c054_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2037_c30_c054_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2040_c21_1b70_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_e0d3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_e0d3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_e0d3_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_c8e7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2043_c3_a3c6 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_c8e7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_c8e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_c8e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_c8e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_c8e7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_c8e7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_c8e7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_c8e7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_c8e7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2044_c3_6203 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_c8e7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_c8e7_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2045_c31_05ee_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2045_c31_05ee_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2045_c21_9d51_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2042_l2030_l2026_l2021_l2018_l2005_DUPLICATE_d68a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2042_l2030_l2026_l2021_l2018_DUPLICATE_3ca9_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2042_l2034_l2030_l2026_l2021_l2018_DUPLICATE_3bb8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2034_l2030_l2026_l2021_l2018_DUPLICATE_13f4_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2027_l2022_l2031_l2035_DUPLICATE_4b24_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2032_l2023_DUPLICATE_5b6f_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2032_l2023_DUPLICATE_5b6f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2042_l2030_DUPLICATE_b83a_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l2049_l2001_DUPLICATE_9def_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2024_c3_cfcf := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_afbe_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2024_c3_cfcf;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_21d7_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2015_c3_581d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2015_c3_581d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_3116_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2044_c3_6203 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_c8e7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2044_c3_6203;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_d0d4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_6162_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l2037_c30_c054_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2019_c3_d9f0 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_7f6b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2019_c3_d9f0;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2039_c3_3e55 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_d0d4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2039_c3_3e55;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_f548_right := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2028_c3_13cb := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_8596_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2028_c3_13cb;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2010_c3_5f86 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2010_c3_5f86;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_2d92_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_e0d3_right := to_unsigned(6, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2037_c30_c054_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_c8e7_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_f6a6_right := to_unsigned(4, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2043_c3_a3c6 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_c8e7_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2043_c3_a3c6;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2037_c30_c054_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2035_c3_dc56_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2018_c7_7f6b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2021_c7_afbe_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2026_c7_8596_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2034_c7_d0d4_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_2d92_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_f548_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_6162_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_3116_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_f6a6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_21d7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_e0d3_left := VAR_phase;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_f106_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2027_c3_63d0_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2018_c7_7f6b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2026_c7_8596_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2045_c31_05ee_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2018_c7_7f6b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_afbe_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2026_c7_8596_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2030_c7_83db_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_d0d4_iffalse := tmp16;
     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2042_l2030_DUPLICATE_b83a LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2042_l2030_DUPLICATE_b83a_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2026_c11_3116] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2026_c11_3116_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_3116_left;
     BIN_OP_EQ_uxn_opcodes_h_l2026_c11_3116_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_3116_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_3116_return_output := BIN_OP_EQ_uxn_opcodes_h_l2026_c11_3116_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2042_c11_e0d3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2042_c11_e0d3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_e0d3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2042_c11_e0d3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_e0d3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_e0d3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2042_c11_e0d3_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2005_c2_326e] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2005_c2_326e_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2042_l2034_l2030_l2026_l2021_l2018_DUPLICATE_3bb8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2042_l2034_l2030_l2026_l2021_l2018_DUPLICATE_3bb8_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2021_c11_6162] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2021_c11_6162_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_6162_left;
     BIN_OP_EQ_uxn_opcodes_h_l2021_c11_6162_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_6162_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_6162_return_output := BIN_OP_EQ_uxn_opcodes_h_l2021_c11_6162_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2037_c30_c054] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2037_c30_c054_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2037_c30_c054_ins;
     sp_relative_shift_uxn_opcodes_h_l2037_c30_c054_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2037_c30_c054_x;
     sp_relative_shift_uxn_opcodes_h_l2037_c30_c054_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2037_c30_c054_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2037_c30_c054_return_output := sp_relative_shift_uxn_opcodes_h_l2037_c30_c054_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2045_c31_05ee] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2045_c31_05ee_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2045_c31_05ee_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2045_c31_05ee_return_output := CONST_SR_8_uxn_opcodes_h_l2045_c31_05ee_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2034_c11_21d7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2034_c11_21d7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_21d7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2034_c11_21d7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_21d7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_21d7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2034_c11_21d7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2005_c6_2d92] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2005_c6_2d92_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_2d92_left;
     BIN_OP_EQ_uxn_opcodes_h_l2005_c6_2d92_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_2d92_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_2d92_return_output := BIN_OP_EQ_uxn_opcodes_h_l2005_c6_2d92_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2018_c11_f548] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2018_c11_f548_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_f548_left;
     BIN_OP_EQ_uxn_opcodes_h_l2018_c11_f548_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_f548_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_f548_return_output := BIN_OP_EQ_uxn_opcodes_h_l2018_c11_f548_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2042_l2030_l2026_l2021_l2018_DUPLICATE_3ca9 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2042_l2030_l2026_l2021_l2018_DUPLICATE_3ca9_return_output := result.sp_relative_shift;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2005_c2_326e] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2005_c2_326e_return_output := result.is_stack_index_flipped;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2005_c2_326e] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2005_c2_326e_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2042_l2030_l2026_l2021_l2018_l2005_DUPLICATE_d68a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2042_l2030_l2026_l2021_l2018_l2005_DUPLICATE_d68a_return_output := result.u8_value;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2005_c2_326e] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2005_c2_326e_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2030_c11_f6a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2030_c11_f6a6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_f6a6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2030_c11_f6a6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_f6a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_f6a6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2030_c11_f6a6_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2027_l2022_l2031_l2035_DUPLICATE_4b24 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2027_l2022_l2031_l2035_DUPLICATE_4b24_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2034_l2030_l2026_l2021_l2018_DUPLICATE_13f4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2034_l2030_l2026_l2021_l2018_DUPLICATE_13f4_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2005_c2_326e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_2d92_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_326e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_2d92_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_326e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_2d92_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_326e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_2d92_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_326e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_2d92_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_326e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_2d92_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_326e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_2d92_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_326e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_2d92_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_326e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_2d92_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c2_326e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_2d92_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2005_c2_326e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_2d92_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2005_c2_326e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_2d92_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2018_c7_7f6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_f548_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_7f6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_f548_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_7f6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_f548_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_7f6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_f548_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_7f6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_f548_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2018_c7_7f6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_f548_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2018_c7_7f6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_f548_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2018_c7_7f6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_f548_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2021_c7_afbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_6162_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_afbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_6162_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_afbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_6162_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_afbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_6162_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_afbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_6162_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c7_afbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_6162_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2021_c7_afbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_6162_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_afbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_6162_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2026_c7_8596_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_3116_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_8596_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_3116_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_8596_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_3116_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_8596_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_3116_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_8596_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_3116_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2026_c7_8596_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_3116_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2026_c7_8596_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_3116_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2026_c7_8596_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_3116_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2030_c7_83db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_f6a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_83db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_f6a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_83db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_f6a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_83db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_f6a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_83db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_f6a6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2030_c7_83db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_f6a6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2030_c7_83db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_f6a6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2034_c7_d0d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_21d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_d0d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_21d7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_d0d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_21d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_d0d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_21d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_d0d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_21d7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_d0d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_21d7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_d0d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_21d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_c8e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_e0d3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_c8e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_e0d3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_c8e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_e0d3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_c8e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_e0d3_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2027_c3_63d0_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2027_l2022_l2031_l2035_DUPLICATE_4b24_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2035_c3_dc56_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2027_l2022_l2031_l2035_DUPLICATE_4b24_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2032_l2023_DUPLICATE_5b6f_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2027_l2022_l2031_l2035_DUPLICATE_4b24_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_7f6b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2042_l2030_l2026_l2021_l2018_DUPLICATE_3ca9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_afbe_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2042_l2030_l2026_l2021_l2018_DUPLICATE_3ca9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_8596_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2042_l2030_l2026_l2021_l2018_DUPLICATE_3ca9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_83db_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2042_l2030_l2026_l2021_l2018_DUPLICATE_3ca9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_c8e7_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2042_l2030_l2026_l2021_l2018_DUPLICATE_3ca9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_7f6b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2042_l2034_l2030_l2026_l2021_l2018_DUPLICATE_3bb8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_afbe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2042_l2034_l2030_l2026_l2021_l2018_DUPLICATE_3bb8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_8596_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2042_l2034_l2030_l2026_l2021_l2018_DUPLICATE_3bb8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_83db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2042_l2034_l2030_l2026_l2021_l2018_DUPLICATE_3bb8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_d0d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2042_l2034_l2030_l2026_l2021_l2018_DUPLICATE_3bb8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_c8e7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2042_l2034_l2030_l2026_l2021_l2018_DUPLICATE_3bb8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_7f6b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2034_l2030_l2026_l2021_l2018_DUPLICATE_13f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_afbe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2034_l2030_l2026_l2021_l2018_DUPLICATE_13f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_8596_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2034_l2030_l2026_l2021_l2018_DUPLICATE_13f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_83db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2034_l2030_l2026_l2021_l2018_DUPLICATE_13f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_d0d4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2034_l2030_l2026_l2021_l2018_DUPLICATE_13f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_83db_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2042_l2030_DUPLICATE_b83a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_c8e7_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2042_l2030_DUPLICATE_b83a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2042_l2030_l2026_l2021_l2018_l2005_DUPLICATE_d68a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2018_c7_7f6b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2042_l2030_l2026_l2021_l2018_l2005_DUPLICATE_d68a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c7_afbe_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2042_l2030_l2026_l2021_l2018_l2005_DUPLICATE_d68a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2026_c7_8596_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2042_l2030_l2026_l2021_l2018_l2005_DUPLICATE_d68a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2030_c7_83db_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2042_l2030_l2026_l2021_l2018_l2005_DUPLICATE_d68a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_c8e7_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2042_l2030_l2026_l2021_l2018_l2005_DUPLICATE_d68a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2005_c2_326e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2005_c2_326e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2005_c2_326e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2005_c2_326e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_d0d4_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2037_c30_c054_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2027_c3_63d0] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2027_c3_63d0_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2027_c3_63d0_left;
     BIN_OP_OR_uxn_opcodes_h_l2027_c3_63d0_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2027_c3_63d0_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2027_c3_63d0_return_output := BIN_OP_OR_uxn_opcodes_h_l2027_c3_63d0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2042_c7_c8e7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_c8e7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_c8e7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_c8e7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_c8e7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_c8e7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_c8e7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_c8e7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_c8e7_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2045_c21_9d51] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2045_c21_9d51_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2045_c31_05ee_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2042_c7_c8e7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_c8e7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_c8e7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_c8e7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_c8e7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_c8e7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_c8e7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_c8e7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_c8e7_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2005_c2_326e] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_326e_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_326e_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_326e_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_326e_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2005_c2_326e] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_326e_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_326e_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_326e_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_326e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2005_c2_326e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_326e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_326e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_326e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_326e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2035_c3_dc56] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2035_c3_dc56_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2035_c3_dc56_left;
     BIN_OP_OR_uxn_opcodes_h_l2035_c3_dc56_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2035_c3_dc56_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2035_c3_dc56_return_output := BIN_OP_OR_uxn_opcodes_h_l2035_c3_dc56_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2032_l2023_DUPLICATE_5b6f LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2032_l2023_DUPLICATE_5b6f_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2032_l2023_DUPLICATE_5b6f_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2032_l2023_DUPLICATE_5b6f_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2032_l2023_DUPLICATE_5b6f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2042_c7_c8e7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_c8e7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_c8e7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_c8e7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_c8e7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_c8e7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_c8e7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_c8e7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_c8e7_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2005_c2_326e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_326e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_326e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_326e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_326e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2034_c7_d0d4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_d0d4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_d0d4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_d0d4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_d0d4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_d0d4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_d0d4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_d0d4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_d0d4_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2026_c7_8596_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2027_c3_63d0_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_f106_right := VAR_BIN_OP_OR_uxn_opcodes_h_l2035_c3_dc56_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2034_c7_d0d4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2035_c3_dc56_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_c8e7_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2045_c21_9d51_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2030_c7_83db_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2032_l2023_DUPLICATE_5b6f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2021_c7_afbe_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2032_l2023_DUPLICATE_5b6f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_d0d4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_c8e7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_83db_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_d0d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_d0d4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_c8e7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_d0d4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_c8e7_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2042_c7_c8e7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2042_c7_c8e7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_c8e7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2042_c7_c8e7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_c8e7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2042_c7_c8e7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_c8e7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_c8e7_return_output := result_u8_value_MUX_uxn_opcodes_h_l2042_c7_c8e7_return_output;

     -- n16_MUX[uxn_opcodes_h_l2034_c7_d0d4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2034_c7_d0d4_cond <= VAR_n16_MUX_uxn_opcodes_h_l2034_c7_d0d4_cond;
     n16_MUX_uxn_opcodes_h_l2034_c7_d0d4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2034_c7_d0d4_iftrue;
     n16_MUX_uxn_opcodes_h_l2034_c7_d0d4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2034_c7_d0d4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2034_c7_d0d4_return_output := n16_MUX_uxn_opcodes_h_l2034_c7_d0d4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2034_c7_d0d4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_d0d4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_d0d4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_d0d4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_d0d4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_d0d4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_d0d4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_d0d4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_d0d4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2030_c7_83db] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_83db_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_83db_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_83db_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_83db_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_83db_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_83db_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_83db_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_83db_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2034_c7_d0d4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_d0d4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_d0d4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_d0d4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_d0d4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_d0d4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_d0d4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_d0d4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_d0d4_return_output;

     -- t16_MUX[uxn_opcodes_h_l2026_c7_8596] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2026_c7_8596_cond <= VAR_t16_MUX_uxn_opcodes_h_l2026_c7_8596_cond;
     t16_MUX_uxn_opcodes_h_l2026_c7_8596_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2026_c7_8596_iftrue;
     t16_MUX_uxn_opcodes_h_l2026_c7_8596_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2026_c7_8596_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2026_c7_8596_return_output := t16_MUX_uxn_opcodes_h_l2026_c7_8596_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2034_c7_d0d4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_d0d4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_d0d4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_d0d4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_d0d4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_d0d4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_d0d4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_d0d4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_d0d4_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2036_c11_f106] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_f106_left <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_f106_left;
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_f106_right <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_f106_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_f106_return_output := BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_f106_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l2036_c3_41f9 := resize(VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_f106_return_output, 16);
     VAR_n16_MUX_uxn_opcodes_h_l2030_c7_83db_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2034_c7_d0d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_83db_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_d0d4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_8596_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_83db_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_83db_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_d0d4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_83db_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_d0d4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_d0d4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_c8e7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2021_c7_afbe_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2026_c7_8596_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_d0d4_iftrue := VAR_tmp16_uxn_opcodes_h_l2036_c3_41f9;
     -- t16_MUX[uxn_opcodes_h_l2021_c7_afbe] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2021_c7_afbe_cond <= VAR_t16_MUX_uxn_opcodes_h_l2021_c7_afbe_cond;
     t16_MUX_uxn_opcodes_h_l2021_c7_afbe_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2021_c7_afbe_iftrue;
     t16_MUX_uxn_opcodes_h_l2021_c7_afbe_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2021_c7_afbe_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output := t16_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2030_c7_83db] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_83db_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_83db_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_83db_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_83db_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_83db_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_83db_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_83db_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_83db_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2040_c21_1b70] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2040_c21_1b70_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l2036_c3_41f9);

     -- tmp16_MUX[uxn_opcodes_h_l2034_c7_d0d4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2034_c7_d0d4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_d0d4_cond;
     tmp16_MUX_uxn_opcodes_h_l2034_c7_d0d4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_d0d4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2034_c7_d0d4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_d0d4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_d0d4_return_output := tmp16_MUX_uxn_opcodes_h_l2034_c7_d0d4_return_output;

     -- n16_MUX[uxn_opcodes_h_l2030_c7_83db] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2030_c7_83db_cond <= VAR_n16_MUX_uxn_opcodes_h_l2030_c7_83db_cond;
     n16_MUX_uxn_opcodes_h_l2030_c7_83db_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2030_c7_83db_iftrue;
     n16_MUX_uxn_opcodes_h_l2030_c7_83db_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2030_c7_83db_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2030_c7_83db_return_output := n16_MUX_uxn_opcodes_h_l2030_c7_83db_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2030_c7_83db] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_83db_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_83db_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_83db_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_83db_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_83db_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_83db_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_83db_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_83db_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2030_c7_83db] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_83db_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_83db_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_83db_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_83db_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_83db_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_83db_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_83db_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_83db_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2026_c7_8596] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_8596_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_8596_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_8596_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_8596_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_8596_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_8596_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_8596_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_8596_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_d0d4_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2040_c21_1b70_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2026_c7_8596_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2030_c7_83db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_8596_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_83db_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_afbe_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_8596_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_8596_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_83db_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_8596_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_83db_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2018_c7_7f6b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2030_c7_83db_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_d0d4_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2021_c7_afbe] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_afbe_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_afbe_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_afbe_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_afbe_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_afbe_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_afbe_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output;

     -- t16_MUX[uxn_opcodes_h_l2018_c7_7f6b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2018_c7_7f6b_cond <= VAR_t16_MUX_uxn_opcodes_h_l2018_c7_7f6b_cond;
     t16_MUX_uxn_opcodes_h_l2018_c7_7f6b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2018_c7_7f6b_iftrue;
     t16_MUX_uxn_opcodes_h_l2018_c7_7f6b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2018_c7_7f6b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output := t16_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2030_c7_83db] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2030_c7_83db_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2030_c7_83db_cond;
     tmp16_MUX_uxn_opcodes_h_l2030_c7_83db_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2030_c7_83db_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2030_c7_83db_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2030_c7_83db_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2030_c7_83db_return_output := tmp16_MUX_uxn_opcodes_h_l2030_c7_83db_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2026_c7_8596] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_8596_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_8596_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_8596_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_8596_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_8596_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_8596_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_8596_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_8596_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2026_c7_8596] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_8596_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_8596_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_8596_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_8596_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_8596_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_8596_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_8596_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_8596_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2034_c7_d0d4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2034_c7_d0d4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_d0d4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2034_c7_d0d4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_d0d4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2034_c7_d0d4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_d0d4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_d0d4_return_output := result_u8_value_MUX_uxn_opcodes_h_l2034_c7_d0d4_return_output;

     -- n16_MUX[uxn_opcodes_h_l2026_c7_8596] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2026_c7_8596_cond <= VAR_n16_MUX_uxn_opcodes_h_l2026_c7_8596_cond;
     n16_MUX_uxn_opcodes_h_l2026_c7_8596_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2026_c7_8596_iftrue;
     n16_MUX_uxn_opcodes_h_l2026_c7_8596_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2026_c7_8596_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2026_c7_8596_return_output := n16_MUX_uxn_opcodes_h_l2026_c7_8596_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2026_c7_8596] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_8596_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_8596_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_8596_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_8596_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_8596_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_8596_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_8596_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_8596_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2021_c7_afbe_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2026_c7_8596_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_afbe_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_8596_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_7f6b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_afbe_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_8596_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_afbe_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_8596_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2030_c7_83db_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_d0d4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2026_c7_8596_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2030_c7_83db_return_output;
     -- t16_MUX[uxn_opcodes_h_l2005_c2_326e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2005_c2_326e_cond <= VAR_t16_MUX_uxn_opcodes_h_l2005_c2_326e_cond;
     t16_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue;
     t16_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2005_c2_326e_return_output := t16_MUX_uxn_opcodes_h_l2005_c2_326e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2021_c7_afbe] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_afbe_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_afbe_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_afbe_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_afbe_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_afbe_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_afbe_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2021_c7_afbe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_afbe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_afbe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_afbe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_afbe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_afbe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_afbe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2018_c7_7f6b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_7f6b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_7f6b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_7f6b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_7f6b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_7f6b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_7f6b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2021_c7_afbe] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_afbe_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_afbe_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_afbe_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_afbe_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_afbe_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_afbe_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output;

     -- n16_MUX[uxn_opcodes_h_l2021_c7_afbe] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2021_c7_afbe_cond <= VAR_n16_MUX_uxn_opcodes_h_l2021_c7_afbe_cond;
     n16_MUX_uxn_opcodes_h_l2021_c7_afbe_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2021_c7_afbe_iftrue;
     n16_MUX_uxn_opcodes_h_l2021_c7_afbe_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2021_c7_afbe_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output := n16_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2026_c7_8596] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2026_c7_8596_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2026_c7_8596_cond;
     tmp16_MUX_uxn_opcodes_h_l2026_c7_8596_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2026_c7_8596_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2026_c7_8596_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2026_c7_8596_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2026_c7_8596_return_output := tmp16_MUX_uxn_opcodes_h_l2026_c7_8596_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2030_c7_83db] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2030_c7_83db_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2030_c7_83db_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2030_c7_83db_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2030_c7_83db_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2030_c7_83db_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2030_c7_83db_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2030_c7_83db_return_output := result_u8_value_MUX_uxn_opcodes_h_l2030_c7_83db_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2018_c7_7f6b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_7f6b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_7f6b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_7f6b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2026_c7_8596_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2030_c7_83db_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2005_c2_326e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_afbe_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2026_c7_8596_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2018_c7_7f6b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_7f6b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_7f6b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_7f6b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_7f6b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_7f6b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_7f6b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2026_c7_8596] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2026_c7_8596_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2026_c7_8596_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2026_c7_8596_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2026_c7_8596_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2026_c7_8596_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2026_c7_8596_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2026_c7_8596_return_output := result_u8_value_MUX_uxn_opcodes_h_l2026_c7_8596_return_output;

     -- n16_MUX[uxn_opcodes_h_l2018_c7_7f6b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2018_c7_7f6b_cond <= VAR_n16_MUX_uxn_opcodes_h_l2018_c7_7f6b_cond;
     n16_MUX_uxn_opcodes_h_l2018_c7_7f6b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2018_c7_7f6b_iftrue;
     n16_MUX_uxn_opcodes_h_l2018_c7_7f6b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2018_c7_7f6b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output := n16_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2021_c7_afbe] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2021_c7_afbe_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_afbe_cond;
     tmp16_MUX_uxn_opcodes_h_l2021_c7_afbe_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_afbe_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2021_c7_afbe_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_afbe_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output := tmp16_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2005_c2_326e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_326e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_326e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_326e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_326e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2018_c7_7f6b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_7f6b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_7f6b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_7f6b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_7f6b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_7f6b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_7f6b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2018_c7_7f6b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_7f6b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_7f6b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_7f6b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_7f6b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_7f6b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_7f6b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c7_afbe_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2026_c7_8596_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2018_c7_7f6b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2021_c7_afbe] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2021_c7_afbe_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c7_afbe_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2021_c7_afbe_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c7_afbe_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2021_c7_afbe_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c7_afbe_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output := result_u8_value_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2005_c2_326e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_326e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_326e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_326e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_326e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2018_c7_7f6b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2018_c7_7f6b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2018_c7_7f6b_cond;
     tmp16_MUX_uxn_opcodes_h_l2018_c7_7f6b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2018_c7_7f6b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2018_c7_7f6b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2018_c7_7f6b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output := tmp16_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2005_c2_326e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_326e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_326e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_326e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_326e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2005_c2_326e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_326e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_326e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_326e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_326e_return_output;

     -- n16_MUX[uxn_opcodes_h_l2005_c2_326e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2005_c2_326e_cond <= VAR_n16_MUX_uxn_opcodes_h_l2005_c2_326e_cond;
     n16_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue;
     n16_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2005_c2_326e_return_output := n16_MUX_uxn_opcodes_h_l2005_c2_326e_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2005_c2_326e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2018_c7_7f6b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c7_afbe_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2018_c7_7f6b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2018_c7_7f6b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2018_c7_7f6b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2018_c7_7f6b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2018_c7_7f6b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2018_c7_7f6b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2018_c7_7f6b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2005_c2_326e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2005_c2_326e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2005_c2_326e_cond;
     tmp16_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2005_c2_326e_return_output := tmp16_MUX_uxn_opcodes_h_l2005_c2_326e_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2018_c7_7f6b_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2005_c2_326e_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2005_c2_326e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2005_c2_326e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c2_326e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c2_326e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c2_326e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c2_326e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2005_c2_326e_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l2049_l2001_DUPLICATE_9def LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l2049_l2001_DUPLICATE_9def_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a6df(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_326e_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_326e_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c2_326e_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_326e_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_326e_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_326e_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_326e_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_326e_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_326e_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l2049_l2001_DUPLICATE_9def_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l2049_l2001_DUPLICATE_9def_return_output;
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
