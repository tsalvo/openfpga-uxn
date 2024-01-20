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
-- BIN_OP_EQ[uxn_opcodes_h_l2251_c6_6c59]
signal BIN_OP_EQ_uxn_opcodes_h_l2251_c6_6c59_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2251_c6_6c59_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2251_c6_6c59_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2251_c2_2eec]
signal n16_MUX_uxn_opcodes_h_l2251_c2_2eec_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2251_c2_2eec]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_2eec_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2251_c2_2eec]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_2eec_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2251_c2_2eec]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_2eec_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2251_c2_2eec]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_2eec_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2251_c2_2eec]
signal result_u8_value_MUX_uxn_opcodes_h_l2251_c2_2eec_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2251_c2_2eec]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_2eec_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2251_c2_2eec]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_2eec_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2251_c2_2eec]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_2eec_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2251_c2_2eec]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_2eec_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output : unsigned(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l2251_c2_2eec]
signal t8_MUX_uxn_opcodes_h_l2251_c2_2eec_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2251_c2_2eec]
signal tmp16_MUX_uxn_opcodes_h_l2251_c2_2eec_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2264_c11_d586]
signal BIN_OP_EQ_uxn_opcodes_h_l2264_c11_d586_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2264_c11_d586_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2264_c11_d586_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2264_c7_1743]
signal n16_MUX_uxn_opcodes_h_l2264_c7_1743_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2264_c7_1743_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2264_c7_1743_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2264_c7_1743_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2264_c7_1743]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_1743_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_1743_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_1743_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_1743_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2264_c7_1743]
signal result_u8_value_MUX_uxn_opcodes_h_l2264_c7_1743_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2264_c7_1743_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2264_c7_1743_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2264_c7_1743_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2264_c7_1743]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_1743_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_1743_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_1743_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_1743_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2264_c7_1743]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_1743_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_1743_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_1743_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_1743_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2264_c7_1743]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_1743_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_1743_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_1743_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_1743_return_output : unsigned(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l2264_c7_1743]
signal t8_MUX_uxn_opcodes_h_l2264_c7_1743_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2264_c7_1743_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2264_c7_1743_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2264_c7_1743_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2264_c7_1743]
signal tmp16_MUX_uxn_opcodes_h_l2264_c7_1743_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2264_c7_1743_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2264_c7_1743_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2264_c7_1743_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2267_c11_b205]
signal BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b205_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b205_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b205_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2267_c7_207b]
signal n16_MUX_uxn_opcodes_h_l2267_c7_207b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2267_c7_207b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2267_c7_207b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2267_c7_207b_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2267_c7_207b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_207b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_207b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_207b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_207b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2267_c7_207b]
signal result_u8_value_MUX_uxn_opcodes_h_l2267_c7_207b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2267_c7_207b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2267_c7_207b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2267_c7_207b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2267_c7_207b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_207b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_207b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_207b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_207b_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2267_c7_207b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_207b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_207b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_207b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_207b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2267_c7_207b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_207b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_207b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_207b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_207b_return_output : unsigned(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l2267_c7_207b]
signal t8_MUX_uxn_opcodes_h_l2267_c7_207b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2267_c7_207b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2267_c7_207b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2267_c7_207b_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2267_c7_207b]
signal tmp16_MUX_uxn_opcodes_h_l2267_c7_207b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2267_c7_207b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2267_c7_207b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2267_c7_207b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2271_c11_5db3]
signal BIN_OP_EQ_uxn_opcodes_h_l2271_c11_5db3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2271_c11_5db3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2271_c11_5db3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2271_c7_bf9c]
signal n16_MUX_uxn_opcodes_h_l2271_c7_bf9c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2271_c7_bf9c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2271_c7_bf9c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2271_c7_bf9c_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2271_c7_bf9c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_bf9c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_bf9c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_bf9c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_bf9c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2271_c7_bf9c]
signal result_u8_value_MUX_uxn_opcodes_h_l2271_c7_bf9c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2271_c7_bf9c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2271_c7_bf9c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2271_c7_bf9c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2271_c7_bf9c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_bf9c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_bf9c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_bf9c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_bf9c_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2271_c7_bf9c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_bf9c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_bf9c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_bf9c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_bf9c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2271_c7_bf9c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_bf9c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_bf9c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_bf9c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_bf9c_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2271_c7_bf9c]
signal tmp16_MUX_uxn_opcodes_h_l2271_c7_bf9c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2271_c7_bf9c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2271_c7_bf9c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2271_c7_bf9c_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2273_c3_bb9c]
signal CONST_SL_8_uxn_opcodes_h_l2273_c3_bb9c_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2273_c3_bb9c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2275_c11_c79d]
signal BIN_OP_EQ_uxn_opcodes_h_l2275_c11_c79d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2275_c11_c79d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2275_c11_c79d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2275_c7_0e31]
signal n16_MUX_uxn_opcodes_h_l2275_c7_0e31_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2275_c7_0e31_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2275_c7_0e31_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2275_c7_0e31_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2275_c7_0e31]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_0e31_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_0e31_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_0e31_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_0e31_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2275_c7_0e31]
signal result_u8_value_MUX_uxn_opcodes_h_l2275_c7_0e31_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2275_c7_0e31_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2275_c7_0e31_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2275_c7_0e31_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2275_c7_0e31]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_0e31_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_0e31_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_0e31_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_0e31_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2275_c7_0e31]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_0e31_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_0e31_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_0e31_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_0e31_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2275_c7_0e31]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_0e31_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_0e31_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_0e31_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_0e31_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2275_c7_0e31]
signal tmp16_MUX_uxn_opcodes_h_l2275_c7_0e31_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2275_c7_0e31_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2275_c7_0e31_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2275_c7_0e31_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2276_c3_5098]
signal BIN_OP_OR_uxn_opcodes_h_l2276_c3_5098_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2276_c3_5098_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2276_c3_5098_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2277_c30_b132]
signal sp_relative_shift_uxn_opcodes_h_l2277_c30_b132_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2277_c30_b132_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2277_c30_b132_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2277_c30_b132_return_output : signed(3 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2278_c20_656f]
signal BIN_OP_AND_uxn_opcodes_h_l2278_c20_656f_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2278_c20_656f_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2278_c20_656f_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l2278_c12_6a3e]
signal BIN_OP_SR_uxn_opcodes_h_l2278_c12_6a3e_left : unsigned(15 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2278_c12_6a3e_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2278_c12_6a3e_return_output : unsigned(15 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l2278_c36_d8e0]
signal CONST_SR_4_uxn_opcodes_h_l2278_c36_d8e0_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l2278_c36_d8e0_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l2278_c12_5d94]
signal BIN_OP_SL_uxn_opcodes_h_l2278_c12_5d94_left : unsigned(15 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2278_c12_5d94_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2278_c12_5d94_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2283_c11_c3c5]
signal BIN_OP_EQ_uxn_opcodes_h_l2283_c11_c3c5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2283_c11_c3c5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2283_c11_c3c5_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2283_c7_7e17]
signal result_u8_value_MUX_uxn_opcodes_h_l2283_c7_7e17_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2283_c7_7e17_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2283_c7_7e17_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2283_c7_7e17_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2283_c7_7e17]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_7e17_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_7e17_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_7e17_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_7e17_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2283_c7_7e17]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_7e17_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_7e17_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_7e17_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_7e17_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2283_c7_7e17]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_7e17_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_7e17_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_7e17_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_7e17_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2286_c31_da11]
signal CONST_SR_8_uxn_opcodes_h_l2286_c31_da11_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2286_c31_da11_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_ram_write := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_opc_done := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2251_c6_6c59
BIN_OP_EQ_uxn_opcodes_h_l2251_c6_6c59 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2251_c6_6c59_left,
BIN_OP_EQ_uxn_opcodes_h_l2251_c6_6c59_right,
BIN_OP_EQ_uxn_opcodes_h_l2251_c6_6c59_return_output);

