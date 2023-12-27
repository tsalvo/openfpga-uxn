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
-- BIN_OP_EQ[uxn_opcodes_h_l2251_c6_be9d]
signal BIN_OP_EQ_uxn_opcodes_h_l2251_c6_be9d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2251_c6_be9d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2251_c6_be9d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2251_c2_5fce]
signal tmp16_MUX_uxn_opcodes_h_l2251_c2_5fce_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2251_c2_5fce]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_5fce_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2251_c2_5fce]
signal result_u8_value_MUX_uxn_opcodes_h_l2251_c2_5fce_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2251_c2_5fce]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_5fce_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2251_c2_5fce]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_5fce_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2251_c2_5fce]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_5fce_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2251_c2_5fce]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_5fce_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2251_c2_5fce]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_5fce_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2251_c2_5fce]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_5fce_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2251_c2_5fce]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_5fce_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2251_c2_5fce]
signal t8_MUX_uxn_opcodes_h_l2251_c2_5fce_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2251_c2_5fce]
signal n16_MUX_uxn_opcodes_h_l2251_c2_5fce_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2264_c11_6390]
signal BIN_OP_EQ_uxn_opcodes_h_l2264_c11_6390_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2264_c11_6390_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2264_c11_6390_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2264_c7_3ff9]
signal tmp16_MUX_uxn_opcodes_h_l2264_c7_3ff9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2264_c7_3ff9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2264_c7_3ff9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2264_c7_3ff9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_3ff9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_3ff9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_3ff9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2264_c7_3ff9]
signal result_u8_value_MUX_uxn_opcodes_h_l2264_c7_3ff9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2264_c7_3ff9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2264_c7_3ff9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2264_c7_3ff9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_3ff9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_3ff9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_3ff9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2264_c7_3ff9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_3ff9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_3ff9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_3ff9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2264_c7_3ff9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_3ff9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_3ff9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_3ff9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2264_c7_3ff9]
signal t8_MUX_uxn_opcodes_h_l2264_c7_3ff9_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2264_c7_3ff9_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2264_c7_3ff9_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2264_c7_3ff9]
signal n16_MUX_uxn_opcodes_h_l2264_c7_3ff9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2264_c7_3ff9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2264_c7_3ff9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2267_c11_d180]
signal BIN_OP_EQ_uxn_opcodes_h_l2267_c11_d180_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2267_c11_d180_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2267_c11_d180_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2267_c7_e1d2]
signal tmp16_MUX_uxn_opcodes_h_l2267_c7_e1d2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2267_c7_e1d2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2267_c7_e1d2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2267_c7_e1d2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_e1d2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_e1d2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_e1d2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2267_c7_e1d2]
signal result_u8_value_MUX_uxn_opcodes_h_l2267_c7_e1d2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2267_c7_e1d2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2267_c7_e1d2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2267_c7_e1d2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_e1d2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_e1d2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_e1d2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2267_c7_e1d2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_e1d2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_e1d2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_e1d2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2267_c7_e1d2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_e1d2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_e1d2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_e1d2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2267_c7_e1d2]
signal t8_MUX_uxn_opcodes_h_l2267_c7_e1d2_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2267_c7_e1d2_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2267_c7_e1d2_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2267_c7_e1d2]
signal n16_MUX_uxn_opcodes_h_l2267_c7_e1d2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2267_c7_e1d2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2267_c7_e1d2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2271_c11_0274]
signal BIN_OP_EQ_uxn_opcodes_h_l2271_c11_0274_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2271_c11_0274_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2271_c11_0274_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2271_c7_6b63]
signal tmp16_MUX_uxn_opcodes_h_l2271_c7_6b63_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2271_c7_6b63_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2271_c7_6b63_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2271_c7_6b63_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2271_c7_6b63]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_6b63_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_6b63_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_6b63_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_6b63_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2271_c7_6b63]
signal result_u8_value_MUX_uxn_opcodes_h_l2271_c7_6b63_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2271_c7_6b63_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2271_c7_6b63_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2271_c7_6b63_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2271_c7_6b63]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_6b63_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_6b63_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_6b63_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_6b63_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2271_c7_6b63]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_6b63_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_6b63_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_6b63_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_6b63_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2271_c7_6b63]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_6b63_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_6b63_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_6b63_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_6b63_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2271_c7_6b63]
signal n16_MUX_uxn_opcodes_h_l2271_c7_6b63_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2271_c7_6b63_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2271_c7_6b63_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2271_c7_6b63_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2273_c3_1054]
signal CONST_SL_8_uxn_opcodes_h_l2273_c3_1054_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2273_c3_1054_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2275_c11_d544]
signal BIN_OP_EQ_uxn_opcodes_h_l2275_c11_d544_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2275_c11_d544_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2275_c11_d544_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2275_c7_f686]
signal tmp16_MUX_uxn_opcodes_h_l2275_c7_f686_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2275_c7_f686_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2275_c7_f686_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2275_c7_f686_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2275_c7_f686]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_f686_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_f686_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_f686_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_f686_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2275_c7_f686]
signal result_u8_value_MUX_uxn_opcodes_h_l2275_c7_f686_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2275_c7_f686_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2275_c7_f686_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2275_c7_f686_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2275_c7_f686]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_f686_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_f686_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_f686_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_f686_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2275_c7_f686]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_f686_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_f686_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_f686_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_f686_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2275_c7_f686]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_f686_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_f686_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_f686_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_f686_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2275_c7_f686]
signal n16_MUX_uxn_opcodes_h_l2275_c7_f686_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2275_c7_f686_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2275_c7_f686_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2275_c7_f686_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2276_c3_d001]
signal BIN_OP_OR_uxn_opcodes_h_l2276_c3_d001_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2276_c3_d001_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2276_c3_d001_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2277_c30_1be4]
signal sp_relative_shift_uxn_opcodes_h_l2277_c30_1be4_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2277_c30_1be4_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2277_c30_1be4_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2277_c30_1be4_return_output : signed(3 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2278_c20_0cf4]
signal BIN_OP_AND_uxn_opcodes_h_l2278_c20_0cf4_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2278_c20_0cf4_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2278_c20_0cf4_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l2278_c12_8021]
signal BIN_OP_SR_uxn_opcodes_h_l2278_c12_8021_left : unsigned(15 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2278_c12_8021_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2278_c12_8021_return_output : unsigned(15 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l2278_c36_e61d]
signal CONST_SR_4_uxn_opcodes_h_l2278_c36_e61d_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l2278_c36_e61d_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l2278_c12_57d8]
signal BIN_OP_SL_uxn_opcodes_h_l2278_c12_57d8_left : unsigned(15 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2278_c12_57d8_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2278_c12_57d8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2283_c11_8697]
signal BIN_OP_EQ_uxn_opcodes_h_l2283_c11_8697_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2283_c11_8697_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2283_c11_8697_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2283_c7_23f8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_23f8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_23f8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_23f8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_23f8_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2283_c7_23f8]
signal result_u8_value_MUX_uxn_opcodes_h_l2283_c7_23f8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2283_c7_23f8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2283_c7_23f8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2283_c7_23f8_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2283_c7_23f8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_23f8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_23f8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_23f8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_23f8_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2283_c7_23f8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_23f8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_23f8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_23f8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_23f8_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2286_c31_9a2e]
signal CONST_SR_8_uxn_opcodes_h_l2286_c31_9a2e_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2286_c31_9a2e_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_b856( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2251_c6_be9d
BIN_OP_EQ_uxn_opcodes_h_l2251_c6_be9d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2251_c6_be9d_left,
BIN_OP_EQ_uxn_opcodes_h_l2251_c6_be9d_right,
BIN_OP_EQ_uxn_opcodes_h_l2251_c6_be9d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2251_c2_5fce
tmp16_MUX_uxn_opcodes_h_l2251_c2_5fce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2251_c2_5fce_cond,
tmp16_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue,
tmp16_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse,
tmp16_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_5fce
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_5fce : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_5fce_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2251_c2_5fce
result_u8_value_MUX_uxn_opcodes_h_l2251_c2_5fce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2251_c2_5fce_cond,
result_u8_value_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_5fce
result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_5fce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_5fce_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_5fce
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_5fce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_5fce_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_5fce
result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_5fce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_5fce_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_5fce
result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_5fce : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_5fce_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_5fce
result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_5fce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_5fce_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_5fce
result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_5fce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_5fce_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_5fce
result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_5fce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_5fce_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output);

