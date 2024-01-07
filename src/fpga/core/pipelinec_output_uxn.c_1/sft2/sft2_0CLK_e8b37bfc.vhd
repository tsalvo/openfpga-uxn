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
-- BIN_OP_EQ[uxn_opcodes_h_l2251_c6_7ee9]
signal BIN_OP_EQ_uxn_opcodes_h_l2251_c6_7ee9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2251_c6_7ee9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2251_c6_7ee9_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2251_c2_f0c3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2251_c2_f0c3]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2251_c2_f0c3]
signal result_u8_value_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2251_c2_f0c3]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2251_c2_f0c3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2251_c2_f0c3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2251_c2_f0c3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2251_c2_f0c3]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2251_c2_f0c3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2251_c2_f0c3]
signal tmp16_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2251_c2_f0c3]
signal n16_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l2251_c2_f0c3]
signal t8_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2264_c11_12af]
signal BIN_OP_EQ_uxn_opcodes_h_l2264_c11_12af_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2264_c11_12af_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2264_c11_12af_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2264_c7_2de1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_2de1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_2de1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_2de1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2264_c7_2de1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_2de1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_2de1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_2de1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2264_c7_2de1]
signal result_u8_value_MUX_uxn_opcodes_h_l2264_c7_2de1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2264_c7_2de1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2264_c7_2de1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2264_c7_2de1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_2de1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_2de1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_2de1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2264_c7_2de1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_2de1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_2de1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_2de1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2264_c7_2de1]
signal tmp16_MUX_uxn_opcodes_h_l2264_c7_2de1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2264_c7_2de1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2264_c7_2de1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2264_c7_2de1]
signal n16_MUX_uxn_opcodes_h_l2264_c7_2de1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2264_c7_2de1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2264_c7_2de1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l2264_c7_2de1]
signal t8_MUX_uxn_opcodes_h_l2264_c7_2de1_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2264_c7_2de1_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2264_c7_2de1_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2267_c11_7f4a]
signal BIN_OP_EQ_uxn_opcodes_h_l2267_c11_7f4a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2267_c11_7f4a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2267_c11_7f4a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2267_c7_c987]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_c987_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_c987_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_c987_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_c987_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2267_c7_c987]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_c987_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_c987_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_c987_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_c987_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2267_c7_c987]
signal result_u8_value_MUX_uxn_opcodes_h_l2267_c7_c987_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2267_c7_c987_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2267_c7_c987_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2267_c7_c987_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2267_c7_c987]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_c987_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_c987_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_c987_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_c987_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2267_c7_c987]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_c987_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_c987_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_c987_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_c987_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2267_c7_c987]
signal tmp16_MUX_uxn_opcodes_h_l2267_c7_c987_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2267_c7_c987_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2267_c7_c987_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2267_c7_c987_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2267_c7_c987]
signal n16_MUX_uxn_opcodes_h_l2267_c7_c987_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2267_c7_c987_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2267_c7_c987_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2267_c7_c987_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l2267_c7_c987]
signal t8_MUX_uxn_opcodes_h_l2267_c7_c987_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2267_c7_c987_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2267_c7_c987_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2267_c7_c987_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2271_c11_a4a7]
signal BIN_OP_EQ_uxn_opcodes_h_l2271_c11_a4a7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2271_c11_a4a7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2271_c11_a4a7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2271_c7_80bd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_80bd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_80bd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_80bd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_80bd_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2271_c7_80bd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_80bd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_80bd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_80bd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_80bd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2271_c7_80bd]
signal result_u8_value_MUX_uxn_opcodes_h_l2271_c7_80bd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2271_c7_80bd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2271_c7_80bd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2271_c7_80bd_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2271_c7_80bd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_80bd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_80bd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_80bd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_80bd_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2271_c7_80bd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_80bd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_80bd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_80bd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_80bd_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2271_c7_80bd]
signal tmp16_MUX_uxn_opcodes_h_l2271_c7_80bd_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2271_c7_80bd_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2271_c7_80bd_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2271_c7_80bd_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2271_c7_80bd]
signal n16_MUX_uxn_opcodes_h_l2271_c7_80bd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2271_c7_80bd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2271_c7_80bd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2271_c7_80bd_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2273_c3_5c3e]
signal CONST_SL_8_uxn_opcodes_h_l2273_c3_5c3e_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2273_c3_5c3e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2275_c11_7174]
signal BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7174_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7174_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7174_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2275_c7_b788]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_b788_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_b788_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_b788_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_b788_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2275_c7_b788]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_b788_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_b788_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_b788_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_b788_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2275_c7_b788]
signal result_u8_value_MUX_uxn_opcodes_h_l2275_c7_b788_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2275_c7_b788_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2275_c7_b788_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2275_c7_b788_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2275_c7_b788]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_b788_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_b788_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_b788_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_b788_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2275_c7_b788]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_b788_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_b788_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_b788_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_b788_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2275_c7_b788]
signal tmp16_MUX_uxn_opcodes_h_l2275_c7_b788_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2275_c7_b788_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2275_c7_b788_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2275_c7_b788_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2275_c7_b788]
signal n16_MUX_uxn_opcodes_h_l2275_c7_b788_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2275_c7_b788_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2275_c7_b788_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2275_c7_b788_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2276_c3_4cfe]
signal BIN_OP_OR_uxn_opcodes_h_l2276_c3_4cfe_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2276_c3_4cfe_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2276_c3_4cfe_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2277_c30_27a8]
signal sp_relative_shift_uxn_opcodes_h_l2277_c30_27a8_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2277_c30_27a8_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2277_c30_27a8_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2277_c30_27a8_return_output : signed(3 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2278_c20_62f1]
signal BIN_OP_AND_uxn_opcodes_h_l2278_c20_62f1_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2278_c20_62f1_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2278_c20_62f1_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l2278_c12_8b58]
signal BIN_OP_SR_uxn_opcodes_h_l2278_c12_8b58_left : unsigned(15 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2278_c12_8b58_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2278_c12_8b58_return_output : unsigned(15 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l2278_c36_d6eb]
signal CONST_SR_4_uxn_opcodes_h_l2278_c36_d6eb_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l2278_c36_d6eb_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l2278_c12_df49]
signal BIN_OP_SL_uxn_opcodes_h_l2278_c12_df49_left : unsigned(15 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2278_c12_df49_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2278_c12_df49_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2283_c11_2738]
signal BIN_OP_EQ_uxn_opcodes_h_l2283_c11_2738_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2283_c11_2738_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2283_c11_2738_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2283_c7_edab]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_edab_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_edab_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_edab_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_edab_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2283_c7_edab]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_edab_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_edab_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_edab_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_edab_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2283_c7_edab]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_edab_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_edab_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_edab_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_edab_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2283_c7_edab]
signal result_u8_value_MUX_uxn_opcodes_h_l2283_c7_edab_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2283_c7_edab_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2283_c7_edab_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2283_c7_edab_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2286_c31_d548]
signal CONST_SR_8_uxn_opcodes_h_l2286_c31_d548_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2286_c31_d548_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6( ref_toks_0 : opcode_result_t;
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
      base.is_pc_updated := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.is_ram_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2251_c6_7ee9
BIN_OP_EQ_uxn_opcodes_h_l2251_c6_7ee9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2251_c6_7ee9_left,
BIN_OP_EQ_uxn_opcodes_h_l2251_c6_7ee9_right,
BIN_OP_EQ_uxn_opcodes_h_l2251_c6_7ee9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_f0c3
result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_f0c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_f0c3
result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_f0c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2251_c2_f0c3
result_u8_value_MUX_uxn_opcodes_h_l2251_c2_f0c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond,
result_u8_value_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_f0c3
result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_f0c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_f0c3
result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_f0c3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_f0c3
result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_f0c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_f0c3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_f0c3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_f0c3
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_f0c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_f0c3
result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_f0c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2251_c2_f0c3
tmp16_MUX_uxn_opcodes_h_l2251_c2_f0c3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond,
tmp16_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue,
tmp16_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse,
tmp16_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output);

