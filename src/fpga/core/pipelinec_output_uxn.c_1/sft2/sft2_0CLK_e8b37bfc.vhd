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
entity sft2_0CLK_e8b37bfc is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sft2_0CLK_e8b37bfc;
architecture arch of sft2_0CLK_e8b37bfc is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2251_c6_540d]
signal BIN_OP_EQ_uxn_opcodes_h_l2251_c6_540d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2251_c6_540d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2251_c6_540d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2251_c2_59dc]
signal result_u8_value_MUX_uxn_opcodes_h_l2251_c2_59dc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2251_c2_59dc]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_59dc_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2251_c2_59dc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_59dc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output : unsigned(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2251_c2_59dc]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_59dc_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2251_c2_59dc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_59dc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2251_c2_59dc]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_59dc_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2251_c2_59dc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_59dc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2251_c2_59dc]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_59dc_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2251_c2_59dc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_59dc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2251_c2_59dc]
signal t8_MUX_uxn_opcodes_h_l2251_c2_59dc_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2251_c2_59dc]
signal n16_MUX_uxn_opcodes_h_l2251_c2_59dc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2251_c2_59dc]
signal tmp16_MUX_uxn_opcodes_h_l2251_c2_59dc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2264_c11_b0b9]
signal BIN_OP_EQ_uxn_opcodes_h_l2264_c11_b0b9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2264_c11_b0b9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2264_c11_b0b9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2264_c7_68a0]
signal result_u8_value_MUX_uxn_opcodes_h_l2264_c7_68a0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2264_c7_68a0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2264_c7_68a0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2264_c7_68a0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_68a0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_68a0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_68a0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2264_c7_68a0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_68a0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_68a0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_68a0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2264_c7_68a0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_68a0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_68a0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_68a0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2264_c7_68a0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_68a0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_68a0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_68a0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2264_c7_68a0]
signal t8_MUX_uxn_opcodes_h_l2264_c7_68a0_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2264_c7_68a0_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2264_c7_68a0_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2264_c7_68a0]
signal n16_MUX_uxn_opcodes_h_l2264_c7_68a0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2264_c7_68a0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2264_c7_68a0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2264_c7_68a0]
signal tmp16_MUX_uxn_opcodes_h_l2264_c7_68a0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2264_c7_68a0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2264_c7_68a0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2267_c11_b259]
signal BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b259_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b259_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b259_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2267_c7_2d4a]
signal result_u8_value_MUX_uxn_opcodes_h_l2267_c7_2d4a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2267_c7_2d4a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2267_c7_2d4a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2267_c7_2d4a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_2d4a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_2d4a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_2d4a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2267_c7_2d4a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_2d4a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_2d4a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_2d4a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2267_c7_2d4a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_2d4a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_2d4a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_2d4a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2267_c7_2d4a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_2d4a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_2d4a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_2d4a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2267_c7_2d4a]
signal t8_MUX_uxn_opcodes_h_l2267_c7_2d4a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2267_c7_2d4a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2267_c7_2d4a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2267_c7_2d4a]
signal n16_MUX_uxn_opcodes_h_l2267_c7_2d4a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2267_c7_2d4a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2267_c7_2d4a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2267_c7_2d4a]
signal tmp16_MUX_uxn_opcodes_h_l2267_c7_2d4a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2267_c7_2d4a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2267_c7_2d4a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2271_c11_aecd]
signal BIN_OP_EQ_uxn_opcodes_h_l2271_c11_aecd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2271_c11_aecd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2271_c11_aecd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2271_c7_6286]
signal result_u8_value_MUX_uxn_opcodes_h_l2271_c7_6286_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2271_c7_6286_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2271_c7_6286_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2271_c7_6286_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2271_c7_6286]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_6286_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_6286_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_6286_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_6286_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2271_c7_6286]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_6286_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_6286_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_6286_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_6286_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2271_c7_6286]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_6286_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_6286_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_6286_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_6286_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2271_c7_6286]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_6286_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_6286_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_6286_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_6286_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2271_c7_6286]
signal n16_MUX_uxn_opcodes_h_l2271_c7_6286_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2271_c7_6286_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2271_c7_6286_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2271_c7_6286_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2271_c7_6286]
signal tmp16_MUX_uxn_opcodes_h_l2271_c7_6286_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2271_c7_6286_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2271_c7_6286_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2271_c7_6286_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2273_c3_d2db]
signal CONST_SL_8_uxn_opcodes_h_l2273_c3_d2db_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2273_c3_d2db_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2275_c11_43cd]
signal BIN_OP_EQ_uxn_opcodes_h_l2275_c11_43cd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2275_c11_43cd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2275_c11_43cd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2275_c7_cd87]
signal result_u8_value_MUX_uxn_opcodes_h_l2275_c7_cd87_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2275_c7_cd87_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2275_c7_cd87_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2275_c7_cd87_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2275_c7_cd87]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_cd87_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_cd87_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_cd87_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_cd87_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2275_c7_cd87]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_cd87_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_cd87_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_cd87_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_cd87_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2275_c7_cd87]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_cd87_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_cd87_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_cd87_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_cd87_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2275_c7_cd87]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_cd87_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_cd87_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_cd87_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_cd87_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2275_c7_cd87]
signal n16_MUX_uxn_opcodes_h_l2275_c7_cd87_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2275_c7_cd87_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2275_c7_cd87_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2275_c7_cd87_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2275_c7_cd87]
signal tmp16_MUX_uxn_opcodes_h_l2275_c7_cd87_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2275_c7_cd87_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2275_c7_cd87_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2275_c7_cd87_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2276_c3_64f2]
signal BIN_OP_OR_uxn_opcodes_h_l2276_c3_64f2_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2276_c3_64f2_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2276_c3_64f2_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2277_c30_1f38]
signal sp_relative_shift_uxn_opcodes_h_l2277_c30_1f38_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2277_c30_1f38_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2277_c30_1f38_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2277_c30_1f38_return_output : signed(3 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2278_c20_2dac]
signal BIN_OP_AND_uxn_opcodes_h_l2278_c20_2dac_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2278_c20_2dac_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2278_c20_2dac_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l2278_c12_94e9]
signal BIN_OP_SR_uxn_opcodes_h_l2278_c12_94e9_left : unsigned(15 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2278_c12_94e9_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2278_c12_94e9_return_output : unsigned(15 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l2278_c36_44f7]
signal CONST_SR_4_uxn_opcodes_h_l2278_c36_44f7_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l2278_c36_44f7_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l2278_c12_baae]
signal BIN_OP_SL_uxn_opcodes_h_l2278_c12_baae_left : unsigned(15 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2278_c12_baae_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2278_c12_baae_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2283_c11_1c24]
signal BIN_OP_EQ_uxn_opcodes_h_l2283_c11_1c24_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2283_c11_1c24_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2283_c11_1c24_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2283_c7_3b92]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_3b92_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_3b92_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_3b92_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_3b92_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2283_c7_3b92]
signal result_u8_value_MUX_uxn_opcodes_h_l2283_c7_3b92_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2283_c7_3b92_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2283_c7_3b92_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2283_c7_3b92_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2283_c7_3b92]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_3b92_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_3b92_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_3b92_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_3b92_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2283_c7_3b92]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_3b92_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_3b92_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_3b92_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_3b92_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2286_c31_9aba]
signal CONST_SR_8_uxn_opcodes_h_l2286_c31_9aba_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2286_c31_9aba_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_922a( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_pc_updated := ref_toks_6;
      base.is_opc_done := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.is_stack_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2251_c6_540d
BIN_OP_EQ_uxn_opcodes_h_l2251_c6_540d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2251_c6_540d_left,
BIN_OP_EQ_uxn_opcodes_h_l2251_c6_540d_right,
BIN_OP_EQ_uxn_opcodes_h_l2251_c6_540d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2251_c2_59dc
result_u8_value_MUX_uxn_opcodes_h_l2251_c2_59dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2251_c2_59dc_cond,
result_u8_value_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_59dc
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_59dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_59dc_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_59dc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_59dc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_59dc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_59dc
result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_59dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_59dc_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_59dc
result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_59dc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_59dc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_59dc
result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_59dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_59dc_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_59dc
result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_59dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_59dc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_59dc
result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_59dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_59dc_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_59dc
result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_59dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_59dc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output);

