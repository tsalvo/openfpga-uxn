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
-- Submodules: 64
entity sft2_0CLK_af0d23d3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sft2_0CLK_af0d23d3;
architecture arch of sft2_0CLK_af0d23d3 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2251_c6_a474]
signal BIN_OP_EQ_uxn_opcodes_h_l2251_c6_a474_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2251_c6_a474_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2251_c6_a474_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2251_c2_7f12]
signal t8_MUX_uxn_opcodes_h_l2251_c2_7f12_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2251_c2_7f12]
signal tmp16_MUX_uxn_opcodes_h_l2251_c2_7f12_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2251_c2_7f12]
signal n16_MUX_uxn_opcodes_h_l2251_c2_7f12_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2251_c2_7f12]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_7f12_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2251_c2_7f12]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_7f12_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2251_c2_7f12]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_7f12_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2251_c2_7f12]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_7f12_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2251_c2_7f12]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_7f12_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2251_c2_7f12]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_7f12_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2251_c2_7f12]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_7f12_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2251_c2_7f12]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_7f12_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2251_c2_7f12]
signal result_u8_value_MUX_uxn_opcodes_h_l2251_c2_7f12_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2264_c11_ba2c]
signal BIN_OP_EQ_uxn_opcodes_h_l2264_c11_ba2c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2264_c11_ba2c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2264_c11_ba2c_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2264_c7_b4d8]
signal t8_MUX_uxn_opcodes_h_l2264_c7_b4d8_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2264_c7_b4d8_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2264_c7_b4d8_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2264_c7_b4d8]
signal tmp16_MUX_uxn_opcodes_h_l2264_c7_b4d8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2264_c7_b4d8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2264_c7_b4d8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2264_c7_b4d8]
signal n16_MUX_uxn_opcodes_h_l2264_c7_b4d8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2264_c7_b4d8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2264_c7_b4d8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2264_c7_b4d8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_b4d8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_b4d8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_b4d8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2264_c7_b4d8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_b4d8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_b4d8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_b4d8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2264_c7_b4d8]
signal result_u8_value_MUX_uxn_opcodes_h_l2264_c7_b4d8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2264_c7_b4d8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2264_c7_b4d8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2264_c7_b4d8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_b4d8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_b4d8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_b4d8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2264_c7_b4d8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_b4d8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_b4d8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_b4d8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2267_c11_a7ec]
signal BIN_OP_EQ_uxn_opcodes_h_l2267_c11_a7ec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2267_c11_a7ec_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2267_c11_a7ec_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2267_c7_caa0]
signal t8_MUX_uxn_opcodes_h_l2267_c7_caa0_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2267_c7_caa0_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2267_c7_caa0_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2267_c7_caa0]
signal tmp16_MUX_uxn_opcodes_h_l2267_c7_caa0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2267_c7_caa0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2267_c7_caa0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2267_c7_caa0]
signal n16_MUX_uxn_opcodes_h_l2267_c7_caa0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2267_c7_caa0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2267_c7_caa0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2267_c7_caa0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_caa0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_caa0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_caa0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2267_c7_caa0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_caa0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_caa0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_caa0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2267_c7_caa0]
signal result_u8_value_MUX_uxn_opcodes_h_l2267_c7_caa0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2267_c7_caa0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2267_c7_caa0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2267_c7_caa0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_caa0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_caa0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_caa0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2267_c7_caa0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_caa0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_caa0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_caa0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2271_c11_d90a]
signal BIN_OP_EQ_uxn_opcodes_h_l2271_c11_d90a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2271_c11_d90a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2271_c11_d90a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2271_c7_572d]
signal tmp16_MUX_uxn_opcodes_h_l2271_c7_572d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2271_c7_572d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2271_c7_572d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2271_c7_572d_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2271_c7_572d]
signal n16_MUX_uxn_opcodes_h_l2271_c7_572d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2271_c7_572d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2271_c7_572d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2271_c7_572d_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2271_c7_572d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_572d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_572d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_572d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_572d_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2271_c7_572d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_572d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_572d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_572d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_572d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2271_c7_572d]
signal result_u8_value_MUX_uxn_opcodes_h_l2271_c7_572d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2271_c7_572d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2271_c7_572d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2271_c7_572d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2271_c7_572d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_572d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_572d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_572d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_572d_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2271_c7_572d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_572d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_572d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_572d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_572d_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2273_c3_0421]
signal CONST_SL_8_uxn_opcodes_h_l2273_c3_0421_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2273_c3_0421_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2275_c11_4dc4]
signal BIN_OP_EQ_uxn_opcodes_h_l2275_c11_4dc4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2275_c11_4dc4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2275_c11_4dc4_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2275_c7_3e88]
signal tmp16_MUX_uxn_opcodes_h_l2275_c7_3e88_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2275_c7_3e88_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2275_c7_3e88_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2275_c7_3e88_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2275_c7_3e88]
signal n16_MUX_uxn_opcodes_h_l2275_c7_3e88_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2275_c7_3e88_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2275_c7_3e88_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2275_c7_3e88_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2275_c7_3e88]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_3e88_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_3e88_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_3e88_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_3e88_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2275_c7_3e88]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_3e88_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_3e88_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_3e88_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_3e88_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2275_c7_3e88]
signal result_u8_value_MUX_uxn_opcodes_h_l2275_c7_3e88_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2275_c7_3e88_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2275_c7_3e88_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2275_c7_3e88_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2275_c7_3e88]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_3e88_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_3e88_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_3e88_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_3e88_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2275_c7_3e88]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_3e88_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_3e88_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_3e88_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_3e88_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2276_c3_c61b]
signal BIN_OP_OR_uxn_opcodes_h_l2276_c3_c61b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2276_c3_c61b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2276_c3_c61b_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2277_c30_58d1]
signal sp_relative_shift_uxn_opcodes_h_l2277_c30_58d1_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2277_c30_58d1_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2277_c30_58d1_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2277_c30_58d1_return_output : signed(3 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2278_c20_6838]
signal BIN_OP_AND_uxn_opcodes_h_l2278_c20_6838_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2278_c20_6838_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2278_c20_6838_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l2278_c12_2583]
signal BIN_OP_SR_uxn_opcodes_h_l2278_c12_2583_left : unsigned(15 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2278_c12_2583_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2278_c12_2583_return_output : unsigned(15 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l2278_c36_125c]
signal CONST_SR_4_uxn_opcodes_h_l2278_c36_125c_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l2278_c36_125c_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l2278_c12_a05d]
signal BIN_OP_SL_uxn_opcodes_h_l2278_c12_a05d_left : unsigned(15 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2278_c12_a05d_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2278_c12_a05d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2283_c11_d588]
signal BIN_OP_EQ_uxn_opcodes_h_l2283_c11_d588_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2283_c11_d588_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2283_c11_d588_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2283_c7_3272]
signal result_u8_value_MUX_uxn_opcodes_h_l2283_c7_3272_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2283_c7_3272_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2283_c7_3272_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2283_c7_3272_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2283_c7_3272]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_3272_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_3272_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_3272_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_3272_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2283_c7_3272]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_3272_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_3272_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_3272_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_3272_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2283_c7_3272]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_3272_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_3272_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_3272_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_3272_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2286_c31_3467]
signal CONST_SR_8_uxn_opcodes_h_l2286_c31_3467_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2286_c31_3467_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_8b52( ref_toks_0 : opcode_result_t;
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
      base.is_pc_updated := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.is_ram_write := ref_toks_7;
      base.is_vram_write := ref_toks_8;
      base.u8_value := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2251_c6_a474
BIN_OP_EQ_uxn_opcodes_h_l2251_c6_a474 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2251_c6_a474_left,
BIN_OP_EQ_uxn_opcodes_h_l2251_c6_a474_right,
BIN_OP_EQ_uxn_opcodes_h_l2251_c6_a474_return_output);