-- n16_MUX_uxn_opcodes_h_l2251_c2_f0c3
n16_MUX_uxn_opcodes_h_l2251_c2_f0c3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond,
n16_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue,
n16_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse,
n16_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output);

-- t8_MUX_uxn_opcodes_h_l2251_c2_f0c3
t8_MUX_uxn_opcodes_h_l2251_c2_f0c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond,
t8_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue,
t8_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse,
t8_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2264_c11_12af
BIN_OP_EQ_uxn_opcodes_h_l2264_c11_12af : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2264_c11_12af_left,
BIN_OP_EQ_uxn_opcodes_h_l2264_c11_12af_right,
BIN_OP_EQ_uxn_opcodes_h_l2264_c11_12af_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_2de1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_2de1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_2de1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_2de1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_2de1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_2de1
result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_2de1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_2de1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_2de1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_2de1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2264_c7_2de1
result_u8_value_MUX_uxn_opcodes_h_l2264_c7_2de1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2264_c7_2de1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2264_c7_2de1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2264_c7_2de1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_2de1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_2de1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_2de1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_2de1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_2de1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_2de1
result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_2de1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_2de1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_2de1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_2de1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2264_c7_2de1
tmp16_MUX_uxn_opcodes_h_l2264_c7_2de1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2264_c7_2de1_cond,
tmp16_MUX_uxn_opcodes_h_l2264_c7_2de1_iftrue,
tmp16_MUX_uxn_opcodes_h_l2264_c7_2de1_iffalse,
tmp16_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output);

-- n16_MUX_uxn_opcodes_h_l2264_c7_2de1
n16_MUX_uxn_opcodes_h_l2264_c7_2de1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2264_c7_2de1_cond,
n16_MUX_uxn_opcodes_h_l2264_c7_2de1_iftrue,
n16_MUX_uxn_opcodes_h_l2264_c7_2de1_iffalse,
n16_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output);

-- t8_MUX_uxn_opcodes_h_l2264_c7_2de1
t8_MUX_uxn_opcodes_h_l2264_c7_2de1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2264_c7_2de1_cond,
t8_MUX_uxn_opcodes_h_l2264_c7_2de1_iftrue,
t8_MUX_uxn_opcodes_h_l2264_c7_2de1_iffalse,
t8_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2267_c11_7f4a
BIN_OP_EQ_uxn_opcodes_h_l2267_c11_7f4a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2267_c11_7f4a_left,
BIN_OP_EQ_uxn_opcodes_h_l2267_c11_7f4a_right,
BIN_OP_EQ_uxn_opcodes_h_l2267_c11_7f4a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_c987
result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_c987 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_c987_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_c987_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_c987_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_c987_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_c987
result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_c987 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_c987_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_c987_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_c987_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_c987_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2267_c7_c987
result_u8_value_MUX_uxn_opcodes_h_l2267_c7_c987 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2267_c7_c987_cond,
result_u8_value_MUX_uxn_opcodes_h_l2267_c7_c987_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2267_c7_c987_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2267_c7_c987_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_c987
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_c987 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_c987_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_c987_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_c987_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_c987_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_c987
result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_c987 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_c987_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_c987_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_c987_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_c987_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2267_c7_c987
tmp16_MUX_uxn_opcodes_h_l2267_c7_c987 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2267_c7_c987_cond,
tmp16_MUX_uxn_opcodes_h_l2267_c7_c987_iftrue,
tmp16_MUX_uxn_opcodes_h_l2267_c7_c987_iffalse,
tmp16_MUX_uxn_opcodes_h_l2267_c7_c987_return_output);