-- t8_MUX_uxn_opcodes_h_l2251_c2_59dc
t8_MUX_uxn_opcodes_h_l2251_c2_59dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2251_c2_59dc_cond,
t8_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue,
t8_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse,
t8_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output);

-- n16_MUX_uxn_opcodes_h_l2251_c2_59dc
n16_MUX_uxn_opcodes_h_l2251_c2_59dc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2251_c2_59dc_cond,
n16_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue,
n16_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse,
n16_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2251_c2_59dc
tmp16_MUX_uxn_opcodes_h_l2251_c2_59dc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2251_c2_59dc_cond,
tmp16_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue,
tmp16_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse,
tmp16_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2264_c11_b0b9
BIN_OP_EQ_uxn_opcodes_h_l2264_c11_b0b9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2264_c11_b0b9_left,
BIN_OP_EQ_uxn_opcodes_h_l2264_c11_b0b9_right,
BIN_OP_EQ_uxn_opcodes_h_l2264_c11_b0b9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2264_c7_68a0
result_u8_value_MUX_uxn_opcodes_h_l2264_c7_68a0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2264_c7_68a0_cond,
result_u8_value_MUX_uxn_opcodes_h_l2264_c7_68a0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2264_c7_68a0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_68a0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_68a0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_68a0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_68a0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_68a0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_68a0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_68a0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_68a0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_68a0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_68a0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_68a0
result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_68a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_68a0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_68a0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_68a0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_68a0
result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_68a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_68a0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_68a0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_68a0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output);

-- t8_MUX_uxn_opcodes_h_l2264_c7_68a0
t8_MUX_uxn_opcodes_h_l2264_c7_68a0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2264_c7_68a0_cond,
t8_MUX_uxn_opcodes_h_l2264_c7_68a0_iftrue,
t8_MUX_uxn_opcodes_h_l2264_c7_68a0_iffalse,
t8_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output);

-- n16_MUX_uxn_opcodes_h_l2264_c7_68a0
n16_MUX_uxn_opcodes_h_l2264_c7_68a0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2264_c7_68a0_cond,
n16_MUX_uxn_opcodes_h_l2264_c7_68a0_iftrue,
n16_MUX_uxn_opcodes_h_l2264_c7_68a0_iffalse,
n16_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2264_c7_68a0
tmp16_MUX_uxn_opcodes_h_l2264_c7_68a0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2264_c7_68a0_cond,
tmp16_MUX_uxn_opcodes_h_l2264_c7_68a0_iftrue,
tmp16_MUX_uxn_opcodes_h_l2264_c7_68a0_iffalse,
tmp16_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b259
BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b259 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b259_left,
BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b259_right,
BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b259_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2267_c7_2d4a
result_u8_value_MUX_uxn_opcodes_h_l2267_c7_2d4a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2267_c7_2d4a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2267_c7_2d4a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2267_c7_2d4a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_2d4a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_2d4a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_2d4a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_2d4a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_2d4a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_2d4a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_2d4a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_2d4a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_2d4a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_2d4a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_2d4a
result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_2d4a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_2d4a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_2d4a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_2d4a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_2d4a
result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_2d4a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_2d4a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_2d4a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_2d4a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output);