-- t8_MUX_uxn_opcodes_h_l2251_c2_5fce
t8_MUX_uxn_opcodes_h_l2251_c2_5fce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2251_c2_5fce_cond,
t8_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue,
t8_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse,
t8_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output);

-- n16_MUX_uxn_opcodes_h_l2251_c2_5fce
n16_MUX_uxn_opcodes_h_l2251_c2_5fce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2251_c2_5fce_cond,
n16_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue,
n16_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse,
n16_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2264_c11_6390
BIN_OP_EQ_uxn_opcodes_h_l2264_c11_6390 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2264_c11_6390_left,
BIN_OP_EQ_uxn_opcodes_h_l2264_c11_6390_right,
BIN_OP_EQ_uxn_opcodes_h_l2264_c11_6390_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2264_c7_3ff9
tmp16_MUX_uxn_opcodes_h_l2264_c7_3ff9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2264_c7_3ff9_cond,
tmp16_MUX_uxn_opcodes_h_l2264_c7_3ff9_iftrue,
tmp16_MUX_uxn_opcodes_h_l2264_c7_3ff9_iffalse,
tmp16_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_3ff9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_3ff9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_3ff9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_3ff9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_3ff9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2264_c7_3ff9
result_u8_value_MUX_uxn_opcodes_h_l2264_c7_3ff9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2264_c7_3ff9_cond,
result_u8_value_MUX_uxn_opcodes_h_l2264_c7_3ff9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2264_c7_3ff9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_3ff9
result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_3ff9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_3ff9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_3ff9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_3ff9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_3ff9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_3ff9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_3ff9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_3ff9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_3ff9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_3ff9
result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_3ff9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_3ff9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_3ff9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_3ff9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output);

-- t8_MUX_uxn_opcodes_h_l2264_c7_3ff9
t8_MUX_uxn_opcodes_h_l2264_c7_3ff9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2264_c7_3ff9_cond,
t8_MUX_uxn_opcodes_h_l2264_c7_3ff9_iftrue,
t8_MUX_uxn_opcodes_h_l2264_c7_3ff9_iffalse,
t8_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output);