-- n16_MUX_uxn_opcodes_h_l2267_c7_c987
n16_MUX_uxn_opcodes_h_l2267_c7_c987 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2267_c7_c987_cond,
n16_MUX_uxn_opcodes_h_l2267_c7_c987_iftrue,
n16_MUX_uxn_opcodes_h_l2267_c7_c987_iffalse,
n16_MUX_uxn_opcodes_h_l2267_c7_c987_return_output);

-- t8_MUX_uxn_opcodes_h_l2267_c7_c987
t8_MUX_uxn_opcodes_h_l2267_c7_c987 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2267_c7_c987_cond,
t8_MUX_uxn_opcodes_h_l2267_c7_c987_iftrue,
t8_MUX_uxn_opcodes_h_l2267_c7_c987_iffalse,
t8_MUX_uxn_opcodes_h_l2267_c7_c987_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2271_c11_a4a7
BIN_OP_EQ_uxn_opcodes_h_l2271_c11_a4a7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2271_c11_a4a7_left,
BIN_OP_EQ_uxn_opcodes_h_l2271_c11_a4a7_right,
BIN_OP_EQ_uxn_opcodes_h_l2271_c11_a4a7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_80bd
result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_80bd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_80bd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_80bd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_80bd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_80bd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_80bd
result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_80bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_80bd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_80bd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_80bd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_80bd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2271_c7_80bd
result_u8_value_MUX_uxn_opcodes_h_l2271_c7_80bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2271_c7_80bd_cond,
result_u8_value_MUX_uxn_opcodes_h_l2271_c7_80bd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2271_c7_80bd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2271_c7_80bd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_80bd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_80bd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_80bd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_80bd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_80bd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_80bd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_80bd
result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_80bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_80bd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_80bd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_80bd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_80bd_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2271_c7_80bd
tmp16_MUX_uxn_opcodes_h_l2271_c7_80bd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2271_c7_80bd_cond,
tmp16_MUX_uxn_opcodes_h_l2271_c7_80bd_iftrue,
tmp16_MUX_uxn_opcodes_h_l2271_c7_80bd_iffalse,
tmp16_MUX_uxn_opcodes_h_l2271_c7_80bd_return_output);

-- n16_MUX_uxn_opcodes_h_l2271_c7_80bd
n16_MUX_uxn_opcodes_h_l2271_c7_80bd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2271_c7_80bd_cond,
n16_MUX_uxn_opcodes_h_l2271_c7_80bd_iftrue,
n16_MUX_uxn_opcodes_h_l2271_c7_80bd_iffalse,
n16_MUX_uxn_opcodes_h_l2271_c7_80bd_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2273_c3_5c3e
CONST_SL_8_uxn_opcodes_h_l2273_c3_5c3e : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2273_c3_5c3e_x,
CONST_SL_8_uxn_opcodes_h_l2273_c3_5c3e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7174
BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7174 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7174_left,
BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7174_right,
BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7174_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_b788
result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_b788 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_b788_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_b788_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_b788_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_b788_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_b788
result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_b788 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_b788_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_b788_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_b788_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_b788_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2275_c7_b788
result_u8_value_MUX_uxn_opcodes_h_l2275_c7_b788 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2275_c7_b788_cond,
result_u8_value_MUX_uxn_opcodes_h_l2275_c7_b788_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2275_c7_b788_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2275_c7_b788_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_b788
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_b788 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_b788_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_b788_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_b788_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_b788_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_b788
result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_b788 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_b788_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_b788_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_b788_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_b788_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2275_c7_b788
tmp16_MUX_uxn_opcodes_h_l2275_c7_b788 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2275_c7_b788_cond,
tmp16_MUX_uxn_opcodes_h_l2275_c7_b788_iftrue,
tmp16_MUX_uxn_opcodes_h_l2275_c7_b788_iffalse,
tmp16_MUX_uxn_opcodes_h_l2275_c7_b788_return_output);