-- t8_MUX_uxn_opcodes_h_l2251_c2_7f12
t8_MUX_uxn_opcodes_h_l2251_c2_7f12 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2251_c2_7f12_cond,
t8_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue,
t8_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse,
t8_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2251_c2_7f12
tmp16_MUX_uxn_opcodes_h_l2251_c2_7f12 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2251_c2_7f12_cond,
tmp16_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue,
tmp16_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse,
tmp16_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output);

-- n16_MUX_uxn_opcodes_h_l2251_c2_7f12
n16_MUX_uxn_opcodes_h_l2251_c2_7f12 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2251_c2_7f12_cond,
n16_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue,
n16_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse,
n16_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_7f12
result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_7f12 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_7f12_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_7f12
result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_7f12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_7f12_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_7f12
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_7f12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_7f12_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_7f12
result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_7f12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_7f12_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_7f12
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_7f12 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_7f12_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_7f12
result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_7f12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_7f12_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_7f12
result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_7f12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_7f12_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_7f12
result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_7f12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_7f12_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2251_c2_7f12
result_u8_value_MUX_uxn_opcodes_h_l2251_c2_7f12 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2251_c2_7f12_cond,
result_u8_value_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2264_c11_ba2c
BIN_OP_EQ_uxn_opcodes_h_l2264_c11_ba2c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2264_c11_ba2c_left,
BIN_OP_EQ_uxn_opcodes_h_l2264_c11_ba2c_right,
BIN_OP_EQ_uxn_opcodes_h_l2264_c11_ba2c_return_output);

-- t8_MUX_uxn_opcodes_h_l2264_c7_b4d8
t8_MUX_uxn_opcodes_h_l2264_c7_b4d8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2264_c7_b4d8_cond,
t8_MUX_uxn_opcodes_h_l2264_c7_b4d8_iftrue,
t8_MUX_uxn_opcodes_h_l2264_c7_b4d8_iffalse,
t8_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2264_c7_b4d8
tmp16_MUX_uxn_opcodes_h_l2264_c7_b4d8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2264_c7_b4d8_cond,
tmp16_MUX_uxn_opcodes_h_l2264_c7_b4d8_iftrue,
tmp16_MUX_uxn_opcodes_h_l2264_c7_b4d8_iffalse,
tmp16_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output);

-- n16_MUX_uxn_opcodes_h_l2264_c7_b4d8
n16_MUX_uxn_opcodes_h_l2264_c7_b4d8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2264_c7_b4d8_cond,
n16_MUX_uxn_opcodes_h_l2264_c7_b4d8_iftrue,
n16_MUX_uxn_opcodes_h_l2264_c7_b4d8_iffalse,
n16_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_b4d8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_b4d8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_b4d8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_b4d8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_b4d8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_b4d8
result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_b4d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_b4d8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_b4d8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_b4d8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2264_c7_b4d8
result_u8_value_MUX_uxn_opcodes_h_l2264_c7_b4d8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2264_c7_b4d8_cond,
result_u8_value_MUX_uxn_opcodes_h_l2264_c7_b4d8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2264_c7_b4d8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_b4d8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_b4d8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_b4d8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_b4d8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_b4d8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_b4d8
result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_b4d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_b4d8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_b4d8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_b4d8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2267_c11_a7ec
BIN_OP_EQ_uxn_opcodes_h_l2267_c11_a7ec : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2267_c11_a7ec_left,
BIN_OP_EQ_uxn_opcodes_h_l2267_c11_a7ec_right,
BIN_OP_EQ_uxn_opcodes_h_l2267_c11_a7ec_return_output);

