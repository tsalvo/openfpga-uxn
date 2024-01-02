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
-- BIN_OP_EQ[uxn_opcodes_h_l2251_c6_63e4]
signal BIN_OP_EQ_uxn_opcodes_h_l2251_c6_63e4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2251_c6_63e4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2251_c6_63e4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2251_c2_7b30]
signal n16_MUX_uxn_opcodes_h_l2251_c2_7b30_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2251_c2_7b30]
signal tmp16_MUX_uxn_opcodes_h_l2251_c2_7b30_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l2251_c2_7b30]
signal t8_MUX_uxn_opcodes_h_l2251_c2_7b30_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2251_c2_7b30]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_7b30_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2251_c2_7b30]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_7b30_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2251_c2_7b30]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_7b30_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2251_c2_7b30]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_7b30_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2251_c2_7b30]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_7b30_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2251_c2_7b30]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_7b30_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2251_c2_7b30]
signal result_u8_value_MUX_uxn_opcodes_h_l2251_c2_7b30_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2251_c2_7b30]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_7b30_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2251_c2_7b30]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_7b30_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2264_c11_f19b]
signal BIN_OP_EQ_uxn_opcodes_h_l2264_c11_f19b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2264_c11_f19b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2264_c11_f19b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2264_c7_1141]
signal n16_MUX_uxn_opcodes_h_l2264_c7_1141_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2264_c7_1141_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2264_c7_1141_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2264_c7_1141_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2264_c7_1141]
signal tmp16_MUX_uxn_opcodes_h_l2264_c7_1141_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2264_c7_1141_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2264_c7_1141_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2264_c7_1141_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l2264_c7_1141]
signal t8_MUX_uxn_opcodes_h_l2264_c7_1141_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2264_c7_1141_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2264_c7_1141_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2264_c7_1141_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2264_c7_1141]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_1141_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_1141_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_1141_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_1141_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2264_c7_1141]
signal result_u8_value_MUX_uxn_opcodes_h_l2264_c7_1141_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2264_c7_1141_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2264_c7_1141_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2264_c7_1141_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2264_c7_1141]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_1141_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_1141_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_1141_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_1141_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2264_c7_1141]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_1141_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_1141_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_1141_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_1141_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2264_c7_1141]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_1141_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_1141_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_1141_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_1141_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2267_c11_f465]
signal BIN_OP_EQ_uxn_opcodes_h_l2267_c11_f465_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2267_c11_f465_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2267_c11_f465_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2267_c7_6bdf]
signal n16_MUX_uxn_opcodes_h_l2267_c7_6bdf_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2267_c7_6bdf_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2267_c7_6bdf_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2267_c7_6bdf]
signal tmp16_MUX_uxn_opcodes_h_l2267_c7_6bdf_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2267_c7_6bdf_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2267_c7_6bdf_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l2267_c7_6bdf]
signal t8_MUX_uxn_opcodes_h_l2267_c7_6bdf_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2267_c7_6bdf_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2267_c7_6bdf_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2267_c7_6bdf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_6bdf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_6bdf_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_6bdf_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2267_c7_6bdf]
signal result_u8_value_MUX_uxn_opcodes_h_l2267_c7_6bdf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2267_c7_6bdf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2267_c7_6bdf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2267_c7_6bdf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_6bdf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_6bdf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_6bdf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2267_c7_6bdf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_6bdf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_6bdf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_6bdf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2267_c7_6bdf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_6bdf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_6bdf_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_6bdf_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2271_c11_2d84]
signal BIN_OP_EQ_uxn_opcodes_h_l2271_c11_2d84_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2271_c11_2d84_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2271_c11_2d84_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2271_c7_8029]
signal n16_MUX_uxn_opcodes_h_l2271_c7_8029_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2271_c7_8029_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2271_c7_8029_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2271_c7_8029_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2271_c7_8029]
signal tmp16_MUX_uxn_opcodes_h_l2271_c7_8029_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2271_c7_8029_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2271_c7_8029_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2271_c7_8029_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2271_c7_8029]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_8029_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_8029_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_8029_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_8029_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2271_c7_8029]
signal result_u8_value_MUX_uxn_opcodes_h_l2271_c7_8029_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2271_c7_8029_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2271_c7_8029_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2271_c7_8029_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2271_c7_8029]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_8029_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_8029_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_8029_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_8029_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2271_c7_8029]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_8029_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_8029_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_8029_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_8029_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2271_c7_8029]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_8029_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_8029_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_8029_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_8029_return_output : unsigned(3 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2273_c3_5f9d]
signal CONST_SL_8_uxn_opcodes_h_l2273_c3_5f9d_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2273_c3_5f9d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2275_c11_3fac]
signal BIN_OP_EQ_uxn_opcodes_h_l2275_c11_3fac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2275_c11_3fac_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2275_c11_3fac_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2275_c7_0d28]
signal n16_MUX_uxn_opcodes_h_l2275_c7_0d28_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2275_c7_0d28_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2275_c7_0d28_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2275_c7_0d28_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2275_c7_0d28]
signal tmp16_MUX_uxn_opcodes_h_l2275_c7_0d28_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2275_c7_0d28_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2275_c7_0d28_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2275_c7_0d28_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2275_c7_0d28]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_0d28_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_0d28_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_0d28_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_0d28_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2275_c7_0d28]
signal result_u8_value_MUX_uxn_opcodes_h_l2275_c7_0d28_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2275_c7_0d28_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2275_c7_0d28_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2275_c7_0d28_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2275_c7_0d28]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_0d28_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_0d28_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_0d28_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_0d28_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2275_c7_0d28]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_0d28_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_0d28_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_0d28_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_0d28_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2275_c7_0d28]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_0d28_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_0d28_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_0d28_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_0d28_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2276_c3_13a9]
signal BIN_OP_OR_uxn_opcodes_h_l2276_c3_13a9_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2276_c3_13a9_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2276_c3_13a9_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2277_c30_5f1b]
signal sp_relative_shift_uxn_opcodes_h_l2277_c30_5f1b_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2277_c30_5f1b_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2277_c30_5f1b_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2277_c30_5f1b_return_output : signed(3 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2278_c20_cef6]
signal BIN_OP_AND_uxn_opcodes_h_l2278_c20_cef6_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2278_c20_cef6_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2278_c20_cef6_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l2278_c12_014b]
signal BIN_OP_SR_uxn_opcodes_h_l2278_c12_014b_left : unsigned(15 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2278_c12_014b_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2278_c12_014b_return_output : unsigned(15 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l2278_c36_0d10]
signal CONST_SR_4_uxn_opcodes_h_l2278_c36_0d10_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l2278_c36_0d10_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l2278_c12_5411]
signal BIN_OP_SL_uxn_opcodes_h_l2278_c12_5411_left : unsigned(15 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2278_c12_5411_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2278_c12_5411_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2283_c11_6a31]
signal BIN_OP_EQ_uxn_opcodes_h_l2283_c11_6a31_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2283_c11_6a31_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2283_c11_6a31_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2283_c7_4b3b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_4b3b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_4b3b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_4b3b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_4b3b_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2283_c7_4b3b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_4b3b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_4b3b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_4b3b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_4b3b_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2283_c7_4b3b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_4b3b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_4b3b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_4b3b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_4b3b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2283_c7_4b3b]
signal result_u8_value_MUX_uxn_opcodes_h_l2283_c7_4b3b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2283_c7_4b3b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2283_c7_4b3b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2283_c7_4b3b_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2286_c31_82fc]
signal CONST_SR_8_uxn_opcodes_h_l2286_c31_82fc_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2286_c31_82fc_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_ee25( ref_toks_0 : opcode_result_t;
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
      base.is_ram_write := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.u8_value := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.is_vram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2251_c6_63e4
BIN_OP_EQ_uxn_opcodes_h_l2251_c6_63e4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2251_c6_63e4_left,
BIN_OP_EQ_uxn_opcodes_h_l2251_c6_63e4_right,
BIN_OP_EQ_uxn_opcodes_h_l2251_c6_63e4_return_output);