-- t8_MUX_uxn_opcodes_h_l2267_c7_2d4a
t8_MUX_uxn_opcodes_h_l2267_c7_2d4a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2267_c7_2d4a_cond,
t8_MUX_uxn_opcodes_h_l2267_c7_2d4a_iftrue,
t8_MUX_uxn_opcodes_h_l2267_c7_2d4a_iffalse,
t8_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output);

-- n16_MUX_uxn_opcodes_h_l2267_c7_2d4a
n16_MUX_uxn_opcodes_h_l2267_c7_2d4a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2267_c7_2d4a_cond,
n16_MUX_uxn_opcodes_h_l2267_c7_2d4a_iftrue,
n16_MUX_uxn_opcodes_h_l2267_c7_2d4a_iffalse,
n16_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2267_c7_2d4a
tmp16_MUX_uxn_opcodes_h_l2267_c7_2d4a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2267_c7_2d4a_cond,
tmp16_MUX_uxn_opcodes_h_l2267_c7_2d4a_iftrue,
tmp16_MUX_uxn_opcodes_h_l2267_c7_2d4a_iffalse,
tmp16_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2271_c11_aecd
BIN_OP_EQ_uxn_opcodes_h_l2271_c11_aecd : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2271_c11_aecd_left,
BIN_OP_EQ_uxn_opcodes_h_l2271_c11_aecd_right,
BIN_OP_EQ_uxn_opcodes_h_l2271_c11_aecd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2271_c7_6286
result_u8_value_MUX_uxn_opcodes_h_l2271_c7_6286 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2271_c7_6286_cond,
result_u8_value_MUX_uxn_opcodes_h_l2271_c7_6286_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2271_c7_6286_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2271_c7_6286_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_6286
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_6286 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_6286_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_6286_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_6286_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_6286_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_6286
result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_6286 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_6286_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_6286_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_6286_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_6286_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_6286
result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_6286 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_6286_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_6286_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_6286_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_6286_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_6286
result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_6286 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_6286_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_6286_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_6286_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_6286_return_output);

-- n16_MUX_uxn_opcodes_h_l2271_c7_6286
n16_MUX_uxn_opcodes_h_l2271_c7_6286 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2271_c7_6286_cond,
n16_MUX_uxn_opcodes_h_l2271_c7_6286_iftrue,
n16_MUX_uxn_opcodes_h_l2271_c7_6286_iffalse,
n16_MUX_uxn_opcodes_h_l2271_c7_6286_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2271_c7_6286
tmp16_MUX_uxn_opcodes_h_l2271_c7_6286 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2271_c7_6286_cond,
tmp16_MUX_uxn_opcodes_h_l2271_c7_6286_iftrue,
tmp16_MUX_uxn_opcodes_h_l2271_c7_6286_iffalse,
tmp16_MUX_uxn_opcodes_h_l2271_c7_6286_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2273_c3_d2db
CONST_SL_8_uxn_opcodes_h_l2273_c3_d2db : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2273_c3_d2db_x,
CONST_SL_8_uxn_opcodes_h_l2273_c3_d2db_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2275_c11_43cd
BIN_OP_EQ_uxn_opcodes_h_l2275_c11_43cd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2275_c11_43cd_left,
BIN_OP_EQ_uxn_opcodes_h_l2275_c11_43cd_right,
BIN_OP_EQ_uxn_opcodes_h_l2275_c11_43cd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2275_c7_cd87
result_u8_value_MUX_uxn_opcodes_h_l2275_c7_cd87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2275_c7_cd87_cond,
result_u8_value_MUX_uxn_opcodes_h_l2275_c7_cd87_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2275_c7_cd87_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2275_c7_cd87_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_cd87
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_cd87 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_cd87_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_cd87_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_cd87_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_cd87_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_cd87
result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_cd87 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_cd87_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_cd87_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_cd87_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_cd87_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_cd87
result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_cd87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_cd87_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_cd87_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_cd87_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_cd87_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_cd87
result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_cd87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_cd87_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_cd87_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_cd87_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_cd87_return_output);