-- n16_MUX_uxn_opcodes_h_l2275_c7_b788
n16_MUX_uxn_opcodes_h_l2275_c7_b788 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2275_c7_b788_cond,
n16_MUX_uxn_opcodes_h_l2275_c7_b788_iftrue,
n16_MUX_uxn_opcodes_h_l2275_c7_b788_iffalse,
n16_MUX_uxn_opcodes_h_l2275_c7_b788_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2276_c3_4cfe
BIN_OP_OR_uxn_opcodes_h_l2276_c3_4cfe : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2276_c3_4cfe_left,
BIN_OP_OR_uxn_opcodes_h_l2276_c3_4cfe_right,
BIN_OP_OR_uxn_opcodes_h_l2276_c3_4cfe_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2277_c30_27a8
sp_relative_shift_uxn_opcodes_h_l2277_c30_27a8 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2277_c30_27a8_ins,
sp_relative_shift_uxn_opcodes_h_l2277_c30_27a8_x,
sp_relative_shift_uxn_opcodes_h_l2277_c30_27a8_y,
sp_relative_shift_uxn_opcodes_h_l2277_c30_27a8_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2278_c20_62f1
BIN_OP_AND_uxn_opcodes_h_l2278_c20_62f1 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2278_c20_62f1_left,
BIN_OP_AND_uxn_opcodes_h_l2278_c20_62f1_right,
BIN_OP_AND_uxn_opcodes_h_l2278_c20_62f1_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l2278_c12_8b58
BIN_OP_SR_uxn_opcodes_h_l2278_c12_8b58 : entity work.BIN_OP_SR_uint16_t_uint8_t_0CLK_295015b8 port map (
BIN_OP_SR_uxn_opcodes_h_l2278_c12_8b58_left,
BIN_OP_SR_uxn_opcodes_h_l2278_c12_8b58_right,
BIN_OP_SR_uxn_opcodes_h_l2278_c12_8b58_return_output);

