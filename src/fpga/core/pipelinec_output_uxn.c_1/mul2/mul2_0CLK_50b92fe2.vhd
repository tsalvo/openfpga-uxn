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
-- BIN_OP_EQ[uxn_opcodes_h_l2005_c6_e2ea]
signal BIN_OP_EQ_uxn_opcodes_h_l2005_c6_e2ea_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2005_c6_e2ea_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2005_c6_e2ea_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2005_c2_0581]
signal result_u8_value_MUX_uxn_opcodes_h_l2005_c2_0581_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2005_c2_0581_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2005_c2_0581]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_0581_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_0581_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2005_c2_0581]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_0581_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_0581_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2005_c2_0581]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_0581_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_0581_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2005_c2_0581]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_0581_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_0581_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2005_c2_0581]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_0581_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_0581_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2005_c2_0581]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_0581_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_0581_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2005_c2_0581]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_0581_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_0581_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2005_c2_0581]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_0581_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_0581_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2005_c2_0581]
signal tmp16_MUX_uxn_opcodes_h_l2005_c2_0581_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2005_c2_0581_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2005_c2_0581]
signal n16_MUX_uxn_opcodes_h_l2005_c2_0581_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2005_c2_0581_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2005_c2_0581]
signal t16_MUX_uxn_opcodes_h_l2005_c2_0581_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2005_c2_0581_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2018_c11_4e0a]
signal BIN_OP_EQ_uxn_opcodes_h_l2018_c11_4e0a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2018_c11_4e0a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2018_c11_4e0a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2018_c7_1de1]
signal result_u8_value_MUX_uxn_opcodes_h_l2018_c7_1de1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2018_c7_1de1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2018_c7_1de1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2018_c7_1de1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_1de1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_1de1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_1de1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2018_c7_1de1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_1de1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_1de1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_1de1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2018_c7_1de1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_1de1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_1de1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_1de1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2018_c7_1de1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_1de1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_1de1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_1de1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2018_c7_1de1]
signal tmp16_MUX_uxn_opcodes_h_l2018_c7_1de1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2018_c7_1de1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2018_c7_1de1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2018_c7_1de1]
signal n16_MUX_uxn_opcodes_h_l2018_c7_1de1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2018_c7_1de1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2018_c7_1de1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2018_c7_1de1]
signal t16_MUX_uxn_opcodes_h_l2018_c7_1de1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2018_c7_1de1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2018_c7_1de1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2021_c11_eff2]
signal BIN_OP_EQ_uxn_opcodes_h_l2021_c11_eff2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2021_c11_eff2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2021_c11_eff2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2021_c7_b0f4]
signal result_u8_value_MUX_uxn_opcodes_h_l2021_c7_b0f4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2021_c7_b0f4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2021_c7_b0f4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2021_c7_b0f4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_b0f4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_b0f4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_b0f4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2021_c7_b0f4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_b0f4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_b0f4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_b0f4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2021_c7_b0f4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_b0f4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_b0f4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_b0f4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2021_c7_b0f4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_b0f4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_b0f4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_b0f4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2021_c7_b0f4]
signal tmp16_MUX_uxn_opcodes_h_l2021_c7_b0f4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2021_c7_b0f4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2021_c7_b0f4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2021_c7_b0f4]
signal n16_MUX_uxn_opcodes_h_l2021_c7_b0f4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2021_c7_b0f4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2021_c7_b0f4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2021_c7_b0f4]
signal t16_MUX_uxn_opcodes_h_l2021_c7_b0f4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2021_c7_b0f4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2021_c7_b0f4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2026_c11_4e6e]
signal BIN_OP_EQ_uxn_opcodes_h_l2026_c11_4e6e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2026_c11_4e6e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2026_c11_4e6e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2026_c7_7224]
signal result_u8_value_MUX_uxn_opcodes_h_l2026_c7_7224_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2026_c7_7224_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2026_c7_7224_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2026_c7_7224_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2026_c7_7224]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_7224_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_7224_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_7224_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_7224_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2026_c7_7224]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_7224_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_7224_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_7224_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_7224_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2026_c7_7224]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_7224_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_7224_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_7224_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_7224_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2026_c7_7224]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_7224_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_7224_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_7224_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_7224_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2026_c7_7224]
signal tmp16_MUX_uxn_opcodes_h_l2026_c7_7224_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2026_c7_7224_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2026_c7_7224_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2026_c7_7224_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2026_c7_7224]
signal n16_MUX_uxn_opcodes_h_l2026_c7_7224_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2026_c7_7224_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2026_c7_7224_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2026_c7_7224_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2026_c7_7224]
signal t16_MUX_uxn_opcodes_h_l2026_c7_7224_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2026_c7_7224_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2026_c7_7224_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2026_c7_7224_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2027_c3_21ea]
signal BIN_OP_OR_uxn_opcodes_h_l2027_c3_21ea_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2027_c3_21ea_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2027_c3_21ea_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2030_c11_ef60]
signal BIN_OP_EQ_uxn_opcodes_h_l2030_c11_ef60_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2030_c11_ef60_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2030_c11_ef60_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2030_c7_6176]
signal result_u8_value_MUX_uxn_opcodes_h_l2030_c7_6176_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2030_c7_6176_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2030_c7_6176_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2030_c7_6176_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2030_c7_6176]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_6176_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_6176_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_6176_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_6176_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2030_c7_6176]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_6176_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_6176_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_6176_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_6176_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2030_c7_6176]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_6176_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_6176_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_6176_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_6176_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2030_c7_6176]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_6176_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_6176_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_6176_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_6176_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2030_c7_6176]
signal tmp16_MUX_uxn_opcodes_h_l2030_c7_6176_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2030_c7_6176_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2030_c7_6176_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2030_c7_6176_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2030_c7_6176]
signal n16_MUX_uxn_opcodes_h_l2030_c7_6176_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2030_c7_6176_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2030_c7_6176_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2030_c7_6176_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2034_c11_8c40]
signal BIN_OP_EQ_uxn_opcodes_h_l2034_c11_8c40_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2034_c11_8c40_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2034_c11_8c40_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2034_c7_7b52]
signal result_u8_value_MUX_uxn_opcodes_h_l2034_c7_7b52_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2034_c7_7b52_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2034_c7_7b52_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2034_c7_7b52_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2034_c7_7b52]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_7b52_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_7b52_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_7b52_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_7b52_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2034_c7_7b52]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_7b52_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_7b52_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_7b52_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_7b52_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2034_c7_7b52]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_7b52_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_7b52_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_7b52_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_7b52_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2034_c7_7b52]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_7b52_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_7b52_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_7b52_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_7b52_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2034_c7_7b52]
signal tmp16_MUX_uxn_opcodes_h_l2034_c7_7b52_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2034_c7_7b52_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2034_c7_7b52_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2034_c7_7b52_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2034_c7_7b52]
signal n16_MUX_uxn_opcodes_h_l2034_c7_7b52_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2034_c7_7b52_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2034_c7_7b52_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2034_c7_7b52_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2035_c3_6e5b]
signal BIN_OP_OR_uxn_opcodes_h_l2035_c3_6e5b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2035_c3_6e5b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2035_c3_6e5b_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2036_c11_83a2]
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_83a2_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_83a2_right : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_83a2_return_output : unsigned(31 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2037_c30_36a2]
signal sp_relative_shift_uxn_opcodes_h_l2037_c30_36a2_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2037_c30_36a2_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2037_c30_36a2_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2037_c30_36a2_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2042_c11_cb17]
signal BIN_OP_EQ_uxn_opcodes_h_l2042_c11_cb17_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2042_c11_cb17_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2042_c11_cb17_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2042_c7_3168]
signal result_u8_value_MUX_uxn_opcodes_h_l2042_c7_3168_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2042_c7_3168_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2042_c7_3168_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2042_c7_3168_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2042_c7_3168]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_3168_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_3168_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_3168_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_3168_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2042_c7_3168]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_3168_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_3168_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_3168_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_3168_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2042_c7_3168]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_3168_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_3168_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_3168_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_3168_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2045_c31_b3a0]
signal CONST_SR_8_uxn_opcodes_h_l2045_c31_b3a0_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2045_c31_b3a0_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2023_l2032_DUPLICATE_4a9f
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2023_l2032_DUPLICATE_4a9f_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2023_l2032_DUPLICATE_4a9f_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_243c( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : signed;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_pc_updated := ref_toks_6;
      base.is_ram_write := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2005_c6_e2ea
BIN_OP_EQ_uxn_opcodes_h_l2005_c6_e2ea : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2005_c6_e2ea_left,
BIN_OP_EQ_uxn_opcodes_h_l2005_c6_e2ea_right,
BIN_OP_EQ_uxn_opcodes_h_l2005_c6_e2ea_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2005_c2_0581
result_u8_value_MUX_uxn_opcodes_h_l2005_c2_0581 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2005_c2_0581_cond,
result_u8_value_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2005_c2_0581_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_0581
result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_0581 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_0581_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_0581_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_0581
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_0581 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_0581_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_0581_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_0581
result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_0581 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_0581_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_0581_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_0581
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_0581 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_0581_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_0581_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_0581
result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_0581 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_0581_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_0581_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_0581
result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_0581 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_0581_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_0581_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_0581
result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_0581 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_0581_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_0581_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_0581
result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_0581 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_0581_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_0581_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2005_c2_0581
tmp16_MUX_uxn_opcodes_h_l2005_c2_0581 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2005_c2_0581_cond,
tmp16_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue,
tmp16_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse,
tmp16_MUX_uxn_opcodes_h_l2005_c2_0581_return_output);