-- t8_MUX_uxn_opcodes_h_l2267_c7_caa0
t8_MUX_uxn_opcodes_h_l2267_c7_caa0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2267_c7_caa0_cond,
t8_MUX_uxn_opcodes_h_l2267_c7_caa0_iftrue,
t8_MUX_uxn_opcodes_h_l2267_c7_caa0_iffalse,
t8_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2267_c7_caa0
tmp16_MUX_uxn_opcodes_h_l2267_c7_caa0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2267_c7_caa0_cond,
tmp16_MUX_uxn_opcodes_h_l2267_c7_caa0_iftrue,
tmp16_MUX_uxn_opcodes_h_l2267_c7_caa0_iffalse,
tmp16_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output);

-- n16_MUX_uxn_opcodes_h_l2267_c7_caa0
n16_MUX_uxn_opcodes_h_l2267_c7_caa0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2267_c7_caa0_cond,
n16_MUX_uxn_opcodes_h_l2267_c7_caa0_iftrue,
n16_MUX_uxn_opcodes_h_l2267_c7_caa0_iffalse,
n16_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_caa0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_caa0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_caa0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_caa0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_caa0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_caa0
result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_caa0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_caa0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_caa0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_caa0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2267_c7_caa0
result_u8_value_MUX_uxn_opcodes_h_l2267_c7_caa0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2267_c7_caa0_cond,
result_u8_value_MUX_uxn_opcodes_h_l2267_c7_caa0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2267_c7_caa0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_caa0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_caa0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_caa0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_caa0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_caa0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_caa0
result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_caa0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_caa0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_caa0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_caa0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2271_c11_d90a
BIN_OP_EQ_uxn_opcodes_h_l2271_c11_d90a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2271_c11_d90a_left,
BIN_OP_EQ_uxn_opcodes_h_l2271_c11_d90a_right,
BIN_OP_EQ_uxn_opcodes_h_l2271_c11_d90a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2271_c7_572d
tmp16_MUX_uxn_opcodes_h_l2271_c7_572d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2271_c7_572d_cond,
tmp16_MUX_uxn_opcodes_h_l2271_c7_572d_iftrue,
tmp16_MUX_uxn_opcodes_h_l2271_c7_572d_iffalse,
tmp16_MUX_uxn_opcodes_h_l2271_c7_572d_return_output);

-- n16_MUX_uxn_opcodes_h_l2271_c7_572d
n16_MUX_uxn_opcodes_h_l2271_c7_572d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2271_c7_572d_cond,
n16_MUX_uxn_opcodes_h_l2271_c7_572d_iftrue,
n16_MUX_uxn_opcodes_h_l2271_c7_572d_iffalse,
n16_MUX_uxn_opcodes_h_l2271_c7_572d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_572d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_572d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_572d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_572d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_572d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_572d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_572d
result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_572d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_572d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_572d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_572d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_572d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2271_c7_572d
result_u8_value_MUX_uxn_opcodes_h_l2271_c7_572d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2271_c7_572d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2271_c7_572d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2271_c7_572d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2271_c7_572d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_572d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_572d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_572d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_572d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_572d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_572d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_572d
result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_572d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_572d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_572d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_572d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_572d_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2273_c3_0421
CONST_SL_8_uxn_opcodes_h_l2273_c3_0421 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2273_c3_0421_x,
CONST_SL_8_uxn_opcodes_h_l2273_c3_0421_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2275_c11_4dc4
BIN_OP_EQ_uxn_opcodes_h_l2275_c11_4dc4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2275_c11_4dc4_left,
BIN_OP_EQ_uxn_opcodes_h_l2275_c11_4dc4_right,
BIN_OP_EQ_uxn_opcodes_h_l2275_c11_4dc4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2275_c7_3e88
tmp16_MUX_uxn_opcodes_h_l2275_c7_3e88 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2275_c7_3e88_cond,
tmp16_MUX_uxn_opcodes_h_l2275_c7_3e88_iftrue,
tmp16_MUX_uxn_opcodes_h_l2275_c7_3e88_iffalse,
tmp16_MUX_uxn_opcodes_h_l2275_c7_3e88_return_output);