-- n16_MUX_uxn_opcodes_h_l2251_c2_7b30
n16_MUX_uxn_opcodes_h_l2251_c2_7b30 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2251_c2_7b30_cond,
n16_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue,
n16_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse,
n16_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2251_c2_7b30
tmp16_MUX_uxn_opcodes_h_l2251_c2_7b30 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2251_c2_7b30_cond,
tmp16_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue,
tmp16_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse,
tmp16_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output);

-- t8_MUX_uxn_opcodes_h_l2251_c2_7b30
t8_MUX_uxn_opcodes_h_l2251_c2_7b30 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2251_c2_7b30_cond,
t8_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue,
t8_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse,
t8_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_7b30
result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_7b30 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_7b30_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_7b30
result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_7b30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_7b30_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_7b30
result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_7b30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_7b30_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_7b30
result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_7b30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_7b30_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_7b30
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_7b30 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_7b30_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_7b30
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_7b30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_7b30_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2251_c2_7b30
result_u8_value_MUX_uxn_opcodes_h_l2251_c2_7b30 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2251_c2_7b30_cond,
result_u8_value_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_7b30
result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_7b30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_7b30_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_7b30
result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_7b30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_7b30_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2264_c11_f19b
BIN_OP_EQ_uxn_opcodes_h_l2264_c11_f19b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2264_c11_f19b_left,
BIN_OP_EQ_uxn_opcodes_h_l2264_c11_f19b_right,
BIN_OP_EQ_uxn_opcodes_h_l2264_c11_f19b_return_output);

-- n16_MUX_uxn_opcodes_h_l2264_c7_1141
n16_MUX_uxn_opcodes_h_l2264_c7_1141 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2264_c7_1141_cond,
n16_MUX_uxn_opcodes_h_l2264_c7_1141_iftrue,
n16_MUX_uxn_opcodes_h_l2264_c7_1141_iffalse,
n16_MUX_uxn_opcodes_h_l2264_c7_1141_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2264_c7_1141
tmp16_MUX_uxn_opcodes_h_l2264_c7_1141 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2264_c7_1141_cond,
tmp16_MUX_uxn_opcodes_h_l2264_c7_1141_iftrue,
tmp16_MUX_uxn_opcodes_h_l2264_c7_1141_iffalse,
tmp16_MUX_uxn_opcodes_h_l2264_c7_1141_return_output);

-- t8_MUX_uxn_opcodes_h_l2264_c7_1141
t8_MUX_uxn_opcodes_h_l2264_c7_1141 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2264_c7_1141_cond,
t8_MUX_uxn_opcodes_h_l2264_c7_1141_iftrue,
t8_MUX_uxn_opcodes_h_l2264_c7_1141_iffalse,
t8_MUX_uxn_opcodes_h_l2264_c7_1141_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_1141
result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_1141 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_1141_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_1141_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_1141_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_1141_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2264_c7_1141
result_u8_value_MUX_uxn_opcodes_h_l2264_c7_1141 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2264_c7_1141_cond,
result_u8_value_MUX_uxn_opcodes_h_l2264_c7_1141_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2264_c7_1141_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2264_c7_1141_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_1141
result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_1141 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_1141_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_1141_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_1141_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_1141_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_1141
result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_1141 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_1141_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_1141_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_1141_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_1141_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_1141
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_1141 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_1141_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_1141_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_1141_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_1141_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2267_c11_f465
BIN_OP_EQ_uxn_opcodes_h_l2267_c11_f465 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2267_c11_f465_left,
BIN_OP_EQ_uxn_opcodes_h_l2267_c11_f465_right,
BIN_OP_EQ_uxn_opcodes_h_l2267_c11_f465_return_output);