-- n16_MUX_uxn_opcodes_h_l2251_c2_2eec
n16_MUX_uxn_opcodes_h_l2251_c2_2eec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2251_c2_2eec_cond,
n16_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue,
n16_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse,
n16_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_2eec
result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_2eec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_2eec_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_2eec
result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_2eec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_2eec_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_2eec
result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_2eec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_2eec_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_2eec
result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_2eec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_2eec_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2251_c2_2eec
result_u8_value_MUX_uxn_opcodes_h_l2251_c2_2eec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2251_c2_2eec_cond,
result_u8_value_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_2eec
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_2eec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_2eec_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_2eec
result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_2eec : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_2eec_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_2eec
result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_2eec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_2eec_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_2eec
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_2eec : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_2eec_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output);

-- t8_MUX_uxn_opcodes_h_l2251_c2_2eec
t8_MUX_uxn_opcodes_h_l2251_c2_2eec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2251_c2_2eec_cond,
t8_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue,
t8_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse,
t8_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2251_c2_2eec
tmp16_MUX_uxn_opcodes_h_l2251_c2_2eec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2251_c2_2eec_cond,
tmp16_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue,
tmp16_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse,
tmp16_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2264_c11_d586
BIN_OP_EQ_uxn_opcodes_h_l2264_c11_d586 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2264_c11_d586_left,
BIN_OP_EQ_uxn_opcodes_h_l2264_c11_d586_right,
BIN_OP_EQ_uxn_opcodes_h_l2264_c11_d586_return_output);

-- n16_MUX_uxn_opcodes_h_l2264_c7_1743
n16_MUX_uxn_opcodes_h_l2264_c7_1743 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2264_c7_1743_cond,
n16_MUX_uxn_opcodes_h_l2264_c7_1743_iftrue,
n16_MUX_uxn_opcodes_h_l2264_c7_1743_iffalse,
n16_MUX_uxn_opcodes_h_l2264_c7_1743_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_1743
result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_1743 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_1743_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_1743_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_1743_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_1743_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2264_c7_1743
result_u8_value_MUX_uxn_opcodes_h_l2264_c7_1743 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2264_c7_1743_cond,
result_u8_value_MUX_uxn_opcodes_h_l2264_c7_1743_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2264_c7_1743_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2264_c7_1743_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_1743
result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_1743 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_1743_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_1743_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_1743_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_1743_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_1743
result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_1743 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_1743_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_1743_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_1743_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_1743_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_1743
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_1743 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_1743_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_1743_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_1743_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_1743_return_output);

-- t8_MUX_uxn_opcodes_h_l2264_c7_1743
t8_MUX_uxn_opcodes_h_l2264_c7_1743 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2264_c7_1743_cond,
t8_MUX_uxn_opcodes_h_l2264_c7_1743_iftrue,
t8_MUX_uxn_opcodes_h_l2264_c7_1743_iffalse,
t8_MUX_uxn_opcodes_h_l2264_c7_1743_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2264_c7_1743
tmp16_MUX_uxn_opcodes_h_l2264_c7_1743 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2264_c7_1743_cond,
tmp16_MUX_uxn_opcodes_h_l2264_c7_1743_iftrue,
tmp16_MUX_uxn_opcodes_h_l2264_c7_1743_iffalse,
tmp16_MUX_uxn_opcodes_h_l2264_c7_1743_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b205
BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b205 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b205_left,
BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b205_right,
BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b205_return_output);