-- n16_MUX_uxn_opcodes_h_l2005_c2_0581
n16_MUX_uxn_opcodes_h_l2005_c2_0581 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2005_c2_0581_cond,
n16_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue,
n16_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse,
n16_MUX_uxn_opcodes_h_l2005_c2_0581_return_output);

-- t16_MUX_uxn_opcodes_h_l2005_c2_0581
t16_MUX_uxn_opcodes_h_l2005_c2_0581 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2005_c2_0581_cond,
t16_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue,
t16_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse,
t16_MUX_uxn_opcodes_h_l2005_c2_0581_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2018_c11_4e0a
BIN_OP_EQ_uxn_opcodes_h_l2018_c11_4e0a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2018_c11_4e0a_left,
BIN_OP_EQ_uxn_opcodes_h_l2018_c11_4e0a_right,
BIN_OP_EQ_uxn_opcodes_h_l2018_c11_4e0a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2018_c7_1de1
result_u8_value_MUX_uxn_opcodes_h_l2018_c7_1de1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2018_c7_1de1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2018_c7_1de1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2018_c7_1de1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_1de1
result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_1de1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_1de1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_1de1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_1de1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_1de1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_1de1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_1de1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_1de1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_1de1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_1de1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_1de1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_1de1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_1de1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_1de1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_1de1
result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_1de1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_1de1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_1de1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_1de1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2018_c7_1de1
tmp16_MUX_uxn_opcodes_h_l2018_c7_1de1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2018_c7_1de1_cond,
tmp16_MUX_uxn_opcodes_h_l2018_c7_1de1_iftrue,
tmp16_MUX_uxn_opcodes_h_l2018_c7_1de1_iffalse,
tmp16_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output);

-- n16_MUX_uxn_opcodes_h_l2018_c7_1de1
n16_MUX_uxn_opcodes_h_l2018_c7_1de1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2018_c7_1de1_cond,
n16_MUX_uxn_opcodes_h_l2018_c7_1de1_iftrue,
n16_MUX_uxn_opcodes_h_l2018_c7_1de1_iffalse,
n16_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output);

-- t16_MUX_uxn_opcodes_h_l2018_c7_1de1
t16_MUX_uxn_opcodes_h_l2018_c7_1de1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2018_c7_1de1_cond,
t16_MUX_uxn_opcodes_h_l2018_c7_1de1_iftrue,
t16_MUX_uxn_opcodes_h_l2018_c7_1de1_iffalse,
t16_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2021_c11_eff2
BIN_OP_EQ_uxn_opcodes_h_l2021_c11_eff2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2021_c11_eff2_left,
BIN_OP_EQ_uxn_opcodes_h_l2021_c11_eff2_right,
BIN_OP_EQ_uxn_opcodes_h_l2021_c11_eff2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2021_c7_b0f4
result_u8_value_MUX_uxn_opcodes_h_l2021_c7_b0f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2021_c7_b0f4_cond,
result_u8_value_MUX_uxn_opcodes_h_l2021_c7_b0f4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2021_c7_b0f4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_b0f4
result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_b0f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_b0f4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_b0f4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_b0f4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_b0f4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_b0f4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_b0f4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_b0f4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_b0f4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_b0f4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_b0f4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_b0f4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_b0f4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_b0f4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_b0f4
result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_b0f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_b0f4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_b0f4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_b0f4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2021_c7_b0f4
tmp16_MUX_uxn_opcodes_h_l2021_c7_b0f4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2021_c7_b0f4_cond,
tmp16_MUX_uxn_opcodes_h_l2021_c7_b0f4_iftrue,
tmp16_MUX_uxn_opcodes_h_l2021_c7_b0f4_iffalse,
tmp16_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output);