-- n16_MUX_uxn_opcodes_h_l2267_c7_6bdf
n16_MUX_uxn_opcodes_h_l2267_c7_6bdf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2267_c7_6bdf_cond,
n16_MUX_uxn_opcodes_h_l2267_c7_6bdf_iftrue,
n16_MUX_uxn_opcodes_h_l2267_c7_6bdf_iffalse,
n16_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2267_c7_6bdf
tmp16_MUX_uxn_opcodes_h_l2267_c7_6bdf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2267_c7_6bdf_cond,
tmp16_MUX_uxn_opcodes_h_l2267_c7_6bdf_iftrue,
tmp16_MUX_uxn_opcodes_h_l2267_c7_6bdf_iffalse,
tmp16_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output);

-- t8_MUX_uxn_opcodes_h_l2267_c7_6bdf
t8_MUX_uxn_opcodes_h_l2267_c7_6bdf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2267_c7_6bdf_cond,
t8_MUX_uxn_opcodes_h_l2267_c7_6bdf_iftrue,
t8_MUX_uxn_opcodes_h_l2267_c7_6bdf_iffalse,
t8_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_6bdf
result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_6bdf : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_6bdf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_6bdf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_6bdf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2267_c7_6bdf
result_u8_value_MUX_uxn_opcodes_h_l2267_c7_6bdf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2267_c7_6bdf_cond,
result_u8_value_MUX_uxn_opcodes_h_l2267_c7_6bdf_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2267_c7_6bdf_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_6bdf
result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_6bdf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_6bdf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_6bdf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_6bdf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_6bdf
result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_6bdf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_6bdf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_6bdf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_6bdf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_6bdf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_6bdf : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_6bdf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_6bdf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_6bdf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2271_c11_2d84
BIN_OP_EQ_uxn_opcodes_h_l2271_c11_2d84 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2271_c11_2d84_left,
BIN_OP_EQ_uxn_opcodes_h_l2271_c11_2d84_right,
BIN_OP_EQ_uxn_opcodes_h_l2271_c11_2d84_return_output);

-- n16_MUX_uxn_opcodes_h_l2271_c7_8029
n16_MUX_uxn_opcodes_h_l2271_c7_8029 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2271_c7_8029_cond,
n16_MUX_uxn_opcodes_h_l2271_c7_8029_iftrue,
n16_MUX_uxn_opcodes_h_l2271_c7_8029_iffalse,
n16_MUX_uxn_opcodes_h_l2271_c7_8029_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2271_c7_8029
tmp16_MUX_uxn_opcodes_h_l2271_c7_8029 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2271_c7_8029_cond,
tmp16_MUX_uxn_opcodes_h_l2271_c7_8029_iftrue,
tmp16_MUX_uxn_opcodes_h_l2271_c7_8029_iffalse,
tmp16_MUX_uxn_opcodes_h_l2271_c7_8029_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_8029
result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_8029 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_8029_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_8029_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_8029_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_8029_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2271_c7_8029
result_u8_value_MUX_uxn_opcodes_h_l2271_c7_8029 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2271_c7_8029_cond,
result_u8_value_MUX_uxn_opcodes_h_l2271_c7_8029_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2271_c7_8029_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2271_c7_8029_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_8029
result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_8029 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_8029_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_8029_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_8029_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_8029_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_8029
result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_8029 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_8029_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_8029_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_8029_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_8029_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_8029
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_8029 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_8029_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_8029_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_8029_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_8029_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2273_c3_5f9d
CONST_SL_8_uxn_opcodes_h_l2273_c3_5f9d : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2273_c3_5f9d_x,
CONST_SL_8_uxn_opcodes_h_l2273_c3_5f9d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2275_c11_3fac
BIN_OP_EQ_uxn_opcodes_h_l2275_c11_3fac : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2275_c11_3fac_left,
BIN_OP_EQ_uxn_opcodes_h_l2275_c11_3fac_right,
BIN_OP_EQ_uxn_opcodes_h_l2275_c11_3fac_return_output);

-- n16_MUX_uxn_opcodes_h_l2275_c7_0d28
n16_MUX_uxn_opcodes_h_l2275_c7_0d28 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2275_c7_0d28_cond,
n16_MUX_uxn_opcodes_h_l2275_c7_0d28_iftrue,
n16_MUX_uxn_opcodes_h_l2275_c7_0d28_iffalse,
n16_MUX_uxn_opcodes_h_l2275_c7_0d28_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2275_c7_0d28
tmp16_MUX_uxn_opcodes_h_l2275_c7_0d28 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2275_c7_0d28_cond,
tmp16_MUX_uxn_opcodes_h_l2275_c7_0d28_iftrue,
tmp16_MUX_uxn_opcodes_h_l2275_c7_0d28_iffalse,
tmp16_MUX_uxn_opcodes_h_l2275_c7_0d28_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_0d28
result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_0d28 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_0d28_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_0d28_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_0d28_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_0d28_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2275_c7_0d28
result_u8_value_MUX_uxn_opcodes_h_l2275_c7_0d28 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2275_c7_0d28_cond,
result_u8_value_MUX_uxn_opcodes_h_l2275_c7_0d28_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2275_c7_0d28_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2275_c7_0d28_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_0d28
result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_0d28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_0d28_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_0d28_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_0d28_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_0d28_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_0d28
result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_0d28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_0d28_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_0d28_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_0d28_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_0d28_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_0d28
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_0d28 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_0d28_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_0d28_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_0d28_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_0d28_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2276_c3_13a9
BIN_OP_OR_uxn_opcodes_h_l2276_c3_13a9 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2276_c3_13a9_left,
BIN_OP_OR_uxn_opcodes_h_l2276_c3_13a9_right,
BIN_OP_OR_uxn_opcodes_h_l2276_c3_13a9_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2277_c30_5f1b
sp_relative_shift_uxn_opcodes_h_l2277_c30_5f1b : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2277_c30_5f1b_ins,
sp_relative_shift_uxn_opcodes_h_l2277_c30_5f1b_x,
sp_relative_shift_uxn_opcodes_h_l2277_c30_5f1b_y,
sp_relative_shift_uxn_opcodes_h_l2277_c30_5f1b_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2278_c20_cef6
BIN_OP_AND_uxn_opcodes_h_l2278_c20_cef6 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2278_c20_cef6_left,
BIN_OP_AND_uxn_opcodes_h_l2278_c20_cef6_right,
BIN_OP_AND_uxn_opcodes_h_l2278_c20_cef6_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l2278_c12_014b
BIN_OP_SR_uxn_opcodes_h_l2278_c12_014b : entity work.BIN_OP_SR_uint16_t_uint8_t_0CLK_295015b8 port map (
BIN_OP_SR_uxn_opcodes_h_l2278_c12_014b_left,
BIN_OP_SR_uxn_opcodes_h_l2278_c12_014b_right,
BIN_OP_SR_uxn_opcodes_h_l2278_c12_014b_return_output);