-- CONST_SR_4_uxn_opcodes_h_l2278_c36_d6eb
CONST_SR_4_uxn_opcodes_h_l2278_c36_d6eb : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l2278_c36_d6eb_x,
CONST_SR_4_uxn_opcodes_h_l2278_c36_d6eb_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l2278_c12_df49
BIN_OP_SL_uxn_opcodes_h_l2278_c12_df49 : entity work.BIN_OP_SL_uint16_t_uint8_t_0CLK_b6546dec port map (
BIN_OP_SL_uxn_opcodes_h_l2278_c12_df49_left,
BIN_OP_SL_uxn_opcodes_h_l2278_c12_df49_right,
BIN_OP_SL_uxn_opcodes_h_l2278_c12_df49_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2283_c11_2738
BIN_OP_EQ_uxn_opcodes_h_l2283_c11_2738 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2283_c11_2738_left,
BIN_OP_EQ_uxn_opcodes_h_l2283_c11_2738_right,
BIN_OP_EQ_uxn_opcodes_h_l2283_c11_2738_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_edab
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_edab : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_edab_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_edab_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_edab_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_edab_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_edab
result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_edab : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_edab_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_edab_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_edab_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_edab_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_edab
result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_edab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_edab_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_edab_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_edab_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_edab_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2283_c7_edab
result_u8_value_MUX_uxn_opcodes_h_l2283_c7_edab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2283_c7_edab_cond,
result_u8_value_MUX_uxn_opcodes_h_l2283_c7_edab_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2283_c7_edab_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2283_c7_edab_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2286_c31_d548
CONST_SR_8_uxn_opcodes_h_l2286_c31_d548 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2286_c31_d548_x,
CONST_SR_8_uxn_opcodes_h_l2286_c31_d548_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2251_c6_7ee9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output,
 tmp16_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output,
 n16_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output,
 t8_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2264_c11_12af_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output,
 tmp16_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output,
 n16_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output,
 t8_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2267_c11_7f4a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_c987_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_c987_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2267_c7_c987_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_c987_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_c987_return_output,
 tmp16_MUX_uxn_opcodes_h_l2267_c7_c987_return_output,
 n16_MUX_uxn_opcodes_h_l2267_c7_c987_return_output,
 t8_MUX_uxn_opcodes_h_l2267_c7_c987_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2271_c11_a4a7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_80bd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_80bd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2271_c7_80bd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_80bd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_80bd_return_output,
 tmp16_MUX_uxn_opcodes_h_l2271_c7_80bd_return_output,
 n16_MUX_uxn_opcodes_h_l2271_c7_80bd_return_output,
 CONST_SL_8_uxn_opcodes_h_l2273_c3_5c3e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7174_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_b788_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_b788_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2275_c7_b788_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_b788_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_b788_return_output,
 tmp16_MUX_uxn_opcodes_h_l2275_c7_b788_return_output,
 n16_MUX_uxn_opcodes_h_l2275_c7_b788_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2276_c3_4cfe_return_output,
 sp_relative_shift_uxn_opcodes_h_l2277_c30_27a8_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2278_c20_62f1_return_output,
 BIN_OP_SR_uxn_opcodes_h_l2278_c12_8b58_return_output,
 CONST_SR_4_uxn_opcodes_h_l2278_c36_d6eb_return_output,
 BIN_OP_SL_uxn_opcodes_h_l2278_c12_df49_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2283_c11_2738_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_edab_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_edab_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_edab_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2283_c7_edab_return_output,
 CONST_SR_8_uxn_opcodes_h_l2286_c31_d548_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_7ee9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_7ee9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_7ee9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2251_c2_f0c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2251_c2_f0c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2251_c2_f0c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2256_c3_4bcb : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2261_c3_a797 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2251_c2_f0c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_12af_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_12af_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_12af_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_2de1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_2de1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_c987_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_2de1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_2de1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_2de1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_c987_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_2de1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_2de1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_2de1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_c987_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_2de1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_2de1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2265_c3_0867 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_2de1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_c987_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_2de1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_2de1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_2de1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_c987_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_2de1_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_2de1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_2de1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_c987_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_2de1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2264_c7_2de1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2264_c7_2de1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2267_c7_c987_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2264_c7_2de1_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2264_c7_2de1_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2264_c7_2de1_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2267_c7_c987_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2264_c7_2de1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_7f4a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_7f4a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_7f4a_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_c987_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_c987_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_80bd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_c987_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_c987_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_c987_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_80bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_c987_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_c987_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_c987_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_80bd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_c987_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_c987_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2269_c3_b31e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_c987_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_80bd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_c987_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_c987_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_c987_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_80bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_c987_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_c987_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_c987_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_80bd_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_c987_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2267_c7_c987_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2267_c7_c987_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2271_c7_80bd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2267_c7_c987_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2267_c7_c987_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2267_c7_c987_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2267_c7_c987_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_a4a7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_a4a7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_a4a7_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_80bd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_80bd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_b788_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_80bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_80bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_80bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_b788_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_80bd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_80bd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_80bd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_b788_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_80bd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_80bd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_80bd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_b788_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_80bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_80bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_80bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_b788_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_80bd_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_80bd_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_80bd_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_b788_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_80bd_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2271_c7_80bd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2271_c7_80bd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2275_c7_b788_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2271_c7_80bd_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2273_c3_5c3e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2273_c3_5c3e_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7174_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7174_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7174_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_b788_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_b788_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_edab_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_b788_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_b788_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_b788_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_b788_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_b788_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_b788_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_edab_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_b788_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_b788_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2280_c3_8b77 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_b788_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_edab_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_b788_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_b788_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_b788_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_edab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_b788_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_b788_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_b788_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_b788_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2275_c7_b788_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2275_c7_b788_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2275_c7_b788_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_4cfe_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_4cfe_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_4cfe_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_27a8_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_27a8_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_27a8_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_27a8_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_8b58_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_62f1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_62f1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_62f1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_8b58_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_8b58_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_df49_left : unsigned(15 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2278_c36_d6eb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_df49_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2278_c36_d6eb_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_df49_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2281_c21_281a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_2738_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_2738_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_2738_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_edab_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2285_c3_2077 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_edab_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_edab_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_edab_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2284_c3_3058 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_edab_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_edab_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_edab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_edab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_edab_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_edab_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_edab_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_edab_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2286_c31_d548_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2286_c31_d548_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2286_c21_f570_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2283_l2271_l2267_l2264_l2251_DUPLICATE_7722_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2271_l2264_l2267_l2283_DUPLICATE_517e_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2271_l2264_l2275_l2267_DUPLICATE_be58_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2283_l2275_l2271_l2267_l2264_DUPLICATE_941c_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2272_l2276_DUPLICATE_d867_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2271_l2283_DUPLICATE_d8d3_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l2290_l2246_DUPLICATE_651d_return_output : opcode_result_t;
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
     VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_27a8_y := resize(to_signed(-1, 2), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_7f4a_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2269_c3_b31e := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_c987_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2269_c3_b31e;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2256_c3_4bcb := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2256_c3_4bcb;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2265_c3_0867 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_2de1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2265_c3_0867;
     VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_27a8_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_7ee9_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2261_c3_a797 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2261_c3_a797;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2284_c3_3058 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_edab_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2284_c3_3058;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_12af_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7174_right := to_unsigned(4, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_b788_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_62f1_right := to_unsigned(15, 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_edab_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_a4a7_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_2738_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2280_c3_8b77 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_b788_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2280_c3_8b77;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2285_c3_2077 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_edab_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2285_c3_2077;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_27a8_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_4cfe_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2264_c7_2de1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2267_c7_c987_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2275_c7_b788_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_7ee9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_12af_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_7f4a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_a4a7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7174_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_2738_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l2267_c7_c987_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_62f1_left := t8;
     VAR_CONST_SR_4_uxn_opcodes_h_l2278_c36_d6eb_x := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2264_c7_2de1_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2267_c7_c987_iffalse := t8;
     VAR_CONST_SR_8_uxn_opcodes_h_l2286_c31_d548_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_2de1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_c987_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_80bd_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_b788_iffalse := tmp16;
     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2283_l2271_l2267_l2264_l2251_DUPLICATE_7722 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2283_l2271_l2267_l2264_l2251_DUPLICATE_7722_return_output := result.u8_value;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2251_c2_f0c3] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2251_c2_f0c3_return_output := result.is_ram_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2251_c2_f0c3] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2251_c2_f0c3_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2283_l2275_l2271_l2267_l2264_DUPLICATE_941c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2283_l2275_l2271_l2267_l2264_DUPLICATE_941c_return_output := result.is_opc_done;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2251_c2_f0c3] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2251_c2_f0c3_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l2271_c11_a4a7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2271_c11_a4a7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_a4a7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2271_c11_a4a7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_a4a7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_a4a7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2271_c11_a4a7_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2251_c2_f0c3] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2251_c2_f0c3_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2283_c11_2738] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2283_c11_2738_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_2738_left;
     BIN_OP_EQ_uxn_opcodes_h_l2283_c11_2738_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_2738_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_2738_return_output := BIN_OP_EQ_uxn_opcodes_h_l2283_c11_2738_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2271_l2283_DUPLICATE_d8d3 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2271_l2283_DUPLICATE_d8d3_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2272_l2276_DUPLICATE_d867 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2272_l2276_DUPLICATE_d867_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- sp_relative_shift[uxn_opcodes_h_l2277_c30_27a8] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2277_c30_27a8_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_27a8_ins;
     sp_relative_shift_uxn_opcodes_h_l2277_c30_27a8_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_27a8_x;
     sp_relative_shift_uxn_opcodes_h_l2277_c30_27a8_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_27a8_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_27a8_return_output := sp_relative_shift_uxn_opcodes_h_l2277_c30_27a8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2271_l2264_l2275_l2267_DUPLICATE_be58 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2271_l2264_l2275_l2267_DUPLICATE_be58_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2264_c11_12af] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2264_c11_12af_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_12af_left;
     BIN_OP_EQ_uxn_opcodes_h_l2264_c11_12af_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_12af_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_12af_return_output := BIN_OP_EQ_uxn_opcodes_h_l2264_c11_12af_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2267_c11_7f4a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2267_c11_7f4a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_7f4a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2267_c11_7f4a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_7f4a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_7f4a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2267_c11_7f4a_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2271_l2264_l2267_l2283_DUPLICATE_517e LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2271_l2264_l2267_l2283_DUPLICATE_517e_return_output := result.sp_relative_shift;

     -- CONST_SR_4[uxn_opcodes_h_l2278_c36_d6eb] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l2278_c36_d6eb_x <= VAR_CONST_SR_4_uxn_opcodes_h_l2278_c36_d6eb_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l2278_c36_d6eb_return_output := CONST_SR_4_uxn_opcodes_h_l2278_c36_d6eb_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2278_c20_62f1] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2278_c20_62f1_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_62f1_left;
     BIN_OP_AND_uxn_opcodes_h_l2278_c20_62f1_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_62f1_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_62f1_return_output := BIN_OP_AND_uxn_opcodes_h_l2278_c20_62f1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2251_c6_7ee9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2251_c6_7ee9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_7ee9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2251_c6_7ee9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_7ee9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_7ee9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2251_c6_7ee9_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2286_c31_d548] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2286_c31_d548_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2286_c31_d548_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2286_c31_d548_return_output := CONST_SR_8_uxn_opcodes_h_l2286_c31_d548_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2275_c11_7174] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7174_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7174_left;
     BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7174_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7174_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7174_return_output := BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7174_return_output;

     -- Submodule level 1
     VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_8b58_right := VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_62f1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_7ee9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_7ee9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_7ee9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_7ee9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_7ee9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_7ee9_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_7ee9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_7ee9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_7ee9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_7ee9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_7ee9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_7ee9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2264_c7_2de1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_12af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_2de1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_12af_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_2de1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_12af_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_2de1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_12af_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_2de1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_12af_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_2de1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_12af_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2264_c7_2de1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_12af_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_2de1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_12af_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2267_c7_c987_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_7f4a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_c987_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_7f4a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_c987_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_7f4a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_c987_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_7f4a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_c987_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_7f4a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_c987_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_7f4a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2267_c7_c987_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_7f4a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_c987_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_7f4a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2271_c7_80bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_a4a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_80bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_a4a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_80bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_a4a7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_80bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_a4a7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_80bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_a4a7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_80bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_a4a7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_80bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_a4a7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2275_c7_b788_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7174_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_b788_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7174_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_b788_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7174_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_b788_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7174_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_b788_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7174_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_b788_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7174_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_b788_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7174_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_edab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_2738_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_edab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_2738_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_edab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_2738_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_edab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_2738_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_4cfe_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2272_l2276_DUPLICATE_d867_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2273_c3_5c3e_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2272_l2276_DUPLICATE_d867_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_2de1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2271_l2264_l2267_l2283_DUPLICATE_517e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_c987_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2271_l2264_l2267_l2283_DUPLICATE_517e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_80bd_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2271_l2264_l2267_l2283_DUPLICATE_517e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_edab_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2271_l2264_l2267_l2283_DUPLICATE_517e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_2de1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2283_l2275_l2271_l2267_l2264_DUPLICATE_941c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_c987_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2283_l2275_l2271_l2267_l2264_DUPLICATE_941c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_80bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2283_l2275_l2271_l2267_l2264_DUPLICATE_941c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_b788_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2283_l2275_l2271_l2267_l2264_DUPLICATE_941c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_edab_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2283_l2275_l2271_l2267_l2264_DUPLICATE_941c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_2de1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2271_l2264_l2275_l2267_DUPLICATE_be58_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_c987_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2271_l2264_l2275_l2267_DUPLICATE_be58_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_80bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2271_l2264_l2275_l2267_DUPLICATE_be58_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_b788_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2271_l2264_l2275_l2267_DUPLICATE_be58_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_80bd_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2271_l2283_DUPLICATE_d8d3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_edab_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2271_l2283_DUPLICATE_d8d3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2283_l2271_l2267_l2264_l2251_DUPLICATE_7722_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_2de1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2283_l2271_l2267_l2264_l2251_DUPLICATE_7722_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_c987_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2283_l2271_l2267_l2264_l2251_DUPLICATE_7722_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_80bd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2283_l2271_l2267_l2264_l2251_DUPLICATE_7722_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_edab_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2283_l2271_l2267_l2264_l2251_DUPLICATE_7722_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_df49_right := VAR_CONST_SR_4_uxn_opcodes_h_l2278_c36_d6eb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2251_c2_f0c3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2251_c2_f0c3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2251_c2_f0c3_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2251_c2_f0c3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_b788_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_27a8_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2283_c7_edab] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_edab_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_edab_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_edab_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_edab_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_edab_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_edab_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_edab_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_edab_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2276_c3_4cfe] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2276_c3_4cfe_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_4cfe_left;
     BIN_OP_OR_uxn_opcodes_h_l2276_c3_4cfe_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_4cfe_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_4cfe_return_output := BIN_OP_OR_uxn_opcodes_h_l2276_c3_4cfe_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2251_c2_f0c3] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2251_c2_f0c3] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2251_c2_f0c3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2286_c21_f570] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2286_c21_f570_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2286_c31_d548_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2283_c7_edab] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_edab_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_edab_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_edab_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_edab_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_edab_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_edab_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_edab_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_edab_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2273_c3_5c3e] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2273_c3_5c3e_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2273_c3_5c3e_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2273_c3_5c3e_return_output := CONST_SL_8_uxn_opcodes_h_l2273_c3_5c3e_return_output;

     -- t8_MUX[uxn_opcodes_h_l2267_c7_c987] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2267_c7_c987_cond <= VAR_t8_MUX_uxn_opcodes_h_l2267_c7_c987_cond;
     t8_MUX_uxn_opcodes_h_l2267_c7_c987_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2267_c7_c987_iftrue;
     t8_MUX_uxn_opcodes_h_l2267_c7_c987_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2267_c7_c987_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2267_c7_c987_return_output := t8_MUX_uxn_opcodes_h_l2267_c7_c987_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2251_c2_f0c3] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2275_c7_b788] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_b788_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_b788_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_b788_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_b788_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_b788_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_b788_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_b788_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_b788_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2283_c7_edab] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_edab_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_edab_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_edab_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_edab_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_edab_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_edab_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_edab_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_edab_return_output;

     -- Submodule level 2
     VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_8b58_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_4cfe_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2275_c7_b788_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_4cfe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_edab_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2286_c21_f570_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2271_c7_80bd_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2273_c3_5c3e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_b788_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_edab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_80bd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_b788_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_b788_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_edab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_b788_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_edab_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2264_c7_2de1_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2267_c7_c987_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2271_c7_80bd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_80bd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_80bd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_80bd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_80bd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_80bd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_80bd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_80bd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_80bd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2283_c7_edab] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2283_c7_edab_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_edab_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2283_c7_edab_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_edab_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2283_c7_edab_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_edab_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_edab_return_output := result_u8_value_MUX_uxn_opcodes_h_l2283_c7_edab_return_output;

     -- t8_MUX[uxn_opcodes_h_l2264_c7_2de1] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2264_c7_2de1_cond <= VAR_t8_MUX_uxn_opcodes_h_l2264_c7_2de1_cond;
     t8_MUX_uxn_opcodes_h_l2264_c7_2de1_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2264_c7_2de1_iftrue;
     t8_MUX_uxn_opcodes_h_l2264_c7_2de1_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2264_c7_2de1_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output := t8_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output;

     -- BIN_OP_SR[uxn_opcodes_h_l2278_c12_8b58] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l2278_c12_8b58_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_8b58_left;
     BIN_OP_SR_uxn_opcodes_h_l2278_c12_8b58_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_8b58_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_8b58_return_output := BIN_OP_SR_uxn_opcodes_h_l2278_c12_8b58_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2275_c7_b788] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_b788_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_b788_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_b788_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_b788_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_b788_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_b788_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_b788_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_b788_return_output;

     -- n16_MUX[uxn_opcodes_h_l2275_c7_b788] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2275_c7_b788_cond <= VAR_n16_MUX_uxn_opcodes_h_l2275_c7_b788_cond;
     n16_MUX_uxn_opcodes_h_l2275_c7_b788_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2275_c7_b788_iftrue;
     n16_MUX_uxn_opcodes_h_l2275_c7_b788_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2275_c7_b788_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2275_c7_b788_return_output := n16_MUX_uxn_opcodes_h_l2275_c7_b788_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2275_c7_b788] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_b788_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_b788_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_b788_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_b788_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_b788_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_b788_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_b788_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_b788_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2275_c7_b788] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_b788_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_b788_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_b788_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_b788_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_b788_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_b788_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_b788_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_b788_return_output;

     -- Submodule level 3
     VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_df49_left := VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_8b58_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2271_c7_80bd_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2275_c7_b788_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_80bd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_b788_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_c987_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_80bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_80bd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_b788_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_80bd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_b788_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_b788_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_edab_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2271_c7_80bd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_80bd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_80bd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_80bd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_80bd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_80bd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_80bd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_80bd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_80bd_return_output;

     -- BIN_OP_SL[uxn_opcodes_h_l2278_c12_df49] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l2278_c12_df49_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_df49_left;
     BIN_OP_SL_uxn_opcodes_h_l2278_c12_df49_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_df49_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_df49_return_output := BIN_OP_SL_uxn_opcodes_h_l2278_c12_df49_return_output;

     -- n16_MUX[uxn_opcodes_h_l2271_c7_80bd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2271_c7_80bd_cond <= VAR_n16_MUX_uxn_opcodes_h_l2271_c7_80bd_cond;
     n16_MUX_uxn_opcodes_h_l2271_c7_80bd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2271_c7_80bd_iftrue;
     n16_MUX_uxn_opcodes_h_l2271_c7_80bd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2271_c7_80bd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2271_c7_80bd_return_output := n16_MUX_uxn_opcodes_h_l2271_c7_80bd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2271_c7_80bd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_80bd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_80bd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_80bd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_80bd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_80bd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_80bd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_80bd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_80bd_return_output;

     -- t8_MUX[uxn_opcodes_h_l2251_c2_f0c3] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond <= VAR_t8_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond;
     t8_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue;
     t8_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output := t8_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2271_c7_80bd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_80bd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_80bd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_80bd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_80bd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_80bd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_80bd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_80bd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_80bd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2267_c7_c987] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_c987_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_c987_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_c987_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_c987_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_c987_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_c987_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_c987_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_c987_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_b788_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_df49_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2267_c7_c987_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2271_c7_80bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_c987_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_80bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_2de1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_c987_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_c987_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_80bd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_c987_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_80bd_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2275_c7_b788] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2275_c7_b788_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_b788_cond;
     tmp16_MUX_uxn_opcodes_h_l2275_c7_b788_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_b788_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2275_c7_b788_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_b788_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_b788_return_output := tmp16_MUX_uxn_opcodes_h_l2275_c7_b788_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2281_c21_281a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2281_c21_281a_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_df49_return_output);

     -- n16_MUX[uxn_opcodes_h_l2267_c7_c987] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2267_c7_c987_cond <= VAR_n16_MUX_uxn_opcodes_h_l2267_c7_c987_cond;
     n16_MUX_uxn_opcodes_h_l2267_c7_c987_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2267_c7_c987_iftrue;
     n16_MUX_uxn_opcodes_h_l2267_c7_c987_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2267_c7_c987_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2267_c7_c987_return_output := n16_MUX_uxn_opcodes_h_l2267_c7_c987_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2267_c7_c987] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_c987_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_c987_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_c987_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_c987_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_c987_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_c987_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_c987_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_c987_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2267_c7_c987] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_c987_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_c987_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_c987_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_c987_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_c987_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_c987_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_c987_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_c987_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2264_c7_2de1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_2de1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_2de1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_2de1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_2de1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_2de1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_2de1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2267_c7_c987] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_c987_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_c987_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_c987_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_c987_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_c987_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_c987_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_c987_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_c987_return_output;

     -- Submodule level 5
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_b788_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2281_c21_281a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2264_c7_2de1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2267_c7_c987_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_2de1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_c987_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_2de1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_c987_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_2de1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_c987_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_80bd_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_b788_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2271_c7_80bd] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2271_c7_80bd_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_80bd_cond;
     tmp16_MUX_uxn_opcodes_h_l2271_c7_80bd_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_80bd_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2271_c7_80bd_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_80bd_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_80bd_return_output := tmp16_MUX_uxn_opcodes_h_l2271_c7_80bd_return_output;

     -- n16_MUX[uxn_opcodes_h_l2264_c7_2de1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2264_c7_2de1_cond <= VAR_n16_MUX_uxn_opcodes_h_l2264_c7_2de1_cond;
     n16_MUX_uxn_opcodes_h_l2264_c7_2de1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2264_c7_2de1_iftrue;
     n16_MUX_uxn_opcodes_h_l2264_c7_2de1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2264_c7_2de1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output := n16_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2264_c7_2de1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_2de1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_2de1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_2de1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_2de1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_2de1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_2de1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2251_c2_f0c3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2264_c7_2de1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_2de1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_2de1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_2de1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_2de1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_2de1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_2de1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2264_c7_2de1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_2de1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_2de1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_2de1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_2de1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_2de1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_2de1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2275_c7_b788] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2275_c7_b788_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_b788_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2275_c7_b788_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_b788_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2275_c7_b788_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_b788_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_b788_return_output := result_u8_value_MUX_uxn_opcodes_h_l2275_c7_b788_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_80bd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_b788_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_c987_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_80bd_return_output;
     -- n16_MUX[uxn_opcodes_h_l2251_c2_f0c3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond <= VAR_n16_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond;
     n16_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue;
     n16_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output := n16_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2251_c2_f0c3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2251_c2_f0c3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2251_c2_f0c3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2267_c7_c987] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2267_c7_c987_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_c987_cond;
     tmp16_MUX_uxn_opcodes_h_l2267_c7_c987_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_c987_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2267_c7_c987_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_c987_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_c987_return_output := tmp16_MUX_uxn_opcodes_h_l2267_c7_c987_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2271_c7_80bd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2271_c7_80bd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_80bd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2271_c7_80bd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_80bd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2271_c7_80bd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_80bd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_80bd_return_output := result_u8_value_MUX_uxn_opcodes_h_l2271_c7_80bd_return_output;

     -- Submodule level 7
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_c987_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_80bd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_2de1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_c987_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2264_c7_2de1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2264_c7_2de1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_2de1_cond;
     tmp16_MUX_uxn_opcodes_h_l2264_c7_2de1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_2de1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2264_c7_2de1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_2de1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output := tmp16_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2267_c7_c987] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2267_c7_c987_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_c987_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2267_c7_c987_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_c987_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2267_c7_c987_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_c987_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_c987_return_output := result_u8_value_MUX_uxn_opcodes_h_l2267_c7_c987_return_output;

     -- Submodule level 8
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_2de1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_c987_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2251_c2_f0c3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond;
     tmp16_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output := tmp16_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2264_c7_2de1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2264_c7_2de1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_2de1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2264_c7_2de1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_2de1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2264_c7_2de1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_2de1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_2de1_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2251_c2_f0c3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_f0c3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_f0c3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_f0c3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output := result_u8_value_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l2290_l2246_DUPLICATE_651d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l2290_l2246_DUPLICATE_651d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_f0c3_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l2290_l2246_DUPLICATE_651d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l2290_l2246_DUPLICATE_651d_return_output;
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