-- n16_MUX_uxn_opcodes_h_l2021_c7_b0f4
n16_MUX_uxn_opcodes_h_l2021_c7_b0f4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2021_c7_b0f4_cond,
n16_MUX_uxn_opcodes_h_l2021_c7_b0f4_iftrue,
n16_MUX_uxn_opcodes_h_l2021_c7_b0f4_iffalse,
n16_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output);

-- t16_MUX_uxn_opcodes_h_l2021_c7_b0f4
t16_MUX_uxn_opcodes_h_l2021_c7_b0f4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2021_c7_b0f4_cond,
t16_MUX_uxn_opcodes_h_l2021_c7_b0f4_iftrue,
t16_MUX_uxn_opcodes_h_l2021_c7_b0f4_iffalse,
t16_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2026_c11_4e6e
BIN_OP_EQ_uxn_opcodes_h_l2026_c11_4e6e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2026_c11_4e6e_left,
BIN_OP_EQ_uxn_opcodes_h_l2026_c11_4e6e_right,
BIN_OP_EQ_uxn_opcodes_h_l2026_c11_4e6e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2026_c7_7224
result_u8_value_MUX_uxn_opcodes_h_l2026_c7_7224 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2026_c7_7224_cond,
result_u8_value_MUX_uxn_opcodes_h_l2026_c7_7224_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2026_c7_7224_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2026_c7_7224_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_7224
result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_7224 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_7224_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_7224_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_7224_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_7224_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_7224
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_7224 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_7224_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_7224_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_7224_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_7224_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_7224
result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_7224 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_7224_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_7224_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_7224_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_7224_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_7224
result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_7224 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_7224_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_7224_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_7224_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_7224_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2026_c7_7224
tmp16_MUX_uxn_opcodes_h_l2026_c7_7224 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2026_c7_7224_cond,
tmp16_MUX_uxn_opcodes_h_l2026_c7_7224_iftrue,
tmp16_MUX_uxn_opcodes_h_l2026_c7_7224_iffalse,
tmp16_MUX_uxn_opcodes_h_l2026_c7_7224_return_output);

-- n16_MUX_uxn_opcodes_h_l2026_c7_7224
n16_MUX_uxn_opcodes_h_l2026_c7_7224 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2026_c7_7224_cond,
n16_MUX_uxn_opcodes_h_l2026_c7_7224_iftrue,
n16_MUX_uxn_opcodes_h_l2026_c7_7224_iffalse,
n16_MUX_uxn_opcodes_h_l2026_c7_7224_return_output);

-- t16_MUX_uxn_opcodes_h_l2026_c7_7224
t16_MUX_uxn_opcodes_h_l2026_c7_7224 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2026_c7_7224_cond,
t16_MUX_uxn_opcodes_h_l2026_c7_7224_iftrue,
t16_MUX_uxn_opcodes_h_l2026_c7_7224_iffalse,
t16_MUX_uxn_opcodes_h_l2026_c7_7224_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2027_c3_21ea
BIN_OP_OR_uxn_opcodes_h_l2027_c3_21ea : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2027_c3_21ea_left,
BIN_OP_OR_uxn_opcodes_h_l2027_c3_21ea_right,
BIN_OP_OR_uxn_opcodes_h_l2027_c3_21ea_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2030_c11_ef60
BIN_OP_EQ_uxn_opcodes_h_l2030_c11_ef60 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2030_c11_ef60_left,
BIN_OP_EQ_uxn_opcodes_h_l2030_c11_ef60_right,
BIN_OP_EQ_uxn_opcodes_h_l2030_c11_ef60_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2030_c7_6176
result_u8_value_MUX_uxn_opcodes_h_l2030_c7_6176 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2030_c7_6176_cond,
result_u8_value_MUX_uxn_opcodes_h_l2030_c7_6176_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2030_c7_6176_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2030_c7_6176_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_6176
result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_6176 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_6176_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_6176_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_6176_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_6176_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_6176
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_6176 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_6176_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_6176_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_6176_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_6176_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_6176
result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_6176 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_6176_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_6176_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_6176_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_6176_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_6176
result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_6176 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_6176_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_6176_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_6176_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_6176_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2030_c7_6176
tmp16_MUX_uxn_opcodes_h_l2030_c7_6176 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2030_c7_6176_cond,
tmp16_MUX_uxn_opcodes_h_l2030_c7_6176_iftrue,
tmp16_MUX_uxn_opcodes_h_l2030_c7_6176_iffalse,
tmp16_MUX_uxn_opcodes_h_l2030_c7_6176_return_output);

-- n16_MUX_uxn_opcodes_h_l2030_c7_6176
n16_MUX_uxn_opcodes_h_l2030_c7_6176 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2030_c7_6176_cond,
n16_MUX_uxn_opcodes_h_l2030_c7_6176_iftrue,
n16_MUX_uxn_opcodes_h_l2030_c7_6176_iffalse,
n16_MUX_uxn_opcodes_h_l2030_c7_6176_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2034_c11_8c40
BIN_OP_EQ_uxn_opcodes_h_l2034_c11_8c40 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2034_c11_8c40_left,
BIN_OP_EQ_uxn_opcodes_h_l2034_c11_8c40_right,
BIN_OP_EQ_uxn_opcodes_h_l2034_c11_8c40_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2034_c7_7b52
result_u8_value_MUX_uxn_opcodes_h_l2034_c7_7b52 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2034_c7_7b52_cond,
result_u8_value_MUX_uxn_opcodes_h_l2034_c7_7b52_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2034_c7_7b52_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2034_c7_7b52_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_7b52
result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_7b52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_7b52_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_7b52_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_7b52_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_7b52_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_7b52
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_7b52 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_7b52_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_7b52_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_7b52_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_7b52_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_7b52
result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_7b52 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_7b52_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_7b52_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_7b52_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_7b52_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_7b52
result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_7b52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_7b52_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_7b52_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_7b52_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_7b52_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2034_c7_7b52
tmp16_MUX_uxn_opcodes_h_l2034_c7_7b52 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2034_c7_7b52_cond,
tmp16_MUX_uxn_opcodes_h_l2034_c7_7b52_iftrue,
tmp16_MUX_uxn_opcodes_h_l2034_c7_7b52_iffalse,
tmp16_MUX_uxn_opcodes_h_l2034_c7_7b52_return_output);