-- n16_MUX_uxn_opcodes_h_l2275_c7_cd87
n16_MUX_uxn_opcodes_h_l2275_c7_cd87 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2275_c7_cd87_cond,
n16_MUX_uxn_opcodes_h_l2275_c7_cd87_iftrue,
n16_MUX_uxn_opcodes_h_l2275_c7_cd87_iffalse,
n16_MUX_uxn_opcodes_h_l2275_c7_cd87_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2275_c7_cd87
tmp16_MUX_uxn_opcodes_h_l2275_c7_cd87 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2275_c7_cd87_cond,
tmp16_MUX_uxn_opcodes_h_l2275_c7_cd87_iftrue,
tmp16_MUX_uxn_opcodes_h_l2275_c7_cd87_iffalse,
tmp16_MUX_uxn_opcodes_h_l2275_c7_cd87_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2276_c3_64f2
BIN_OP_OR_uxn_opcodes_h_l2276_c3_64f2 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2276_c3_64f2_left,
BIN_OP_OR_uxn_opcodes_h_l2276_c3_64f2_right,
BIN_OP_OR_uxn_opcodes_h_l2276_c3_64f2_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2277_c30_1f38
sp_relative_shift_uxn_opcodes_h_l2277_c30_1f38 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2277_c30_1f38_ins,
sp_relative_shift_uxn_opcodes_h_l2277_c30_1f38_x,
sp_relative_shift_uxn_opcodes_h_l2277_c30_1f38_y,
sp_relative_shift_uxn_opcodes_h_l2277_c30_1f38_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2278_c20_2dac
BIN_OP_AND_uxn_opcodes_h_l2278_c20_2dac : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2278_c20_2dac_left,
BIN_OP_AND_uxn_opcodes_h_l2278_c20_2dac_right,
BIN_OP_AND_uxn_opcodes_h_l2278_c20_2dac_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l2278_c12_94e9
BIN_OP_SR_uxn_opcodes_h_l2278_c12_94e9 : entity work.BIN_OP_SR_uint16_t_uint8_t_0CLK_295015b8 port map (
BIN_OP_SR_uxn_opcodes_h_l2278_c12_94e9_left,
BIN_OP_SR_uxn_opcodes_h_l2278_c12_94e9_right,
BIN_OP_SR_uxn_opcodes_h_l2278_c12_94e9_return_output);

