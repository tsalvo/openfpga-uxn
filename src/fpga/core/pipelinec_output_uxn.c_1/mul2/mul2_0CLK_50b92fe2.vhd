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
-- BIN_OP_EQ[uxn_opcodes_h_l2005_c6_3023]
signal BIN_OP_EQ_uxn_opcodes_h_l2005_c6_3023_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2005_c6_3023_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2005_c6_3023_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2005_c2_eac8]
signal t16_MUX_uxn_opcodes_h_l2005_c2_eac8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2005_c2_eac8]
signal n16_MUX_uxn_opcodes_h_l2005_c2_eac8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2005_c2_eac8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_eac8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2005_c2_eac8]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_eac8_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2005_c2_eac8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_eac8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2005_c2_eac8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_eac8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2005_c2_eac8]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_eac8_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2005_c2_eac8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_eac8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2005_c2_eac8]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_eac8_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2005_c2_eac8]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_eac8_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2005_c2_eac8]
signal result_u8_value_MUX_uxn_opcodes_h_l2005_c2_eac8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2005_c2_eac8]
signal tmp16_MUX_uxn_opcodes_h_l2005_c2_eac8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2018_c11_34b7]
signal BIN_OP_EQ_uxn_opcodes_h_l2018_c11_34b7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2018_c11_34b7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2018_c11_34b7_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2018_c7_d13c]
signal t16_MUX_uxn_opcodes_h_l2018_c7_d13c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2018_c7_d13c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2018_c7_d13c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2018_c7_d13c]
signal n16_MUX_uxn_opcodes_h_l2018_c7_d13c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2018_c7_d13c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2018_c7_d13c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2018_c7_d13c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_d13c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_d13c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_d13c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2018_c7_d13c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_d13c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_d13c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_d13c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2018_c7_d13c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_d13c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_d13c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_d13c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2018_c7_d13c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_d13c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_d13c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_d13c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2018_c7_d13c]
signal result_u8_value_MUX_uxn_opcodes_h_l2018_c7_d13c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2018_c7_d13c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2018_c7_d13c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2018_c7_d13c]
signal tmp16_MUX_uxn_opcodes_h_l2018_c7_d13c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2018_c7_d13c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2018_c7_d13c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2021_c11_1e1f]
signal BIN_OP_EQ_uxn_opcodes_h_l2021_c11_1e1f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2021_c11_1e1f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2021_c11_1e1f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2021_c7_e72b]
signal t16_MUX_uxn_opcodes_h_l2021_c7_e72b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2021_c7_e72b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2021_c7_e72b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2021_c7_e72b]
signal n16_MUX_uxn_opcodes_h_l2021_c7_e72b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2021_c7_e72b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2021_c7_e72b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2021_c7_e72b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_e72b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_e72b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_e72b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2021_c7_e72b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_e72b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_e72b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_e72b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2021_c7_e72b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_e72b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_e72b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_e72b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2021_c7_e72b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_e72b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_e72b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_e72b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2021_c7_e72b]
signal result_u8_value_MUX_uxn_opcodes_h_l2021_c7_e72b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2021_c7_e72b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2021_c7_e72b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2021_c7_e72b]
signal tmp16_MUX_uxn_opcodes_h_l2021_c7_e72b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2021_c7_e72b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2021_c7_e72b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2026_c11_b3e9]
signal BIN_OP_EQ_uxn_opcodes_h_l2026_c11_b3e9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2026_c11_b3e9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2026_c11_b3e9_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2026_c7_66a3]
signal t16_MUX_uxn_opcodes_h_l2026_c7_66a3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2026_c7_66a3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2026_c7_66a3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2026_c7_66a3]
signal n16_MUX_uxn_opcodes_h_l2026_c7_66a3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2026_c7_66a3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2026_c7_66a3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2026_c7_66a3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_66a3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_66a3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_66a3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2026_c7_66a3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_66a3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_66a3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_66a3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2026_c7_66a3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_66a3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_66a3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_66a3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2026_c7_66a3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_66a3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_66a3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_66a3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2026_c7_66a3]
signal result_u8_value_MUX_uxn_opcodes_h_l2026_c7_66a3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2026_c7_66a3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2026_c7_66a3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2026_c7_66a3]
signal tmp16_MUX_uxn_opcodes_h_l2026_c7_66a3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2026_c7_66a3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2026_c7_66a3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2027_c3_4c68]
signal BIN_OP_OR_uxn_opcodes_h_l2027_c3_4c68_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2027_c3_4c68_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2027_c3_4c68_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2030_c11_8342]
signal BIN_OP_EQ_uxn_opcodes_h_l2030_c11_8342_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2030_c11_8342_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2030_c11_8342_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2030_c7_2045]
signal n16_MUX_uxn_opcodes_h_l2030_c7_2045_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2030_c7_2045_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2030_c7_2045_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2030_c7_2045_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2030_c7_2045]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_2045_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_2045_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_2045_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_2045_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2030_c7_2045]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_2045_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_2045_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_2045_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_2045_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2030_c7_2045]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_2045_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_2045_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_2045_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_2045_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2030_c7_2045]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_2045_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_2045_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_2045_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_2045_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2030_c7_2045]
signal result_u8_value_MUX_uxn_opcodes_h_l2030_c7_2045_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2030_c7_2045_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2030_c7_2045_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2030_c7_2045_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2030_c7_2045]
signal tmp16_MUX_uxn_opcodes_h_l2030_c7_2045_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2030_c7_2045_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2030_c7_2045_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2030_c7_2045_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2034_c11_ad98]
signal BIN_OP_EQ_uxn_opcodes_h_l2034_c11_ad98_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2034_c11_ad98_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2034_c11_ad98_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2034_c7_1532]
signal n16_MUX_uxn_opcodes_h_l2034_c7_1532_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2034_c7_1532_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2034_c7_1532_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2034_c7_1532_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2034_c7_1532]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_1532_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_1532_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_1532_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_1532_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2034_c7_1532]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_1532_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_1532_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_1532_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_1532_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2034_c7_1532]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_1532_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_1532_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_1532_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_1532_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2034_c7_1532]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_1532_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_1532_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_1532_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_1532_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2034_c7_1532]
signal result_u8_value_MUX_uxn_opcodes_h_l2034_c7_1532_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2034_c7_1532_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2034_c7_1532_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2034_c7_1532_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2034_c7_1532]
signal tmp16_MUX_uxn_opcodes_h_l2034_c7_1532_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2034_c7_1532_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2034_c7_1532_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2034_c7_1532_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2035_c3_823e]
signal BIN_OP_OR_uxn_opcodes_h_l2035_c3_823e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2035_c3_823e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2035_c3_823e_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2036_c11_1de0]
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_1de0_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_1de0_right : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_1de0_return_output : unsigned(31 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2037_c30_8a9f]
signal sp_relative_shift_uxn_opcodes_h_l2037_c30_8a9f_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2037_c30_8a9f_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2037_c30_8a9f_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2037_c30_8a9f_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2042_c11_7cff]
signal BIN_OP_EQ_uxn_opcodes_h_l2042_c11_7cff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2042_c11_7cff_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2042_c11_7cff_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2042_c7_9d89]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_9d89_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_9d89_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_9d89_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_9d89_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2042_c7_9d89]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_9d89_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_9d89_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_9d89_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_9d89_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2042_c7_9d89]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_9d89_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_9d89_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_9d89_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_9d89_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2042_c7_9d89]
signal result_u8_value_MUX_uxn_opcodes_h_l2042_c7_9d89_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2042_c7_9d89_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2042_c7_9d89_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2042_c7_9d89_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2045_c31_62ad]
signal CONST_SR_8_uxn_opcodes_h_l2045_c31_62ad_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2045_c31_62ad_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2032_l2023_DUPLICATE_72eb
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2032_l2023_DUPLICATE_72eb_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2032_l2023_DUPLICATE_72eb_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_04b4( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_stack_index_flipped := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.u8_value := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2005_c6_3023
BIN_OP_EQ_uxn_opcodes_h_l2005_c6_3023 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2005_c6_3023_left,
BIN_OP_EQ_uxn_opcodes_h_l2005_c6_3023_right,
BIN_OP_EQ_uxn_opcodes_h_l2005_c6_3023_return_output);