-- n16_MUX_uxn_opcodes_h_l2275_c7_3e88
n16_MUX_uxn_opcodes_h_l2275_c7_3e88 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2275_c7_3e88_cond,
n16_MUX_uxn_opcodes_h_l2275_c7_3e88_iftrue,
n16_MUX_uxn_opcodes_h_l2275_c7_3e88_iffalse,
n16_MUX_uxn_opcodes_h_l2275_c7_3e88_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_3e88
result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_3e88 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_3e88_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_3e88_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_3e88_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_3e88_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_3e88
result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_3e88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_3e88_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_3e88_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_3e88_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_3e88_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2275_c7_3e88
result_u8_value_MUX_uxn_opcodes_h_l2275_c7_3e88 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2275_c7_3e88_cond,
result_u8_value_MUX_uxn_opcodes_h_l2275_c7_3e88_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2275_c7_3e88_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2275_c7_3e88_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_3e88
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_3e88 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_3e88_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_3e88_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_3e88_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_3e88_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_3e88
result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_3e88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_3e88_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_3e88_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_3e88_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_3e88_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2276_c3_c61b
BIN_OP_OR_uxn_opcodes_h_l2276_c3_c61b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2276_c3_c61b_left,
BIN_OP_OR_uxn_opcodes_h_l2276_c3_c61b_right,
BIN_OP_OR_uxn_opcodes_h_l2276_c3_c61b_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2277_c30_58d1
sp_relative_shift_uxn_opcodes_h_l2277_c30_58d1 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2277_c30_58d1_ins,
sp_relative_shift_uxn_opcodes_h_l2277_c30_58d1_x,
sp_relative_shift_uxn_opcodes_h_l2277_c30_58d1_y,
sp_relative_shift_uxn_opcodes_h_l2277_c30_58d1_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2278_c20_6838
BIN_OP_AND_uxn_opcodes_h_l2278_c20_6838 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2278_c20_6838_left,
BIN_OP_AND_uxn_opcodes_h_l2278_c20_6838_right,
BIN_OP_AND_uxn_opcodes_h_l2278_c20_6838_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l2278_c12_2583
BIN_OP_SR_uxn_opcodes_h_l2278_c12_2583 : entity work.BIN_OP_SR_uint16_t_uint8_t_0CLK_9f3d501a port map (
BIN_OP_SR_uxn_opcodes_h_l2278_c12_2583_left,
BIN_OP_SR_uxn_opcodes_h_l2278_c12_2583_right,
BIN_OP_SR_uxn_opcodes_h_l2278_c12_2583_return_output);