-- n16_MUX_uxn_opcodes_h_l2034_c7_7b52
n16_MUX_uxn_opcodes_h_l2034_c7_7b52 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2034_c7_7b52_cond,
n16_MUX_uxn_opcodes_h_l2034_c7_7b52_iftrue,
n16_MUX_uxn_opcodes_h_l2034_c7_7b52_iffalse,
n16_MUX_uxn_opcodes_h_l2034_c7_7b52_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2035_c3_6e5b
BIN_OP_OR_uxn_opcodes_h_l2035_c3_6e5b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2035_c3_6e5b_left,
BIN_OP_OR_uxn_opcodes_h_l2035_c3_6e5b_right,
BIN_OP_OR_uxn_opcodes_h_l2035_c3_6e5b_return_output);

-- BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_83a2
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_83a2 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_83a2_left,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_83a2_right,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_83a2_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2037_c30_36a2
sp_relative_shift_uxn_opcodes_h_l2037_c30_36a2 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2037_c30_36a2_ins,
sp_relative_shift_uxn_opcodes_h_l2037_c30_36a2_x,
sp_relative_shift_uxn_opcodes_h_l2037_c30_36a2_y,
sp_relative_shift_uxn_opcodes_h_l2037_c30_36a2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2042_c11_cb17
BIN_OP_EQ_uxn_opcodes_h_l2042_c11_cb17 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2042_c11_cb17_left,
BIN_OP_EQ_uxn_opcodes_h_l2042_c11_cb17_right,
BIN_OP_EQ_uxn_opcodes_h_l2042_c11_cb17_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2042_c7_3168
result_u8_value_MUX_uxn_opcodes_h_l2042_c7_3168 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2042_c7_3168_cond,
result_u8_value_MUX_uxn_opcodes_h_l2042_c7_3168_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2042_c7_3168_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2042_c7_3168_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_3168
result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_3168 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_3168_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_3168_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_3168_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_3168_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_3168
result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_3168 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_3168_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_3168_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_3168_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_3168_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_3168
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_3168 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_3168_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_3168_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_3168_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_3168_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2045_c31_b3a0
CONST_SR_8_uxn_opcodes_h_l2045_c31_b3a0 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2045_c31_b3a0_x,
CONST_SR_8_uxn_opcodes_h_l2045_c31_b3a0_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2023_l2032_DUPLICATE_4a9f
CONST_SL_8_uint16_t_uxn_opcodes_h_l2023_l2032_DUPLICATE_4a9f : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2023_l2032_DUPLICATE_4a9f_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2023_l2032_DUPLICATE_4a9f_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2005_c6_e2ea_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2005_c2_0581_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_0581_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_0581_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_0581_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_0581_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_0581_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_0581_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_0581_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_0581_return_output,
 tmp16_MUX_uxn_opcodes_h_l2005_c2_0581_return_output,
 n16_MUX_uxn_opcodes_h_l2005_c2_0581_return_output,
 t16_MUX_uxn_opcodes_h_l2005_c2_0581_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2018_c11_4e0a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output,
 tmp16_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output,
 n16_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output,
 t16_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2021_c11_eff2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output,
 tmp16_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output,
 n16_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output,
 t16_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2026_c11_4e6e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2026_c7_7224_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_7224_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_7224_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_7224_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_7224_return_output,
 tmp16_MUX_uxn_opcodes_h_l2026_c7_7224_return_output,
 n16_MUX_uxn_opcodes_h_l2026_c7_7224_return_output,
 t16_MUX_uxn_opcodes_h_l2026_c7_7224_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2027_c3_21ea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2030_c11_ef60_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2030_c7_6176_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_6176_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_6176_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_6176_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_6176_return_output,
 tmp16_MUX_uxn_opcodes_h_l2030_c7_6176_return_output,
 n16_MUX_uxn_opcodes_h_l2030_c7_6176_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2034_c11_8c40_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2034_c7_7b52_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_7b52_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_7b52_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_7b52_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_7b52_return_output,
 tmp16_MUX_uxn_opcodes_h_l2034_c7_7b52_return_output,
 n16_MUX_uxn_opcodes_h_l2034_c7_7b52_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2035_c3_6e5b_return_output,
 BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_83a2_return_output,
 sp_relative_shift_uxn_opcodes_h_l2037_c30_36a2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2042_c11_cb17_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2042_c7_3168_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_3168_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_3168_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_3168_return_output,
 CONST_SR_8_uxn_opcodes_h_l2045_c31_b3a0_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2023_l2032_DUPLICATE_4a9f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_e2ea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_e2ea_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_e2ea_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c2_0581_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c2_0581_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_0581_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_0581_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2005_c2_0581_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_0581_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_0581_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2005_c2_0581_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_0581_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_0581_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2015_c3_a67b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_0581_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_0581_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2005_c2_0581_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_0581_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_0581_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2005_c2_0581_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_0581_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_0581_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2010_c3_0f82 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_0581_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_0581_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_0581_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_0581_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2005_c2_0581_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2005_c2_0581_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2005_c2_0581_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2005_c2_0581_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2005_c2_0581_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2005_c2_0581_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_4e0a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_4e0a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_4e0a_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2018_c7_1de1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2018_c7_1de1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2018_c7_1de1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_1de1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_1de1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_1de1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_1de1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2019_c3_1b78 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_1de1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_1de1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_1de1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_1de1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_1de1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_1de1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_1de1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_1de1_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2018_c7_1de1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2018_c7_1de1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2018_c7_1de1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2018_c7_1de1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2018_c7_1de1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2018_c7_1de1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2018_c7_1de1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2018_c7_1de1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2018_c7_1de1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_eff2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_eff2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_eff2_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c7_b0f4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c7_b0f4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2026_c7_7224_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c7_b0f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_b0f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_b0f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_7224_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_b0f4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_b0f4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2024_c3_0c8a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_b0f4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_7224_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_b0f4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_b0f4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_b0f4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_7224_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_b0f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_b0f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_b0f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_7224_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_b0f4_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_b0f4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_b0f4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2026_c7_7224_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_b0f4_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2021_c7_b0f4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2021_c7_b0f4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2026_c7_7224_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2021_c7_b0f4_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2021_c7_b0f4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2021_c7_b0f4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2026_c7_7224_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2021_c7_b0f4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_4e6e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_4e6e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_4e6e_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2026_c7_7224_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2026_c7_7224_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2030_c7_6176_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2026_c7_7224_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_7224_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_7224_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_6176_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_7224_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_7224_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2028_c3_171b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_7224_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_6176_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_7224_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_7224_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_7224_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_6176_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_7224_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_7224_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_7224_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_6176_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_7224_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2026_c7_7224_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2026_c7_7224_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2030_c7_6176_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2026_c7_7224_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2026_c7_7224_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2026_c7_7224_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2030_c7_6176_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2026_c7_7224_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2026_c7_7224_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2026_c7_7224_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2026_c7_7224_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2027_c3_21ea_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2027_c3_21ea_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2027_c3_21ea_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_ef60_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_ef60_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_ef60_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2030_c7_6176_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2030_c7_6176_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_7b52_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2030_c7_6176_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_6176_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_6176_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_7b52_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_6176_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_6176_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_6176_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_7b52_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_6176_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_6176_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_6176_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_7b52_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_6176_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_6176_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_6176_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_7b52_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_6176_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2030_c7_6176_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2030_c7_6176_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_7b52_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2030_c7_6176_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2030_c7_6176_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2030_c7_6176_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2034_c7_7b52_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2030_c7_6176_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_8c40_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_8c40_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_8c40_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_7b52_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_7b52_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_3168_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_7b52_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_7b52_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_7b52_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_7b52_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_7b52_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2039_c3_695f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_7b52_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_3168_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_7b52_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_7b52_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_7b52_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_3168_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_7b52_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_7b52_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_7b52_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_3168_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_7b52_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_7b52_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l2036_c3_c729 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_7b52_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_7b52_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2034_c7_7b52_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2034_c7_7b52_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2034_c7_7b52_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2035_c3_6e5b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2035_c3_6e5b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2035_c3_6e5b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_83a2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_83a2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_83a2_return_output : unsigned(31 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2037_c30_36a2_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2037_c30_36a2_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2037_c30_36a2_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2037_c30_36a2_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2040_c21_89bc_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_cb17_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_cb17_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_cb17_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_3168_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_3168_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_3168_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_3168_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2043_c3_a223 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_3168_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_3168_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_3168_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_3168_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_3168_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_3168_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2044_c3_16da : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_3168_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_3168_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2045_c31_b3a0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2045_c31_b3a0_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2045_c21_c9f4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2018_l2005_l2042_l2030_l2026_l2021_DUPLICATE_8f5e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2018_l2034_l2030_l2026_l2021_DUPLICATE_ae79_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2018_l2042_l2030_l2026_l2021_DUPLICATE_4161_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2018_l2042_l2034_l2030_l2026_l2021_DUPLICATE_bfc5_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2035_l2031_l2027_l2022_DUPLICATE_74a6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2023_l2032_DUPLICATE_4a9f_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2023_l2032_DUPLICATE_4a9f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2042_l2030_DUPLICATE_615e_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l2049_l2001_DUPLICATE_5308_return_output : opcode_result_t;
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
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2015_c3_a67b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2015_c3_a67b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_cb17_right := to_unsigned(6, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_ef60_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2019_c3_1b78 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_1de1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2019_c3_1b78;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_3168_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2043_c3_a223 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_3168_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2043_c3_a223;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_7b52_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_8c40_right := to_unsigned(5, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2010_c3_0f82 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2010_c3_0f82;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2024_c3_0c8a := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_b0f4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2024_c3_0c8a;
     VAR_sp_relative_shift_uxn_opcodes_h_l2037_c30_36a2_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2028_c3_171b := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_7224_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2028_c3_171b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_e2ea_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2037_c30_36a2_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2044_c3_16da := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_3168_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2044_c3_16da;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_eff2_right := to_unsigned(2, 2);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_4e6e_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_4e0a_right := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2039_c3_695f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_7b52_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2039_c3_695f;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2037_c30_36a2_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2035_c3_6e5b_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2018_c7_1de1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2021_c7_b0f4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2026_c7_7224_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2034_c7_7b52_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_e2ea_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_4e0a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_eff2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_4e6e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_ef60_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_8c40_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_cb17_left := VAR_phase;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_83a2_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2027_c3_21ea_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2018_c7_1de1_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2026_c7_7224_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2045_c31_b3a0_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2018_c7_1de1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_b0f4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2026_c7_7224_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2030_c7_6176_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_7b52_iffalse := tmp16;
     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2035_l2031_l2027_l2022_DUPLICATE_74a6 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2035_l2031_l2027_l2022_DUPLICATE_74a6_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2026_c11_4e6e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2026_c11_4e6e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_4e6e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2026_c11_4e6e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_4e6e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_4e6e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2026_c11_4e6e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2005_c6_e2ea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2005_c6_e2ea_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_e2ea_left;
     BIN_OP_EQ_uxn_opcodes_h_l2005_c6_e2ea_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_e2ea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_e2ea_return_output := BIN_OP_EQ_uxn_opcodes_h_l2005_c6_e2ea_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2018_c11_4e0a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2018_c11_4e0a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_4e0a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2018_c11_4e0a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_4e0a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_4e0a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2018_c11_4e0a_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2018_l2042_l2030_l2026_l2021_DUPLICATE_4161 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2018_l2042_l2030_l2026_l2021_DUPLICATE_4161_return_output := result.sp_relative_shift;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2005_c2_0581] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2005_c2_0581_return_output := result.is_vram_write;

     -- CONST_SR_8[uxn_opcodes_h_l2045_c31_b3a0] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2045_c31_b3a0_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2045_c31_b3a0_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2045_c31_b3a0_return_output := CONST_SR_8_uxn_opcodes_h_l2045_c31_b3a0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2042_c11_cb17] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2042_c11_cb17_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_cb17_left;
     BIN_OP_EQ_uxn_opcodes_h_l2042_c11_cb17_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_cb17_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_cb17_return_output := BIN_OP_EQ_uxn_opcodes_h_l2042_c11_cb17_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2018_l2034_l2030_l2026_l2021_DUPLICATE_ae79 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2018_l2034_l2030_l2026_l2021_DUPLICATE_ae79_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2030_c11_ef60] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2030_c11_ef60_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_ef60_left;
     BIN_OP_EQ_uxn_opcodes_h_l2030_c11_ef60_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_ef60_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_ef60_return_output := BIN_OP_EQ_uxn_opcodes_h_l2030_c11_ef60_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2018_l2042_l2034_l2030_l2026_l2021_DUPLICATE_bfc5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2018_l2042_l2034_l2030_l2026_l2021_DUPLICATE_bfc5_return_output := result.is_opc_done;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2005_c2_0581] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2005_c2_0581_return_output := result.is_stack_index_flipped;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2005_c2_0581] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2005_c2_0581_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2034_c11_8c40] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2034_c11_8c40_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_8c40_left;
     BIN_OP_EQ_uxn_opcodes_h_l2034_c11_8c40_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_8c40_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_8c40_return_output := BIN_OP_EQ_uxn_opcodes_h_l2034_c11_8c40_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2021_c11_eff2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2021_c11_eff2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_eff2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2021_c11_eff2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_eff2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_eff2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2021_c11_eff2_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2005_c2_0581] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2005_c2_0581_return_output := result.is_pc_updated;

     -- sp_relative_shift[uxn_opcodes_h_l2037_c30_36a2] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2037_c30_36a2_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2037_c30_36a2_ins;
     sp_relative_shift_uxn_opcodes_h_l2037_c30_36a2_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2037_c30_36a2_x;
     sp_relative_shift_uxn_opcodes_h_l2037_c30_36a2_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2037_c30_36a2_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2037_c30_36a2_return_output := sp_relative_shift_uxn_opcodes_h_l2037_c30_36a2_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2042_l2030_DUPLICATE_615e LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2042_l2030_DUPLICATE_615e_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2018_l2005_l2042_l2030_l2026_l2021_DUPLICATE_8f5e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2018_l2005_l2042_l2030_l2026_l2021_DUPLICATE_8f5e_return_output := result.u8_value;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2005_c2_0581_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_e2ea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_0581_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_e2ea_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_0581_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_e2ea_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_0581_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_e2ea_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_0581_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_e2ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_0581_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_e2ea_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_0581_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_e2ea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_0581_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_e2ea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_0581_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_e2ea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c2_0581_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_e2ea_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2005_c2_0581_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_e2ea_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2005_c2_0581_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_e2ea_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2018_c7_1de1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_4e0a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_1de1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_4e0a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_1de1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_4e0a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_1de1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_4e0a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_1de1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_4e0a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2018_c7_1de1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_4e0a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2018_c7_1de1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_4e0a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2018_c7_1de1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_4e0a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2021_c7_b0f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_eff2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_b0f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_eff2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_b0f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_eff2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_b0f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_eff2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_b0f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_eff2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c7_b0f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_eff2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2021_c7_b0f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_eff2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_b0f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_eff2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2026_c7_7224_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_4e6e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_7224_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_4e6e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_7224_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_4e6e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_7224_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_4e6e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_7224_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_4e6e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2026_c7_7224_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_4e6e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2026_c7_7224_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_4e6e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2026_c7_7224_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_4e6e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2030_c7_6176_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_ef60_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_6176_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_ef60_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_6176_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_ef60_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_6176_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_ef60_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_6176_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_ef60_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2030_c7_6176_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_ef60_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2030_c7_6176_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_ef60_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2034_c7_7b52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_8c40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_7b52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_8c40_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_7b52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_8c40_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_7b52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_8c40_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_7b52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_8c40_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_7b52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_8c40_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_7b52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_8c40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_3168_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_cb17_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_3168_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_cb17_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_3168_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_cb17_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_3168_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_cb17_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2027_c3_21ea_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2035_l2031_l2027_l2022_DUPLICATE_74a6_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2035_c3_6e5b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2035_l2031_l2027_l2022_DUPLICATE_74a6_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2023_l2032_DUPLICATE_4a9f_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2035_l2031_l2027_l2022_DUPLICATE_74a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_1de1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2018_l2042_l2030_l2026_l2021_DUPLICATE_4161_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_b0f4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2018_l2042_l2030_l2026_l2021_DUPLICATE_4161_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_7224_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2018_l2042_l2030_l2026_l2021_DUPLICATE_4161_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_6176_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2018_l2042_l2030_l2026_l2021_DUPLICATE_4161_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_3168_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2018_l2042_l2030_l2026_l2021_DUPLICATE_4161_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_1de1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2018_l2042_l2034_l2030_l2026_l2021_DUPLICATE_bfc5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_b0f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2018_l2042_l2034_l2030_l2026_l2021_DUPLICATE_bfc5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_7224_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2018_l2042_l2034_l2030_l2026_l2021_DUPLICATE_bfc5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_6176_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2018_l2042_l2034_l2030_l2026_l2021_DUPLICATE_bfc5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_7b52_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2018_l2042_l2034_l2030_l2026_l2021_DUPLICATE_bfc5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_3168_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2018_l2042_l2034_l2030_l2026_l2021_DUPLICATE_bfc5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_1de1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2018_l2034_l2030_l2026_l2021_DUPLICATE_ae79_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_b0f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2018_l2034_l2030_l2026_l2021_DUPLICATE_ae79_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_7224_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2018_l2034_l2030_l2026_l2021_DUPLICATE_ae79_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_6176_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2018_l2034_l2030_l2026_l2021_DUPLICATE_ae79_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_7b52_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2018_l2034_l2030_l2026_l2021_DUPLICATE_ae79_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_6176_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2042_l2030_DUPLICATE_615e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_3168_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2042_l2030_DUPLICATE_615e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2018_l2005_l2042_l2030_l2026_l2021_DUPLICATE_8f5e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2018_c7_1de1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2018_l2005_l2042_l2030_l2026_l2021_DUPLICATE_8f5e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c7_b0f4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2018_l2005_l2042_l2030_l2026_l2021_DUPLICATE_8f5e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2026_c7_7224_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2018_l2005_l2042_l2030_l2026_l2021_DUPLICATE_8f5e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2030_c7_6176_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2018_l2005_l2042_l2030_l2026_l2021_DUPLICATE_8f5e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_3168_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2018_l2005_l2042_l2030_l2026_l2021_DUPLICATE_8f5e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2005_c2_0581_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2005_c2_0581_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2005_c2_0581_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2005_c2_0581_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_7b52_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2037_c30_36a2_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2042_c7_3168] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_3168_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_3168_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_3168_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_3168_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_3168_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_3168_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_3168_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_3168_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2034_c7_7b52] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_7b52_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_7b52_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_7b52_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_7b52_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_7b52_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_7b52_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_7b52_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_7b52_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2023_l2032_DUPLICATE_4a9f LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2023_l2032_DUPLICATE_4a9f_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2023_l2032_DUPLICATE_4a9f_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2023_l2032_DUPLICATE_4a9f_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2023_l2032_DUPLICATE_4a9f_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2005_c2_0581] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_0581_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_0581_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_0581_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_0581_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2005_c2_0581] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_0581_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_0581_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_0581_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_0581_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2042_c7_3168] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_3168_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_3168_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_3168_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_3168_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_3168_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_3168_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_3168_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_3168_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2035_c3_6e5b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2035_c3_6e5b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2035_c3_6e5b_left;
     BIN_OP_OR_uxn_opcodes_h_l2035_c3_6e5b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2035_c3_6e5b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2035_c3_6e5b_return_output := BIN_OP_OR_uxn_opcodes_h_l2035_c3_6e5b_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2005_c2_0581] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_0581_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_0581_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_0581_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_0581_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2042_c7_3168] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_3168_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_3168_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_3168_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_3168_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_3168_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_3168_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_3168_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_3168_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2045_c21_c9f4] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2045_c21_c9f4_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2045_c31_b3a0_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l2027_c3_21ea] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2027_c3_21ea_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2027_c3_21ea_left;
     BIN_OP_OR_uxn_opcodes_h_l2027_c3_21ea_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2027_c3_21ea_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2027_c3_21ea_return_output := BIN_OP_OR_uxn_opcodes_h_l2027_c3_21ea_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2005_c2_0581] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_0581_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_0581_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_0581_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_0581_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2026_c7_7224_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2027_c3_21ea_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_83a2_right := VAR_BIN_OP_OR_uxn_opcodes_h_l2035_c3_6e5b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2034_c7_7b52_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2035_c3_6e5b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_3168_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2045_c21_c9f4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2030_c7_6176_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2023_l2032_DUPLICATE_4a9f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2021_c7_b0f4_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2023_l2032_DUPLICATE_4a9f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_7b52_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_3168_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_6176_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_7b52_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_7b52_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_3168_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_7b52_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_3168_return_output;
     -- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2036_c11_83a2] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_83a2_left <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_83a2_left;
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_83a2_right <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_83a2_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_83a2_return_output := BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_83a2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2034_c7_7b52] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_7b52_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_7b52_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_7b52_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_7b52_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_7b52_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_7b52_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_7b52_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_7b52_return_output;

     -- n16_MUX[uxn_opcodes_h_l2034_c7_7b52] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2034_c7_7b52_cond <= VAR_n16_MUX_uxn_opcodes_h_l2034_c7_7b52_cond;
     n16_MUX_uxn_opcodes_h_l2034_c7_7b52_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2034_c7_7b52_iftrue;
     n16_MUX_uxn_opcodes_h_l2034_c7_7b52_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2034_c7_7b52_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2034_c7_7b52_return_output := n16_MUX_uxn_opcodes_h_l2034_c7_7b52_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2030_c7_6176] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_6176_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_6176_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_6176_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_6176_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_6176_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_6176_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_6176_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_6176_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2034_c7_7b52] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_7b52_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_7b52_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_7b52_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_7b52_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_7b52_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_7b52_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_7b52_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_7b52_return_output;

     -- t16_MUX[uxn_opcodes_h_l2026_c7_7224] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2026_c7_7224_cond <= VAR_t16_MUX_uxn_opcodes_h_l2026_c7_7224_cond;
     t16_MUX_uxn_opcodes_h_l2026_c7_7224_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2026_c7_7224_iftrue;
     t16_MUX_uxn_opcodes_h_l2026_c7_7224_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2026_c7_7224_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2026_c7_7224_return_output := t16_MUX_uxn_opcodes_h_l2026_c7_7224_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2042_c7_3168] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2042_c7_3168_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_3168_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2042_c7_3168_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_3168_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2042_c7_3168_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_3168_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_3168_return_output := result_u8_value_MUX_uxn_opcodes_h_l2042_c7_3168_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2034_c7_7b52] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_7b52_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_7b52_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_7b52_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_7b52_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_7b52_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_7b52_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_7b52_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_7b52_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l2036_c3_c729 := resize(VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_83a2_return_output, 16);
     VAR_n16_MUX_uxn_opcodes_h_l2030_c7_6176_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2034_c7_7b52_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_6176_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_7b52_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_7224_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_6176_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_6176_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_7b52_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_6176_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_7b52_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_7b52_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_3168_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2021_c7_b0f4_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2026_c7_7224_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_7b52_iftrue := VAR_tmp16_uxn_opcodes_h_l2036_c3_c729;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2030_c7_6176] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_6176_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_6176_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_6176_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_6176_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_6176_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_6176_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_6176_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_6176_return_output;

     -- t16_MUX[uxn_opcodes_h_l2021_c7_b0f4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2021_c7_b0f4_cond <= VAR_t16_MUX_uxn_opcodes_h_l2021_c7_b0f4_cond;
     t16_MUX_uxn_opcodes_h_l2021_c7_b0f4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2021_c7_b0f4_iftrue;
     t16_MUX_uxn_opcodes_h_l2021_c7_b0f4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2021_c7_b0f4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output := t16_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2040_c21_89bc] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2040_c21_89bc_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l2036_c3_c729);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2030_c7_6176] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_6176_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_6176_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_6176_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_6176_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_6176_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_6176_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_6176_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_6176_return_output;

     -- n16_MUX[uxn_opcodes_h_l2030_c7_6176] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2030_c7_6176_cond <= VAR_n16_MUX_uxn_opcodes_h_l2030_c7_6176_cond;
     n16_MUX_uxn_opcodes_h_l2030_c7_6176_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2030_c7_6176_iftrue;
     n16_MUX_uxn_opcodes_h_l2030_c7_6176_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2030_c7_6176_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2030_c7_6176_return_output := n16_MUX_uxn_opcodes_h_l2030_c7_6176_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2034_c7_7b52] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2034_c7_7b52_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_7b52_cond;
     tmp16_MUX_uxn_opcodes_h_l2034_c7_7b52_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_7b52_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2034_c7_7b52_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_7b52_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_7b52_return_output := tmp16_MUX_uxn_opcodes_h_l2034_c7_7b52_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2026_c7_7224] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_7224_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_7224_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_7224_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_7224_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_7224_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_7224_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_7224_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_7224_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2030_c7_6176] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_6176_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_6176_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_6176_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_6176_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_6176_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_6176_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_6176_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_6176_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_7b52_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2040_c21_89bc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2026_c7_7224_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2030_c7_6176_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_7224_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_6176_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_b0f4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_7224_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_7224_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_6176_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_7224_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_6176_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2018_c7_1de1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2030_c7_6176_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_7b52_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2026_c7_7224] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_7224_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_7224_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_7224_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_7224_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_7224_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_7224_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_7224_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_7224_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2034_c7_7b52] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2034_c7_7b52_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_7b52_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2034_c7_7b52_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_7b52_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2034_c7_7b52_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_7b52_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_7b52_return_output := result_u8_value_MUX_uxn_opcodes_h_l2034_c7_7b52_return_output;

     -- t16_MUX[uxn_opcodes_h_l2018_c7_1de1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2018_c7_1de1_cond <= VAR_t16_MUX_uxn_opcodes_h_l2018_c7_1de1_cond;
     t16_MUX_uxn_opcodes_h_l2018_c7_1de1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2018_c7_1de1_iftrue;
     t16_MUX_uxn_opcodes_h_l2018_c7_1de1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2018_c7_1de1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output := t16_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2021_c7_b0f4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_b0f4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_b0f4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_b0f4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_b0f4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_b0f4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_b0f4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output;

     -- n16_MUX[uxn_opcodes_h_l2026_c7_7224] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2026_c7_7224_cond <= VAR_n16_MUX_uxn_opcodes_h_l2026_c7_7224_cond;
     n16_MUX_uxn_opcodes_h_l2026_c7_7224_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2026_c7_7224_iftrue;
     n16_MUX_uxn_opcodes_h_l2026_c7_7224_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2026_c7_7224_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2026_c7_7224_return_output := n16_MUX_uxn_opcodes_h_l2026_c7_7224_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2030_c7_6176] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2030_c7_6176_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2030_c7_6176_cond;
     tmp16_MUX_uxn_opcodes_h_l2030_c7_6176_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2030_c7_6176_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2030_c7_6176_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2030_c7_6176_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2030_c7_6176_return_output := tmp16_MUX_uxn_opcodes_h_l2030_c7_6176_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2026_c7_7224] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_7224_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_7224_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_7224_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_7224_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_7224_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_7224_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_7224_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_7224_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2026_c7_7224] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_7224_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_7224_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_7224_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_7224_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_7224_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_7224_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_7224_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_7224_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2021_c7_b0f4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2026_c7_7224_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_b0f4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_7224_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_1de1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_b0f4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_7224_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_b0f4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_7224_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2030_c7_6176_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_7b52_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2026_c7_7224_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2030_c7_6176_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2021_c7_b0f4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_b0f4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_b0f4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_b0f4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_b0f4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_b0f4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_b0f4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output;

     -- n16_MUX[uxn_opcodes_h_l2021_c7_b0f4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2021_c7_b0f4_cond <= VAR_n16_MUX_uxn_opcodes_h_l2021_c7_b0f4_cond;
     n16_MUX_uxn_opcodes_h_l2021_c7_b0f4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2021_c7_b0f4_iftrue;
     n16_MUX_uxn_opcodes_h_l2021_c7_b0f4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2021_c7_b0f4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output := n16_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2021_c7_b0f4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_b0f4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_b0f4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_b0f4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_b0f4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_b0f4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_b0f4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2026_c7_7224] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2026_c7_7224_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2026_c7_7224_cond;
     tmp16_MUX_uxn_opcodes_h_l2026_c7_7224_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2026_c7_7224_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2026_c7_7224_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2026_c7_7224_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2026_c7_7224_return_output := tmp16_MUX_uxn_opcodes_h_l2026_c7_7224_return_output;

     -- t16_MUX[uxn_opcodes_h_l2005_c2_0581] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2005_c2_0581_cond <= VAR_t16_MUX_uxn_opcodes_h_l2005_c2_0581_cond;
     t16_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue;
     t16_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2005_c2_0581_return_output := t16_MUX_uxn_opcodes_h_l2005_c2_0581_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2018_c7_1de1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_1de1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_1de1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_1de1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_1de1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_1de1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_1de1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2021_c7_b0f4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_b0f4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_b0f4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_b0f4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_b0f4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_b0f4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_b0f4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2030_c7_6176] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2030_c7_6176_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2030_c7_6176_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2030_c7_6176_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2030_c7_6176_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2030_c7_6176_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2030_c7_6176_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2030_c7_6176_return_output := result_u8_value_MUX_uxn_opcodes_h_l2030_c7_6176_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2018_c7_1de1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_1de1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_1de1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_1de1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2026_c7_7224_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2030_c7_6176_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2005_c2_0581_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_b0f4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2026_c7_7224_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2018_c7_1de1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_1de1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_1de1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_1de1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_1de1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_1de1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_1de1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2026_c7_7224] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2026_c7_7224_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2026_c7_7224_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2026_c7_7224_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2026_c7_7224_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2026_c7_7224_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2026_c7_7224_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2026_c7_7224_return_output := result_u8_value_MUX_uxn_opcodes_h_l2026_c7_7224_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2005_c2_0581] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_0581_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_0581_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_0581_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_0581_return_output;

     -- n16_MUX[uxn_opcodes_h_l2018_c7_1de1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2018_c7_1de1_cond <= VAR_n16_MUX_uxn_opcodes_h_l2018_c7_1de1_cond;
     n16_MUX_uxn_opcodes_h_l2018_c7_1de1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2018_c7_1de1_iftrue;
     n16_MUX_uxn_opcodes_h_l2018_c7_1de1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2018_c7_1de1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output := n16_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2021_c7_b0f4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2021_c7_b0f4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_b0f4_cond;
     tmp16_MUX_uxn_opcodes_h_l2021_c7_b0f4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_b0f4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2021_c7_b0f4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_b0f4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output := tmp16_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2018_c7_1de1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_1de1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_1de1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_1de1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_1de1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_1de1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_1de1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2018_c7_1de1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_1de1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_1de1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_1de1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_1de1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_1de1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_1de1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c7_b0f4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2026_c7_7224_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2018_c7_1de1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2018_c7_1de1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2018_c7_1de1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2018_c7_1de1_cond;
     tmp16_MUX_uxn_opcodes_h_l2018_c7_1de1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2018_c7_1de1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2018_c7_1de1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2018_c7_1de1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output := tmp16_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2005_c2_0581] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_0581_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_0581_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_0581_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_0581_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2005_c2_0581] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_0581_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_0581_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_0581_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_0581_return_output;

     -- n16_MUX[uxn_opcodes_h_l2005_c2_0581] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2005_c2_0581_cond <= VAR_n16_MUX_uxn_opcodes_h_l2005_c2_0581_cond;
     n16_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue;
     n16_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2005_c2_0581_return_output := n16_MUX_uxn_opcodes_h_l2005_c2_0581_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2021_c7_b0f4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2021_c7_b0f4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c7_b0f4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2021_c7_b0f4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c7_b0f4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2021_c7_b0f4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c7_b0f4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output := result_u8_value_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2005_c2_0581] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_0581_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_0581_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_0581_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_0581_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2005_c2_0581_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2018_c7_1de1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c7_b0f4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2018_c7_1de1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2018_c7_1de1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2018_c7_1de1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2018_c7_1de1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2018_c7_1de1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2018_c7_1de1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2018_c7_1de1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2005_c2_0581] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2005_c2_0581_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2005_c2_0581_cond;
     tmp16_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2005_c2_0581_return_output := tmp16_MUX_uxn_opcodes_h_l2005_c2_0581_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2018_c7_1de1_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2005_c2_0581_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2005_c2_0581] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2005_c2_0581_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c2_0581_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c2_0581_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c2_0581_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c2_0581_return_output := result_u8_value_MUX_uxn_opcodes_h_l2005_c2_0581_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l2049_l2001_DUPLICATE_5308 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l2049_l2001_DUPLICATE_5308_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_243c(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c2_0581_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_0581_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_0581_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_0581_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_0581_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_0581_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_0581_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_0581_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_0581_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l2049_l2001_DUPLICATE_5308_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l2049_l2001_DUPLICATE_5308_return_output;
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