-- n16_MUX_uxn_opcodes_h_l2267_c7_207b
n16_MUX_uxn_opcodes_h_l2267_c7_207b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2267_c7_207b_cond,
n16_MUX_uxn_opcodes_h_l2267_c7_207b_iftrue,
n16_MUX_uxn_opcodes_h_l2267_c7_207b_iffalse,
n16_MUX_uxn_opcodes_h_l2267_c7_207b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_207b
result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_207b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_207b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_207b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_207b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_207b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2267_c7_207b
result_u8_value_MUX_uxn_opcodes_h_l2267_c7_207b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2267_c7_207b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2267_c7_207b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2267_c7_207b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2267_c7_207b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_207b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_207b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_207b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_207b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_207b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_207b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_207b
result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_207b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_207b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_207b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_207b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_207b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_207b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_207b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_207b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_207b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_207b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_207b_return_output);

-- t8_MUX_uxn_opcodes_h_l2267_c7_207b
t8_MUX_uxn_opcodes_h_l2267_c7_207b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2267_c7_207b_cond,
t8_MUX_uxn_opcodes_h_l2267_c7_207b_iftrue,
t8_MUX_uxn_opcodes_h_l2267_c7_207b_iffalse,
t8_MUX_uxn_opcodes_h_l2267_c7_207b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2267_c7_207b
tmp16_MUX_uxn_opcodes_h_l2267_c7_207b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2267_c7_207b_cond,
tmp16_MUX_uxn_opcodes_h_l2267_c7_207b_iftrue,
tmp16_MUX_uxn_opcodes_h_l2267_c7_207b_iffalse,
tmp16_MUX_uxn_opcodes_h_l2267_c7_207b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2271_c11_5db3
BIN_OP_EQ_uxn_opcodes_h_l2271_c11_5db3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2271_c11_5db3_left,
BIN_OP_EQ_uxn_opcodes_h_l2271_c11_5db3_right,
BIN_OP_EQ_uxn_opcodes_h_l2271_c11_5db3_return_output);

-- n16_MUX_uxn_opcodes_h_l2271_c7_bf9c
n16_MUX_uxn_opcodes_h_l2271_c7_bf9c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2271_c7_bf9c_cond,
n16_MUX_uxn_opcodes_h_l2271_c7_bf9c_iftrue,
n16_MUX_uxn_opcodes_h_l2271_c7_bf9c_iffalse,
n16_MUX_uxn_opcodes_h_l2271_c7_bf9c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_bf9c
result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_bf9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_bf9c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_bf9c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_bf9c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_bf9c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2271_c7_bf9c
result_u8_value_MUX_uxn_opcodes_h_l2271_c7_bf9c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2271_c7_bf9c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2271_c7_bf9c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2271_c7_bf9c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2271_c7_bf9c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_bf9c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_bf9c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_bf9c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_bf9c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_bf9c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_bf9c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_bf9c
result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_bf9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_bf9c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_bf9c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_bf9c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_bf9c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_bf9c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_bf9c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_bf9c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_bf9c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_bf9c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_bf9c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2271_c7_bf9c
tmp16_MUX_uxn_opcodes_h_l2271_c7_bf9c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2271_c7_bf9c_cond,
tmp16_MUX_uxn_opcodes_h_l2271_c7_bf9c_iftrue,
tmp16_MUX_uxn_opcodes_h_l2271_c7_bf9c_iffalse,
tmp16_MUX_uxn_opcodes_h_l2271_c7_bf9c_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2273_c3_bb9c
CONST_SL_8_uxn_opcodes_h_l2273_c3_bb9c : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2273_c3_bb9c_x,
CONST_SL_8_uxn_opcodes_h_l2273_c3_bb9c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2275_c11_c79d
BIN_OP_EQ_uxn_opcodes_h_l2275_c11_c79d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2275_c11_c79d_left,
BIN_OP_EQ_uxn_opcodes_h_l2275_c11_c79d_right,
BIN_OP_EQ_uxn_opcodes_h_l2275_c11_c79d_return_output);

-- n16_MUX_uxn_opcodes_h_l2275_c7_0e31
n16_MUX_uxn_opcodes_h_l2275_c7_0e31 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2275_c7_0e31_cond,
n16_MUX_uxn_opcodes_h_l2275_c7_0e31_iftrue,
n16_MUX_uxn_opcodes_h_l2275_c7_0e31_iffalse,
n16_MUX_uxn_opcodes_h_l2275_c7_0e31_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_0e31
result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_0e31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_0e31_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_0e31_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_0e31_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_0e31_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2275_c7_0e31
result_u8_value_MUX_uxn_opcodes_h_l2275_c7_0e31 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2275_c7_0e31_cond,
result_u8_value_MUX_uxn_opcodes_h_l2275_c7_0e31_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2275_c7_0e31_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2275_c7_0e31_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_0e31
result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_0e31 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_0e31_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_0e31_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_0e31_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_0e31_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_0e31
result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_0e31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_0e31_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_0e31_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_0e31_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_0e31_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_0e31
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_0e31 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_0e31_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_0e31_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_0e31_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_0e31_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2275_c7_0e31
tmp16_MUX_uxn_opcodes_h_l2275_c7_0e31 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2275_c7_0e31_cond,
tmp16_MUX_uxn_opcodes_h_l2275_c7_0e31_iftrue,
tmp16_MUX_uxn_opcodes_h_l2275_c7_0e31_iffalse,
tmp16_MUX_uxn_opcodes_h_l2275_c7_0e31_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2276_c3_5098
BIN_OP_OR_uxn_opcodes_h_l2276_c3_5098 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2276_c3_5098_left,
BIN_OP_OR_uxn_opcodes_h_l2276_c3_5098_right,
BIN_OP_OR_uxn_opcodes_h_l2276_c3_5098_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2277_c30_b132
sp_relative_shift_uxn_opcodes_h_l2277_c30_b132 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2277_c30_b132_ins,
sp_relative_shift_uxn_opcodes_h_l2277_c30_b132_x,
sp_relative_shift_uxn_opcodes_h_l2277_c30_b132_y,
sp_relative_shift_uxn_opcodes_h_l2277_c30_b132_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2278_c20_656f
BIN_OP_AND_uxn_opcodes_h_l2278_c20_656f : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2278_c20_656f_left,
BIN_OP_AND_uxn_opcodes_h_l2278_c20_656f_right,
BIN_OP_AND_uxn_opcodes_h_l2278_c20_656f_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l2278_c12_6a3e
BIN_OP_SR_uxn_opcodes_h_l2278_c12_6a3e : entity work.BIN_OP_SR_uint16_t_uint8_t_0CLK_295015b8 port map (
BIN_OP_SR_uxn_opcodes_h_l2278_c12_6a3e_left,
BIN_OP_SR_uxn_opcodes_h_l2278_c12_6a3e_right,
BIN_OP_SR_uxn_opcodes_h_l2278_c12_6a3e_return_output);