-- CONST_SR_4_uxn_opcodes_h_l2278_c36_125c
CONST_SR_4_uxn_opcodes_h_l2278_c36_125c : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l2278_c36_125c_x,
CONST_SR_4_uxn_opcodes_h_l2278_c36_125c_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l2278_c12_a05d
BIN_OP_SL_uxn_opcodes_h_l2278_c12_a05d : entity work.BIN_OP_SL_uint16_t_uint8_t_0CLK_4b371565 port map (
BIN_OP_SL_uxn_opcodes_h_l2278_c12_a05d_left,
BIN_OP_SL_uxn_opcodes_h_l2278_c12_a05d_right,
BIN_OP_SL_uxn_opcodes_h_l2278_c12_a05d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2283_c11_d588
BIN_OP_EQ_uxn_opcodes_h_l2283_c11_d588 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2283_c11_d588_left,
BIN_OP_EQ_uxn_opcodes_h_l2283_c11_d588_right,
BIN_OP_EQ_uxn_opcodes_h_l2283_c11_d588_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2283_c7_3272
result_u8_value_MUX_uxn_opcodes_h_l2283_c7_3272 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2283_c7_3272_cond,
result_u8_value_MUX_uxn_opcodes_h_l2283_c7_3272_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2283_c7_3272_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2283_c7_3272_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_3272
result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_3272 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_3272_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_3272_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_3272_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_3272_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_3272
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_3272 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_3272_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_3272_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_3272_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_3272_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_3272
result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_3272 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_3272_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_3272_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_3272_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_3272_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2286_c31_3467
CONST_SR_8_uxn_opcodes_h_l2286_c31_3467 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2286_c31_3467_x,
CONST_SR_8_uxn_opcodes_h_l2286_c31_3467_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2251_c6_a474_return_output,
 t8_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output,
 tmp16_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output,
 n16_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2264_c11_ba2c_return_output,
 t8_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output,
 tmp16_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output,
 n16_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2267_c11_a7ec_return_output,
 t8_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output,
 tmp16_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output,
 n16_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2271_c11_d90a_return_output,
 tmp16_MUX_uxn_opcodes_h_l2271_c7_572d_return_output,
 n16_MUX_uxn_opcodes_h_l2271_c7_572d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_572d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_572d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2271_c7_572d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_572d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_572d_return_output,
 CONST_SL_8_uxn_opcodes_h_l2273_c3_0421_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2275_c11_4dc4_return_output,
 tmp16_MUX_uxn_opcodes_h_l2275_c7_3e88_return_output,
 n16_MUX_uxn_opcodes_h_l2275_c7_3e88_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_3e88_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_3e88_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2275_c7_3e88_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_3e88_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_3e88_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2276_c3_c61b_return_output,
 sp_relative_shift_uxn_opcodes_h_l2277_c30_58d1_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2278_c20_6838_return_output,
 BIN_OP_SR_uxn_opcodes_h_l2278_c12_2583_return_output,
 CONST_SR_4_uxn_opcodes_h_l2278_c36_125c_return_output,
 BIN_OP_SL_uxn_opcodes_h_l2278_c12_a05d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2283_c11_d588_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2283_c7_3272_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_3272_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_3272_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_3272_return_output,
 CONST_SR_8_uxn_opcodes_h_l2286_c31_3467_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_a474_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_a474_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_a474_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2251_c2_7f12_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_7f12_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2251_c2_7f12_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2256_c3_f52b : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_7f12_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2251_c2_7f12_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_7f12_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2251_c2_7f12_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_7f12_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_7f12_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2261_c3_9feb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_7f12_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_7f12_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2251_c2_7f12_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_7f12_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2251_c2_7f12_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_7f12_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_7f12_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_ba2c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_ba2c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_ba2c_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2264_c7_b4d8_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2264_c7_b4d8_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2264_c7_b4d8_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_b4d8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_b4d8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_b4d8_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2264_c7_b4d8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2264_c7_b4d8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2264_c7_b4d8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_b4d8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_b4d8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_b4d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_b4d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_b4d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_b4d8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_b4d8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_b4d8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_b4d8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_b4d8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2265_c3_342b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_b4d8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_b4d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_b4d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_b4d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_b4d8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_a7ec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_a7ec_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_a7ec_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2267_c7_caa0_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2267_c7_caa0_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2267_c7_caa0_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_caa0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_caa0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_572d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_caa0_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2267_c7_caa0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2267_c7_caa0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2271_c7_572d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2267_c7_caa0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_caa0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_caa0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_572d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_caa0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_caa0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_caa0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_572d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_caa0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_caa0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_caa0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_572d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_caa0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_caa0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2269_c3_f4f1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_caa0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_572d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_caa0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_caa0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_caa0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_572d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_caa0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_d90a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_d90a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_d90a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_572d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_572d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_3e88_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_572d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2271_c7_572d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2271_c7_572d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2275_c7_3e88_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2271_c7_572d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_572d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_572d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_3e88_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_572d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_572d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_572d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_3e88_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_572d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_572d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_572d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_3e88_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_572d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_572d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_572d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_3e88_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_572d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_572d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_572d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_3e88_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_572d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2273_c3_0421_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2273_c3_0421_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_4dc4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_4dc4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_4dc4_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_3e88_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_3e88_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_3e88_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2275_c7_3e88_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2275_c7_3e88_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2275_c7_3e88_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_3e88_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_3e88_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_3272_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_3e88_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_3e88_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_3e88_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_3e88_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_3e88_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_3e88_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_3272_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_3e88_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_3e88_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2280_c3_70d4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_3e88_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_3272_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_3e88_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_3e88_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_3e88_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_3272_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_3e88_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_c61b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_c61b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_c61b_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_58d1_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_58d1_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_58d1_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_58d1_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_2583_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_6838_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_6838_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_6838_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_2583_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_2583_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_a05d_left : unsigned(15 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2278_c36_125c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_a05d_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2278_c36_125c_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_a05d_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2281_c21_2f3e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_d588_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_d588_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_d588_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_3272_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_3272_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_3272_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_3272_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2284_c3_bf3c : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_3272_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_3272_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_3272_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2285_c3_093c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_3272_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_3272_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_3272_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_3272_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_3272_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2286_c31_3467_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2286_c31_3467_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2286_c21_c614_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2267_l2264_l2251_l2283_l2271_DUPLICATE_1ff1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2267_l2283_l2271_l2264_DUPLICATE_2305_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2267_l2271_l2264_l2275_DUPLICATE_5503_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2267_l2264_l2283_l2275_l2271_DUPLICATE_4704_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2276_l2272_DUPLICATE_3dd0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2283_l2271_DUPLICATE_cc85_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l2246_l2290_DUPLICATE_00cd_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_ba2c_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_d588_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_4dc4_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2261_c3_9feb := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2261_c3_9feb;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2256_c3_f52b := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2256_c3_f52b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2265_c3_342b := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_b4d8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2265_c3_342b;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_58d1_y := resize(to_signed(-1, 2), 4);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2269_c3_f4f1 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_caa0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2269_c3_f4f1;
     VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_58d1_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_d90a_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_a474_right := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2280_c3_70d4 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_3e88_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2280_c3_70d4;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_3272_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_a7ec_right := to_unsigned(2, 2);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_6838_right := to_unsigned(15, 8);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2284_c3_bf3c := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_3272_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2284_c3_bf3c;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2285_c3_093c := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_3272_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2285_c3_093c;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_3e88_iftrue := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_58d1_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_c61b_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2264_c7_b4d8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2267_c7_caa0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2275_c7_3e88_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_a474_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_ba2c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_a7ec_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_d90a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_4dc4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_d588_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l2267_c7_caa0_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_6838_left := t8;
     VAR_CONST_SR_4_uxn_opcodes_h_l2278_c36_125c_x := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2264_c7_b4d8_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2267_c7_caa0_iffalse := t8;
     VAR_CONST_SR_8_uxn_opcodes_h_l2286_c31_3467_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_b4d8_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_caa0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_572d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_3e88_iffalse := tmp16;
     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2276_l2272_DUPLICATE_3dd0 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2276_l2272_DUPLICATE_3dd0_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2267_l2264_l2283_l2275_l2271_DUPLICATE_4704 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2267_l2264_l2283_l2275_l2271_DUPLICATE_4704_return_output := result.is_opc_done;

     -- CONST_SR_8[uxn_opcodes_h_l2286_c31_3467] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2286_c31_3467_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2286_c31_3467_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2286_c31_3467_return_output := CONST_SR_8_uxn_opcodes_h_l2286_c31_3467_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2251_c6_a474] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2251_c6_a474_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_a474_left;
     BIN_OP_EQ_uxn_opcodes_h_l2251_c6_a474_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_a474_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_a474_return_output := BIN_OP_EQ_uxn_opcodes_h_l2251_c6_a474_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2251_c2_7f12] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2251_c2_7f12_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2271_c11_d90a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2271_c11_d90a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_d90a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2271_c11_d90a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_d90a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_d90a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2271_c11_d90a_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2267_l2283_l2271_l2264_DUPLICATE_2305 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2267_l2283_l2271_l2264_DUPLICATE_2305_return_output := result.sp_relative_shift;

     -- sp_relative_shift[uxn_opcodes_h_l2277_c30_58d1] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2277_c30_58d1_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_58d1_ins;
     sp_relative_shift_uxn_opcodes_h_l2277_c30_58d1_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_58d1_x;
     sp_relative_shift_uxn_opcodes_h_l2277_c30_58d1_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_58d1_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_58d1_return_output := sp_relative_shift_uxn_opcodes_h_l2277_c30_58d1_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2251_c2_7f12] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2251_c2_7f12_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2275_c11_4dc4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2275_c11_4dc4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_4dc4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2275_c11_4dc4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_4dc4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_4dc4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2275_c11_4dc4_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2278_c20_6838] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2278_c20_6838_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_6838_left;
     BIN_OP_AND_uxn_opcodes_h_l2278_c20_6838_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_6838_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_6838_return_output := BIN_OP_AND_uxn_opcodes_h_l2278_c20_6838_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2251_c2_7f12] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2251_c2_7f12_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l2283_c11_d588] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2283_c11_d588_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_d588_left;
     BIN_OP_EQ_uxn_opcodes_h_l2283_c11_d588_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_d588_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_d588_return_output := BIN_OP_EQ_uxn_opcodes_h_l2283_c11_d588_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2267_l2271_l2264_l2275_DUPLICATE_5503 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2267_l2271_l2264_l2275_DUPLICATE_5503_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2283_l2271_DUPLICATE_cc85 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2283_l2271_DUPLICATE_cc85_return_output := result.stack_address_sp_offset;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2251_c2_7f12] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2251_c2_7f12_return_output := result.is_stack_index_flipped;

     -- CONST_SR_4[uxn_opcodes_h_l2278_c36_125c] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l2278_c36_125c_x <= VAR_CONST_SR_4_uxn_opcodes_h_l2278_c36_125c_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l2278_c36_125c_return_output := CONST_SR_4_uxn_opcodes_h_l2278_c36_125c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2264_c11_ba2c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2264_c11_ba2c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_ba2c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2264_c11_ba2c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_ba2c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_ba2c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2264_c11_ba2c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2267_c11_a7ec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2267_c11_a7ec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_a7ec_left;
     BIN_OP_EQ_uxn_opcodes_h_l2267_c11_a7ec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_a7ec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_a7ec_return_output := BIN_OP_EQ_uxn_opcodes_h_l2267_c11_a7ec_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2267_l2264_l2251_l2283_l2271_DUPLICATE_1ff1 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2267_l2264_l2251_l2283_l2271_DUPLICATE_1ff1_return_output := result.u8_value;

     -- Submodule level 1
     VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_2583_right := VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_6838_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2251_c2_7f12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_a474_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_7f12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_a474_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_7f12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_a474_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_7f12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_a474_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_7f12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_a474_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_7f12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_a474_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_7f12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_a474_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_7f12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_a474_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_7f12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_a474_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_7f12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_a474_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2251_c2_7f12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_a474_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_7f12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_a474_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2264_c7_b4d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_ba2c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_b4d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_ba2c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_b4d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_ba2c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_b4d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_ba2c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_b4d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_ba2c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_b4d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_ba2c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2264_c7_b4d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_ba2c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_b4d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_ba2c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2267_c7_caa0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_a7ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_caa0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_a7ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_caa0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_a7ec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_caa0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_a7ec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_caa0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_a7ec_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_caa0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_a7ec_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2267_c7_caa0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_a7ec_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_caa0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_a7ec_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2271_c7_572d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_d90a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_572d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_d90a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_572d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_d90a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_572d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_d90a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_572d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_d90a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_572d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_d90a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_572d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_d90a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2275_c7_3e88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_4dc4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_3e88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_4dc4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_3e88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_4dc4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_3e88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_4dc4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_3e88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_4dc4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_3e88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_4dc4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_3e88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_4dc4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_3272_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_d588_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_3272_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_d588_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_3272_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_d588_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_3272_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_d588_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_c61b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2276_l2272_DUPLICATE_3dd0_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2273_c3_0421_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2276_l2272_DUPLICATE_3dd0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_b4d8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2267_l2283_l2271_l2264_DUPLICATE_2305_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_caa0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2267_l2283_l2271_l2264_DUPLICATE_2305_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_572d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2267_l2283_l2271_l2264_DUPLICATE_2305_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_3272_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2267_l2283_l2271_l2264_DUPLICATE_2305_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_b4d8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2267_l2264_l2283_l2275_l2271_DUPLICATE_4704_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_caa0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2267_l2264_l2283_l2275_l2271_DUPLICATE_4704_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_572d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2267_l2264_l2283_l2275_l2271_DUPLICATE_4704_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_3e88_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2267_l2264_l2283_l2275_l2271_DUPLICATE_4704_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_3272_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2267_l2264_l2283_l2275_l2271_DUPLICATE_4704_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_b4d8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2267_l2271_l2264_l2275_DUPLICATE_5503_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_caa0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2267_l2271_l2264_l2275_DUPLICATE_5503_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_572d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2267_l2271_l2264_l2275_DUPLICATE_5503_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_3e88_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2267_l2271_l2264_l2275_DUPLICATE_5503_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_572d_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2283_l2271_DUPLICATE_cc85_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_3272_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2283_l2271_DUPLICATE_cc85_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2267_l2264_l2251_l2283_l2271_DUPLICATE_1ff1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_b4d8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2267_l2264_l2251_l2283_l2271_DUPLICATE_1ff1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_caa0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2267_l2264_l2251_l2283_l2271_DUPLICATE_1ff1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_572d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2267_l2264_l2251_l2283_l2271_DUPLICATE_1ff1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_3272_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2267_l2264_l2251_l2283_l2271_DUPLICATE_1ff1_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_a05d_right := VAR_CONST_SR_4_uxn_opcodes_h_l2278_c36_125c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2251_c2_7f12_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2251_c2_7f12_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2251_c2_7f12_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2251_c2_7f12_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_3e88_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_58d1_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2251_c2_7f12] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_7f12_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_7f12_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2273_c3_0421] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2273_c3_0421_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2273_c3_0421_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2273_c3_0421_return_output := CONST_SL_8_uxn_opcodes_h_l2273_c3_0421_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2275_c7_3e88] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_3e88_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_3e88_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_3e88_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_3e88_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_3e88_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_3e88_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_3e88_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_3e88_return_output;

     -- t8_MUX[uxn_opcodes_h_l2267_c7_caa0] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2267_c7_caa0_cond <= VAR_t8_MUX_uxn_opcodes_h_l2267_c7_caa0_cond;
     t8_MUX_uxn_opcodes_h_l2267_c7_caa0_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2267_c7_caa0_iftrue;
     t8_MUX_uxn_opcodes_h_l2267_c7_caa0_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2267_c7_caa0_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output := t8_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2283_c7_3272] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_3272_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_3272_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_3272_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_3272_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_3272_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_3272_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_3272_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_3272_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2283_c7_3272] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_3272_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_3272_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_3272_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_3272_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_3272_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_3272_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_3272_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_3272_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2283_c7_3272] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_3272_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_3272_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_3272_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_3272_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_3272_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_3272_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_3272_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_3272_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2251_c2_7f12] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_7f12_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_7f12_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2251_c2_7f12] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_7f12_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_7f12_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2276_c3_c61b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2276_c3_c61b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_c61b_left;
     BIN_OP_OR_uxn_opcodes_h_l2276_c3_c61b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_c61b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_c61b_return_output := BIN_OP_OR_uxn_opcodes_h_l2276_c3_c61b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2286_c21_c614] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2286_c21_c614_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2286_c31_3467_return_output);

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2251_c2_7f12] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_7f12_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_7f12_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output;

     -- Submodule level 2
     VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_2583_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_c61b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2275_c7_3e88_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_c61b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_3272_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2286_c21_c614_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2271_c7_572d_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2273_c3_0421_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_3e88_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_3272_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_572d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_3e88_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_3e88_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_3272_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_3e88_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_3272_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2264_c7_b4d8_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2275_c7_3e88] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_3e88_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_3e88_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_3e88_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_3e88_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_3e88_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_3e88_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_3e88_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_3e88_return_output;

     -- BIN_OP_SR[uxn_opcodes_h_l2278_c12_2583] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l2278_c12_2583_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_2583_left;
     BIN_OP_SR_uxn_opcodes_h_l2278_c12_2583_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_2583_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_2583_return_output := BIN_OP_SR_uxn_opcodes_h_l2278_c12_2583_return_output;

     -- t8_MUX[uxn_opcodes_h_l2264_c7_b4d8] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2264_c7_b4d8_cond <= VAR_t8_MUX_uxn_opcodes_h_l2264_c7_b4d8_cond;
     t8_MUX_uxn_opcodes_h_l2264_c7_b4d8_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2264_c7_b4d8_iftrue;
     t8_MUX_uxn_opcodes_h_l2264_c7_b4d8_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2264_c7_b4d8_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output := t8_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output;

     -- n16_MUX[uxn_opcodes_h_l2275_c7_3e88] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2275_c7_3e88_cond <= VAR_n16_MUX_uxn_opcodes_h_l2275_c7_3e88_cond;
     n16_MUX_uxn_opcodes_h_l2275_c7_3e88_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2275_c7_3e88_iftrue;
     n16_MUX_uxn_opcodes_h_l2275_c7_3e88_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2275_c7_3e88_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2275_c7_3e88_return_output := n16_MUX_uxn_opcodes_h_l2275_c7_3e88_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2275_c7_3e88] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_3e88_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_3e88_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_3e88_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_3e88_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_3e88_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_3e88_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_3e88_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_3e88_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2275_c7_3e88] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_3e88_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_3e88_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_3e88_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_3e88_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_3e88_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_3e88_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_3e88_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_3e88_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2271_c7_572d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_572d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_572d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_572d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_572d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_572d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_572d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_572d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_572d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2283_c7_3272] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2283_c7_3272_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_3272_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2283_c7_3272_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_3272_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2283_c7_3272_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_3272_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_3272_return_output := result_u8_value_MUX_uxn_opcodes_h_l2283_c7_3272_return_output;

     -- Submodule level 3
     VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_a05d_left := VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_2583_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2271_c7_572d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2275_c7_3e88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_572d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_3e88_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_caa0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_572d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_572d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_3e88_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_572d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_3e88_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_3e88_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_3272_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2271_c7_572d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_572d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_572d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_572d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_572d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_572d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_572d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_572d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_572d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2267_c7_caa0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_caa0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_caa0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_caa0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_caa0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_caa0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_caa0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2271_c7_572d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_572d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_572d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_572d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_572d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_572d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_572d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_572d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_572d_return_output;

     -- n16_MUX[uxn_opcodes_h_l2271_c7_572d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2271_c7_572d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2271_c7_572d_cond;
     n16_MUX_uxn_opcodes_h_l2271_c7_572d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2271_c7_572d_iftrue;
     n16_MUX_uxn_opcodes_h_l2271_c7_572d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2271_c7_572d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2271_c7_572d_return_output := n16_MUX_uxn_opcodes_h_l2271_c7_572d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2271_c7_572d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_572d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_572d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_572d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_572d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_572d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_572d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_572d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_572d_return_output;

     -- BIN_OP_SL[uxn_opcodes_h_l2278_c12_a05d] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l2278_c12_a05d_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_a05d_left;
     BIN_OP_SL_uxn_opcodes_h_l2278_c12_a05d_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_a05d_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_a05d_return_output := BIN_OP_SL_uxn_opcodes_h_l2278_c12_a05d_return_output;

     -- t8_MUX[uxn_opcodes_h_l2251_c2_7f12] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2251_c2_7f12_cond <= VAR_t8_MUX_uxn_opcodes_h_l2251_c2_7f12_cond;
     t8_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue;
     t8_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output := t8_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_3e88_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_a05d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2267_c7_caa0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2271_c7_572d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_caa0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_572d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_b4d8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_caa0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_572d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_caa0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_572d_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l2281_c21_2f3e] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2281_c21_2f3e_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_a05d_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2264_c7_b4d8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_b4d8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_b4d8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_b4d8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_b4d8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_b4d8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_b4d8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2275_c7_3e88] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2275_c7_3e88_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_3e88_cond;
     tmp16_MUX_uxn_opcodes_h_l2275_c7_3e88_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_3e88_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2275_c7_3e88_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_3e88_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_3e88_return_output := tmp16_MUX_uxn_opcodes_h_l2275_c7_3e88_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2267_c7_caa0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_caa0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_caa0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_caa0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_caa0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_caa0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_caa0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output;

     -- n16_MUX[uxn_opcodes_h_l2267_c7_caa0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2267_c7_caa0_cond <= VAR_n16_MUX_uxn_opcodes_h_l2267_c7_caa0_cond;
     n16_MUX_uxn_opcodes_h_l2267_c7_caa0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2267_c7_caa0_iftrue;
     n16_MUX_uxn_opcodes_h_l2267_c7_caa0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2267_c7_caa0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output := n16_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2267_c7_caa0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_caa0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_caa0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_caa0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_caa0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_caa0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_caa0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2267_c7_caa0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_caa0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_caa0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_caa0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_caa0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_caa0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_caa0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output;

     -- Submodule level 5
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_3e88_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2281_c21_2f3e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2264_c7_b4d8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_b4d8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_b4d8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_b4d8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_572d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_3e88_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2264_c7_b4d8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_b4d8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_b4d8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_b4d8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_b4d8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_b4d8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_b4d8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output;

     -- n16_MUX[uxn_opcodes_h_l2264_c7_b4d8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2264_c7_b4d8_cond <= VAR_n16_MUX_uxn_opcodes_h_l2264_c7_b4d8_cond;
     n16_MUX_uxn_opcodes_h_l2264_c7_b4d8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2264_c7_b4d8_iftrue;
     n16_MUX_uxn_opcodes_h_l2264_c7_b4d8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2264_c7_b4d8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output := n16_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2251_c2_7f12] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_7f12_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_7f12_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2271_c7_572d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2271_c7_572d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_572d_cond;
     tmp16_MUX_uxn_opcodes_h_l2271_c7_572d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_572d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2271_c7_572d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_572d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_572d_return_output := tmp16_MUX_uxn_opcodes_h_l2271_c7_572d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2264_c7_b4d8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_b4d8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_b4d8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_b4d8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_b4d8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_b4d8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_b4d8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2264_c7_b4d8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_b4d8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_b4d8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_b4d8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_b4d8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_b4d8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_b4d8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2275_c7_3e88] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2275_c7_3e88_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_3e88_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2275_c7_3e88_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_3e88_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2275_c7_3e88_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_3e88_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_3e88_return_output := result_u8_value_MUX_uxn_opcodes_h_l2275_c7_3e88_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_572d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_3e88_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_caa0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_572d_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2267_c7_caa0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2267_c7_caa0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_caa0_cond;
     tmp16_MUX_uxn_opcodes_h_l2267_c7_caa0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_caa0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2267_c7_caa0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_caa0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output := tmp16_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2251_c2_7f12] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_7f12_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_7f12_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2271_c7_572d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2271_c7_572d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_572d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2271_c7_572d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_572d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2271_c7_572d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_572d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_572d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2271_c7_572d_return_output;

     -- n16_MUX[uxn_opcodes_h_l2251_c2_7f12] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2251_c2_7f12_cond <= VAR_n16_MUX_uxn_opcodes_h_l2251_c2_7f12_cond;
     n16_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue;
     n16_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output := n16_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2251_c2_7f12] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_7f12_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_7f12_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2251_c2_7f12] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_7f12_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_7f12_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output;

     -- Submodule level 7
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_caa0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_572d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_b4d8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2267_c7_caa0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2267_c7_caa0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_caa0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2267_c7_caa0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_caa0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2267_c7_caa0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_caa0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output := result_u8_value_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2264_c7_b4d8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2264_c7_b4d8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_b4d8_cond;
     tmp16_MUX_uxn_opcodes_h_l2264_c7_b4d8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_b4d8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2264_c7_b4d8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_b4d8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output := tmp16_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output;

     -- Submodule level 8
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_b4d8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_caa0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2251_c2_7f12] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2251_c2_7f12_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_7f12_cond;
     tmp16_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output := tmp16_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2264_c7_b4d8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2264_c7_b4d8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_b4d8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2264_c7_b4d8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_b4d8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2264_c7_b4d8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_b4d8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output := result_u8_value_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_b4d8_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2251_c2_7f12] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2251_c2_7f12_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_7f12_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_7f12_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_7f12_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output := result_u8_value_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l2246_l2290_DUPLICATE_00cd LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l2246_l2290_DUPLICATE_00cd_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8b52(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_7f12_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l2246_l2290_DUPLICATE_00cd_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l2246_l2290_DUPLICATE_00cd_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