-- n16_MUX_uxn_opcodes_h_l2264_c7_3ff9
n16_MUX_uxn_opcodes_h_l2264_c7_3ff9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2264_c7_3ff9_cond,
n16_MUX_uxn_opcodes_h_l2264_c7_3ff9_iftrue,
n16_MUX_uxn_opcodes_h_l2264_c7_3ff9_iffalse,
n16_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2267_c11_d180
BIN_OP_EQ_uxn_opcodes_h_l2267_c11_d180 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2267_c11_d180_left,
BIN_OP_EQ_uxn_opcodes_h_l2267_c11_d180_right,
BIN_OP_EQ_uxn_opcodes_h_l2267_c11_d180_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2267_c7_e1d2
tmp16_MUX_uxn_opcodes_h_l2267_c7_e1d2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2267_c7_e1d2_cond,
tmp16_MUX_uxn_opcodes_h_l2267_c7_e1d2_iftrue,
tmp16_MUX_uxn_opcodes_h_l2267_c7_e1d2_iffalse,
tmp16_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_e1d2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_e1d2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_e1d2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_e1d2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_e1d2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2267_c7_e1d2
result_u8_value_MUX_uxn_opcodes_h_l2267_c7_e1d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2267_c7_e1d2_cond,
result_u8_value_MUX_uxn_opcodes_h_l2267_c7_e1d2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2267_c7_e1d2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_e1d2
result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_e1d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_e1d2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_e1d2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_e1d2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_e1d2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_e1d2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_e1d2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_e1d2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_e1d2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_e1d2
result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_e1d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_e1d2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_e1d2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_e1d2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output);

-- t8_MUX_uxn_opcodes_h_l2267_c7_e1d2
t8_MUX_uxn_opcodes_h_l2267_c7_e1d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2267_c7_e1d2_cond,
t8_MUX_uxn_opcodes_h_l2267_c7_e1d2_iftrue,
t8_MUX_uxn_opcodes_h_l2267_c7_e1d2_iffalse,
t8_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output);

-- n16_MUX_uxn_opcodes_h_l2267_c7_e1d2
n16_MUX_uxn_opcodes_h_l2267_c7_e1d2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2267_c7_e1d2_cond,
n16_MUX_uxn_opcodes_h_l2267_c7_e1d2_iftrue,
n16_MUX_uxn_opcodes_h_l2267_c7_e1d2_iffalse,
n16_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2271_c11_0274
BIN_OP_EQ_uxn_opcodes_h_l2271_c11_0274 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2271_c11_0274_left,
BIN_OP_EQ_uxn_opcodes_h_l2271_c11_0274_right,
BIN_OP_EQ_uxn_opcodes_h_l2271_c11_0274_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2271_c7_6b63
tmp16_MUX_uxn_opcodes_h_l2271_c7_6b63 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2271_c7_6b63_cond,
tmp16_MUX_uxn_opcodes_h_l2271_c7_6b63_iftrue,
tmp16_MUX_uxn_opcodes_h_l2271_c7_6b63_iffalse,
tmp16_MUX_uxn_opcodes_h_l2271_c7_6b63_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_6b63
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_6b63 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_6b63_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_6b63_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_6b63_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_6b63_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2271_c7_6b63
result_u8_value_MUX_uxn_opcodes_h_l2271_c7_6b63 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2271_c7_6b63_cond,
result_u8_value_MUX_uxn_opcodes_h_l2271_c7_6b63_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2271_c7_6b63_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2271_c7_6b63_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_6b63
result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_6b63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_6b63_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_6b63_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_6b63_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_6b63_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_6b63
result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_6b63 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_6b63_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_6b63_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_6b63_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_6b63_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_6b63
result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_6b63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_6b63_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_6b63_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_6b63_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_6b63_return_output);

-- n16_MUX_uxn_opcodes_h_l2271_c7_6b63
n16_MUX_uxn_opcodes_h_l2271_c7_6b63 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2271_c7_6b63_cond,
n16_MUX_uxn_opcodes_h_l2271_c7_6b63_iftrue,
n16_MUX_uxn_opcodes_h_l2271_c7_6b63_iffalse,
n16_MUX_uxn_opcodes_h_l2271_c7_6b63_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2273_c3_1054
CONST_SL_8_uxn_opcodes_h_l2273_c3_1054 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2273_c3_1054_x,
CONST_SL_8_uxn_opcodes_h_l2273_c3_1054_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2275_c11_d544
BIN_OP_EQ_uxn_opcodes_h_l2275_c11_d544 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2275_c11_d544_left,
BIN_OP_EQ_uxn_opcodes_h_l2275_c11_d544_right,
BIN_OP_EQ_uxn_opcodes_h_l2275_c11_d544_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2275_c7_f686
tmp16_MUX_uxn_opcodes_h_l2275_c7_f686 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2275_c7_f686_cond,
tmp16_MUX_uxn_opcodes_h_l2275_c7_f686_iftrue,
tmp16_MUX_uxn_opcodes_h_l2275_c7_f686_iffalse,
tmp16_MUX_uxn_opcodes_h_l2275_c7_f686_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_f686
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_f686 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_f686_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_f686_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_f686_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_f686_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2275_c7_f686
result_u8_value_MUX_uxn_opcodes_h_l2275_c7_f686 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2275_c7_f686_cond,
result_u8_value_MUX_uxn_opcodes_h_l2275_c7_f686_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2275_c7_f686_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2275_c7_f686_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_f686
result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_f686 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_f686_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_f686_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_f686_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_f686_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_f686
result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_f686 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_f686_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_f686_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_f686_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_f686_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_f686
result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_f686 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_f686_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_f686_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_f686_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_f686_return_output);