-- CONST_SR_4_uxn_opcodes_h_l2278_c36_d8e0
CONST_SR_4_uxn_opcodes_h_l2278_c36_d8e0 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l2278_c36_d8e0_x,
CONST_SR_4_uxn_opcodes_h_l2278_c36_d8e0_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l2278_c12_5d94
BIN_OP_SL_uxn_opcodes_h_l2278_c12_5d94 : entity work.BIN_OP_SL_uint16_t_uint8_t_0CLK_b6546dec port map (
BIN_OP_SL_uxn_opcodes_h_l2278_c12_5d94_left,
BIN_OP_SL_uxn_opcodes_h_l2278_c12_5d94_right,
BIN_OP_SL_uxn_opcodes_h_l2278_c12_5d94_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2283_c11_c3c5
BIN_OP_EQ_uxn_opcodes_h_l2283_c11_c3c5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2283_c11_c3c5_left,
BIN_OP_EQ_uxn_opcodes_h_l2283_c11_c3c5_right,
BIN_OP_EQ_uxn_opcodes_h_l2283_c11_c3c5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2283_c7_7e17
result_u8_value_MUX_uxn_opcodes_h_l2283_c7_7e17 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2283_c7_7e17_cond,
result_u8_value_MUX_uxn_opcodes_h_l2283_c7_7e17_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2283_c7_7e17_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2283_c7_7e17_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_7e17
result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_7e17 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_7e17_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_7e17_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_7e17_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_7e17_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_7e17
result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_7e17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_7e17_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_7e17_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_7e17_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_7e17_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_7e17
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_7e17 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_7e17_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_7e17_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_7e17_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_7e17_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2286_c31_da11
CONST_SR_8_uxn_opcodes_h_l2286_c31_da11 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2286_c31_da11_x,
CONST_SR_8_uxn_opcodes_h_l2286_c31_da11_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2251_c6_6c59_return_output,
 n16_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output,
 t8_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output,
 tmp16_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2264_c11_d586_return_output,
 n16_MUX_uxn_opcodes_h_l2264_c7_1743_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_1743_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2264_c7_1743_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_1743_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_1743_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_1743_return_output,
 t8_MUX_uxn_opcodes_h_l2264_c7_1743_return_output,
 tmp16_MUX_uxn_opcodes_h_l2264_c7_1743_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b205_return_output,
 n16_MUX_uxn_opcodes_h_l2267_c7_207b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_207b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2267_c7_207b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_207b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_207b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_207b_return_output,
 t8_MUX_uxn_opcodes_h_l2267_c7_207b_return_output,
 tmp16_MUX_uxn_opcodes_h_l2267_c7_207b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2271_c11_5db3_return_output,
 n16_MUX_uxn_opcodes_h_l2271_c7_bf9c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_bf9c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2271_c7_bf9c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_bf9c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_bf9c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_bf9c_return_output,
 tmp16_MUX_uxn_opcodes_h_l2271_c7_bf9c_return_output,
 CONST_SL_8_uxn_opcodes_h_l2273_c3_bb9c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2275_c11_c79d_return_output,
 n16_MUX_uxn_opcodes_h_l2275_c7_0e31_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_0e31_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2275_c7_0e31_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_0e31_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_0e31_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_0e31_return_output,
 tmp16_MUX_uxn_opcodes_h_l2275_c7_0e31_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2276_c3_5098_return_output,
 sp_relative_shift_uxn_opcodes_h_l2277_c30_b132_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2278_c20_656f_return_output,
 BIN_OP_SR_uxn_opcodes_h_l2278_c12_6a3e_return_output,
 CONST_SR_4_uxn_opcodes_h_l2278_c36_d8e0_return_output,
 BIN_OP_SL_uxn_opcodes_h_l2278_c12_5d94_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2283_c11_c3c5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2283_c7_7e17_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_7e17_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_7e17_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_7e17_return_output,
 CONST_SR_8_uxn_opcodes_h_l2286_c31_da11_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_6c59_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_6c59_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_6c59_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2264_c7_1743_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2251_c2_2eec_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2251_c2_2eec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_2eec_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_1743_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_2eec_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2251_c2_2eec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_2eec_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2251_c2_2eec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_2eec_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_1743_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_2eec_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2251_c2_2eec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_2eec_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2256_c3_26d6 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_1743_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_2eec_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_1743_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_2eec_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2261_c3_7874 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_1743_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_2eec_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2264_c7_1743_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2251_c2_2eec_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_1743_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_2eec_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_d586_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_d586_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_d586_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2264_c7_1743_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2264_c7_1743_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2267_c7_207b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2264_c7_1743_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_1743_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_1743_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_207b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_1743_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_1743_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_1743_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_207b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_1743_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_1743_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_1743_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_207b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_1743_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_1743_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_1743_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_207b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_1743_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_1743_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2265_c3_65ba : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_1743_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_207b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_1743_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2264_c7_1743_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2264_c7_1743_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2267_c7_207b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2264_c7_1743_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_1743_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_1743_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_207b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_1743_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b205_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b205_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b205_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2267_c7_207b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2267_c7_207b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2271_c7_bf9c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2267_c7_207b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_207b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_207b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_bf9c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_207b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_207b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_207b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_bf9c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_207b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_207b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_207b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_bf9c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_207b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_207b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_207b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_bf9c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_207b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_207b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2269_c3_6bb4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_207b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_bf9c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_207b_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2267_c7_207b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2267_c7_207b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2267_c7_207b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_207b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_207b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_bf9c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_207b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_5db3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_5db3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_5db3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2271_c7_bf9c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2271_c7_bf9c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2275_c7_0e31_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2271_c7_bf9c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_bf9c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_bf9c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_0e31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_bf9c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_bf9c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_bf9c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_0e31_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_bf9c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_bf9c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_bf9c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_0e31_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_bf9c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_bf9c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_bf9c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_0e31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_bf9c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_bf9c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_bf9c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_0e31_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_bf9c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_bf9c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_bf9c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_0e31_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_bf9c_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2273_c3_bb9c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2273_c3_bb9c_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_c79d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_c79d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_c79d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2275_c7_0e31_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2275_c7_0e31_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2275_c7_0e31_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_0e31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_0e31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_0e31_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_0e31_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_0e31_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_7e17_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_0e31_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_0e31_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_0e31_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_7e17_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_0e31_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_0e31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_0e31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_7e17_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_0e31_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_0e31_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2280_c3_5e28 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_0e31_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_7e17_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_0e31_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_0e31_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_0e31_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_0e31_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_5098_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_5098_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_5098_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_b132_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_b132_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_b132_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_b132_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_6a3e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_656f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_656f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_656f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_6a3e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_6a3e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_5d94_left : unsigned(15 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2278_c36_d8e0_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_5d94_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2278_c36_d8e0_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_5d94_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2281_c21_a162_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_c3c5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_c3c5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_c3c5_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_7e17_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_7e17_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_7e17_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_7e17_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2284_c3_e146 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_7e17_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_7e17_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_7e17_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_7e17_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_7e17_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_7e17_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2285_c3_c901 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_7e17_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_7e17_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2286_c31_da11_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2286_c31_da11_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2286_c21_ce3a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2271_l2267_l2264_l2251_l2283_DUPLICATE_9f48_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2271_l2264_l2275_l2267_DUPLICATE_e4f5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2271_l2264_l2267_l2283_DUPLICATE_8003_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2275_l2271_l2267_l2264_l2283_DUPLICATE_eb6a_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2276_l2272_DUPLICATE_4b7e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2271_l2283_DUPLICATE_cf41_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l2290_l2246_DUPLICATE_4eaa_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_7e17_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_b132_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2261_c3_7874 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2261_c3_7874;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2265_c3_65ba := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_1743_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2265_c3_65ba;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2280_c3_5e28 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_0e31_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2280_c3_5e28;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_6c59_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2269_c3_6bb4 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_207b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2269_c3_6bb4;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_656f_right := to_unsigned(15, 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_0e31_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b205_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_c3c5_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2285_c3_c901 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_7e17_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2285_c3_c901;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2284_c3_e146 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_7e17_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2284_c3_e146;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_d586_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_5db3_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_c79d_right := to_unsigned(4, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2256_c3_26d6 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2256_c3_26d6;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_b132_y := resize(to_signed(-1, 2), 4);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_b132_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_5098_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2264_c7_1743_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2267_c7_207b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2275_c7_0e31_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_6c59_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_d586_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b205_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_5db3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_c79d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_c3c5_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l2267_c7_207b_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_656f_left := t8;
     VAR_CONST_SR_4_uxn_opcodes_h_l2278_c36_d8e0_x := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2264_c7_1743_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2267_c7_207b_iffalse := t8;
     VAR_CONST_SR_8_uxn_opcodes_h_l2286_c31_da11_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_1743_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_207b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_bf9c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_0e31_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2251_c6_6c59] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2251_c6_6c59_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_6c59_left;
     BIN_OP_EQ_uxn_opcodes_h_l2251_c6_6c59_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_6c59_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_6c59_return_output := BIN_OP_EQ_uxn_opcodes_h_l2251_c6_6c59_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2276_l2272_DUPLICATE_4b7e LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2276_l2272_DUPLICATE_4b7e_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2271_l2264_l2275_l2267_DUPLICATE_e4f5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2271_l2264_l2275_l2267_DUPLICATE_e4f5_return_output := result.is_stack_write;

     -- sp_relative_shift[uxn_opcodes_h_l2277_c30_b132] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2277_c30_b132_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_b132_ins;
     sp_relative_shift_uxn_opcodes_h_l2277_c30_b132_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_b132_x;
     sp_relative_shift_uxn_opcodes_h_l2277_c30_b132_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_b132_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_b132_return_output := sp_relative_shift_uxn_opcodes_h_l2277_c30_b132_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2286_c31_da11] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2286_c31_da11_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2286_c31_da11_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2286_c31_da11_return_output := CONST_SR_8_uxn_opcodes_h_l2286_c31_da11_return_output;

     -- CONST_SR_4[uxn_opcodes_h_l2278_c36_d8e0] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l2278_c36_d8e0_x <= VAR_CONST_SR_4_uxn_opcodes_h_l2278_c36_d8e0_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l2278_c36_d8e0_return_output := CONST_SR_4_uxn_opcodes_h_l2278_c36_d8e0_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2251_c2_2eec] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2251_c2_2eec_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2271_l2267_l2264_l2251_l2283_DUPLICATE_9f48 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2271_l2267_l2264_l2251_l2283_DUPLICATE_9f48_return_output := result.u8_value;

     -- BIN_OP_AND[uxn_opcodes_h_l2278_c20_656f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2278_c20_656f_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_656f_left;
     BIN_OP_AND_uxn_opcodes_h_l2278_c20_656f_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_656f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_656f_return_output := BIN_OP_AND_uxn_opcodes_h_l2278_c20_656f_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2271_l2283_DUPLICATE_cf41 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2271_l2283_DUPLICATE_cf41_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2271_l2264_l2267_l2283_DUPLICATE_8003 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2271_l2264_l2267_l2283_DUPLICATE_8003_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2264_c11_d586] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2264_c11_d586_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_d586_left;
     BIN_OP_EQ_uxn_opcodes_h_l2264_c11_d586_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_d586_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_d586_return_output := BIN_OP_EQ_uxn_opcodes_h_l2264_c11_d586_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2251_c2_2eec] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2251_c2_2eec_return_output := result.is_ram_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2251_c2_2eec] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2251_c2_2eec_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2275_l2271_l2267_l2264_l2283_DUPLICATE_eb6a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2275_l2271_l2267_l2264_l2283_DUPLICATE_eb6a_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2283_c11_c3c5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2283_c11_c3c5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_c3c5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2283_c11_c3c5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_c3c5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_c3c5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2283_c11_c3c5_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2251_c2_2eec] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2251_c2_2eec_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l2275_c11_c79d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2275_c11_c79d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_c79d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2275_c11_c79d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_c79d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_c79d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2275_c11_c79d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2267_c11_b205] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b205_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b205_left;
     BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b205_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b205_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b205_return_output := BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b205_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2271_c11_5db3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2271_c11_5db3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_5db3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2271_c11_5db3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_5db3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_5db3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2271_c11_5db3_return_output;

     -- Submodule level 1
     VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_6a3e_right := VAR_BIN_OP_AND_uxn_opcodes_h_l2278_c20_656f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2251_c2_2eec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_6c59_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_2eec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_6c59_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_2eec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_6c59_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_2eec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_6c59_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_2eec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_6c59_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_2eec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_6c59_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_2eec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_6c59_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_2eec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_6c59_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_2eec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_6c59_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_2eec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_6c59_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2251_c2_2eec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_6c59_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_2eec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c6_6c59_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2264_c7_1743_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_d586_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_1743_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_d586_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_1743_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_d586_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_1743_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_d586_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_1743_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_d586_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_1743_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_d586_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2264_c7_1743_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_d586_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_1743_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2264_c11_d586_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2267_c7_207b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b205_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_207b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b205_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_207b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b205_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_207b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b205_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_207b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b205_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_207b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b205_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2267_c7_207b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b205_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_207b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_b205_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2271_c7_bf9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_5db3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_bf9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_5db3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_bf9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_5db3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_bf9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_5db3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_bf9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_5db3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_bf9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_5db3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_bf9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2271_c11_5db3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2275_c7_0e31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_c79d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_0e31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_c79d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_0e31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_c79d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_0e31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_c79d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_0e31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_c79d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_0e31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_c79d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_0e31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_c79d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_7e17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_c3c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_7e17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_c3c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_7e17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_c3c5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_7e17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_c3c5_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_5098_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2276_l2272_DUPLICATE_4b7e_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2273_c3_bb9c_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2276_l2272_DUPLICATE_4b7e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_1743_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2271_l2264_l2267_l2283_DUPLICATE_8003_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_207b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2271_l2264_l2267_l2283_DUPLICATE_8003_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_bf9c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2271_l2264_l2267_l2283_DUPLICATE_8003_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_7e17_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2271_l2264_l2267_l2283_DUPLICATE_8003_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_1743_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2275_l2271_l2267_l2264_l2283_DUPLICATE_eb6a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_207b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2275_l2271_l2267_l2264_l2283_DUPLICATE_eb6a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_bf9c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2275_l2271_l2267_l2264_l2283_DUPLICATE_eb6a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_0e31_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2275_l2271_l2267_l2264_l2283_DUPLICATE_eb6a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_7e17_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2275_l2271_l2267_l2264_l2283_DUPLICATE_eb6a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_1743_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2271_l2264_l2275_l2267_DUPLICATE_e4f5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_207b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2271_l2264_l2275_l2267_DUPLICATE_e4f5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_bf9c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2271_l2264_l2275_l2267_DUPLICATE_e4f5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_0e31_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2271_l2264_l2275_l2267_DUPLICATE_e4f5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_bf9c_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2271_l2283_DUPLICATE_cf41_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_7e17_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2271_l2283_DUPLICATE_cf41_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2271_l2267_l2264_l2251_l2283_DUPLICATE_9f48_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_1743_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2271_l2267_l2264_l2251_l2283_DUPLICATE_9f48_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_207b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2271_l2267_l2264_l2251_l2283_DUPLICATE_9f48_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_bf9c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2271_l2267_l2264_l2251_l2283_DUPLICATE_9f48_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_7e17_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2271_l2267_l2264_l2251_l2283_DUPLICATE_9f48_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_5d94_right := VAR_CONST_SR_4_uxn_opcodes_h_l2278_c36_d8e0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2251_c2_2eec_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2251_c2_2eec_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2251_c2_2eec_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2251_c2_2eec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_0e31_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2277_c30_b132_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l2286_c21_ce3a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2286_c21_ce3a_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2286_c31_da11_return_output);

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2251_c2_2eec] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_2eec_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_2eec_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2273_c3_bb9c] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2273_c3_bb9c_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2273_c3_bb9c_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2273_c3_bb9c_return_output := CONST_SL_8_uxn_opcodes_h_l2273_c3_bb9c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2251_c2_2eec] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_2eec_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_2eec_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2251_c2_2eec] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_2eec_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_2eec_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2276_c3_5098] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2276_c3_5098_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_5098_left;
     BIN_OP_OR_uxn_opcodes_h_l2276_c3_5098_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_5098_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_5098_return_output := BIN_OP_OR_uxn_opcodes_h_l2276_c3_5098_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2283_c7_7e17] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_7e17_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_7e17_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_7e17_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_7e17_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_7e17_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_7e17_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_7e17_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_7e17_return_output;

     -- t8_MUX[uxn_opcodes_h_l2267_c7_207b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2267_c7_207b_cond <= VAR_t8_MUX_uxn_opcodes_h_l2267_c7_207b_cond;
     t8_MUX_uxn_opcodes_h_l2267_c7_207b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2267_c7_207b_iftrue;
     t8_MUX_uxn_opcodes_h_l2267_c7_207b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2267_c7_207b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2267_c7_207b_return_output := t8_MUX_uxn_opcodes_h_l2267_c7_207b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2283_c7_7e17] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_7e17_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_7e17_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_7e17_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_7e17_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_7e17_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_7e17_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_7e17_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_7e17_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2283_c7_7e17] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_7e17_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_7e17_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_7e17_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_7e17_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_7e17_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_7e17_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_7e17_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_7e17_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2275_c7_0e31] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_0e31_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_0e31_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_0e31_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_0e31_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_0e31_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_0e31_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_0e31_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_0e31_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2251_c2_2eec] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_2eec_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_2eec_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output;

     -- Submodule level 2
     VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_6a3e_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_5098_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2275_c7_0e31_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2276_c3_5098_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_7e17_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2286_c21_ce3a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2271_c7_bf9c_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2273_c3_bb9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_0e31_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_7e17_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_bf9c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_0e31_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_0e31_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_7e17_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_0e31_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_7e17_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2264_c7_1743_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2267_c7_207b_return_output;
     -- n16_MUX[uxn_opcodes_h_l2275_c7_0e31] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2275_c7_0e31_cond <= VAR_n16_MUX_uxn_opcodes_h_l2275_c7_0e31_cond;
     n16_MUX_uxn_opcodes_h_l2275_c7_0e31_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2275_c7_0e31_iftrue;
     n16_MUX_uxn_opcodes_h_l2275_c7_0e31_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2275_c7_0e31_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2275_c7_0e31_return_output := n16_MUX_uxn_opcodes_h_l2275_c7_0e31_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2275_c7_0e31] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_0e31_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_0e31_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_0e31_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_0e31_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_0e31_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_0e31_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_0e31_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_0e31_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2275_c7_0e31] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_0e31_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_0e31_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_0e31_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_0e31_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_0e31_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_0e31_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_0e31_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_0e31_return_output;

     -- BIN_OP_SR[uxn_opcodes_h_l2278_c12_6a3e] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l2278_c12_6a3e_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_6a3e_left;
     BIN_OP_SR_uxn_opcodes_h_l2278_c12_6a3e_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_6a3e_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_6a3e_return_output := BIN_OP_SR_uxn_opcodes_h_l2278_c12_6a3e_return_output;

     -- t8_MUX[uxn_opcodes_h_l2264_c7_1743] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2264_c7_1743_cond <= VAR_t8_MUX_uxn_opcodes_h_l2264_c7_1743_cond;
     t8_MUX_uxn_opcodes_h_l2264_c7_1743_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2264_c7_1743_iftrue;
     t8_MUX_uxn_opcodes_h_l2264_c7_1743_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2264_c7_1743_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2264_c7_1743_return_output := t8_MUX_uxn_opcodes_h_l2264_c7_1743_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2275_c7_0e31] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_0e31_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_0e31_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_0e31_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_0e31_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_0e31_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_0e31_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_0e31_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_0e31_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2283_c7_7e17] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2283_c7_7e17_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_7e17_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2283_c7_7e17_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_7e17_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2283_c7_7e17_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_7e17_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_7e17_return_output := result_u8_value_MUX_uxn_opcodes_h_l2283_c7_7e17_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2271_c7_bf9c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_bf9c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_bf9c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_bf9c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_bf9c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_bf9c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_bf9c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_bf9c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_bf9c_return_output;

     -- Submodule level 3
     VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_5d94_left := VAR_BIN_OP_SR_uxn_opcodes_h_l2278_c12_6a3e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2271_c7_bf9c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2275_c7_0e31_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_bf9c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_0e31_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_207b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2271_c7_bf9c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_bf9c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_0e31_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_bf9c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_0e31_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_0e31_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_7e17_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2264_c7_1743_return_output;
     -- BIN_OP_SL[uxn_opcodes_h_l2278_c12_5d94] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l2278_c12_5d94_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_5d94_left;
     BIN_OP_SL_uxn_opcodes_h_l2278_c12_5d94_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_5d94_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_5d94_return_output := BIN_OP_SL_uxn_opcodes_h_l2278_c12_5d94_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2271_c7_bf9c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_bf9c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_bf9c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_bf9c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_bf9c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_bf9c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_bf9c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_bf9c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_bf9c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2271_c7_bf9c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2271_c7_bf9c_cond <= VAR_n16_MUX_uxn_opcodes_h_l2271_c7_bf9c_cond;
     n16_MUX_uxn_opcodes_h_l2271_c7_bf9c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2271_c7_bf9c_iftrue;
     n16_MUX_uxn_opcodes_h_l2271_c7_bf9c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2271_c7_bf9c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2271_c7_bf9c_return_output := n16_MUX_uxn_opcodes_h_l2271_c7_bf9c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2271_c7_bf9c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_bf9c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_bf9c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_bf9c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_bf9c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_bf9c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_bf9c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_bf9c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_bf9c_return_output;

     -- t8_MUX[uxn_opcodes_h_l2251_c2_2eec] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2251_c2_2eec_cond <= VAR_t8_MUX_uxn_opcodes_h_l2251_c2_2eec_cond;
     t8_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue;
     t8_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output := t8_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2271_c7_bf9c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_bf9c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_bf9c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_bf9c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_bf9c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_bf9c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_bf9c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_bf9c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_bf9c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2267_c7_207b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_207b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_207b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_207b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_207b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_207b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_207b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_207b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_207b_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_0e31_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_5d94_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2267_c7_207b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2271_c7_bf9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_207b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2271_c7_bf9c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_1743_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_207b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_207b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2271_c7_bf9c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_207b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2271_c7_bf9c_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2267_c7_207b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_207b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_207b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_207b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_207b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_207b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_207b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_207b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_207b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2267_c7_207b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_207b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_207b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_207b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_207b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_207b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_207b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_207b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_207b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2275_c7_0e31] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2275_c7_0e31_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_0e31_cond;
     tmp16_MUX_uxn_opcodes_h_l2275_c7_0e31_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_0e31_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2275_c7_0e31_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_0e31_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_0e31_return_output := tmp16_MUX_uxn_opcodes_h_l2275_c7_0e31_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2264_c7_1743] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_1743_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_1743_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_1743_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_1743_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_1743_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_1743_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_1743_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_1743_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2281_c21_a162] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2281_c21_a162_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_SL_uxn_opcodes_h_l2278_c12_5d94_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2267_c7_207b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_207b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_207b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_207b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_207b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_207b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_207b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_207b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_207b_return_output;

     -- n16_MUX[uxn_opcodes_h_l2267_c7_207b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2267_c7_207b_cond <= VAR_n16_MUX_uxn_opcodes_h_l2267_c7_207b_cond;
     n16_MUX_uxn_opcodes_h_l2267_c7_207b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2267_c7_207b_iftrue;
     n16_MUX_uxn_opcodes_h_l2267_c7_207b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2267_c7_207b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2267_c7_207b_return_output := n16_MUX_uxn_opcodes_h_l2267_c7_207b_return_output;

     -- Submodule level 5
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_0e31_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2281_c21_a162_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2264_c7_1743_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2267_c7_207b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_1743_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_207b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2264_c7_1743_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_1743_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_207b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_1743_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_207b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_bf9c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_0e31_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2264_c7_1743] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_1743_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_1743_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_1743_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_1743_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_1743_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_1743_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_1743_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_1743_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2271_c7_bf9c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2271_c7_bf9c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_bf9c_cond;
     tmp16_MUX_uxn_opcodes_h_l2271_c7_bf9c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_bf9c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2271_c7_bf9c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_bf9c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_bf9c_return_output := tmp16_MUX_uxn_opcodes_h_l2271_c7_bf9c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2264_c7_1743] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_1743_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_1743_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_1743_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_1743_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_1743_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_1743_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_1743_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_1743_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2251_c2_2eec] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_2eec_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_2eec_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2275_c7_0e31] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2275_c7_0e31_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_0e31_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2275_c7_0e31_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_0e31_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2275_c7_0e31_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_0e31_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_0e31_return_output := result_u8_value_MUX_uxn_opcodes_h_l2275_c7_0e31_return_output;

     -- n16_MUX[uxn_opcodes_h_l2264_c7_1743] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2264_c7_1743_cond <= VAR_n16_MUX_uxn_opcodes_h_l2264_c7_1743_cond;
     n16_MUX_uxn_opcodes_h_l2264_c7_1743_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2264_c7_1743_iftrue;
     n16_MUX_uxn_opcodes_h_l2264_c7_1743_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2264_c7_1743_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2264_c7_1743_return_output := n16_MUX_uxn_opcodes_h_l2264_c7_1743_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2264_c7_1743] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_1743_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_1743_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_1743_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_1743_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_1743_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_1743_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_1743_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_1743_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2264_c7_1743_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2264_c7_1743_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2264_c7_1743_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2264_c7_1743_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_bf9c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2275_c7_0e31_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_207b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2271_c7_bf9c_return_output;
     -- n16_MUX[uxn_opcodes_h_l2251_c2_2eec] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2251_c2_2eec_cond <= VAR_n16_MUX_uxn_opcodes_h_l2251_c2_2eec_cond;
     n16_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue;
     n16_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output := n16_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2251_c2_2eec] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_2eec_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_2eec_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2267_c7_207b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2267_c7_207b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_207b_cond;
     tmp16_MUX_uxn_opcodes_h_l2267_c7_207b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_207b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2267_c7_207b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_207b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_207b_return_output := tmp16_MUX_uxn_opcodes_h_l2267_c7_207b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2251_c2_2eec] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_2eec_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_2eec_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2251_c2_2eec] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_2eec_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_2eec_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2271_c7_bf9c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2271_c7_bf9c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_bf9c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2271_c7_bf9c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_bf9c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2271_c7_bf9c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_bf9c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_bf9c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2271_c7_bf9c_return_output;

     -- Submodule level 7
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_207b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2271_c7_bf9c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_1743_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_207b_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2267_c7_207b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2267_c7_207b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_207b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2267_c7_207b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_207b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2267_c7_207b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_207b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_207b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2267_c7_207b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2264_c7_1743] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2264_c7_1743_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_1743_cond;
     tmp16_MUX_uxn_opcodes_h_l2264_c7_1743_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_1743_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2264_c7_1743_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_1743_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_1743_return_output := tmp16_MUX_uxn_opcodes_h_l2264_c7_1743_return_output;

     -- Submodule level 8
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_1743_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2267_c7_207b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2264_c7_1743_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2264_c7_1743] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2264_c7_1743_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_1743_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2264_c7_1743_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_1743_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2264_c7_1743_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_1743_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_1743_return_output := result_u8_value_MUX_uxn_opcodes_h_l2264_c7_1743_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2251_c2_2eec] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2251_c2_2eec_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_2eec_cond;
     tmp16_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output := tmp16_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2264_c7_1743_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2251_c2_2eec] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2251_c2_2eec_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_2eec_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_2eec_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_2eec_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output := result_u8_value_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l2290_l2246_DUPLICATE_4eaa LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l2290_l2246_DUPLICATE_4eaa_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c2_2eec_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l2290_l2246_DUPLICATE_4eaa_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l2290_l2246_DUPLICATE_4eaa_return_output;
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