-- CONST_SR_4_uxn_opcodes_h_l2278_c36_0d10
CONST_SR_4_uxn_opcodes_h_l2278_c36_0d10 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l2278_c36_0d10_x,
CONST_SR_4_uxn_opcodes_h_l2278_c36_0d10_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l2278_c12_5411
BIN_OP_SL_uxn_opcodes_h_l2278_c12_5411 : entity work.BIN_OP_SL_uint16_t_uint8_t_0CLK_b6546dec port map (
BIN_OP_SL_uxn_opcodes_h_l2278_c12_5411_left,
BIN_OP_SL_uxn_opcodes_h_l2278_c12_5411_right,
BIN_OP_SL_uxn_opcodes_h_l2278_c12_5411_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2283_c11_6a31
BIN_OP_EQ_uxn_opcodes_h_l2283_c11_6a31 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2283_c11_6a31_left,
BIN_OP_EQ_uxn_opcodes_h_l2283_c11_6a31_right,
BIN_OP_EQ_uxn_opcodes_h_l2283_c11_6a31_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_4b3b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_4b3b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_4b3b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_4b3b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_4b3b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_4b3b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_4b3b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_4b3b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_4b3b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_4b3b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_4b3b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_4b3b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_4b3b
result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_4b3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_4b3b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_4b3b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_4b3b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_4b3b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2283_c7_4b3b
result_u8_value_MUX_uxn_opcodes_h_l2283_c7_4b3b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2283_c7_4b3b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2283_c7_4b3b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2283_c7_4b3b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2283_c7_4b3b_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2286_c31_82fc
CONST_SR_8_uxn_opcodes_h_l2286_c31_82fc : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2286_c31_82fc_x,
CONST_SR_8_uxn_opcodes_h_l2286_c31_82fc_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2251_c6_63e4_return_output,
 n16_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output,
 tmp16_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output,
 t8_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2264_c11_f19b_return_output,
 n16_MUX_uxn_opcodes_h_l2264_c7_1141_return_output,
 tmp16_MUX_uxn_opcodes_h_l2264_c7_1141_return_output,
 t8_MUX_uxn_opcodes_h_l2264_c7_1141_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_1141_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2264_c7_1141_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_1141_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_1141_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_1141_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2267_c11_f465_return_output,
 n16_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output,
 tmp16_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output,
 t8_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2271_c11_2d84_return_output,
 n16_MUX_uxn_opcodes_h_l2271_c7_8029_return_output,
 tmp16_MUX_uxn_opcodes_h_l2271_c7_8029_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_8029_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2271_c7_8029_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_8029_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_8029_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_8029_return_output,
 CONST_SL_8_uxn_opcodes_h_l2273_c3_5f9d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2275_c11_3fac_return_output,
 n16_MUX_uxn_opcodes_h_l2275_c7_0d28_return_output,
 tmp16_MUX_uxn_opcodes_h_l2275_c7_0d28_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_0d28_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2275_c7_0d28_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_0d28_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_0d28_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_0d28_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2276_c3_13a9_return_output,
 sp_relative_shift_uxn_opcodes_h_l2277_c30_5f1b_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2278_c20_cef6_return_output,
 BIN_OP_SR_uxn_opcodes_h_l2278_c12_014b_return_output,
 CONST_SR_4_uxn_opcodes_h_l2278_c36_0d10_return_output,
 BIN_OP_SL_uxn_opcodes_h_l2278_c12_5411_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2283_c11_6a31_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_4b3b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_4b3b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_4b3b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2283_c7_4b3b_return_output,
 CONST_SR_8_uxn_opcodes_h_l2286_c31_82fc_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_63e4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_63e4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_63e4_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2264_c7_1141_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2251_c2_7b30_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_1141_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_7b30_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2264_c7_1141_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2251_c2_7b30_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2256_c3_b581 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_1141_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_7b30_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2251_c2_7b30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_7b30_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_1141_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_7b30_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_1141_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_7b30_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2261_c3_e5fe : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_1141_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_7b30_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2251_c2_7b30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_7b30_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_1141_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_7b30_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2251_c2_7b30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_7b30_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2251_c2_7b30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_7b30_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_f19b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_f19b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_f19b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2264_c7_1141_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2264_c7_1141_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2264_c7_1141_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_1141_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_1141_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_1141_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2264_c7_1141_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2264_c7_1141_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2264_c7_1141_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_1141_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_1141_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_1141_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_1141_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_1141_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_1141_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_1141_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_1141_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_1141_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_1141_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_1141_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_1141_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_1141_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2265_c3_6464 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_1141_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_1141_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_f465_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_f465_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_f465_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2267_c7_6bdf_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2267_c7_6bdf_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2271_c7_8029_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2267_c7_6bdf_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_6bdf_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_6bdf_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_8029_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_6bdf_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2267_c7_6bdf_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2267_c7_6bdf_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2267_c7_6bdf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_6bdf_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_6bdf_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_8029_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_6bdf_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_6bdf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_6bdf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_8029_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_6bdf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_6bdf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_6bdf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_8029_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_6bdf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_6bdf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_6bdf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_8029_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_6bdf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_6bdf_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2269_c3_fc1b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_6bdf_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_8029_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_6bdf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_2d84_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_2d84_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_2d84_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2271_c7_8029_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2271_c7_8029_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2275_c7_0d28_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2271_c7_8029_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_8029_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_8029_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_0d28_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_8029_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_8029_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_8029_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_0d28_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_8029_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_8029_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_8029_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_0d28_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_8029_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_8029_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_8029_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_0d28_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_8029_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_8029_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_8029_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_0d28_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_8029_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_8029_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_8029_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_0d28_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_8029_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2273_c3_5f9d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2273_c3_5f9d_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_3fac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_3fac_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_3fac_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2275_c7_0d28_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2275_c7_0d28_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2275_c7_0d28_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_0d28_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_0d28_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_0d28_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_0d28_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_0d28_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_4b3b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_0d28_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_0d28_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_0d28_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_4b3b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_0d28_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_0d28_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_0d28_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_0d28_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_0d28_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_0d28_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_4b3b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_0d28_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_0d28_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2280_c3_d52b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_0d28_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_4b3b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_0d28_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_13a9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_13a9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_13a9_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_5f1b_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_5f1b_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_5f1b_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_5f1b_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_014b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_cef6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_cef6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_cef6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_014b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_014b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_5411_left : unsigned(15 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2278_c36_0d10_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_5411_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2278_c36_0d10_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_5411_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2281_c21_8c13_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_6a31_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_6a31_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_6a31_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_4b3b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2284_c3_592e : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_4b3b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_4b3b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_4b3b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2285_c3_3c4b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_4b3b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_4b3b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_4b3b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_4b3b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_4b3b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_4b3b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_4b3b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_4b3b_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2286_c31_82fc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2286_c31_82fc_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2286_c21_5302_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2283_l2271_l2267_l2264_l2251_DUPLICATE_6fc7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2267_l2283_l2271_l2264_DUPLICATE_e722_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2267_l2271_l2264_l2275_DUPLICATE_9fe9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2283_l2275_l2271_l2267_l2264_DUPLICATE_ac2f_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2276_l2272_DUPLICATE_67dc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2283_l2271_DUPLICATE_d880_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l2290_l2246_DUPLICATE_0c1d_return_output : opcode_result_t;
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
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2269_c3_fc1b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_6bdf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2269_c3_fc1b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2261_c3_e5fe := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2261_c3_e5fe;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2256_c3_b581 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2256_c3_b581;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_f465_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_5f1b_y := resize(to_signed(-1, 2), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2280_c3_d52b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_0d28_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2280_c3_d52b;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_4b3b_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_5f1b_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2265_c3_6464 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_1141_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2265_c3_6464;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_2d84_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_63e4_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_f19b_right := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_cef6_right := to_unsigned(15, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2285_c3_3c4b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_4b3b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2285_c3_3c4b;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_0d28_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2284_c3_592e := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_4b3b_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2284_c3_592e;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_3fac_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_6a31_right := to_unsigned(5, 3);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_5f1b_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_13a9_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2264_c7_1141_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2267_c7_6bdf_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2275_c7_0d28_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_63e4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_f19b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_f465_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_2d84_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_3fac_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_6a31_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l2267_c7_6bdf_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_cef6_left := t8;
     VAR_CONST_SR_4_uxn_opcodes_h_l2278_c36_0d10_x := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2264_c7_1141_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2267_c7_6bdf_iffalse := t8;
     VAR_CONST_SR_8_uxn_opcodes_h_l2286_c31_82fc_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_1141_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_6bdf_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_8029_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_0d28_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2283_c11_6a31] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2283_c11_6a31_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_6a31_left;
     BIN_OP_EQ_uxn_opcodes_h_l2283_c11_6a31_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_6a31_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_6a31_return_output := BIN_OP_EQ_uxn_opcodes_h_l2283_c11_6a31_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2251_c6_63e4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2251_c6_63e4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_63e4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2251_c6_63e4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_63e4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_63e4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2251_c6_63e4_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2278_c20_cef6] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2278_c20_cef6_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_cef6_left;
     BIN_OP_AND_uxn_opcodes_h_l2278_c20_cef6_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_cef6_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_cef6_return_output := BIN_OP_AND_uxn_opcodes_h_l2278_c20_cef6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2275_c11_3fac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2275_c11_3fac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_3fac_left;
     BIN_OP_EQ_uxn_opcodes_h_l2275_c11_3fac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_3fac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_3fac_return_output := BIN_OP_EQ_uxn_opcodes_h_l2275_c11_3fac_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2283_l2275_l2271_l2267_l2264_DUPLICATE_ac2f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2283_l2275_l2271_l2267_l2264_DUPLICATE_ac2f_return_output := result.is_opc_done;

     -- CONST_SR_4[uxn_opcodes_h_l2278_c36_0d10] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l2278_c36_0d10_x <= VAR_CONST_SR_4_uxn_opcodes_h_l2278_c36_0d10_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l2278_c36_0d10_return_output := CONST_SR_4_uxn_opcodes_h_l2278_c36_0d10_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2283_l2271_DUPLICATE_d880 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2283_l2271_DUPLICATE_d880_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2283_l2271_l2267_l2264_l2251_DUPLICATE_6fc7 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2283_l2271_l2267_l2264_l2251_DUPLICATE_6fc7_return_output := result.u8_value;

     -- sp_relative_shift[uxn_opcodes_h_l2277_c30_5f1b] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2277_c30_5f1b_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_5f1b_ins;
     sp_relative_shift_uxn_opcodes_h_l2277_c30_5f1b_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_5f1b_x;
     sp_relative_shift_uxn_opcodes_h_l2277_c30_5f1b_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_5f1b_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_5f1b_return_output := sp_relative_shift_uxn_opcodes_h_l2277_c30_5f1b_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2267_l2283_l2271_l2264_DUPLICATE_e722 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2267_l2283_l2271_l2264_DUPLICATE_e722_return_output := result.sp_relative_shift;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2251_c2_7b30] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2251_c2_7b30_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2267_c11_f465] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2267_c11_f465_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_f465_left;
     BIN_OP_EQ_uxn_opcodes_h_l2267_c11_f465_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_f465_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_f465_return_output := BIN_OP_EQ_uxn_opcodes_h_l2267_c11_f465_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2267_l2271_l2264_l2275_DUPLICATE_9fe9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2267_l2271_l2264_l2275_DUPLICATE_9fe9_return_output := result.is_stack_write;

     -- CONST_SR_8[uxn_opcodes_h_l2286_c31_82fc] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2286_c31_82fc_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2286_c31_82fc_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2286_c31_82fc_return_output := CONST_SR_8_uxn_opcodes_h_l2286_c31_82fc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2271_c11_2d84] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2271_c11_2d84_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_2d84_left;
     BIN_OP_EQ_uxn_opcodes_h_l2271_c11_2d84_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_2d84_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_2d84_return_output := BIN_OP_EQ_uxn_opcodes_h_l2271_c11_2d84_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2251_c2_7b30] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2251_c2_7b30_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l2264_c11_f19b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2264_c11_f19b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_f19b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2264_c11_f19b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_f19b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_f19b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2264_c11_f19b_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2251_c2_7b30] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2251_c2_7b30_return_output := result.is_ram_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2276_l2272_DUPLICATE_67dc LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2276_l2272_DUPLICATE_67dc_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2251_c2_7b30] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2251_c2_7b30_return_output := result.is_stack_index_flipped;

     -- Submodule level 1
     VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_014b_right := VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_cef6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2251_c2_7b30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_63e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_7b30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_63e4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_7b30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_63e4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_7b30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_63e4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_7b30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_63e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_7b30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_63e4_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_7b30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_63e4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_7b30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_63e4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_7b30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_63e4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_7b30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_63e4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2251_c2_7b30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_63e4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_7b30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_63e4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2264_c7_1141_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_f19b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_1141_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_f19b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_1141_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_f19b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_1141_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_f19b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_1141_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_f19b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_1141_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_f19b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2264_c7_1141_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_f19b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_1141_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_f19b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2267_c7_6bdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_f465_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_6bdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_f465_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_6bdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_f465_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_6bdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_f465_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_6bdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_f465_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_6bdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_f465_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2267_c7_6bdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_f465_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_6bdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_f465_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2271_c7_8029_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_2d84_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_8029_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_2d84_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_8029_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_2d84_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_8029_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_2d84_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_8029_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_2d84_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_8029_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_2d84_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_8029_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_2d84_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2275_c7_0d28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_3fac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_0d28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_3fac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_0d28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_3fac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_0d28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_3fac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_0d28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_3fac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_0d28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_3fac_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_0d28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_3fac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_4b3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_6a31_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_4b3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_6a31_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_4b3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_6a31_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_4b3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_6a31_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_13a9_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2276_l2272_DUPLICATE_67dc_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2273_c3_5f9d_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2276_l2272_DUPLICATE_67dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_1141_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2267_l2283_l2271_l2264_DUPLICATE_e722_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_6bdf_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2267_l2283_l2271_l2264_DUPLICATE_e722_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_8029_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2267_l2283_l2271_l2264_DUPLICATE_e722_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_4b3b_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2267_l2283_l2271_l2264_DUPLICATE_e722_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_1141_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2283_l2275_l2271_l2267_l2264_DUPLICATE_ac2f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_6bdf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2283_l2275_l2271_l2267_l2264_DUPLICATE_ac2f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_8029_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2283_l2275_l2271_l2267_l2264_DUPLICATE_ac2f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_0d28_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2283_l2275_l2271_l2267_l2264_DUPLICATE_ac2f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_4b3b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2283_l2275_l2271_l2267_l2264_DUPLICATE_ac2f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_1141_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2267_l2271_l2264_l2275_DUPLICATE_9fe9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_6bdf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2267_l2271_l2264_l2275_DUPLICATE_9fe9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_8029_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2267_l2271_l2264_l2275_DUPLICATE_9fe9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_0d28_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2267_l2271_l2264_l2275_DUPLICATE_9fe9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_8029_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2283_l2271_DUPLICATE_d880_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_4b3b_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2283_l2271_DUPLICATE_d880_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2283_l2271_l2267_l2264_l2251_DUPLICATE_6fc7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_1141_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2283_l2271_l2267_l2264_l2251_DUPLICATE_6fc7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_6bdf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2283_l2271_l2267_l2264_l2251_DUPLICATE_6fc7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_8029_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2283_l2271_l2267_l2264_l2251_DUPLICATE_6fc7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_4b3b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2283_l2271_l2267_l2264_l2251_DUPLICATE_6fc7_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_5411_right := VAR_CONST_SR_4_uxn_opcodes_h_l2278_c36_0d10_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2251_c2_7b30_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2251_c2_7b30_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2251_c2_7b30_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2251_c2_7b30_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_0d28_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_5f1b_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2275_c7_0d28] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_0d28_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_0d28_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_0d28_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_0d28_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_0d28_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_0d28_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_0d28_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_0d28_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2251_c2_7b30] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_7b30_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_7b30_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output;

     -- t8_MUX[uxn_opcodes_h_l2267_c7_6bdf] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2267_c7_6bdf_cond <= VAR_t8_MUX_uxn_opcodes_h_l2267_c7_6bdf_cond;
     t8_MUX_uxn_opcodes_h_l2267_c7_6bdf_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2267_c7_6bdf_iftrue;
     t8_MUX_uxn_opcodes_h_l2267_c7_6bdf_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2267_c7_6bdf_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output := t8_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2283_c7_4b3b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_4b3b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_4b3b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_4b3b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_4b3b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_4b3b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_4b3b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_4b3b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_4b3b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2251_c2_7b30] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_7b30_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_7b30_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2283_c7_4b3b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_4b3b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_4b3b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_4b3b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_4b3b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_4b3b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_4b3b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_4b3b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_4b3b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2286_c21_5302] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2286_c21_5302_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2286_c31_82fc_return_output);

     -- CONST_SL_8[uxn_opcodes_h_l2273_c3_5f9d] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2273_c3_5f9d_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2273_c3_5f9d_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2273_c3_5f9d_return_output := CONST_SL_8_uxn_opcodes_h_l2273_c3_5f9d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2276_c3_13a9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2276_c3_13a9_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_13a9_left;
     BIN_OP_OR_uxn_opcodes_h_l2276_c3_13a9_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_13a9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_13a9_return_output := BIN_OP_OR_uxn_opcodes_h_l2276_c3_13a9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2283_c7_4b3b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_4b3b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_4b3b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_4b3b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_4b3b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_4b3b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_4b3b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_4b3b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_4b3b_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2251_c2_7b30] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_7b30_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_7b30_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2251_c2_7b30] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_7b30_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_7b30_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output;

     -- Submodule level 2
     VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_014b_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_13a9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2275_c7_0d28_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_13a9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_4b3b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2286_c21_5302_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2271_c7_8029_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2273_c3_5f9d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_0d28_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_4b3b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_8029_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_0d28_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_0d28_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_4b3b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_0d28_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_4b3b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2264_c7_1141_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2275_c7_0d28] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_0d28_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_0d28_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_0d28_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_0d28_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_0d28_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_0d28_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_0d28_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_0d28_return_output;

     -- n16_MUX[uxn_opcodes_h_l2275_c7_0d28] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2275_c7_0d28_cond <= VAR_n16_MUX_uxn_opcodes_h_l2275_c7_0d28_cond;
     n16_MUX_uxn_opcodes_h_l2275_c7_0d28_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2275_c7_0d28_iftrue;
     n16_MUX_uxn_opcodes_h_l2275_c7_0d28_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2275_c7_0d28_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2275_c7_0d28_return_output := n16_MUX_uxn_opcodes_h_l2275_c7_0d28_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2275_c7_0d28] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_0d28_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_0d28_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_0d28_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_0d28_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_0d28_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_0d28_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_0d28_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_0d28_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2283_c7_4b3b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2283_c7_4b3b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_4b3b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2283_c7_4b3b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_4b3b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2283_c7_4b3b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_4b3b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_4b3b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2283_c7_4b3b_return_output;

     -- t8_MUX[uxn_opcodes_h_l2264_c7_1141] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2264_c7_1141_cond <= VAR_t8_MUX_uxn_opcodes_h_l2264_c7_1141_cond;
     t8_MUX_uxn_opcodes_h_l2264_c7_1141_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2264_c7_1141_iftrue;
     t8_MUX_uxn_opcodes_h_l2264_c7_1141_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2264_c7_1141_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2264_c7_1141_return_output := t8_MUX_uxn_opcodes_h_l2264_c7_1141_return_output;

     -- BIN_OP_SR[uxn_opcodes_h_l2278_c12_014b] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l2278_c12_014b_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_014b_left;
     BIN_OP_SR_uxn_opcodes_h_l2278_c12_014b_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_014b_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_014b_return_output := BIN_OP_SR_uxn_opcodes_h_l2278_c12_014b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2271_c7_8029] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_8029_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_8029_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_8029_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_8029_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_8029_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_8029_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_8029_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_8029_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2275_c7_0d28] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_0d28_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_0d28_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_0d28_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_0d28_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_0d28_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_0d28_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_0d28_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_0d28_return_output;

     -- Submodule level 3
     VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_5411_left := VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_014b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2271_c7_8029_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2275_c7_0d28_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_8029_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_0d28_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_6bdf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_8029_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_8029_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_0d28_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_8029_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_0d28_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_0d28_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_4b3b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2264_c7_1141_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2267_c7_6bdf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_6bdf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_6bdf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_6bdf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_6bdf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_6bdf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_6bdf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output;

     -- t8_MUX[uxn_opcodes_h_l2251_c2_7b30] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2251_c2_7b30_cond <= VAR_t8_MUX_uxn_opcodes_h_l2251_c2_7b30_cond;
     t8_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue;
     t8_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output := t8_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2271_c7_8029] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_8029_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_8029_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_8029_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_8029_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_8029_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_8029_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_8029_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_8029_return_output;

     -- n16_MUX[uxn_opcodes_h_l2271_c7_8029] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2271_c7_8029_cond <= VAR_n16_MUX_uxn_opcodes_h_l2271_c7_8029_cond;
     n16_MUX_uxn_opcodes_h_l2271_c7_8029_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2271_c7_8029_iftrue;
     n16_MUX_uxn_opcodes_h_l2271_c7_8029_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2271_c7_8029_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2271_c7_8029_return_output := n16_MUX_uxn_opcodes_h_l2271_c7_8029_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2271_c7_8029] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_8029_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_8029_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_8029_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_8029_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_8029_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_8029_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_8029_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_8029_return_output;

     -- BIN_OP_SL[uxn_opcodes_h_l2278_c12_5411] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l2278_c12_5411_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_5411_left;
     BIN_OP_SL_uxn_opcodes_h_l2278_c12_5411_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_5411_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_5411_return_output := BIN_OP_SL_uxn_opcodes_h_l2278_c12_5411_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2271_c7_8029] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_8029_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_8029_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_8029_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_8029_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_8029_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_8029_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_8029_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_8029_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_0d28_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_5411_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2267_c7_6bdf_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2271_c7_8029_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_6bdf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_8029_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_1141_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_6bdf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_8029_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_6bdf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_8029_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output;
     -- n16_MUX[uxn_opcodes_h_l2267_c7_6bdf] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2267_c7_6bdf_cond <= VAR_n16_MUX_uxn_opcodes_h_l2267_c7_6bdf_cond;
     n16_MUX_uxn_opcodes_h_l2267_c7_6bdf_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2267_c7_6bdf_iftrue;
     n16_MUX_uxn_opcodes_h_l2267_c7_6bdf_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2267_c7_6bdf_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output := n16_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2267_c7_6bdf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_6bdf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_6bdf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_6bdf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_6bdf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_6bdf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_6bdf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2267_c7_6bdf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_6bdf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_6bdf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_6bdf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_6bdf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_6bdf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_6bdf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2275_c7_0d28] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2275_c7_0d28_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_0d28_cond;
     tmp16_MUX_uxn_opcodes_h_l2275_c7_0d28_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_0d28_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2275_c7_0d28_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_0d28_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_0d28_return_output := tmp16_MUX_uxn_opcodes_h_l2275_c7_0d28_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2264_c7_1141] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_1141_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_1141_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_1141_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_1141_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_1141_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_1141_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_1141_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_1141_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2267_c7_6bdf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_6bdf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_6bdf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_6bdf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_6bdf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_6bdf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_6bdf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2281_c21_8c13] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2281_c21_8c13_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_5411_return_output);

     -- Submodule level 5
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_0d28_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2281_c21_8c13_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2264_c7_1141_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_1141_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_1141_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_1141_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_1141_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_8029_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_0d28_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2264_c7_1141] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_1141_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_1141_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_1141_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_1141_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_1141_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_1141_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_1141_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_1141_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2264_c7_1141] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_1141_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_1141_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_1141_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_1141_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_1141_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_1141_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_1141_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_1141_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2271_c7_8029] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2271_c7_8029_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_8029_cond;
     tmp16_MUX_uxn_opcodes_h_l2271_c7_8029_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_8029_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2271_c7_8029_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_8029_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_8029_return_output := tmp16_MUX_uxn_opcodes_h_l2271_c7_8029_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2264_c7_1141] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_1141_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_1141_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_1141_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_1141_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_1141_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_1141_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_1141_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_1141_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2251_c2_7b30] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_7b30_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_7b30_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2275_c7_0d28] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2275_c7_0d28_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_0d28_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2275_c7_0d28_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_0d28_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2275_c7_0d28_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_0d28_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_0d28_return_output := result_u8_value_MUX_uxn_opcodes_h_l2275_c7_0d28_return_output;

     -- n16_MUX[uxn_opcodes_h_l2264_c7_1141] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2264_c7_1141_cond <= VAR_n16_MUX_uxn_opcodes_h_l2264_c7_1141_cond;
     n16_MUX_uxn_opcodes_h_l2264_c7_1141_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2264_c7_1141_iftrue;
     n16_MUX_uxn_opcodes_h_l2264_c7_1141_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2264_c7_1141_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2264_c7_1141_return_output := n16_MUX_uxn_opcodes_h_l2264_c7_1141_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2264_c7_1141_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_1141_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_1141_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_1141_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_8029_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_0d28_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_6bdf_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_8029_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2267_c7_6bdf] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2267_c7_6bdf_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_6bdf_cond;
     tmp16_MUX_uxn_opcodes_h_l2267_c7_6bdf_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_6bdf_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2267_c7_6bdf_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_6bdf_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output := tmp16_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2251_c2_7b30] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_7b30_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_7b30_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2251_c2_7b30] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_7b30_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_7b30_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2251_c2_7b30] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_7b30_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_7b30_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2271_c7_8029] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2271_c7_8029_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_8029_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2271_c7_8029_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_8029_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2271_c7_8029_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_8029_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_8029_return_output := result_u8_value_MUX_uxn_opcodes_h_l2271_c7_8029_return_output;

     -- n16_MUX[uxn_opcodes_h_l2251_c2_7b30] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2251_c2_7b30_cond <= VAR_n16_MUX_uxn_opcodes_h_l2251_c2_7b30_cond;
     n16_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue;
     n16_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output := n16_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output;

     -- Submodule level 7
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_6bdf_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_8029_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_1141_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2267_c7_6bdf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2267_c7_6bdf_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_6bdf_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2267_c7_6bdf_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_6bdf_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2267_c7_6bdf_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_6bdf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output := result_u8_value_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2264_c7_1141] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2264_c7_1141_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_1141_cond;
     tmp16_MUX_uxn_opcodes_h_l2264_c7_1141_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_1141_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2264_c7_1141_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_1141_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_1141_return_output := tmp16_MUX_uxn_opcodes_h_l2264_c7_1141_return_output;

     -- Submodule level 8
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_1141_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_6bdf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_1141_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2264_c7_1141] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2264_c7_1141_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_1141_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2264_c7_1141_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_1141_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2264_c7_1141_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_1141_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_1141_return_output := result_u8_value_MUX_uxn_opcodes_h_l2264_c7_1141_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2251_c2_7b30] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2251_c2_7b30_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_7b30_cond;
     tmp16_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output := tmp16_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_1141_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2251_c2_7b30] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2251_c2_7b30_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_7b30_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_7b30_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_7b30_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output := result_u8_value_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l2290_l2246_DUPLICATE_0c1d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l2290_l2246_DUPLICATE_0c1d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_ee25(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_7b30_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l2290_l2246_DUPLICATE_0c1d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l2290_l2246_DUPLICATE_0c1d_return_output;
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