-- n16_MUX_uxn_opcodes_h_l2275_c7_f686
n16_MUX_uxn_opcodes_h_l2275_c7_f686 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2275_c7_f686_cond,
n16_MUX_uxn_opcodes_h_l2275_c7_f686_iftrue,
n16_MUX_uxn_opcodes_h_l2275_c7_f686_iffalse,
n16_MUX_uxn_opcodes_h_l2275_c7_f686_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2276_c3_d001
BIN_OP_OR_uxn_opcodes_h_l2276_c3_d001 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2276_c3_d001_left,
BIN_OP_OR_uxn_opcodes_h_l2276_c3_d001_right,
BIN_OP_OR_uxn_opcodes_h_l2276_c3_d001_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2277_c30_1be4
sp_relative_shift_uxn_opcodes_h_l2277_c30_1be4 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2277_c30_1be4_ins,
sp_relative_shift_uxn_opcodes_h_l2277_c30_1be4_x,
sp_relative_shift_uxn_opcodes_h_l2277_c30_1be4_y,
sp_relative_shift_uxn_opcodes_h_l2277_c30_1be4_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2278_c20_0cf4
BIN_OP_AND_uxn_opcodes_h_l2278_c20_0cf4 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2278_c20_0cf4_left,
BIN_OP_AND_uxn_opcodes_h_l2278_c20_0cf4_right,
BIN_OP_AND_uxn_opcodes_h_l2278_c20_0cf4_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l2278_c12_8021
BIN_OP_SR_uxn_opcodes_h_l2278_c12_8021 : entity work.BIN_OP_SR_uint16_t_uint8_t_0CLK_295015b8 port map (
BIN_OP_SR_uxn_opcodes_h_l2278_c12_8021_left,
BIN_OP_SR_uxn_opcodes_h_l2278_c12_8021_right,
BIN_OP_SR_uxn_opcodes_h_l2278_c12_8021_return_output);