-- t16_MUX_uxn_opcodes_h_l2005_c2_eac8
t16_MUX_uxn_opcodes_h_l2005_c2_eac8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2005_c2_eac8_cond,
t16_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue,
t16_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse,
t16_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output);

-- n16_MUX_uxn_opcodes_h_l2005_c2_eac8
n16_MUX_uxn_opcodes_h_l2005_c2_eac8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2005_c2_eac8_cond,
n16_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue,
n16_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse,
n16_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_eac8
result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_eac8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_eac8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_eac8
result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_eac8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_eac8_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_eac8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_eac8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_eac8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_eac8
result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_eac8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_eac8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_eac8
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_eac8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_eac8_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_eac8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_eac8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_eac8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_eac8
result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_eac8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_eac8_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_eac8
result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_eac8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_eac8_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2005_c2_eac8
result_u8_value_MUX_uxn_opcodes_h_l2005_c2_eac8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2005_c2_eac8_cond,
result_u8_value_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2005_c2_eac8
tmp16_MUX_uxn_opcodes_h_l2005_c2_eac8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2005_c2_eac8_cond,
tmp16_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue,
tmp16_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse,
tmp16_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2018_c11_34b7
BIN_OP_EQ_uxn_opcodes_h_l2018_c11_34b7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2018_c11_34b7_left,
BIN_OP_EQ_uxn_opcodes_h_l2018_c11_34b7_right,
BIN_OP_EQ_uxn_opcodes_h_l2018_c11_34b7_return_output);

-- t16_MUX_uxn_opcodes_h_l2018_c7_d13c
t16_MUX_uxn_opcodes_h_l2018_c7_d13c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2018_c7_d13c_cond,
t16_MUX_uxn_opcodes_h_l2018_c7_d13c_iftrue,
t16_MUX_uxn_opcodes_h_l2018_c7_d13c_iffalse,
t16_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output);

-- n16_MUX_uxn_opcodes_h_l2018_c7_d13c
n16_MUX_uxn_opcodes_h_l2018_c7_d13c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2018_c7_d13c_cond,
n16_MUX_uxn_opcodes_h_l2018_c7_d13c_iftrue,
n16_MUX_uxn_opcodes_h_l2018_c7_d13c_iffalse,
n16_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_d13c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_d13c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_d13c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_d13c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_d13c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_d13c
result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_d13c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_d13c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_d13c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_d13c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_d13c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_d13c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_d13c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_d13c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_d13c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_d13c
result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_d13c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_d13c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_d13c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_d13c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2018_c7_d13c
result_u8_value_MUX_uxn_opcodes_h_l2018_c7_d13c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2018_c7_d13c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2018_c7_d13c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2018_c7_d13c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2018_c7_d13c
tmp16_MUX_uxn_opcodes_h_l2018_c7_d13c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2018_c7_d13c_cond,
tmp16_MUX_uxn_opcodes_h_l2018_c7_d13c_iftrue,
tmp16_MUX_uxn_opcodes_h_l2018_c7_d13c_iffalse,
tmp16_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2021_c11_1e1f
BIN_OP_EQ_uxn_opcodes_h_l2021_c11_1e1f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2021_c11_1e1f_left,
BIN_OP_EQ_uxn_opcodes_h_l2021_c11_1e1f_right,
BIN_OP_EQ_uxn_opcodes_h_l2021_c11_1e1f_return_output);

-- t16_MUX_uxn_opcodes_h_l2021_c7_e72b
t16_MUX_uxn_opcodes_h_l2021_c7_e72b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2021_c7_e72b_cond,
t16_MUX_uxn_opcodes_h_l2021_c7_e72b_iftrue,
t16_MUX_uxn_opcodes_h_l2021_c7_e72b_iffalse,
t16_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output);