-- CONST_SR_4_uxn_opcodes_h_l2278_c36_44f7
CONST_SR_4_uxn_opcodes_h_l2278_c36_44f7 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l2278_c36_44f7_x,
CONST_SR_4_uxn_opcodes_h_l2278_c36_44f7_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l2278_c12_baae
BIN_OP_SL_uxn_opcodes_h_l2278_c12_baae : entity work.BIN_OP_SL_uint16_t_uint8_t_0CLK_b6546dec port map (
BIN_OP_SL_uxn_opcodes_h_l2278_c12_baae_left,
BIN_OP_SL_uxn_opcodes_h_l2278_c12_baae_right,
BIN_OP_SL_uxn_opcodes_h_l2278_c12_baae_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2283_c11_1c24
BIN_OP_EQ_uxn_opcodes_h_l2283_c11_1c24 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2283_c11_1c24_left,
BIN_OP_EQ_uxn_opcodes_h_l2283_c11_1c24_right,
BIN_OP_EQ_uxn_opcodes_h_l2283_c11_1c24_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_3b92
result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_3b92 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_3b92_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_3b92_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_3b92_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_3b92_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2283_c7_3b92
result_u8_value_MUX_uxn_opcodes_h_l2283_c7_3b92 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2283_c7_3b92_cond,
result_u8_value_MUX_uxn_opcodes_h_l2283_c7_3b92_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2283_c7_3b92_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2283_c7_3b92_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_3b92
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_3b92 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_3b92_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_3b92_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_3b92_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_3b92_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_3b92
result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_3b92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_3b92_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_3b92_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_3b92_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_3b92_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2286_c31_9aba
CONST_SR_8_uxn_opcodes_h_l2286_c31_9aba : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2286_c31_9aba_x,
CONST_SR_8_uxn_opcodes_h_l2286_c31_9aba_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2251_c6_540d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output,
 t8_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output,
 n16_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output,
 tmp16_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2264_c11_b0b9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output,
 t8_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output,
 n16_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output,
 tmp16_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b259_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output,
 t8_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output,
 n16_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output,
 tmp16_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2271_c11_aecd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2271_c7_6286_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_6286_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_6286_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_6286_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_6286_return_output,
 n16_MUX_uxn_opcodes_h_l2271_c7_6286_return_output,
 tmp16_MUX_uxn_opcodes_h_l2271_c7_6286_return_output,
 CONST_SL_8_uxn_opcodes_h_l2273_c3_d2db_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2275_c11_43cd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2275_c7_cd87_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_cd87_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_cd87_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_cd87_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_cd87_return_output,
 n16_MUX_uxn_opcodes_h_l2275_c7_cd87_return_output,
 tmp16_MUX_uxn_opcodes_h_l2275_c7_cd87_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2276_c3_64f2_return_output,
 sp_relative_shift_uxn_opcodes_h_l2277_c30_1f38_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2278_c20_2dac_return_output,
 BIN_OP_SR_uxn_opcodes_h_l2278_c12_94e9_return_output,
 CONST_SR_4_uxn_opcodes_h_l2278_c36_44f7_return_output,
 BIN_OP_SL_uxn_opcodes_h_l2278_c12_baae_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2283_c11_1c24_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_3b92_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2283_c7_3b92_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_3b92_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_3b92_return_output,
 CONST_SR_8_uxn_opcodes_h_l2286_c31_9aba_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_540d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_540d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_540d_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_59dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2251_c2_59dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_59dc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2261_c3_c1a9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_59dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2251_c2_59dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_59dc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2256_c3_b02f : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_59dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2251_c2_59dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_59dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_59dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2251_c2_59dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_59dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_59dc_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2251_c2_59dc_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2251_c2_59dc_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_59dc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_b0b9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_b0b9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_b0b9_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_68a0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_68a0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_68a0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_68a0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2265_c3_182b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_68a0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_68a0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_68a0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_68a0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_68a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_68a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_68a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_68a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_68a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_68a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_68a0_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2264_c7_68a0_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2264_c7_68a0_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2264_c7_68a0_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2264_c7_68a0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2264_c7_68a0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2264_c7_68a0_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_68a0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_68a0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_68a0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b259_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b259_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b259_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_2d4a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_2d4a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_6286_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_2d4a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_2d4a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2269_c3_e2fa : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_2d4a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_6286_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_2d4a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_2d4a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_2d4a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_6286_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_2d4a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_2d4a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_2d4a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_6286_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_2d4a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_2d4a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_2d4a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_6286_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_2d4a_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2267_c7_2d4a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2267_c7_2d4a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2267_c7_2d4a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2267_c7_2d4a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2267_c7_2d4a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2271_c7_6286_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2267_c7_2d4a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_2d4a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_2d4a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_6286_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_2d4a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_aecd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_aecd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_aecd_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_6286_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_6286_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_cd87_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_6286_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_6286_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_6286_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_cd87_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_6286_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_6286_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_6286_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_cd87_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_6286_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_6286_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_6286_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_cd87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_6286_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_6286_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_6286_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_cd87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_6286_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2271_c7_6286_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2271_c7_6286_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2275_c7_cd87_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2271_c7_6286_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_6286_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_6286_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_cd87_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_6286_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2273_c3_d2db_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2273_c3_d2db_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_43cd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_43cd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_43cd_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_cd87_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_cd87_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_3b92_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_cd87_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_cd87_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2280_c3_5af4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_cd87_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_3b92_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_cd87_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_cd87_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_cd87_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_3b92_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_cd87_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_cd87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_cd87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_3b92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_cd87_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_cd87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_cd87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_cd87_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2275_c7_cd87_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2275_c7_cd87_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2275_c7_cd87_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_cd87_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_cd87_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_cd87_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_64f2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_64f2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_64f2_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_1f38_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_1f38_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_1f38_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_1f38_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_94e9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_2dac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_2dac_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_2dac_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_94e9_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_94e9_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_baae_left : unsigned(15 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2278_c36_44f7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_baae_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2278_c36_44f7_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_baae_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2281_c21_1af6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_1c24_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_1c24_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_1c24_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_3b92_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2284_c3_6009 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_3b92_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_3b92_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_3b92_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_3b92_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_3b92_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_3b92_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2285_c3_9db9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_3b92_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_3b92_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_3b92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_3b92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_3b92_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2286_c31_9aba_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2286_c31_9aba_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2286_c21_ae11_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2264_l2251_l2283_l2271_l2267_DUPLICATE_189b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2271_l2264_l2267_l2283_DUPLICATE_157f_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2264_l2283_l2275_l2271_l2267_DUPLICATE_5ee8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2271_l2264_l2275_l2267_DUPLICATE_db71_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2272_l2276_DUPLICATE_79b9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2271_l2283_DUPLICATE_6cf9_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l2290_l2246_DUPLICATE_63ff_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_aecd_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2280_c3_5af4 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_cd87_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2280_c3_5af4;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2284_c3_6009 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_3b92_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2284_c3_6009;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_3b92_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2285_c3_9db9 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_3b92_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2285_c3_9db9;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_2dac_right := to_unsigned(15, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_b0b9_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_1f38_y := resize(to_signed(-1, 2), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2269_c3_e2fa := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_2d4a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2269_c3_e2fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b259_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_540d_right := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_cd87_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_1c24_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2261_c3_c1a9 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2261_c3_c1a9;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2265_c3_182b := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_68a0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2265_c3_182b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_43cd_right := to_unsigned(4, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2256_c3_b02f := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2256_c3_b02f;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_1f38_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_1f38_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_64f2_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2264_c7_68a0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2267_c7_2d4a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2275_c7_cd87_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_540d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_b0b9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b259_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_aecd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_43cd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_1c24_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l2267_c7_2d4a_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_2dac_left := t8;
     VAR_CONST_SR_4_uxn_opcodes_h_l2278_c36_44f7_x := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2264_c7_68a0_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2267_c7_2d4a_iffalse := t8;
     VAR_CONST_SR_8_uxn_opcodes_h_l2286_c31_9aba_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_68a0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_2d4a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_6286_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_cd87_iffalse := tmp16;
     -- CONST_SR_4[uxn_opcodes_h_l2278_c36_44f7] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l2278_c36_44f7_x <= VAR_CONST_SR_4_uxn_opcodes_h_l2278_c36_44f7_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l2278_c36_44f7_return_output := CONST_SR_4_uxn_opcodes_h_l2278_c36_44f7_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2271_l2264_l2267_l2283_DUPLICATE_157f LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2271_l2264_l2267_l2283_DUPLICATE_157f_return_output := result.sp_relative_shift;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2251_c2_59dc] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2251_c2_59dc_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2271_l2283_DUPLICATE_6cf9 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2271_l2283_DUPLICATE_6cf9_return_output := result.stack_address_sp_offset;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2251_c2_59dc] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2251_c2_59dc_return_output := result.is_vram_write;

     -- BIN_OP_AND[uxn_opcodes_h_l2278_c20_2dac] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2278_c20_2dac_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_2dac_left;
     BIN_OP_AND_uxn_opcodes_h_l2278_c20_2dac_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_2dac_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_2dac_return_output := BIN_OP_AND_uxn_opcodes_h_l2278_c20_2dac_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2283_c11_1c24] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2283_c11_1c24_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_1c24_left;
     BIN_OP_EQ_uxn_opcodes_h_l2283_c11_1c24_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_1c24_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_1c24_return_output := BIN_OP_EQ_uxn_opcodes_h_l2283_c11_1c24_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2275_c11_43cd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2275_c11_43cd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_43cd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2275_c11_43cd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_43cd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_43cd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2275_c11_43cd_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2272_l2276_DUPLICATE_79b9 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2272_l2276_DUPLICATE_79b9_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2267_c11_b259] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b259_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b259_left;
     BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b259_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b259_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b259_return_output := BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b259_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2286_c31_9aba] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2286_c31_9aba_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2286_c31_9aba_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2286_c31_9aba_return_output := CONST_SR_8_uxn_opcodes_h_l2286_c31_9aba_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2251_c6_540d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2251_c6_540d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_540d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2251_c6_540d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_540d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_540d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2251_c6_540d_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2277_c30_1f38] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2277_c30_1f38_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_1f38_ins;
     sp_relative_shift_uxn_opcodes_h_l2277_c30_1f38_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_1f38_x;
     sp_relative_shift_uxn_opcodes_h_l2277_c30_1f38_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_1f38_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_1f38_return_output := sp_relative_shift_uxn_opcodes_h_l2277_c30_1f38_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2264_l2251_l2283_l2271_l2267_DUPLICATE_189b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2264_l2251_l2283_l2271_l2267_DUPLICATE_189b_return_output := result.u8_value;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2251_c2_59dc] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2251_c2_59dc_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2264_l2283_l2275_l2271_l2267_DUPLICATE_5ee8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2264_l2283_l2275_l2271_l2267_DUPLICATE_5ee8_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2271_c11_aecd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2271_c11_aecd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_aecd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2271_c11_aecd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_aecd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_aecd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2271_c11_aecd_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2271_l2264_l2275_l2267_DUPLICATE_db71 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2271_l2264_l2275_l2267_DUPLICATE_db71_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2264_c11_b0b9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2264_c11_b0b9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_b0b9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2264_c11_b0b9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_b0b9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_b0b9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2264_c11_b0b9_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2251_c2_59dc] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2251_c2_59dc_return_output := result.is_ram_write;

     -- Submodule level 1
     VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_94e9_right := VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_2dac_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2251_c2_59dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_540d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_59dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_540d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_59dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_540d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_59dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_540d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_59dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_540d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_59dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_540d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_59dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_540d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_59dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_540d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_59dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_540d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_59dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_540d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2251_c2_59dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_540d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_59dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_540d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2264_c7_68a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_b0b9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_68a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_b0b9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_68a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_b0b9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_68a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_b0b9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_68a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_b0b9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_68a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_b0b9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2264_c7_68a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_b0b9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_68a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_b0b9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2267_c7_2d4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b259_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_2d4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b259_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_2d4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b259_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_2d4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b259_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_2d4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b259_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_2d4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b259_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2267_c7_2d4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b259_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_2d4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b259_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2271_c7_6286_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_aecd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_6286_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_aecd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_6286_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_aecd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_6286_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_aecd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_6286_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_aecd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_6286_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_aecd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_6286_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_aecd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2275_c7_cd87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_43cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_cd87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_43cd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_cd87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_43cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_cd87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_43cd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_cd87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_43cd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_cd87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_43cd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_cd87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_43cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_3b92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_1c24_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_3b92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_1c24_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_3b92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_1c24_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_3b92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_1c24_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_64f2_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2272_l2276_DUPLICATE_79b9_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2273_c3_d2db_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2272_l2276_DUPLICATE_79b9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_68a0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2271_l2264_l2267_l2283_DUPLICATE_157f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_2d4a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2271_l2264_l2267_l2283_DUPLICATE_157f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_6286_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2271_l2264_l2267_l2283_DUPLICATE_157f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_3b92_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2271_l2264_l2267_l2283_DUPLICATE_157f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_68a0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2264_l2283_l2275_l2271_l2267_DUPLICATE_5ee8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_2d4a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2264_l2283_l2275_l2271_l2267_DUPLICATE_5ee8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_6286_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2264_l2283_l2275_l2271_l2267_DUPLICATE_5ee8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_cd87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2264_l2283_l2275_l2271_l2267_DUPLICATE_5ee8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_3b92_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2264_l2283_l2275_l2271_l2267_DUPLICATE_5ee8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_68a0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2271_l2264_l2275_l2267_DUPLICATE_db71_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_2d4a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2271_l2264_l2275_l2267_DUPLICATE_db71_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_6286_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2271_l2264_l2275_l2267_DUPLICATE_db71_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_cd87_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2271_l2264_l2275_l2267_DUPLICATE_db71_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_6286_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2271_l2283_DUPLICATE_6cf9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_3b92_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2271_l2283_DUPLICATE_6cf9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2264_l2251_l2283_l2271_l2267_DUPLICATE_189b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_68a0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2264_l2251_l2283_l2271_l2267_DUPLICATE_189b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_2d4a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2264_l2251_l2283_l2271_l2267_DUPLICATE_189b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_6286_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2264_l2251_l2283_l2271_l2267_DUPLICATE_189b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_3b92_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2264_l2251_l2283_l2271_l2267_DUPLICATE_189b_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_baae_right := VAR_CONST_SR_4_uxn_opcodes_h_l2278_c36_44f7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2251_c2_59dc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2251_c2_59dc_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2251_c2_59dc_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2251_c2_59dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_cd87_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_1f38_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2251_c2_59dc] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_59dc_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_59dc_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2283_c7_3b92] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_3b92_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_3b92_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_3b92_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_3b92_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_3b92_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_3b92_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_3b92_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_3b92_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2286_c21_ae11] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2286_c21_ae11_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2286_c31_9aba_return_output);

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2251_c2_59dc] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_59dc_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_59dc_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2273_c3_d2db] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2273_c3_d2db_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2273_c3_d2db_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2273_c3_d2db_return_output := CONST_SL_8_uxn_opcodes_h_l2273_c3_d2db_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2275_c7_cd87] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_cd87_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_cd87_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_cd87_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_cd87_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_cd87_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_cd87_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_cd87_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_cd87_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2251_c2_59dc] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_59dc_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_59dc_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2276_c3_64f2] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2276_c3_64f2_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_64f2_left;
     BIN_OP_OR_uxn_opcodes_h_l2276_c3_64f2_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_64f2_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_64f2_return_output := BIN_OP_OR_uxn_opcodes_h_l2276_c3_64f2_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2251_c2_59dc] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_59dc_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_59dc_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2283_c7_3b92] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_3b92_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_3b92_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_3b92_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_3b92_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_3b92_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_3b92_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_3b92_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_3b92_return_output;

     -- t8_MUX[uxn_opcodes_h_l2267_c7_2d4a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2267_c7_2d4a_cond <= VAR_t8_MUX_uxn_opcodes_h_l2267_c7_2d4a_cond;
     t8_MUX_uxn_opcodes_h_l2267_c7_2d4a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2267_c7_2d4a_iftrue;
     t8_MUX_uxn_opcodes_h_l2267_c7_2d4a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2267_c7_2d4a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output := t8_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2283_c7_3b92] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_3b92_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_3b92_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_3b92_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_3b92_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_3b92_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_3b92_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_3b92_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_3b92_return_output;

     -- Submodule level 2
     VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_94e9_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_64f2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2275_c7_cd87_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_64f2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_3b92_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2286_c21_ae11_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2271_c7_6286_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2273_c3_d2db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_cd87_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_3b92_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_6286_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_cd87_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_cd87_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_3b92_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_cd87_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_3b92_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2264_c7_68a0_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2283_c7_3b92] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2283_c7_3b92_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_3b92_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2283_c7_3b92_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_3b92_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2283_c7_3b92_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_3b92_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_3b92_return_output := result_u8_value_MUX_uxn_opcodes_h_l2283_c7_3b92_return_output;

     -- t8_MUX[uxn_opcodes_h_l2264_c7_68a0] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2264_c7_68a0_cond <= VAR_t8_MUX_uxn_opcodes_h_l2264_c7_68a0_cond;
     t8_MUX_uxn_opcodes_h_l2264_c7_68a0_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2264_c7_68a0_iftrue;
     t8_MUX_uxn_opcodes_h_l2264_c7_68a0_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2264_c7_68a0_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output := t8_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output;

     -- BIN_OP_SR[uxn_opcodes_h_l2278_c12_94e9] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l2278_c12_94e9_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_94e9_left;
     BIN_OP_SR_uxn_opcodes_h_l2278_c12_94e9_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_94e9_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_94e9_return_output := BIN_OP_SR_uxn_opcodes_h_l2278_c12_94e9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2275_c7_cd87] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_cd87_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_cd87_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_cd87_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_cd87_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_cd87_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_cd87_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_cd87_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_cd87_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2275_c7_cd87] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_cd87_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_cd87_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_cd87_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_cd87_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_cd87_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_cd87_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_cd87_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_cd87_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2271_c7_6286] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_6286_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_6286_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_6286_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_6286_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_6286_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_6286_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_6286_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_6286_return_output;

     -- n16_MUX[uxn_opcodes_h_l2275_c7_cd87] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2275_c7_cd87_cond <= VAR_n16_MUX_uxn_opcodes_h_l2275_c7_cd87_cond;
     n16_MUX_uxn_opcodes_h_l2275_c7_cd87_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2275_c7_cd87_iftrue;
     n16_MUX_uxn_opcodes_h_l2275_c7_cd87_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2275_c7_cd87_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2275_c7_cd87_return_output := n16_MUX_uxn_opcodes_h_l2275_c7_cd87_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2275_c7_cd87] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_cd87_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_cd87_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_cd87_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_cd87_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_cd87_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_cd87_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_cd87_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_cd87_return_output;

     -- Submodule level 3
     VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_baae_left := VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_94e9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2271_c7_6286_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2275_c7_cd87_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_6286_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_cd87_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_2d4a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_6286_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_6286_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_cd87_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_6286_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_cd87_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_cd87_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_3b92_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2271_c7_6286] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_6286_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_6286_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_6286_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_6286_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_6286_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_6286_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_6286_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_6286_return_output;

     -- BIN_OP_SL[uxn_opcodes_h_l2278_c12_baae] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l2278_c12_baae_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_baae_left;
     BIN_OP_SL_uxn_opcodes_h_l2278_c12_baae_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_baae_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_baae_return_output := BIN_OP_SL_uxn_opcodes_h_l2278_c12_baae_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2271_c7_6286] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_6286_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_6286_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_6286_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_6286_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_6286_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_6286_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_6286_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_6286_return_output;

     -- t8_MUX[uxn_opcodes_h_l2251_c2_59dc] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2251_c2_59dc_cond <= VAR_t8_MUX_uxn_opcodes_h_l2251_c2_59dc_cond;
     t8_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue;
     t8_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output := t8_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2271_c7_6286] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_6286_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_6286_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_6286_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_6286_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_6286_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_6286_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_6286_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_6286_return_output;

     -- n16_MUX[uxn_opcodes_h_l2271_c7_6286] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2271_c7_6286_cond <= VAR_n16_MUX_uxn_opcodes_h_l2271_c7_6286_cond;
     n16_MUX_uxn_opcodes_h_l2271_c7_6286_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2271_c7_6286_iftrue;
     n16_MUX_uxn_opcodes_h_l2271_c7_6286_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2271_c7_6286_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2271_c7_6286_return_output := n16_MUX_uxn_opcodes_h_l2271_c7_6286_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2267_c7_2d4a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_2d4a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_2d4a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_2d4a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_2d4a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_2d4a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_2d4a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_cd87_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_baae_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2267_c7_2d4a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2271_c7_6286_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_2d4a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_6286_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_68a0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_2d4a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_6286_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_2d4a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_6286_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2264_c7_68a0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_68a0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_68a0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_68a0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_68a0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_68a0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_68a0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2281_c21_1af6] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2281_c21_1af6_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_baae_return_output);

     -- tmp16_MUX[uxn_opcodes_h_l2275_c7_cd87] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2275_c7_cd87_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_cd87_cond;
     tmp16_MUX_uxn_opcodes_h_l2275_c7_cd87_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_cd87_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2275_c7_cd87_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_cd87_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_cd87_return_output := tmp16_MUX_uxn_opcodes_h_l2275_c7_cd87_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2267_c7_2d4a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_2d4a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_2d4a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_2d4a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_2d4a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_2d4a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_2d4a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output;

     -- n16_MUX[uxn_opcodes_h_l2267_c7_2d4a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2267_c7_2d4a_cond <= VAR_n16_MUX_uxn_opcodes_h_l2267_c7_2d4a_cond;
     n16_MUX_uxn_opcodes_h_l2267_c7_2d4a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2267_c7_2d4a_iftrue;
     n16_MUX_uxn_opcodes_h_l2267_c7_2d4a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2267_c7_2d4a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output := n16_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2267_c7_2d4a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_2d4a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_2d4a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_2d4a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_2d4a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_2d4a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_2d4a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2267_c7_2d4a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_2d4a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_2d4a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_2d4a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_2d4a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_2d4a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_2d4a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output;

     -- Submodule level 5
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_cd87_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2281_c21_1af6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2264_c7_68a0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_68a0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_68a0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_68a0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_6286_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_cd87_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2264_c7_68a0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_68a0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_68a0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_68a0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_68a0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_68a0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_68a0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output;

     -- n16_MUX[uxn_opcodes_h_l2264_c7_68a0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2264_c7_68a0_cond <= VAR_n16_MUX_uxn_opcodes_h_l2264_c7_68a0_cond;
     n16_MUX_uxn_opcodes_h_l2264_c7_68a0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2264_c7_68a0_iftrue;
     n16_MUX_uxn_opcodes_h_l2264_c7_68a0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2264_c7_68a0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output := n16_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2251_c2_59dc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_59dc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_59dc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2271_c7_6286] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2271_c7_6286_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_6286_cond;
     tmp16_MUX_uxn_opcodes_h_l2271_c7_6286_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_6286_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2271_c7_6286_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_6286_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_6286_return_output := tmp16_MUX_uxn_opcodes_h_l2271_c7_6286_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2275_c7_cd87] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2275_c7_cd87_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_cd87_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2275_c7_cd87_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_cd87_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2275_c7_cd87_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_cd87_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_cd87_return_output := result_u8_value_MUX_uxn_opcodes_h_l2275_c7_cd87_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2264_c7_68a0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_68a0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_68a0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_68a0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_68a0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_68a0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_68a0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2264_c7_68a0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_68a0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_68a0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_68a0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_68a0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_68a0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_68a0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_6286_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_cd87_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_2d4a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_6286_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2251_c2_59dc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_59dc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_59dc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2251_c2_59dc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_59dc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_59dc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2251_c2_59dc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_59dc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_59dc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2267_c7_2d4a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2267_c7_2d4a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_2d4a_cond;
     tmp16_MUX_uxn_opcodes_h_l2267_c7_2d4a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_2d4a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2267_c7_2d4a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_2d4a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output := tmp16_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2271_c7_6286] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2271_c7_6286_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_6286_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2271_c7_6286_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_6286_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2271_c7_6286_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_6286_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_6286_return_output := result_u8_value_MUX_uxn_opcodes_h_l2271_c7_6286_return_output;

     -- n16_MUX[uxn_opcodes_h_l2251_c2_59dc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2251_c2_59dc_cond <= VAR_n16_MUX_uxn_opcodes_h_l2251_c2_59dc_cond;
     n16_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue;
     n16_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output := n16_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output;

     -- Submodule level 7
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_2d4a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_6286_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_68a0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2267_c7_2d4a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2267_c7_2d4a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_2d4a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2267_c7_2d4a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_2d4a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2267_c7_2d4a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_2d4a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2264_c7_68a0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2264_c7_68a0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_68a0_cond;
     tmp16_MUX_uxn_opcodes_h_l2264_c7_68a0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_68a0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2264_c7_68a0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_68a0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output := tmp16_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output;

     -- Submodule level 8
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_68a0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_2d4a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2264_c7_68a0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2264_c7_68a0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_68a0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2264_c7_68a0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_68a0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2264_c7_68a0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_68a0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output := result_u8_value_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2251_c2_59dc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2251_c2_59dc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_59dc_cond;
     tmp16_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output := tmp16_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_68a0_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2251_c2_59dc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2251_c2_59dc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_59dc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_59dc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_59dc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output := result_u8_value_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l2290_l2246_DUPLICATE_63ff LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l2290_l2246_DUPLICATE_63ff_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_922a(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_59dc_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l2290_l2246_DUPLICATE_63ff_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l2290_l2246_DUPLICATE_63ff_return_output;
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