-- CONST_SR_4_uxn_opcodes_h_l2278_c36_e61d
CONST_SR_4_uxn_opcodes_h_l2278_c36_e61d : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l2278_c36_e61d_x,
CONST_SR_4_uxn_opcodes_h_l2278_c36_e61d_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l2278_c12_57d8
BIN_OP_SL_uxn_opcodes_h_l2278_c12_57d8 : entity work.BIN_OP_SL_uint16_t_uint8_t_0CLK_b6546dec port map (
BIN_OP_SL_uxn_opcodes_h_l2278_c12_57d8_left,
BIN_OP_SL_uxn_opcodes_h_l2278_c12_57d8_right,
BIN_OP_SL_uxn_opcodes_h_l2278_c12_57d8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2283_c11_8697
BIN_OP_EQ_uxn_opcodes_h_l2283_c11_8697 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2283_c11_8697_left,
BIN_OP_EQ_uxn_opcodes_h_l2283_c11_8697_right,
BIN_OP_EQ_uxn_opcodes_h_l2283_c11_8697_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_23f8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_23f8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_23f8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_23f8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_23f8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_23f8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2283_c7_23f8
result_u8_value_MUX_uxn_opcodes_h_l2283_c7_23f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2283_c7_23f8_cond,
result_u8_value_MUX_uxn_opcodes_h_l2283_c7_23f8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2283_c7_23f8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2283_c7_23f8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_23f8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_23f8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_23f8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_23f8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_23f8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_23f8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_23f8
result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_23f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_23f8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_23f8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_23f8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_23f8_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2286_c31_9a2e
CONST_SR_8_uxn_opcodes_h_l2286_c31_9a2e : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2286_c31_9a2e_x,
CONST_SR_8_uxn_opcodes_h_l2286_c31_9a2e_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2251_c6_be9d_return_output,
 tmp16_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output,
 t8_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output,
 n16_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2264_c11_6390_return_output,
 tmp16_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output,
 t8_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output,
 n16_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2267_c11_d180_return_output,
 tmp16_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output,
 t8_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output,
 n16_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2271_c11_0274_return_output,
 tmp16_MUX_uxn_opcodes_h_l2271_c7_6b63_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_6b63_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2271_c7_6b63_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_6b63_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_6b63_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_6b63_return_output,
 n16_MUX_uxn_opcodes_h_l2271_c7_6b63_return_output,
 CONST_SL_8_uxn_opcodes_h_l2273_c3_1054_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2275_c11_d544_return_output,
 tmp16_MUX_uxn_opcodes_h_l2275_c7_f686_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_f686_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2275_c7_f686_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_f686_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_f686_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_f686_return_output,
 n16_MUX_uxn_opcodes_h_l2275_c7_f686_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2276_c3_d001_return_output,
 sp_relative_shift_uxn_opcodes_h_l2277_c30_1be4_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2278_c20_0cf4_return_output,
 BIN_OP_SR_uxn_opcodes_h_l2278_c12_8021_return_output,
 CONST_SR_4_uxn_opcodes_h_l2278_c36_e61d_return_output,
 BIN_OP_SL_uxn_opcodes_h_l2278_c12_57d8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2283_c11_8697_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_23f8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2283_c7_23f8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_23f8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_23f8_return_output,
 CONST_SR_8_uxn_opcodes_h_l2286_c31_9a2e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_be9d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_be9d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_be9d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_5fce_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2261_c3_66a3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_5fce_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_5fce_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2251_c2_5fce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_5fce_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2251_c2_5fce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_5fce_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_5fce_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2256_c3_63b8 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_5fce_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2251_c2_5fce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_5fce_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2251_c2_5fce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_5fce_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_5fce_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2251_c2_5fce_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2251_c2_5fce_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_6390_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_6390_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_6390_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_3ff9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_3ff9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_3ff9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_3ff9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2265_c3_78f6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_3ff9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_3ff9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_3ff9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_3ff9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_3ff9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_3ff9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_3ff9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_3ff9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_3ff9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_3ff9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_3ff9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_3ff9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_3ff9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_3ff9_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2264_c7_3ff9_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2264_c7_3ff9_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2264_c7_3ff9_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2264_c7_3ff9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2264_c7_3ff9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2264_c7_3ff9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_d180_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_d180_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_d180_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_e1d2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_e1d2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_6b63_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_e1d2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_e1d2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2269_c3_c2cf : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_e1d2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_6b63_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_e1d2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_e1d2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_e1d2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_6b63_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_e1d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_e1d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_e1d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_6b63_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_e1d2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_e1d2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_e1d2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_6b63_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_e1d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_e1d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_e1d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_6b63_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_e1d2_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2267_c7_e1d2_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2267_c7_e1d2_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2267_c7_e1d2_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2267_c7_e1d2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2267_c7_e1d2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2271_c7_6b63_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2267_c7_e1d2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_0274_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_0274_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_0274_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_6b63_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_6b63_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_f686_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_6b63_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_6b63_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_6b63_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_f686_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_6b63_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_6b63_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_6b63_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_f686_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_6b63_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_6b63_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_6b63_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_f686_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_6b63_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_6b63_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_6b63_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_f686_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_6b63_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_6b63_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_6b63_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_f686_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_6b63_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2271_c7_6b63_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2271_c7_6b63_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2275_c7_f686_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2271_c7_6b63_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2273_c3_1054_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2273_c3_1054_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_d544_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_d544_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_d544_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_f686_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_f686_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_f686_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_f686_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2280_c3_a51e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_f686_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_23f8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_f686_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_f686_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_f686_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_23f8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_f686_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_f686_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_f686_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_f686_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_f686_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_f686_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_23f8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_f686_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_f686_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_f686_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_23f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_f686_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2275_c7_f686_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2275_c7_f686_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2275_c7_f686_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_d001_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_d001_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_d001_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_1be4_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_1be4_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_1be4_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_1be4_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_8021_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_0cf4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_0cf4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_0cf4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_8021_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_8021_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_57d8_left : unsigned(15 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2278_c36_e61d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_57d8_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2278_c36_e61d_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_57d8_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2281_c21_cc49_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_8697_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_8697_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_8697_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_23f8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2285_c3_f471 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_23f8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_23f8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_23f8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_23f8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_23f8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_23f8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2284_c3_c86f : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_23f8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_23f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_23f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_23f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_23f8_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2286_c31_9a2e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2286_c31_9a2e_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2286_c21_f5d7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2271_l2267_l2264_l2251_l2283_DUPLICATE_c588_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2271_l2264_l2275_l2267_DUPLICATE_f3c5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2271_l2264_l2267_l2283_DUPLICATE_6b38_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2275_l2271_l2267_l2264_l2283_DUPLICATE_272e_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2272_l2276_DUPLICATE_2396_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2271_l2283_DUPLICATE_0b80_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l2290_l2246_DUPLICATE_cea7_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2265_c3_78f6 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_3ff9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2265_c3_78f6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_d544_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_1be4_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_d180_right := to_unsigned(2, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_23f8_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_8697_right := to_unsigned(5, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_1be4_y := resize(to_signed(-1, 2), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2261_c3_66a3 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2261_c3_66a3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_be9d_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2280_c3_a51e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_f686_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2280_c3_a51e;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_0cf4_right := to_unsigned(15, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_0274_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_6390_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2285_c3_f471 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_23f8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2285_c3_f471;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2284_c3_c86f := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_23f8_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2284_c3_c86f;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2269_c3_c2cf := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_e1d2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2269_c3_c2cf;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2256_c3_63b8 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2256_c3_63b8;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_f686_iftrue := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_1be4_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_d001_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2264_c7_3ff9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2267_c7_e1d2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2275_c7_f686_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_be9d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_6390_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_d180_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_0274_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_d544_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_8697_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l2267_c7_e1d2_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_0cf4_left := t8;
     VAR_CONST_SR_4_uxn_opcodes_h_l2278_c36_e61d_x := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2264_c7_3ff9_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2267_c7_e1d2_iffalse := t8;
     VAR_CONST_SR_8_uxn_opcodes_h_l2286_c31_9a2e_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_3ff9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_e1d2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_6b63_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_f686_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2275_c11_d544] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2275_c11_d544_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_d544_left;
     BIN_OP_EQ_uxn_opcodes_h_l2275_c11_d544_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_d544_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_d544_return_output := BIN_OP_EQ_uxn_opcodes_h_l2275_c11_d544_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2271_l2283_DUPLICATE_0b80 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2271_l2283_DUPLICATE_0b80_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2272_l2276_DUPLICATE_2396 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2272_l2276_DUPLICATE_2396_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2251_c2_5fce] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2251_c2_5fce_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l2283_c11_8697] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2283_c11_8697_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_8697_left;
     BIN_OP_EQ_uxn_opcodes_h_l2283_c11_8697_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_8697_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_8697_return_output := BIN_OP_EQ_uxn_opcodes_h_l2283_c11_8697_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2286_c31_9a2e] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2286_c31_9a2e_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2286_c31_9a2e_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2286_c31_9a2e_return_output := CONST_SR_8_uxn_opcodes_h_l2286_c31_9a2e_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2278_c20_0cf4] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2278_c20_0cf4_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_0cf4_left;
     BIN_OP_AND_uxn_opcodes_h_l2278_c20_0cf4_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_0cf4_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_0cf4_return_output := BIN_OP_AND_uxn_opcodes_h_l2278_c20_0cf4_return_output;

     -- CONST_SR_4[uxn_opcodes_h_l2278_c36_e61d] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l2278_c36_e61d_x <= VAR_CONST_SR_4_uxn_opcodes_h_l2278_c36_e61d_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l2278_c36_e61d_return_output := CONST_SR_4_uxn_opcodes_h_l2278_c36_e61d_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2271_l2267_l2264_l2251_l2283_DUPLICATE_c588 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2271_l2267_l2264_l2251_l2283_DUPLICATE_c588_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2271_l2264_l2275_l2267_DUPLICATE_f3c5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2271_l2264_l2275_l2267_DUPLICATE_f3c5_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2267_c11_d180] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2267_c11_d180_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_d180_left;
     BIN_OP_EQ_uxn_opcodes_h_l2267_c11_d180_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_d180_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_d180_return_output := BIN_OP_EQ_uxn_opcodes_h_l2267_c11_d180_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2251_c2_5fce] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2251_c2_5fce_return_output := result.is_ram_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2251_c2_5fce] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2251_c2_5fce_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2275_l2271_l2267_l2264_l2283_DUPLICATE_272e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2275_l2271_l2267_l2264_l2283_DUPLICATE_272e_return_output := result.is_opc_done;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2251_c2_5fce] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2251_c2_5fce_return_output := result.is_vram_write;

     -- sp_relative_shift[uxn_opcodes_h_l2277_c30_1be4] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2277_c30_1be4_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_1be4_ins;
     sp_relative_shift_uxn_opcodes_h_l2277_c30_1be4_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_1be4_x;
     sp_relative_shift_uxn_opcodes_h_l2277_c30_1be4_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_1be4_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_1be4_return_output := sp_relative_shift_uxn_opcodes_h_l2277_c30_1be4_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2271_l2264_l2267_l2283_DUPLICATE_6b38 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2271_l2264_l2267_l2283_DUPLICATE_6b38_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2264_c11_6390] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2264_c11_6390_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_6390_left;
     BIN_OP_EQ_uxn_opcodes_h_l2264_c11_6390_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_6390_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_6390_return_output := BIN_OP_EQ_uxn_opcodes_h_l2264_c11_6390_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2251_c6_be9d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2251_c6_be9d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_be9d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2251_c6_be9d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_be9d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_be9d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2251_c6_be9d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2271_c11_0274] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2271_c11_0274_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_0274_left;
     BIN_OP_EQ_uxn_opcodes_h_l2271_c11_0274_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_0274_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_0274_return_output := BIN_OP_EQ_uxn_opcodes_h_l2271_c11_0274_return_output;

     -- Submodule level 1
     VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_8021_right := VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_0cf4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2251_c2_5fce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_be9d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_5fce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_be9d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_5fce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_be9d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_5fce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_be9d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_5fce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_be9d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_5fce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_be9d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_5fce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_be9d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_5fce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_be9d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_5fce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_be9d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_5fce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_be9d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2251_c2_5fce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_be9d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_5fce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_be9d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2264_c7_3ff9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_6390_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_3ff9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_6390_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_3ff9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_6390_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_3ff9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_6390_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_3ff9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_6390_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_3ff9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_6390_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2264_c7_3ff9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_6390_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_3ff9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_6390_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2267_c7_e1d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_d180_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_e1d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_d180_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_e1d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_d180_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_e1d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_d180_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_e1d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_d180_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_e1d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_d180_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2267_c7_e1d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_d180_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_e1d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_d180_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2271_c7_6b63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_0274_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_6b63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_0274_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_6b63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_0274_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_6b63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_0274_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_6b63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_0274_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_6b63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_0274_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_6b63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_0274_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2275_c7_f686_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_d544_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_f686_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_d544_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_f686_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_d544_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_f686_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_d544_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_f686_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_d544_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_f686_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_d544_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_f686_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_d544_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_23f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_8697_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_23f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_8697_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_23f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_8697_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_23f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_8697_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_d001_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2272_l2276_DUPLICATE_2396_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2273_c3_1054_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2272_l2276_DUPLICATE_2396_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_3ff9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2271_l2264_l2267_l2283_DUPLICATE_6b38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_e1d2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2271_l2264_l2267_l2283_DUPLICATE_6b38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_6b63_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2271_l2264_l2267_l2283_DUPLICATE_6b38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_23f8_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2271_l2264_l2267_l2283_DUPLICATE_6b38_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_3ff9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2275_l2271_l2267_l2264_l2283_DUPLICATE_272e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_e1d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2275_l2271_l2267_l2264_l2283_DUPLICATE_272e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_6b63_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2275_l2271_l2267_l2264_l2283_DUPLICATE_272e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_f686_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2275_l2271_l2267_l2264_l2283_DUPLICATE_272e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_23f8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2275_l2271_l2267_l2264_l2283_DUPLICATE_272e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_3ff9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2271_l2264_l2275_l2267_DUPLICATE_f3c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_e1d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2271_l2264_l2275_l2267_DUPLICATE_f3c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_6b63_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2271_l2264_l2275_l2267_DUPLICATE_f3c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_f686_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2271_l2264_l2275_l2267_DUPLICATE_f3c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_6b63_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2271_l2283_DUPLICATE_0b80_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_23f8_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2271_l2283_DUPLICATE_0b80_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2271_l2267_l2264_l2251_l2283_DUPLICATE_c588_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_3ff9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2271_l2267_l2264_l2251_l2283_DUPLICATE_c588_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_e1d2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2271_l2267_l2264_l2251_l2283_DUPLICATE_c588_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_6b63_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2271_l2267_l2264_l2251_l2283_DUPLICATE_c588_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_23f8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2271_l2267_l2264_l2251_l2283_DUPLICATE_c588_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_57d8_right := VAR_CONST_SR_4_uxn_opcodes_h_l2278_c36_e61d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2251_c2_5fce_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2251_c2_5fce_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2251_c2_5fce_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2251_c2_5fce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_f686_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_1be4_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l2251_c2_5fce] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_5fce_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_5fce_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2286_c21_f5d7] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2286_c21_f5d7_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2286_c31_9a2e_return_output);

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2251_c2_5fce] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_5fce_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_5fce_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output;

     -- t8_MUX[uxn_opcodes_h_l2267_c7_e1d2] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2267_c7_e1d2_cond <= VAR_t8_MUX_uxn_opcodes_h_l2267_c7_e1d2_cond;
     t8_MUX_uxn_opcodes_h_l2267_c7_e1d2_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2267_c7_e1d2_iftrue;
     t8_MUX_uxn_opcodes_h_l2267_c7_e1d2_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2267_c7_e1d2_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output := t8_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2276_c3_d001] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2276_c3_d001_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_d001_left;
     BIN_OP_OR_uxn_opcodes_h_l2276_c3_d001_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_d001_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_d001_return_output := BIN_OP_OR_uxn_opcodes_h_l2276_c3_d001_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2273_c3_1054] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2273_c3_1054_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2273_c3_1054_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2273_c3_1054_return_output := CONST_SL_8_uxn_opcodes_h_l2273_c3_1054_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2251_c2_5fce] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_5fce_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_5fce_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2283_c7_23f8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_23f8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_23f8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_23f8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_23f8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_23f8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_23f8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_23f8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_23f8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2275_c7_f686] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_f686_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_f686_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_f686_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_f686_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_f686_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_f686_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_f686_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_f686_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2283_c7_23f8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_23f8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_23f8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_23f8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_23f8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_23f8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_23f8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_23f8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_23f8_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2251_c2_5fce] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_5fce_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_5fce_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2283_c7_23f8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_23f8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_23f8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_23f8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_23f8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_23f8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_23f8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_23f8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_23f8_return_output;

     -- Submodule level 2
     VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_8021_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_d001_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2275_c7_f686_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_d001_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_23f8_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2286_c21_f5d7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2271_c7_6b63_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2273_c3_1054_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_f686_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_23f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_6b63_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_f686_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_f686_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_23f8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_f686_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_23f8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2264_c7_3ff9_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2283_c7_23f8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2283_c7_23f8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_23f8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2283_c7_23f8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_23f8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2283_c7_23f8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_23f8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_23f8_return_output := result_u8_value_MUX_uxn_opcodes_h_l2283_c7_23f8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2275_c7_f686] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_f686_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_f686_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_f686_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_f686_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_f686_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_f686_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_f686_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_f686_return_output;

     -- n16_MUX[uxn_opcodes_h_l2275_c7_f686] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2275_c7_f686_cond <= VAR_n16_MUX_uxn_opcodes_h_l2275_c7_f686_cond;
     n16_MUX_uxn_opcodes_h_l2275_c7_f686_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2275_c7_f686_iftrue;
     n16_MUX_uxn_opcodes_h_l2275_c7_f686_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2275_c7_f686_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2275_c7_f686_return_output := n16_MUX_uxn_opcodes_h_l2275_c7_f686_return_output;

     -- t8_MUX[uxn_opcodes_h_l2264_c7_3ff9] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2264_c7_3ff9_cond <= VAR_t8_MUX_uxn_opcodes_h_l2264_c7_3ff9_cond;
     t8_MUX_uxn_opcodes_h_l2264_c7_3ff9_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2264_c7_3ff9_iftrue;
     t8_MUX_uxn_opcodes_h_l2264_c7_3ff9_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2264_c7_3ff9_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output := t8_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2271_c7_6b63] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_6b63_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_6b63_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_6b63_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_6b63_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_6b63_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_6b63_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_6b63_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_6b63_return_output;

     -- BIN_OP_SR[uxn_opcodes_h_l2278_c12_8021] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l2278_c12_8021_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_8021_left;
     BIN_OP_SR_uxn_opcodes_h_l2278_c12_8021_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_8021_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_8021_return_output := BIN_OP_SR_uxn_opcodes_h_l2278_c12_8021_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2275_c7_f686] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_f686_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_f686_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_f686_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_f686_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_f686_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_f686_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_f686_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_f686_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2275_c7_f686] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_f686_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_f686_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_f686_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_f686_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_f686_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_f686_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_f686_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_f686_return_output;

     -- Submodule level 3
     VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_57d8_left := VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_8021_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2271_c7_6b63_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2275_c7_f686_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_6b63_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_f686_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_e1d2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_6b63_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_6b63_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_f686_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_6b63_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_f686_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_f686_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_23f8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2267_c7_e1d2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_e1d2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_e1d2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_e1d2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_e1d2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_e1d2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_e1d2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2271_c7_6b63] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_6b63_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_6b63_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_6b63_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_6b63_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_6b63_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_6b63_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_6b63_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_6b63_return_output;

     -- n16_MUX[uxn_opcodes_h_l2271_c7_6b63] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2271_c7_6b63_cond <= VAR_n16_MUX_uxn_opcodes_h_l2271_c7_6b63_cond;
     n16_MUX_uxn_opcodes_h_l2271_c7_6b63_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2271_c7_6b63_iftrue;
     n16_MUX_uxn_opcodes_h_l2271_c7_6b63_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2271_c7_6b63_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2271_c7_6b63_return_output := n16_MUX_uxn_opcodes_h_l2271_c7_6b63_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2271_c7_6b63] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_6b63_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_6b63_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_6b63_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_6b63_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_6b63_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_6b63_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_6b63_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_6b63_return_output;

     -- t8_MUX[uxn_opcodes_h_l2251_c2_5fce] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2251_c2_5fce_cond <= VAR_t8_MUX_uxn_opcodes_h_l2251_c2_5fce_cond;
     t8_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue;
     t8_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output := t8_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output;

     -- BIN_OP_SL[uxn_opcodes_h_l2278_c12_57d8] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l2278_c12_57d8_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_57d8_left;
     BIN_OP_SL_uxn_opcodes_h_l2278_c12_57d8_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_57d8_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_57d8_return_output := BIN_OP_SL_uxn_opcodes_h_l2278_c12_57d8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2271_c7_6b63] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_6b63_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_6b63_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_6b63_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_6b63_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_6b63_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_6b63_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_6b63_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_6b63_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_f686_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_57d8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2267_c7_e1d2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2271_c7_6b63_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_e1d2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_6b63_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_3ff9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_e1d2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_6b63_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_e1d2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_6b63_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2264_c7_3ff9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_3ff9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_3ff9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_3ff9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_3ff9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_3ff9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_3ff9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2281_c21_cc49] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2281_c21_cc49_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_57d8_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2267_c7_e1d2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_e1d2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_e1d2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_e1d2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_e1d2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_e1d2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_e1d2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2275_c7_f686] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2275_c7_f686_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_f686_cond;
     tmp16_MUX_uxn_opcodes_h_l2275_c7_f686_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_f686_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2275_c7_f686_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_f686_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_f686_return_output := tmp16_MUX_uxn_opcodes_h_l2275_c7_f686_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2267_c7_e1d2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_e1d2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_e1d2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_e1d2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_e1d2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_e1d2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_e1d2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2267_c7_e1d2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_e1d2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_e1d2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_e1d2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_e1d2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_e1d2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_e1d2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output;

     -- n16_MUX[uxn_opcodes_h_l2267_c7_e1d2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2267_c7_e1d2_cond <= VAR_n16_MUX_uxn_opcodes_h_l2267_c7_e1d2_cond;
     n16_MUX_uxn_opcodes_h_l2267_c7_e1d2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2267_c7_e1d2_iftrue;
     n16_MUX_uxn_opcodes_h_l2267_c7_e1d2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2267_c7_e1d2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output := n16_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output;

     -- Submodule level 5
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_f686_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2281_c21_cc49_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2264_c7_3ff9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_3ff9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_3ff9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_3ff9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_6b63_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_f686_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2275_c7_f686] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2275_c7_f686_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_f686_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2275_c7_f686_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_f686_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2275_c7_f686_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_f686_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_f686_return_output := result_u8_value_MUX_uxn_opcodes_h_l2275_c7_f686_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2264_c7_3ff9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_3ff9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_3ff9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_3ff9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_3ff9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_3ff9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_3ff9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2264_c7_3ff9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_3ff9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_3ff9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_3ff9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_3ff9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_3ff9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_3ff9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output;

     -- n16_MUX[uxn_opcodes_h_l2264_c7_3ff9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2264_c7_3ff9_cond <= VAR_n16_MUX_uxn_opcodes_h_l2264_c7_3ff9_cond;
     n16_MUX_uxn_opcodes_h_l2264_c7_3ff9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2264_c7_3ff9_iftrue;
     n16_MUX_uxn_opcodes_h_l2264_c7_3ff9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2264_c7_3ff9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output := n16_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2251_c2_5fce] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_5fce_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_5fce_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2264_c7_3ff9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_3ff9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_3ff9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_3ff9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_3ff9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_3ff9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_3ff9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2271_c7_6b63] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2271_c7_6b63_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_6b63_cond;
     tmp16_MUX_uxn_opcodes_h_l2271_c7_6b63_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_6b63_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2271_c7_6b63_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_6b63_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_6b63_return_output := tmp16_MUX_uxn_opcodes_h_l2271_c7_6b63_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_6b63_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_f686_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_e1d2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_6b63_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2267_c7_e1d2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2267_c7_e1d2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_e1d2_cond;
     tmp16_MUX_uxn_opcodes_h_l2267_c7_e1d2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_e1d2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2267_c7_e1d2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_e1d2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output := tmp16_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output;

     -- n16_MUX[uxn_opcodes_h_l2251_c2_5fce] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2251_c2_5fce_cond <= VAR_n16_MUX_uxn_opcodes_h_l2251_c2_5fce_cond;
     n16_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue;
     n16_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output := n16_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2251_c2_5fce] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_5fce_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_5fce_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2251_c2_5fce] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_5fce_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_5fce_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2271_c7_6b63] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2271_c7_6b63_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_6b63_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2271_c7_6b63_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_6b63_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2271_c7_6b63_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_6b63_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_6b63_return_output := result_u8_value_MUX_uxn_opcodes_h_l2271_c7_6b63_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2251_c2_5fce] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_5fce_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_5fce_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output;

     -- Submodule level 7
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_e1d2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_6b63_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_3ff9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2267_c7_e1d2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2267_c7_e1d2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_e1d2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2267_c7_e1d2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_e1d2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2267_c7_e1d2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_e1d2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output := result_u8_value_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2264_c7_3ff9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2264_c7_3ff9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_3ff9_cond;
     tmp16_MUX_uxn_opcodes_h_l2264_c7_3ff9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_3ff9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2264_c7_3ff9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_3ff9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output := tmp16_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output;

     -- Submodule level 8
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_3ff9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_e1d2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2251_c2_5fce] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2251_c2_5fce_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_5fce_cond;
     tmp16_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output := tmp16_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2264_c7_3ff9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2264_c7_3ff9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_3ff9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2264_c7_3ff9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_3ff9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2264_c7_3ff9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_3ff9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output := result_u8_value_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_3ff9_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2251_c2_5fce] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2251_c2_5fce_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_5fce_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_5fce_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_5fce_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output := result_u8_value_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l2290_l2246_DUPLICATE_cea7 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l2290_l2246_DUPLICATE_cea7_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b856(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_5fce_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l2290_l2246_DUPLICATE_cea7_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l2290_l2246_DUPLICATE_cea7_return_output;
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