-- n16_MUX_uxn_opcodes_h_l2021_c7_e72b
n16_MUX_uxn_opcodes_h_l2021_c7_e72b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2021_c7_e72b_cond,
n16_MUX_uxn_opcodes_h_l2021_c7_e72b_iftrue,
n16_MUX_uxn_opcodes_h_l2021_c7_e72b_iffalse,
n16_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_e72b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_e72b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_e72b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_e72b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_e72b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_e72b
result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_e72b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_e72b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_e72b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_e72b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_e72b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_e72b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_e72b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_e72b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_e72b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_e72b
result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_e72b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_e72b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_e72b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_e72b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2021_c7_e72b
result_u8_value_MUX_uxn_opcodes_h_l2021_c7_e72b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2021_c7_e72b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2021_c7_e72b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2021_c7_e72b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2021_c7_e72b
tmp16_MUX_uxn_opcodes_h_l2021_c7_e72b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2021_c7_e72b_cond,
tmp16_MUX_uxn_opcodes_h_l2021_c7_e72b_iftrue,
tmp16_MUX_uxn_opcodes_h_l2021_c7_e72b_iffalse,
tmp16_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2026_c11_b3e9
BIN_OP_EQ_uxn_opcodes_h_l2026_c11_b3e9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2026_c11_b3e9_left,
BIN_OP_EQ_uxn_opcodes_h_l2026_c11_b3e9_right,
BIN_OP_EQ_uxn_opcodes_h_l2026_c11_b3e9_return_output);

-- t16_MUX_uxn_opcodes_h_l2026_c7_66a3
t16_MUX_uxn_opcodes_h_l2026_c7_66a3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2026_c7_66a3_cond,
t16_MUX_uxn_opcodes_h_l2026_c7_66a3_iftrue,
t16_MUX_uxn_opcodes_h_l2026_c7_66a3_iffalse,
t16_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output);

-- n16_MUX_uxn_opcodes_h_l2026_c7_66a3
n16_MUX_uxn_opcodes_h_l2026_c7_66a3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2026_c7_66a3_cond,
n16_MUX_uxn_opcodes_h_l2026_c7_66a3_iftrue,
n16_MUX_uxn_opcodes_h_l2026_c7_66a3_iffalse,
n16_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_66a3
result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_66a3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_66a3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_66a3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_66a3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_66a3
result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_66a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_66a3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_66a3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_66a3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_66a3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_66a3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_66a3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_66a3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_66a3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_66a3
result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_66a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_66a3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_66a3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_66a3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2026_c7_66a3
result_u8_value_MUX_uxn_opcodes_h_l2026_c7_66a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2026_c7_66a3_cond,
result_u8_value_MUX_uxn_opcodes_h_l2026_c7_66a3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2026_c7_66a3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2026_c7_66a3
tmp16_MUX_uxn_opcodes_h_l2026_c7_66a3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2026_c7_66a3_cond,
tmp16_MUX_uxn_opcodes_h_l2026_c7_66a3_iftrue,
tmp16_MUX_uxn_opcodes_h_l2026_c7_66a3_iffalse,
tmp16_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2027_c3_4c68
BIN_OP_OR_uxn_opcodes_h_l2027_c3_4c68 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2027_c3_4c68_left,
BIN_OP_OR_uxn_opcodes_h_l2027_c3_4c68_right,
BIN_OP_OR_uxn_opcodes_h_l2027_c3_4c68_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2030_c11_8342
BIN_OP_EQ_uxn_opcodes_h_l2030_c11_8342 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2030_c11_8342_left,
BIN_OP_EQ_uxn_opcodes_h_l2030_c11_8342_right,
BIN_OP_EQ_uxn_opcodes_h_l2030_c11_8342_return_output);

-- n16_MUX_uxn_opcodes_h_l2030_c7_2045
n16_MUX_uxn_opcodes_h_l2030_c7_2045 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2030_c7_2045_cond,
n16_MUX_uxn_opcodes_h_l2030_c7_2045_iftrue,
n16_MUX_uxn_opcodes_h_l2030_c7_2045_iffalse,
n16_MUX_uxn_opcodes_h_l2030_c7_2045_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_2045
result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_2045 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_2045_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_2045_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_2045_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_2045_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_2045
result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_2045 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_2045_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_2045_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_2045_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_2045_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_2045
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_2045 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_2045_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_2045_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_2045_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_2045_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_2045
result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_2045 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_2045_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_2045_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_2045_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_2045_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2030_c7_2045
result_u8_value_MUX_uxn_opcodes_h_l2030_c7_2045 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2030_c7_2045_cond,
result_u8_value_MUX_uxn_opcodes_h_l2030_c7_2045_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2030_c7_2045_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2030_c7_2045_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2030_c7_2045
tmp16_MUX_uxn_opcodes_h_l2030_c7_2045 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2030_c7_2045_cond,
tmp16_MUX_uxn_opcodes_h_l2030_c7_2045_iftrue,
tmp16_MUX_uxn_opcodes_h_l2030_c7_2045_iffalse,
tmp16_MUX_uxn_opcodes_h_l2030_c7_2045_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2034_c11_ad98
BIN_OP_EQ_uxn_opcodes_h_l2034_c11_ad98 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2034_c11_ad98_left,
BIN_OP_EQ_uxn_opcodes_h_l2034_c11_ad98_right,
BIN_OP_EQ_uxn_opcodes_h_l2034_c11_ad98_return_output);

-- n16_MUX_uxn_opcodes_h_l2034_c7_1532
n16_MUX_uxn_opcodes_h_l2034_c7_1532 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2034_c7_1532_cond,
n16_MUX_uxn_opcodes_h_l2034_c7_1532_iftrue,
n16_MUX_uxn_opcodes_h_l2034_c7_1532_iffalse,
n16_MUX_uxn_opcodes_h_l2034_c7_1532_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_1532
result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_1532 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_1532_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_1532_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_1532_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_1532_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_1532
result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_1532 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_1532_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_1532_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_1532_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_1532_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_1532
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_1532 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_1532_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_1532_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_1532_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_1532_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_1532
result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_1532 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_1532_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_1532_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_1532_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_1532_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2034_c7_1532
result_u8_value_MUX_uxn_opcodes_h_l2034_c7_1532 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2034_c7_1532_cond,
result_u8_value_MUX_uxn_opcodes_h_l2034_c7_1532_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2034_c7_1532_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2034_c7_1532_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2034_c7_1532
tmp16_MUX_uxn_opcodes_h_l2034_c7_1532 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2034_c7_1532_cond,
tmp16_MUX_uxn_opcodes_h_l2034_c7_1532_iftrue,
tmp16_MUX_uxn_opcodes_h_l2034_c7_1532_iffalse,
tmp16_MUX_uxn_opcodes_h_l2034_c7_1532_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2035_c3_823e
BIN_OP_OR_uxn_opcodes_h_l2035_c3_823e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2035_c3_823e_left,
BIN_OP_OR_uxn_opcodes_h_l2035_c3_823e_right,
BIN_OP_OR_uxn_opcodes_h_l2035_c3_823e_return_output);

-- BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_1de0
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_1de0 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_1de0_left,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_1de0_right,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_1de0_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2037_c30_8a9f
sp_relative_shift_uxn_opcodes_h_l2037_c30_8a9f : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2037_c30_8a9f_ins,
sp_relative_shift_uxn_opcodes_h_l2037_c30_8a9f_x,
sp_relative_shift_uxn_opcodes_h_l2037_c30_8a9f_y,
sp_relative_shift_uxn_opcodes_h_l2037_c30_8a9f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2042_c11_7cff
BIN_OP_EQ_uxn_opcodes_h_l2042_c11_7cff : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2042_c11_7cff_left,
BIN_OP_EQ_uxn_opcodes_h_l2042_c11_7cff_right,
BIN_OP_EQ_uxn_opcodes_h_l2042_c11_7cff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_9d89
result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_9d89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_9d89_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_9d89_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_9d89_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_9d89_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_9d89
result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_9d89 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_9d89_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_9d89_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_9d89_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_9d89_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_9d89
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_9d89 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_9d89_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_9d89_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_9d89_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_9d89_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2042_c7_9d89
result_u8_value_MUX_uxn_opcodes_h_l2042_c7_9d89 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2042_c7_9d89_cond,
result_u8_value_MUX_uxn_opcodes_h_l2042_c7_9d89_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2042_c7_9d89_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2042_c7_9d89_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2045_c31_62ad
CONST_SR_8_uxn_opcodes_h_l2045_c31_62ad : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2045_c31_62ad_x,
CONST_SR_8_uxn_opcodes_h_l2045_c31_62ad_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2032_l2023_DUPLICATE_72eb
CONST_SL_8_uint16_t_uxn_opcodes_h_l2032_l2023_DUPLICATE_72eb : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2032_l2023_DUPLICATE_72eb_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2032_l2023_DUPLICATE_72eb_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2005_c6_3023_return_output,
 t16_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output,
 n16_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output,
 tmp16_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2018_c11_34b7_return_output,
 t16_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output,
 n16_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output,
 tmp16_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2021_c11_1e1f_return_output,
 t16_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output,
 n16_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output,
 tmp16_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2026_c11_b3e9_return_output,
 t16_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output,
 n16_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output,
 tmp16_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2027_c3_4c68_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2030_c11_8342_return_output,
 n16_MUX_uxn_opcodes_h_l2030_c7_2045_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_2045_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_2045_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_2045_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_2045_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2030_c7_2045_return_output,
 tmp16_MUX_uxn_opcodes_h_l2030_c7_2045_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2034_c11_ad98_return_output,
 n16_MUX_uxn_opcodes_h_l2034_c7_1532_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_1532_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_1532_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_1532_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_1532_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2034_c7_1532_return_output,
 tmp16_MUX_uxn_opcodes_h_l2034_c7_1532_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2035_c3_823e_return_output,
 BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_1de0_return_output,
 sp_relative_shift_uxn_opcodes_h_l2037_c30_8a9f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2042_c11_7cff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_9d89_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_9d89_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_9d89_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2042_c7_9d89_return_output,
 CONST_SR_8_uxn_opcodes_h_l2045_c31_62ad_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2032_l2023_DUPLICATE_72eb_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_3023_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_3023_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_3023_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2005_c2_eac8_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2005_c2_eac8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_eac8_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2005_c2_eac8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_eac8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2015_c3_074d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_eac8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_eac8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2005_c2_eac8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_eac8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2010_c3_cdb6 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_eac8_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2005_c2_eac8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_eac8_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2005_c2_eac8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_eac8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c2_eac8_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2005_c2_eac8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_34b7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_34b7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_34b7_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2018_c7_d13c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2018_c7_d13c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2018_c7_d13c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2018_c7_d13c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2018_c7_d13c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2018_c7_d13c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_d13c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_d13c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_d13c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_d13c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_d13c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_d13c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_d13c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2019_c3_ea06 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_d13c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_d13c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_d13c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_d13c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_d13c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2018_c7_d13c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2018_c7_d13c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2018_c7_d13c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2018_c7_d13c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2018_c7_d13c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2018_c7_d13c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_1e1f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_1e1f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_1e1f_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2021_c7_e72b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2021_c7_e72b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2021_c7_e72b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2021_c7_e72b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2021_c7_e72b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2021_c7_e72b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_e72b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_e72b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_e72b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_e72b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_e72b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_e72b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_e72b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2024_c3_ae46 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_e72b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_e72b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_e72b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_e72b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_e72b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c7_e72b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c7_e72b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c7_e72b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_e72b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_e72b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_e72b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_b3e9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_b3e9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_b3e9_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2026_c7_66a3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2026_c7_66a3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2026_c7_66a3_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2026_c7_66a3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2026_c7_66a3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2030_c7_2045_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2026_c7_66a3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_66a3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_66a3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_2045_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_66a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_66a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_66a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_2045_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_66a3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_66a3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2028_c3_70f3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_66a3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_2045_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_66a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_66a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_66a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_2045_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_66a3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2026_c7_66a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2026_c7_66a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2030_c7_2045_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2026_c7_66a3_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2026_c7_66a3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2026_c7_66a3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2030_c7_2045_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2026_c7_66a3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2027_c3_4c68_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2027_c3_4c68_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2027_c3_4c68_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_8342_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_8342_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_8342_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2030_c7_2045_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2030_c7_2045_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2034_c7_1532_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2030_c7_2045_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_2045_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_2045_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_1532_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_2045_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_2045_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_2045_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_1532_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_2045_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_2045_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_2045_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_1532_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_2045_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_2045_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_2045_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_1532_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_2045_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2030_c7_2045_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2030_c7_2045_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_1532_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2030_c7_2045_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2030_c7_2045_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2030_c7_2045_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_1532_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2030_c7_2045_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_ad98_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_ad98_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_ad98_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2034_c7_1532_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2034_c7_1532_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2034_c7_1532_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_1532_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_1532_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_9d89_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_1532_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_1532_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_1532_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_9d89_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_1532_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_1532_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2039_c3_792a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_1532_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_9d89_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_1532_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_1532_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_1532_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_1532_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_1532_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_1532_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_9d89_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_1532_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_1532_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l2036_c3_3c06 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_1532_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_1532_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2035_c3_823e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2035_c3_823e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2035_c3_823e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_1de0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_1de0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_1de0_return_output : unsigned(31 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2037_c30_8a9f_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2037_c30_8a9f_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2037_c30_8a9f_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2037_c30_8a9f_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2040_c21_3810_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_7cff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_7cff_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_7cff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_9d89_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_9d89_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_9d89_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_9d89_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2043_c3_9cbb : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_9d89_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_9d89_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_9d89_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2044_c3_b9de : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_9d89_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_9d89_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_9d89_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_9d89_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_9d89_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2045_c31_62ad_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2045_c31_62ad_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2045_c21_55cc_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2005_l2042_l2030_l2026_l2021_l2018_DUPLICATE_1967_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2042_l2030_l2026_l2021_l2018_DUPLICATE_6804_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2042_l2034_l2030_l2026_l2021_l2018_DUPLICATE_1b9c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2034_l2030_l2026_l2021_l2018_DUPLICATE_d2cc_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2031_l2027_l2035_l2022_DUPLICATE_b62f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2032_l2023_DUPLICATE_72eb_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2032_l2023_DUPLICATE_72eb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2042_l2030_DUPLICATE_9ceb_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l2049_l2001_DUPLICATE_b143_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2028_c3_70f3 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_66a3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2028_c3_70f3;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2037_c30_8a9f_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2010_c3_cdb6 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2010_c3_cdb6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_3023_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_1532_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_8342_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_34b7_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_7cff_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_ad98_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_9d89_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2044_c3_b9de := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_9d89_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2044_c3_b9de;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_1e1f_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2015_c3_074d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2015_c3_074d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_b3e9_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2043_c3_9cbb := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_9d89_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2043_c3_9cbb;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2037_c30_8a9f_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2039_c3_792a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_1532_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2039_c3_792a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2024_c3_ae46 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_e72b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2024_c3_ae46;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2019_c3_ea06 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_d13c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2019_c3_ea06;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2037_c30_8a9f_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2035_c3_823e_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2018_c7_d13c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2021_c7_e72b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2026_c7_66a3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2034_c7_1532_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_3023_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_34b7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_1e1f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_b3e9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_8342_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_ad98_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_7cff_left := VAR_phase;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_1de0_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2027_c3_4c68_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2018_c7_d13c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2026_c7_66a3_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2045_c31_62ad_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2018_c7_d13c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_e72b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2026_c7_66a3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2030_c7_2045_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_1532_iffalse := tmp16;
     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2005_c2_eac8] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2005_c2_eac8_return_output := result.is_ram_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2005_c2_eac8] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2005_c2_eac8_return_output := result.is_pc_updated;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2005_c2_eac8] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2005_c2_eac8_return_output := result.is_vram_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2005_c2_eac8] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2005_c2_eac8_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2042_l2030_DUPLICATE_9ceb LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2042_l2030_DUPLICATE_9ceb_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2005_c6_3023] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2005_c6_3023_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_3023_left;
     BIN_OP_EQ_uxn_opcodes_h_l2005_c6_3023_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_3023_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_3023_return_output := BIN_OP_EQ_uxn_opcodes_h_l2005_c6_3023_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2045_c31_62ad] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2045_c31_62ad_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2045_c31_62ad_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2045_c31_62ad_return_output := CONST_SR_8_uxn_opcodes_h_l2045_c31_62ad_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2034_c11_ad98] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2034_c11_ad98_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_ad98_left;
     BIN_OP_EQ_uxn_opcodes_h_l2034_c11_ad98_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_ad98_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_ad98_return_output := BIN_OP_EQ_uxn_opcodes_h_l2034_c11_ad98_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2021_c11_1e1f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2021_c11_1e1f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_1e1f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2021_c11_1e1f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_1e1f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_1e1f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2021_c11_1e1f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2042_l2034_l2030_l2026_l2021_l2018_DUPLICATE_1b9c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2042_l2034_l2030_l2026_l2021_l2018_DUPLICATE_1b9c_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2005_l2042_l2030_l2026_l2021_l2018_DUPLICATE_1967 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2005_l2042_l2030_l2026_l2021_l2018_DUPLICATE_1967_return_output := result.u8_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2042_l2030_l2026_l2021_l2018_DUPLICATE_6804 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2042_l2030_l2026_l2021_l2018_DUPLICATE_6804_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2018_c11_34b7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2018_c11_34b7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_34b7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2018_c11_34b7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_34b7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_34b7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2018_c11_34b7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2030_c11_8342] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2030_c11_8342_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_8342_left;
     BIN_OP_EQ_uxn_opcodes_h_l2030_c11_8342_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_8342_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_8342_return_output := BIN_OP_EQ_uxn_opcodes_h_l2030_c11_8342_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2026_c11_b3e9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2026_c11_b3e9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_b3e9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2026_c11_b3e9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_b3e9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_b3e9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2026_c11_b3e9_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2037_c30_8a9f] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2037_c30_8a9f_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2037_c30_8a9f_ins;
     sp_relative_shift_uxn_opcodes_h_l2037_c30_8a9f_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2037_c30_8a9f_x;
     sp_relative_shift_uxn_opcodes_h_l2037_c30_8a9f_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2037_c30_8a9f_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2037_c30_8a9f_return_output := sp_relative_shift_uxn_opcodes_h_l2037_c30_8a9f_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2031_l2027_l2035_l2022_DUPLICATE_b62f LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2031_l2027_l2035_l2022_DUPLICATE_b62f_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2034_l2030_l2026_l2021_l2018_DUPLICATE_d2cc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2034_l2030_l2026_l2021_l2018_DUPLICATE_d2cc_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2042_c11_7cff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2042_c11_7cff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_7cff_left;
     BIN_OP_EQ_uxn_opcodes_h_l2042_c11_7cff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_7cff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_7cff_return_output := BIN_OP_EQ_uxn_opcodes_h_l2042_c11_7cff_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2005_c2_eac8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_3023_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_eac8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_3023_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_eac8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_3023_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_eac8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_3023_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_eac8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_3023_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_eac8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_3023_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_eac8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_3023_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_eac8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_3023_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_eac8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_3023_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c2_eac8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_3023_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2005_c2_eac8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_3023_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2005_c2_eac8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2005_c6_3023_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2018_c7_d13c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_34b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_d13c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_34b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_d13c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_34b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_d13c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_34b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_d13c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_34b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2018_c7_d13c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_34b7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2018_c7_d13c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_34b7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2018_c7_d13c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2018_c11_34b7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2021_c7_e72b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_1e1f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_e72b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_1e1f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_e72b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_1e1f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_e72b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_1e1f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_e72b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_1e1f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c7_e72b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_1e1f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2021_c7_e72b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_1e1f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_e72b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_1e1f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2026_c7_66a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_b3e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_66a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_b3e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_66a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_b3e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_66a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_b3e9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_66a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_b3e9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2026_c7_66a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_b3e9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2026_c7_66a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_b3e9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2026_c7_66a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_b3e9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2030_c7_2045_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_8342_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_2045_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_8342_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_2045_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_8342_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_2045_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_8342_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_2045_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_8342_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2030_c7_2045_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_8342_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2030_c7_2045_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2030_c11_8342_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2034_c7_1532_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_ad98_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_1532_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_ad98_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_1532_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_ad98_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_1532_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_ad98_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_1532_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_ad98_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_1532_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_ad98_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_1532_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_ad98_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_9d89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_7cff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_9d89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_7cff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_9d89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_7cff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_9d89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_7cff_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2027_c3_4c68_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2031_l2027_l2035_l2022_DUPLICATE_b62f_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2035_c3_823e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2031_l2027_l2035_l2022_DUPLICATE_b62f_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2032_l2023_DUPLICATE_72eb_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2031_l2027_l2035_l2022_DUPLICATE_b62f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_d13c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2042_l2030_l2026_l2021_l2018_DUPLICATE_6804_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_e72b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2042_l2030_l2026_l2021_l2018_DUPLICATE_6804_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_66a3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2042_l2030_l2026_l2021_l2018_DUPLICATE_6804_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_2045_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2042_l2030_l2026_l2021_l2018_DUPLICATE_6804_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_9d89_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2042_l2030_l2026_l2021_l2018_DUPLICATE_6804_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_d13c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2042_l2034_l2030_l2026_l2021_l2018_DUPLICATE_1b9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_e72b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2042_l2034_l2030_l2026_l2021_l2018_DUPLICATE_1b9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_66a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2042_l2034_l2030_l2026_l2021_l2018_DUPLICATE_1b9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_2045_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2042_l2034_l2030_l2026_l2021_l2018_DUPLICATE_1b9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_1532_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2042_l2034_l2030_l2026_l2021_l2018_DUPLICATE_1b9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_9d89_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2042_l2034_l2030_l2026_l2021_l2018_DUPLICATE_1b9c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_d13c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2034_l2030_l2026_l2021_l2018_DUPLICATE_d2cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_e72b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2034_l2030_l2026_l2021_l2018_DUPLICATE_d2cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_66a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2034_l2030_l2026_l2021_l2018_DUPLICATE_d2cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_2045_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2034_l2030_l2026_l2021_l2018_DUPLICATE_d2cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_1532_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2034_l2030_l2026_l2021_l2018_DUPLICATE_d2cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_2045_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2042_l2030_DUPLICATE_9ceb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_9d89_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2042_l2030_DUPLICATE_9ceb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2005_l2042_l2030_l2026_l2021_l2018_DUPLICATE_1967_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2018_c7_d13c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2005_l2042_l2030_l2026_l2021_l2018_DUPLICATE_1967_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c7_e72b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2005_l2042_l2030_l2026_l2021_l2018_DUPLICATE_1967_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2026_c7_66a3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2005_l2042_l2030_l2026_l2021_l2018_DUPLICATE_1967_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2030_c7_2045_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2005_l2042_l2030_l2026_l2021_l2018_DUPLICATE_1967_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_9d89_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2005_l2042_l2030_l2026_l2021_l2018_DUPLICATE_1967_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2005_c2_eac8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2005_c2_eac8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2005_c2_eac8_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2005_c2_eac8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_1532_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2037_c30_8a9f_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2042_c7_9d89] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_9d89_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_9d89_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_9d89_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_9d89_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_9d89_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_9d89_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_9d89_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_9d89_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2045_c21_55cc] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2045_c21_55cc_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2045_c31_62ad_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l2027_c3_4c68] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2027_c3_4c68_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2027_c3_4c68_left;
     BIN_OP_OR_uxn_opcodes_h_l2027_c3_4c68_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2027_c3_4c68_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2027_c3_4c68_return_output := BIN_OP_OR_uxn_opcodes_h_l2027_c3_4c68_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2034_c7_1532] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_1532_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_1532_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_1532_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_1532_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_1532_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_1532_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_1532_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_1532_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2005_c2_eac8] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_eac8_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_eac8_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2005_c2_eac8] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_eac8_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_eac8_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2005_c2_eac8] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_eac8_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_eac8_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2042_c7_9d89] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_9d89_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_9d89_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_9d89_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_9d89_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_9d89_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_9d89_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_9d89_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_9d89_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2042_c7_9d89] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_9d89_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_9d89_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_9d89_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_9d89_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_9d89_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_9d89_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_9d89_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_9d89_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2032_l2023_DUPLICATE_72eb LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2032_l2023_DUPLICATE_72eb_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2032_l2023_DUPLICATE_72eb_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2032_l2023_DUPLICATE_72eb_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2032_l2023_DUPLICATE_72eb_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2035_c3_823e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2035_c3_823e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2035_c3_823e_left;
     BIN_OP_OR_uxn_opcodes_h_l2035_c3_823e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2035_c3_823e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2035_c3_823e_return_output := BIN_OP_OR_uxn_opcodes_h_l2035_c3_823e_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2005_c2_eac8] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_eac8_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_eac8_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2026_c7_66a3_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2027_c3_4c68_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_1de0_right := VAR_BIN_OP_OR_uxn_opcodes_h_l2035_c3_823e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2034_c7_1532_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2035_c3_823e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_9d89_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2045_c21_55cc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2030_c7_2045_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2032_l2023_DUPLICATE_72eb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2021_c7_e72b_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2032_l2023_DUPLICATE_72eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_1532_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_9d89_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_2045_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_1532_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_1532_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_9d89_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_1532_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_9d89_return_output;
     -- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2036_c11_1de0] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_1de0_left <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_1de0_left;
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_1de0_right <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_1de0_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_1de0_return_output := BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_1de0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2042_c7_9d89] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2042_c7_9d89_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_9d89_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2042_c7_9d89_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_9d89_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2042_c7_9d89_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_9d89_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_9d89_return_output := result_u8_value_MUX_uxn_opcodes_h_l2042_c7_9d89_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2034_c7_1532] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_1532_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_1532_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_1532_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_1532_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_1532_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_1532_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_1532_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_1532_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2034_c7_1532] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_1532_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_1532_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_1532_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_1532_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_1532_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_1532_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_1532_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_1532_return_output;

     -- t16_MUX[uxn_opcodes_h_l2026_c7_66a3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2026_c7_66a3_cond <= VAR_t16_MUX_uxn_opcodes_h_l2026_c7_66a3_cond;
     t16_MUX_uxn_opcodes_h_l2026_c7_66a3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2026_c7_66a3_iftrue;
     t16_MUX_uxn_opcodes_h_l2026_c7_66a3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2026_c7_66a3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output := t16_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2030_c7_2045] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_2045_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_2045_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_2045_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_2045_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_2045_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_2045_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_2045_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_2045_return_output;

     -- n16_MUX[uxn_opcodes_h_l2034_c7_1532] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2034_c7_1532_cond <= VAR_n16_MUX_uxn_opcodes_h_l2034_c7_1532_cond;
     n16_MUX_uxn_opcodes_h_l2034_c7_1532_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2034_c7_1532_iftrue;
     n16_MUX_uxn_opcodes_h_l2034_c7_1532_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2034_c7_1532_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2034_c7_1532_return_output := n16_MUX_uxn_opcodes_h_l2034_c7_1532_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2034_c7_1532] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_1532_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_1532_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_1532_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_1532_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_1532_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_1532_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_1532_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_1532_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l2036_c3_3c06 := resize(VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2036_c11_1de0_return_output, 16);
     VAR_n16_MUX_uxn_opcodes_h_l2030_c7_2045_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2034_c7_1532_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_2045_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_1532_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_66a3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2030_c7_2045_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_2045_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_1532_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_2045_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_1532_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_1532_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_9d89_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2021_c7_e72b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_1532_iftrue := VAR_tmp16_uxn_opcodes_h_l2036_c3_3c06;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2030_c7_2045] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_2045_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_2045_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_2045_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_2045_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_2045_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_2045_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_2045_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_2045_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2030_c7_2045] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_2045_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_2045_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_2045_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_2045_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_2045_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_2045_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_2045_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_2045_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2026_c7_66a3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_66a3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_66a3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_66a3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_66a3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_66a3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_66a3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output;

     -- t16_MUX[uxn_opcodes_h_l2021_c7_e72b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2021_c7_e72b_cond <= VAR_t16_MUX_uxn_opcodes_h_l2021_c7_e72b_cond;
     t16_MUX_uxn_opcodes_h_l2021_c7_e72b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2021_c7_e72b_iftrue;
     t16_MUX_uxn_opcodes_h_l2021_c7_e72b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2021_c7_e72b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output := t16_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2040_c21_3810] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2040_c21_3810_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l2036_c3_3c06);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2030_c7_2045] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_2045_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_2045_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_2045_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_2045_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_2045_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_2045_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_2045_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_2045_return_output;

     -- n16_MUX[uxn_opcodes_h_l2030_c7_2045] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2030_c7_2045_cond <= VAR_n16_MUX_uxn_opcodes_h_l2030_c7_2045_cond;
     n16_MUX_uxn_opcodes_h_l2030_c7_2045_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2030_c7_2045_iftrue;
     n16_MUX_uxn_opcodes_h_l2030_c7_2045_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2030_c7_2045_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2030_c7_2045_return_output := n16_MUX_uxn_opcodes_h_l2030_c7_2045_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2034_c7_1532] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2034_c7_1532_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_1532_cond;
     tmp16_MUX_uxn_opcodes_h_l2034_c7_1532_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_1532_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2034_c7_1532_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_1532_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_1532_return_output := tmp16_MUX_uxn_opcodes_h_l2034_c7_1532_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_1532_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2040_c21_3810_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2026_c7_66a3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2030_c7_2045_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_66a3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2030_c7_2045_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_e72b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_66a3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2030_c7_2045_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_66a3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2030_c7_2045_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2018_c7_d13c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2030_c7_2045_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_1532_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2030_c7_2045] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2030_c7_2045_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2030_c7_2045_cond;
     tmp16_MUX_uxn_opcodes_h_l2030_c7_2045_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2030_c7_2045_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2030_c7_2045_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2030_c7_2045_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2030_c7_2045_return_output := tmp16_MUX_uxn_opcodes_h_l2030_c7_2045_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2021_c7_e72b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_e72b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_e72b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_e72b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_e72b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_e72b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_e72b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2026_c7_66a3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_66a3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_66a3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_66a3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_66a3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_66a3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_66a3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output;

     -- t16_MUX[uxn_opcodes_h_l2018_c7_d13c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2018_c7_d13c_cond <= VAR_t16_MUX_uxn_opcodes_h_l2018_c7_d13c_cond;
     t16_MUX_uxn_opcodes_h_l2018_c7_d13c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2018_c7_d13c_iftrue;
     t16_MUX_uxn_opcodes_h_l2018_c7_d13c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2018_c7_d13c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output := t16_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2034_c7_1532] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2034_c7_1532_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_1532_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2034_c7_1532_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_1532_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2034_c7_1532_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_1532_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_1532_return_output := result_u8_value_MUX_uxn_opcodes_h_l2034_c7_1532_return_output;

     -- n16_MUX[uxn_opcodes_h_l2026_c7_66a3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2026_c7_66a3_cond <= VAR_n16_MUX_uxn_opcodes_h_l2026_c7_66a3_cond;
     n16_MUX_uxn_opcodes_h_l2026_c7_66a3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2026_c7_66a3_iftrue;
     n16_MUX_uxn_opcodes_h_l2026_c7_66a3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2026_c7_66a3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output := n16_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2026_c7_66a3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_66a3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_66a3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_66a3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_66a3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_66a3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_66a3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2026_c7_66a3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_66a3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_66a3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_66a3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_66a3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_66a3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_66a3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2021_c7_e72b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_e72b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_d13c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_e72b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_e72b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2030_c7_2045_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_1532_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2026_c7_66a3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2030_c7_2045_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2030_c7_2045] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2030_c7_2045_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2030_c7_2045_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2030_c7_2045_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2030_c7_2045_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2030_c7_2045_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2030_c7_2045_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2030_c7_2045_return_output := result_u8_value_MUX_uxn_opcodes_h_l2030_c7_2045_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2021_c7_e72b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_e72b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_e72b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_e72b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_e72b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_e72b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_e72b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output;

     -- t16_MUX[uxn_opcodes_h_l2005_c2_eac8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2005_c2_eac8_cond <= VAR_t16_MUX_uxn_opcodes_h_l2005_c2_eac8_cond;
     t16_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue;
     t16_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output := t16_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2018_c7_d13c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_d13c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_d13c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_d13c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_d13c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_d13c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_d13c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2026_c7_66a3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2026_c7_66a3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2026_c7_66a3_cond;
     tmp16_MUX_uxn_opcodes_h_l2026_c7_66a3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2026_c7_66a3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2026_c7_66a3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2026_c7_66a3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output := tmp16_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output;

     -- n16_MUX[uxn_opcodes_h_l2021_c7_e72b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2021_c7_e72b_cond <= VAR_n16_MUX_uxn_opcodes_h_l2021_c7_e72b_cond;
     n16_MUX_uxn_opcodes_h_l2021_c7_e72b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2021_c7_e72b_iftrue;
     n16_MUX_uxn_opcodes_h_l2021_c7_e72b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2021_c7_e72b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output := n16_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2021_c7_e72b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_e72b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_e72b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_e72b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_e72b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_e72b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_e72b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2021_c7_e72b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_e72b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_e72b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_e72b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_e72b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_e72b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_e72b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2018_c7_d13c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_d13c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_d13c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_d13c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2026_c7_66a3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2030_c7_2045_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_e72b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2026_c7_66a3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2026_c7_66a3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2026_c7_66a3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2026_c7_66a3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2026_c7_66a3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2026_c7_66a3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2026_c7_66a3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output := result_u8_value_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2021_c7_e72b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2021_c7_e72b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_e72b_cond;
     tmp16_MUX_uxn_opcodes_h_l2021_c7_e72b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_e72b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2021_c7_e72b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_e72b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output := tmp16_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2018_c7_d13c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_d13c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_d13c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_d13c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_d13c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_d13c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_d13c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2005_c2_eac8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_eac8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_eac8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output;

     -- n16_MUX[uxn_opcodes_h_l2018_c7_d13c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2018_c7_d13c_cond <= VAR_n16_MUX_uxn_opcodes_h_l2018_c7_d13c_cond;
     n16_MUX_uxn_opcodes_h_l2018_c7_d13c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2018_c7_d13c_iftrue;
     n16_MUX_uxn_opcodes_h_l2018_c7_d13c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2018_c7_d13c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output := n16_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2018_c7_d13c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_d13c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_d13c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_d13c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_d13c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_d13c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_d13c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2018_c7_d13c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_d13c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_d13c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_d13c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_d13c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_d13c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_d13c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c7_e72b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2026_c7_66a3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2018_c7_d13c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2005_c2_eac8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_eac8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_eac8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2005_c2_eac8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_eac8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_eac8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2005_c2_eac8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_eac8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_eac8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2018_c7_d13c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2018_c7_d13c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2018_c7_d13c_cond;
     tmp16_MUX_uxn_opcodes_h_l2018_c7_d13c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2018_c7_d13c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2018_c7_d13c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2018_c7_d13c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output := tmp16_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2005_c2_eac8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2005_c2_eac8_cond <= VAR_n16_MUX_uxn_opcodes_h_l2005_c2_eac8_cond;
     n16_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue;
     n16_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output := n16_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2021_c7_e72b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2021_c7_e72b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c7_e72b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2021_c7_e72b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c7_e72b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2021_c7_e72b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c7_e72b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2018_c7_d13c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c7_e72b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2005_c2_eac8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2005_c2_eac8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2005_c2_eac8_cond;
     tmp16_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output := tmp16_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2018_c7_d13c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2018_c7_d13c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2018_c7_d13c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2018_c7_d13c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2018_c7_d13c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2018_c7_d13c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2018_c7_d13c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2018_c7_d13c_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2005_c2_eac8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2005_c2_eac8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c2_eac8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c2_eac8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c2_eac8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output := result_u8_value_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l2049_l2001_DUPLICATE_b143 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l2049_l2001_DUPLICATE_b143_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_04b4(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2005_c2_eac8_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l2049_l2001_DUPLICATE_b143_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l2049_l2001_DUPLICATE_b143_return_output;
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
