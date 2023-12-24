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
-- BIN_OP_EQ[uxn_opcodes_h_l2268_c6_ff7a]
signal BIN_OP_EQ_uxn_opcodes_h_l2268_c6_ff7a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2268_c6_ff7a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2268_c6_ff7a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2268_c2_c9e8]
signal n16_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2268_c2_c9e8]
signal tmp16_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l2268_c2_c9e8]
signal t8_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2268_c2_c9e8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2268_c2_c9e8]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2268_c2_c9e8]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2268_c2_c9e8]
signal result_u8_value_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2268_c2_c9e8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2268_c2_c9e8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2268_c2_c9e8]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2268_c2_c9e8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2268_c2_c9e8]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2281_c11_3940]
signal BIN_OP_EQ_uxn_opcodes_h_l2281_c11_3940_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2281_c11_3940_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2281_c11_3940_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2281_c7_0d7b]
signal n16_MUX_uxn_opcodes_h_l2281_c7_0d7b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2281_c7_0d7b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2281_c7_0d7b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2281_c7_0d7b]
signal tmp16_MUX_uxn_opcodes_h_l2281_c7_0d7b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2281_c7_0d7b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2281_c7_0d7b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l2281_c7_0d7b]
signal t8_MUX_uxn_opcodes_h_l2281_c7_0d7b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2281_c7_0d7b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2281_c7_0d7b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2281_c7_0d7b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c7_0d7b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c7_0d7b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c7_0d7b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2281_c7_0d7b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c7_0d7b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c7_0d7b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c7_0d7b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2281_c7_0d7b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2281_c7_0d7b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2281_c7_0d7b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2281_c7_0d7b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2281_c7_0d7b]
signal result_u8_value_MUX_uxn_opcodes_h_l2281_c7_0d7b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2281_c7_0d7b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2281_c7_0d7b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2281_c7_0d7b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2281_c7_0d7b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2281_c7_0d7b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2281_c7_0d7b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2284_c11_40c9]
signal BIN_OP_EQ_uxn_opcodes_h_l2284_c11_40c9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2284_c11_40c9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2284_c11_40c9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2284_c7_67dc]
signal n16_MUX_uxn_opcodes_h_l2284_c7_67dc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2284_c7_67dc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2284_c7_67dc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2284_c7_67dc]
signal tmp16_MUX_uxn_opcodes_h_l2284_c7_67dc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2284_c7_67dc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2284_c7_67dc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l2284_c7_67dc]
signal t8_MUX_uxn_opcodes_h_l2284_c7_67dc_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2284_c7_67dc_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2284_c7_67dc_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2284_c7_67dc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_67dc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_67dc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_67dc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2284_c7_67dc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_67dc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_67dc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_67dc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2284_c7_67dc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_67dc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_67dc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_67dc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2284_c7_67dc]
signal result_u8_value_MUX_uxn_opcodes_h_l2284_c7_67dc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2284_c7_67dc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2284_c7_67dc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2284_c7_67dc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_67dc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_67dc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_67dc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2288_c11_422a]
signal BIN_OP_EQ_uxn_opcodes_h_l2288_c11_422a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2288_c11_422a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2288_c11_422a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2288_c7_1413]
signal n16_MUX_uxn_opcodes_h_l2288_c7_1413_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2288_c7_1413_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2288_c7_1413_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2288_c7_1413_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2288_c7_1413]
signal tmp16_MUX_uxn_opcodes_h_l2288_c7_1413_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2288_c7_1413_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2288_c7_1413_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2288_c7_1413_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2288_c7_1413]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_1413_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_1413_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_1413_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_1413_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2288_c7_1413]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_1413_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_1413_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_1413_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_1413_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2288_c7_1413]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_1413_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_1413_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_1413_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_1413_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2288_c7_1413]
signal result_u8_value_MUX_uxn_opcodes_h_l2288_c7_1413_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2288_c7_1413_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2288_c7_1413_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2288_c7_1413_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2288_c7_1413]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_1413_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_1413_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_1413_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_1413_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2290_c3_6234]
signal CONST_SL_8_uxn_opcodes_h_l2290_c3_6234_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2290_c3_6234_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2292_c11_2d7c]
signal BIN_OP_EQ_uxn_opcodes_h_l2292_c11_2d7c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2292_c11_2d7c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2292_c11_2d7c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2292_c7_b1d3]
signal n16_MUX_uxn_opcodes_h_l2292_c7_b1d3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2292_c7_b1d3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2292_c7_b1d3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2292_c7_b1d3_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2292_c7_b1d3]
signal tmp16_MUX_uxn_opcodes_h_l2292_c7_b1d3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2292_c7_b1d3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2292_c7_b1d3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2292_c7_b1d3_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2292_c7_b1d3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_b1d3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_b1d3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_b1d3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_b1d3_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2292_c7_b1d3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_b1d3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_b1d3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_b1d3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_b1d3_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2292_c7_b1d3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_b1d3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_b1d3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_b1d3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_b1d3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2292_c7_b1d3]
signal result_u8_value_MUX_uxn_opcodes_h_l2292_c7_b1d3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2292_c7_b1d3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2292_c7_b1d3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2292_c7_b1d3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2292_c7_b1d3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_b1d3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_b1d3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_b1d3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_b1d3_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2293_c3_eeb3]
signal BIN_OP_OR_uxn_opcodes_h_l2293_c3_eeb3_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2293_c3_eeb3_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2293_c3_eeb3_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2294_c30_9cf4]
signal sp_relative_shift_uxn_opcodes_h_l2294_c30_9cf4_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2294_c30_9cf4_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2294_c30_9cf4_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2294_c30_9cf4_return_output : signed(3 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2295_c20_4314]
signal BIN_OP_AND_uxn_opcodes_h_l2295_c20_4314_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2295_c20_4314_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2295_c20_4314_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l2295_c12_bd6d]
signal BIN_OP_SR_uxn_opcodes_h_l2295_c12_bd6d_left : unsigned(15 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2295_c12_bd6d_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2295_c12_bd6d_return_output : unsigned(15 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l2295_c36_984b]
signal CONST_SR_4_uxn_opcodes_h_l2295_c36_984b_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l2295_c36_984b_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l2295_c12_f23a]
signal BIN_OP_SL_uxn_opcodes_h_l2295_c12_f23a_left : unsigned(15 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2295_c12_f23a_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2295_c12_f23a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2300_c11_5282]
signal BIN_OP_EQ_uxn_opcodes_h_l2300_c11_5282_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2300_c11_5282_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2300_c11_5282_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2300_c7_3cca]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2300_c7_3cca_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2300_c7_3cca_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2300_c7_3cca_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2300_c7_3cca_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2300_c7_3cca]
signal result_u8_value_MUX_uxn_opcodes_h_l2300_c7_3cca_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2300_c7_3cca_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2300_c7_3cca_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2300_c7_3cca_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2300_c7_3cca]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2300_c7_3cca_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2300_c7_3cca_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2300_c7_3cca_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2300_c7_3cca_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2300_c7_3cca]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2300_c7_3cca_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2300_c7_3cca_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2300_c7_3cca_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2300_c7_3cca_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2303_c31_f117]
signal CONST_SR_8_uxn_opcodes_h_l2303_c31_f117_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2303_c31_f117_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2268_c6_ff7a
BIN_OP_EQ_uxn_opcodes_h_l2268_c6_ff7a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2268_c6_ff7a_left,
BIN_OP_EQ_uxn_opcodes_h_l2268_c6_ff7a_right,
BIN_OP_EQ_uxn_opcodes_h_l2268_c6_ff7a_return_output);

-- n16_MUX_uxn_opcodes_h_l2268_c2_c9e8
n16_MUX_uxn_opcodes_h_l2268_c2_c9e8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond,
n16_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue,
n16_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse,
n16_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2268_c2_c9e8
tmp16_MUX_uxn_opcodes_h_l2268_c2_c9e8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond,
tmp16_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue,
tmp16_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse,
tmp16_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output);

-- t8_MUX_uxn_opcodes_h_l2268_c2_c9e8
t8_MUX_uxn_opcodes_h_l2268_c2_c9e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond,
t8_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue,
t8_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse,
t8_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2268_c2_c9e8
result_is_stack_write_MUX_uxn_opcodes_h_l2268_c2_c9e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2268_c2_c9e8
result_is_vram_write_MUX_uxn_opcodes_h_l2268_c2_c9e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2268_c2_c9e8
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2268_c2_c9e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2268_c2_c9e8
result_u8_value_MUX_uxn_opcodes_h_l2268_c2_c9e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond,
result_u8_value_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2268_c2_c9e8
result_is_opc_done_MUX_uxn_opcodes_h_l2268_c2_c9e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c2_c9e8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c2_c9e8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2268_c2_c9e8
result_is_pc_updated_MUX_uxn_opcodes_h_l2268_c2_c9e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c2_c9e8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c2_c9e8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2268_c2_c9e8
result_is_ram_write_MUX_uxn_opcodes_h_l2268_c2_c9e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2281_c11_3940
BIN_OP_EQ_uxn_opcodes_h_l2281_c11_3940 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2281_c11_3940_left,
BIN_OP_EQ_uxn_opcodes_h_l2281_c11_3940_right,
BIN_OP_EQ_uxn_opcodes_h_l2281_c11_3940_return_output);

-- n16_MUX_uxn_opcodes_h_l2281_c7_0d7b
n16_MUX_uxn_opcodes_h_l2281_c7_0d7b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2281_c7_0d7b_cond,
n16_MUX_uxn_opcodes_h_l2281_c7_0d7b_iftrue,
n16_MUX_uxn_opcodes_h_l2281_c7_0d7b_iffalse,
n16_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2281_c7_0d7b
tmp16_MUX_uxn_opcodes_h_l2281_c7_0d7b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2281_c7_0d7b_cond,
tmp16_MUX_uxn_opcodes_h_l2281_c7_0d7b_iftrue,
tmp16_MUX_uxn_opcodes_h_l2281_c7_0d7b_iffalse,
tmp16_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output);

-- t8_MUX_uxn_opcodes_h_l2281_c7_0d7b
t8_MUX_uxn_opcodes_h_l2281_c7_0d7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2281_c7_0d7b_cond,
t8_MUX_uxn_opcodes_h_l2281_c7_0d7b_iftrue,
t8_MUX_uxn_opcodes_h_l2281_c7_0d7b_iffalse,
t8_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c7_0d7b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c7_0d7b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c7_0d7b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c7_0d7b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c7_0d7b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c7_0d7b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c7_0d7b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c7_0d7b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c7_0d7b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c7_0d7b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2281_c7_0d7b
result_is_stack_write_MUX_uxn_opcodes_h_l2281_c7_0d7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2281_c7_0d7b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2281_c7_0d7b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2281_c7_0d7b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2281_c7_0d7b
result_u8_value_MUX_uxn_opcodes_h_l2281_c7_0d7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2281_c7_0d7b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2281_c7_0d7b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2281_c7_0d7b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2281_c7_0d7b
result_is_opc_done_MUX_uxn_opcodes_h_l2281_c7_0d7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2281_c7_0d7b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2281_c7_0d7b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2281_c7_0d7b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2284_c11_40c9
BIN_OP_EQ_uxn_opcodes_h_l2284_c11_40c9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2284_c11_40c9_left,
BIN_OP_EQ_uxn_opcodes_h_l2284_c11_40c9_right,
BIN_OP_EQ_uxn_opcodes_h_l2284_c11_40c9_return_output);

-- n16_MUX_uxn_opcodes_h_l2284_c7_67dc
n16_MUX_uxn_opcodes_h_l2284_c7_67dc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2284_c7_67dc_cond,
n16_MUX_uxn_opcodes_h_l2284_c7_67dc_iftrue,
n16_MUX_uxn_opcodes_h_l2284_c7_67dc_iffalse,
n16_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2284_c7_67dc
tmp16_MUX_uxn_opcodes_h_l2284_c7_67dc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2284_c7_67dc_cond,
tmp16_MUX_uxn_opcodes_h_l2284_c7_67dc_iftrue,
tmp16_MUX_uxn_opcodes_h_l2284_c7_67dc_iffalse,
tmp16_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output);

-- t8_MUX_uxn_opcodes_h_l2284_c7_67dc
t8_MUX_uxn_opcodes_h_l2284_c7_67dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2284_c7_67dc_cond,
t8_MUX_uxn_opcodes_h_l2284_c7_67dc_iftrue,
t8_MUX_uxn_opcodes_h_l2284_c7_67dc_iffalse,
t8_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_67dc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_67dc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_67dc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_67dc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_67dc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_67dc
result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_67dc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_67dc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_67dc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_67dc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_67dc
result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_67dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_67dc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_67dc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_67dc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2284_c7_67dc
result_u8_value_MUX_uxn_opcodes_h_l2284_c7_67dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2284_c7_67dc_cond,
result_u8_value_MUX_uxn_opcodes_h_l2284_c7_67dc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2284_c7_67dc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_67dc
result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_67dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_67dc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_67dc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_67dc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2288_c11_422a
BIN_OP_EQ_uxn_opcodes_h_l2288_c11_422a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2288_c11_422a_left,
BIN_OP_EQ_uxn_opcodes_h_l2288_c11_422a_right,
BIN_OP_EQ_uxn_opcodes_h_l2288_c11_422a_return_output);

-- n16_MUX_uxn_opcodes_h_l2288_c7_1413
n16_MUX_uxn_opcodes_h_l2288_c7_1413 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2288_c7_1413_cond,
n16_MUX_uxn_opcodes_h_l2288_c7_1413_iftrue,
n16_MUX_uxn_opcodes_h_l2288_c7_1413_iffalse,
n16_MUX_uxn_opcodes_h_l2288_c7_1413_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2288_c7_1413
tmp16_MUX_uxn_opcodes_h_l2288_c7_1413 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2288_c7_1413_cond,
tmp16_MUX_uxn_opcodes_h_l2288_c7_1413_iftrue,
tmp16_MUX_uxn_opcodes_h_l2288_c7_1413_iffalse,
tmp16_MUX_uxn_opcodes_h_l2288_c7_1413_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_1413
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_1413 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_1413_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_1413_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_1413_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_1413_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_1413
result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_1413 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_1413_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_1413_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_1413_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_1413_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_1413
result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_1413 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_1413_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_1413_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_1413_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_1413_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2288_c7_1413
result_u8_value_MUX_uxn_opcodes_h_l2288_c7_1413 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2288_c7_1413_cond,
result_u8_value_MUX_uxn_opcodes_h_l2288_c7_1413_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2288_c7_1413_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2288_c7_1413_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_1413
result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_1413 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_1413_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_1413_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_1413_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_1413_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2290_c3_6234
CONST_SL_8_uxn_opcodes_h_l2290_c3_6234 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2290_c3_6234_x,
CONST_SL_8_uxn_opcodes_h_l2290_c3_6234_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2292_c11_2d7c
BIN_OP_EQ_uxn_opcodes_h_l2292_c11_2d7c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2292_c11_2d7c_left,
BIN_OP_EQ_uxn_opcodes_h_l2292_c11_2d7c_right,
BIN_OP_EQ_uxn_opcodes_h_l2292_c11_2d7c_return_output);

-- n16_MUX_uxn_opcodes_h_l2292_c7_b1d3
n16_MUX_uxn_opcodes_h_l2292_c7_b1d3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2292_c7_b1d3_cond,
n16_MUX_uxn_opcodes_h_l2292_c7_b1d3_iftrue,
n16_MUX_uxn_opcodes_h_l2292_c7_b1d3_iffalse,
n16_MUX_uxn_opcodes_h_l2292_c7_b1d3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2292_c7_b1d3
tmp16_MUX_uxn_opcodes_h_l2292_c7_b1d3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2292_c7_b1d3_cond,
tmp16_MUX_uxn_opcodes_h_l2292_c7_b1d3_iftrue,
tmp16_MUX_uxn_opcodes_h_l2292_c7_b1d3_iffalse,
tmp16_MUX_uxn_opcodes_h_l2292_c7_b1d3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_b1d3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_b1d3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_b1d3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_b1d3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_b1d3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_b1d3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_b1d3
result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_b1d3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_b1d3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_b1d3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_b1d3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_b1d3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_b1d3
result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_b1d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_b1d3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_b1d3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_b1d3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_b1d3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2292_c7_b1d3
result_u8_value_MUX_uxn_opcodes_h_l2292_c7_b1d3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2292_c7_b1d3_cond,
result_u8_value_MUX_uxn_opcodes_h_l2292_c7_b1d3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2292_c7_b1d3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2292_c7_b1d3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_b1d3
result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_b1d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_b1d3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_b1d3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_b1d3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_b1d3_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2293_c3_eeb3
BIN_OP_OR_uxn_opcodes_h_l2293_c3_eeb3 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2293_c3_eeb3_left,
BIN_OP_OR_uxn_opcodes_h_l2293_c3_eeb3_right,
BIN_OP_OR_uxn_opcodes_h_l2293_c3_eeb3_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2294_c30_9cf4
sp_relative_shift_uxn_opcodes_h_l2294_c30_9cf4 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2294_c30_9cf4_ins,
sp_relative_shift_uxn_opcodes_h_l2294_c30_9cf4_x,
sp_relative_shift_uxn_opcodes_h_l2294_c30_9cf4_y,
sp_relative_shift_uxn_opcodes_h_l2294_c30_9cf4_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2295_c20_4314
BIN_OP_AND_uxn_opcodes_h_l2295_c20_4314 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2295_c20_4314_left,
BIN_OP_AND_uxn_opcodes_h_l2295_c20_4314_right,
BIN_OP_AND_uxn_opcodes_h_l2295_c20_4314_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l2295_c12_bd6d
BIN_OP_SR_uxn_opcodes_h_l2295_c12_bd6d : entity work.BIN_OP_SR_uint16_t_uint8_t_0CLK_295015b8 port map (
BIN_OP_SR_uxn_opcodes_h_l2295_c12_bd6d_left,
BIN_OP_SR_uxn_opcodes_h_l2295_c12_bd6d_right,
BIN_OP_SR_uxn_opcodes_h_l2295_c12_bd6d_return_output);

-- CONST_SR_4_uxn_opcodes_h_l2295_c36_984b
CONST_SR_4_uxn_opcodes_h_l2295_c36_984b : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l2295_c36_984b_x,
CONST_SR_4_uxn_opcodes_h_l2295_c36_984b_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l2295_c12_f23a
BIN_OP_SL_uxn_opcodes_h_l2295_c12_f23a : entity work.BIN_OP_SL_uint16_t_uint8_t_0CLK_b6546dec port map (
BIN_OP_SL_uxn_opcodes_h_l2295_c12_f23a_left,
BIN_OP_SL_uxn_opcodes_h_l2295_c12_f23a_right,
BIN_OP_SL_uxn_opcodes_h_l2295_c12_f23a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2300_c11_5282
BIN_OP_EQ_uxn_opcodes_h_l2300_c11_5282 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2300_c11_5282_left,
BIN_OP_EQ_uxn_opcodes_h_l2300_c11_5282_right,
BIN_OP_EQ_uxn_opcodes_h_l2300_c11_5282_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2300_c7_3cca
result_sp_relative_shift_MUX_uxn_opcodes_h_l2300_c7_3cca : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2300_c7_3cca_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2300_c7_3cca_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2300_c7_3cca_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2300_c7_3cca_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2300_c7_3cca
result_u8_value_MUX_uxn_opcodes_h_l2300_c7_3cca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2300_c7_3cca_cond,
result_u8_value_MUX_uxn_opcodes_h_l2300_c7_3cca_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2300_c7_3cca_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2300_c7_3cca_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2300_c7_3cca
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2300_c7_3cca : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2300_c7_3cca_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2300_c7_3cca_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2300_c7_3cca_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2300_c7_3cca_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2300_c7_3cca
result_is_opc_done_MUX_uxn_opcodes_h_l2300_c7_3cca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2300_c7_3cca_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2300_c7_3cca_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2300_c7_3cca_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2300_c7_3cca_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2303_c31_f117
CONST_SR_8_uxn_opcodes_h_l2303_c31_f117 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2303_c31_f117_x,
CONST_SR_8_uxn_opcodes_h_l2303_c31_f117_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2268_c6_ff7a_return_output,
 n16_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output,
 tmp16_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output,
 t8_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2281_c11_3940_return_output,
 n16_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output,
 tmp16_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output,
 t8_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2284_c11_40c9_return_output,
 n16_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output,
 tmp16_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output,
 t8_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2288_c11_422a_return_output,
 n16_MUX_uxn_opcodes_h_l2288_c7_1413_return_output,
 tmp16_MUX_uxn_opcodes_h_l2288_c7_1413_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_1413_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_1413_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_1413_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2288_c7_1413_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_1413_return_output,
 CONST_SL_8_uxn_opcodes_h_l2290_c3_6234_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2292_c11_2d7c_return_output,
 n16_MUX_uxn_opcodes_h_l2292_c7_b1d3_return_output,
 tmp16_MUX_uxn_opcodes_h_l2292_c7_b1d3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_b1d3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_b1d3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_b1d3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2292_c7_b1d3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_b1d3_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2293_c3_eeb3_return_output,
 sp_relative_shift_uxn_opcodes_h_l2294_c30_9cf4_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2295_c20_4314_return_output,
 BIN_OP_SR_uxn_opcodes_h_l2295_c12_bd6d_return_output,
 CONST_SR_4_uxn_opcodes_h_l2295_c36_984b_return_output,
 BIN_OP_SL_uxn_opcodes_h_l2295_c12_f23a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2300_c11_5282_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2300_c7_3cca_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2300_c7_3cca_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2300_c7_3cca_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2300_c7_3cca_return_output,
 CONST_SR_8_uxn_opcodes_h_l2303_c31_f117_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c6_ff7a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c6_ff7a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c6_ff7a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2268_c2_c9e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2268_c2_c9e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2273_c3_ed65 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2268_c2_c9e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2278_c3_6f67 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2268_c2_c9e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2281_c11_3940_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2281_c11_3940_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2281_c11_3940_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2281_c7_0d7b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2281_c7_0d7b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2281_c7_0d7b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2281_c7_0d7b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2281_c7_0d7b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2281_c7_0d7b_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2281_c7_0d7b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2281_c7_0d7b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2281_c7_0d7b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c7_0d7b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2282_c3_014d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c7_0d7b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c7_0d7b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c7_0d7b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c7_0d7b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c7_0d7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2281_c7_0d7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2281_c7_0d7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2281_c7_0d7b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2281_c7_0d7b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2281_c7_0d7b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2281_c7_0d7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2281_c7_0d7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2281_c7_0d7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2281_c7_0d7b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_40c9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_40c9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_40c9_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2284_c7_67dc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2284_c7_67dc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2288_c7_1413_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2284_c7_67dc_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2284_c7_67dc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2284_c7_67dc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2288_c7_1413_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2284_c7_67dc_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2284_c7_67dc_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2284_c7_67dc_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2284_c7_67dc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_67dc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2286_c3_54cf : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_67dc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_1413_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_67dc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_67dc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_67dc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_1413_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_67dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_67dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_67dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_1413_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_67dc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_67dc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_67dc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2288_c7_1413_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_67dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_67dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_67dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_1413_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_67dc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2288_c11_422a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2288_c11_422a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2288_c11_422a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2288_c7_1413_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2288_c7_1413_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2292_c7_b1d3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2288_c7_1413_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2288_c7_1413_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2288_c7_1413_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2292_c7_b1d3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2288_c7_1413_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_1413_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_1413_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_b1d3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_1413_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_1413_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_1413_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_b1d3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_1413_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_1413_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_1413_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_b1d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_1413_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2288_c7_1413_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2288_c7_1413_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2292_c7_b1d3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2288_c7_1413_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_1413_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_1413_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_b1d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_1413_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2290_c3_6234_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2290_c3_6234_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c11_2d7c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c11_2d7c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c11_2d7c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2292_c7_b1d3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2292_c7_b1d3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2292_c7_b1d3_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2292_c7_b1d3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2292_c7_b1d3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2292_c7_b1d3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_b1d3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2297_c3_d792 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_b1d3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2300_c7_3cca_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_b1d3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_b1d3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_b1d3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2300_c7_3cca_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_b1d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_b1d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_b1d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_b1d3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2292_c7_b1d3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2292_c7_b1d3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2300_c7_3cca_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2292_c7_b1d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_b1d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_b1d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2300_c7_3cca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_b1d3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2293_c3_eeb3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2293_c3_eeb3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2293_c3_eeb3_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2294_c30_9cf4_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2294_c30_9cf4_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2294_c30_9cf4_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2294_c30_9cf4_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2295_c12_bd6d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2295_c20_4314_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2295_c20_4314_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2295_c20_4314_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2295_c12_bd6d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2295_c12_bd6d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2295_c12_f23a_left : unsigned(15 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2295_c36_984b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2295_c12_f23a_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2295_c36_984b_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2295_c12_f23a_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2298_c21_0470_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2300_c11_5282_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2300_c11_5282_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2300_c11_5282_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2300_c7_3cca_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2301_c3_3337 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2300_c7_3cca_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2300_c7_3cca_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2300_c7_3cca_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2300_c7_3cca_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2300_c7_3cca_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2300_c7_3cca_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2302_c3_acd0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2300_c7_3cca_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2300_c7_3cca_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2300_c7_3cca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2300_c7_3cca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2300_c7_3cca_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2303_c31_f117_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2303_c31_f117_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2303_c21_3874_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2284_l2281_l2268_l2300_l2288_DUPLICATE_199a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2284_l2300_l2288_l2281_DUPLICATE_c4c8_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2284_l2288_l2281_l2292_DUPLICATE_b47b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2284_l2281_l2300_l2292_l2288_DUPLICATE_97a9_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2293_l2289_DUPLICATE_1483_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2300_l2288_DUPLICATE_94bc_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l2263_l2307_DUPLICATE_fb13_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2300_c7_3cca_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c6_ff7a_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_40c9_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c11_2d7c_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2286_c3_54cf := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_67dc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2286_c3_54cf;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_b1d3_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2278_c3_6f67 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2278_c3_6f67;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2281_c11_3940_right := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2295_c20_4314_right := to_unsigned(15, 8);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2288_c11_422a_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l2294_c30_9cf4_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2282_c3_014d := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c7_0d7b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2282_c3_014d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2302_c3_acd0 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2300_c7_3cca_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2302_c3_acd0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2300_c11_5282_right := to_unsigned(5, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2301_c3_3337 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2300_c7_3cca_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2301_c3_3337;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2297_c3_d792 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_b1d3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2297_c3_d792;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2294_c30_9cf4_y := resize(to_signed(-1, 2), 4);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2273_c3_ed65 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2273_c3_ed65;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2294_c30_9cf4_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2293_c3_eeb3_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2281_c7_0d7b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2284_c7_67dc_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2292_c7_b1d3_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c6_ff7a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2281_c11_3940_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_40c9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2288_c11_422a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c11_2d7c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2300_c11_5282_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l2284_c7_67dc_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2295_c20_4314_left := t8;
     VAR_CONST_SR_4_uxn_opcodes_h_l2295_c36_984b_x := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2281_c7_0d7b_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2284_c7_67dc_iffalse := t8;
     VAR_CONST_SR_8_uxn_opcodes_h_l2303_c31_f117_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2281_c7_0d7b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2284_c7_67dc_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2288_c7_1413_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2292_c7_b1d3_iffalse := tmp16;
     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2293_l2289_DUPLICATE_1483 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2293_l2289_DUPLICATE_1483_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2268_c6_ff7a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2268_c6_ff7a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c6_ff7a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2268_c6_ff7a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c6_ff7a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c6_ff7a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2268_c6_ff7a_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2300_l2288_DUPLICATE_94bc LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2300_l2288_DUPLICATE_94bc_return_output := result.stack_address_sp_offset;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2268_c2_c9e8] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2268_c2_c9e8_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2281_c11_3940] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2281_c11_3940_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2281_c11_3940_left;
     BIN_OP_EQ_uxn_opcodes_h_l2281_c11_3940_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2281_c11_3940_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2281_c11_3940_return_output := BIN_OP_EQ_uxn_opcodes_h_l2281_c11_3940_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2288_c11_422a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2288_c11_422a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2288_c11_422a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2288_c11_422a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2288_c11_422a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2288_c11_422a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2288_c11_422a_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2295_c20_4314] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2295_c20_4314_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2295_c20_4314_left;
     BIN_OP_AND_uxn_opcodes_h_l2295_c20_4314_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2295_c20_4314_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2295_c20_4314_return_output := BIN_OP_AND_uxn_opcodes_h_l2295_c20_4314_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2294_c30_9cf4] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2294_c30_9cf4_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2294_c30_9cf4_ins;
     sp_relative_shift_uxn_opcodes_h_l2294_c30_9cf4_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2294_c30_9cf4_x;
     sp_relative_shift_uxn_opcodes_h_l2294_c30_9cf4_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2294_c30_9cf4_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2294_c30_9cf4_return_output := sp_relative_shift_uxn_opcodes_h_l2294_c30_9cf4_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2284_l2300_l2288_l2281_DUPLICATE_c4c8 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2284_l2300_l2288_l2281_DUPLICATE_c4c8_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2300_c11_5282] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2300_c11_5282_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2300_c11_5282_left;
     BIN_OP_EQ_uxn_opcodes_h_l2300_c11_5282_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2300_c11_5282_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2300_c11_5282_return_output := BIN_OP_EQ_uxn_opcodes_h_l2300_c11_5282_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2268_c2_c9e8] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2268_c2_c9e8_return_output := result.is_vram_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2268_c2_c9e8] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2268_c2_c9e8_return_output := result.is_stack_index_flipped;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2268_c2_c9e8] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2268_c2_c9e8_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l2292_c11_2d7c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2292_c11_2d7c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c11_2d7c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2292_c11_2d7c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c11_2d7c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c11_2d7c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2292_c11_2d7c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2284_l2288_l2281_l2292_DUPLICATE_b47b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2284_l2288_l2281_l2292_DUPLICATE_b47b_return_output := result.is_stack_write;

     -- CONST_SR_4[uxn_opcodes_h_l2295_c36_984b] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l2295_c36_984b_x <= VAR_CONST_SR_4_uxn_opcodes_h_l2295_c36_984b_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l2295_c36_984b_return_output := CONST_SR_4_uxn_opcodes_h_l2295_c36_984b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2284_l2281_l2300_l2292_l2288_DUPLICATE_97a9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2284_l2281_l2300_l2292_l2288_DUPLICATE_97a9_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2284_c11_40c9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2284_c11_40c9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_40c9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2284_c11_40c9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_40c9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_40c9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2284_c11_40c9_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2303_c31_f117] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2303_c31_f117_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2303_c31_f117_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2303_c31_f117_return_output := CONST_SR_8_uxn_opcodes_h_l2303_c31_f117_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2284_l2281_l2268_l2300_l2288_DUPLICATE_199a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2284_l2281_l2268_l2300_l2288_DUPLICATE_199a_return_output := result.u8_value;

     -- Submodule level 1
     VAR_BIN_OP_SR_uxn_opcodes_h_l2295_c12_bd6d_right := VAR_BIN_OP_AND_uxn_opcodes_h_l2295_c20_4314_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c6_ff7a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c6_ff7a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c6_ff7a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c6_ff7a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c6_ff7a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c6_ff7a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c6_ff7a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c6_ff7a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c6_ff7a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c6_ff7a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c6_ff7a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c6_ff7a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2281_c7_0d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2281_c11_3940_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2281_c7_0d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2281_c11_3940_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2281_c7_0d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2281_c11_3940_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c7_0d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2281_c11_3940_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c7_0d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2281_c11_3940_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2281_c7_0d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2281_c11_3940_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2281_c7_0d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2281_c11_3940_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2281_c7_0d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2281_c11_3940_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2284_c7_67dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_40c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_67dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_40c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_67dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_40c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_67dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_40c9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_67dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_40c9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_67dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_40c9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2284_c7_67dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_40c9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2284_c7_67dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_40c9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2288_c7_1413_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2288_c11_422a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_1413_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2288_c11_422a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_1413_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2288_c11_422a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_1413_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2288_c11_422a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_1413_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2288_c11_422a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2288_c7_1413_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2288_c11_422a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2288_c7_1413_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2288_c11_422a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2292_c7_b1d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c11_2d7c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_b1d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c11_2d7c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_b1d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c11_2d7c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_b1d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c11_2d7c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_b1d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c11_2d7c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2292_c7_b1d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c11_2d7c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2292_c7_b1d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c11_2d7c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2300_c7_3cca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2300_c11_5282_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2300_c7_3cca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2300_c11_5282_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2300_c7_3cca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2300_c11_5282_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2300_c7_3cca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2300_c11_5282_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2293_c3_eeb3_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2293_l2289_DUPLICATE_1483_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2290_c3_6234_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2293_l2289_DUPLICATE_1483_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c7_0d7b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2284_l2300_l2288_l2281_DUPLICATE_c4c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_67dc_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2284_l2300_l2288_l2281_DUPLICATE_c4c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_1413_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2284_l2300_l2288_l2281_DUPLICATE_c4c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2300_c7_3cca_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2284_l2300_l2288_l2281_DUPLICATE_c4c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2281_c7_0d7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2284_l2281_l2300_l2292_l2288_DUPLICATE_97a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_67dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2284_l2281_l2300_l2292_l2288_DUPLICATE_97a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_1413_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2284_l2281_l2300_l2292_l2288_DUPLICATE_97a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_b1d3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2284_l2281_l2300_l2292_l2288_DUPLICATE_97a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2300_c7_3cca_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2284_l2281_l2300_l2292_l2288_DUPLICATE_97a9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2281_c7_0d7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2284_l2288_l2281_l2292_DUPLICATE_b47b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_67dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2284_l2288_l2281_l2292_DUPLICATE_b47b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_1413_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2284_l2288_l2281_l2292_DUPLICATE_b47b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_b1d3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2284_l2288_l2281_l2292_DUPLICATE_b47b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_1413_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2300_l2288_DUPLICATE_94bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2300_c7_3cca_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2300_l2288_DUPLICATE_94bc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2284_l2281_l2268_l2300_l2288_DUPLICATE_199a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2281_c7_0d7b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2284_l2281_l2268_l2300_l2288_DUPLICATE_199a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_67dc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2284_l2281_l2268_l2300_l2288_DUPLICATE_199a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2288_c7_1413_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2284_l2281_l2268_l2300_l2288_DUPLICATE_199a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2300_c7_3cca_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2284_l2281_l2268_l2300_l2288_DUPLICATE_199a_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2295_c12_f23a_right := VAR_CONST_SR_4_uxn_opcodes_h_l2295_c36_984b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2268_c2_c9e8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2268_c2_c9e8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2268_c2_c9e8_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2268_c2_c9e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_b1d3_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2294_c30_9cf4_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2268_c2_c9e8] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2293_c3_eeb3] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2293_c3_eeb3_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2293_c3_eeb3_left;
     BIN_OP_OR_uxn_opcodes_h_l2293_c3_eeb3_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2293_c3_eeb3_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2293_c3_eeb3_return_output := BIN_OP_OR_uxn_opcodes_h_l2293_c3_eeb3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2300_c7_3cca] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2300_c7_3cca_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2300_c7_3cca_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2300_c7_3cca_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2300_c7_3cca_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2300_c7_3cca_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2300_c7_3cca_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2300_c7_3cca_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2300_c7_3cca_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2303_c21_3874] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2303_c21_3874_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2303_c31_f117_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2300_c7_3cca] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2300_c7_3cca_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2300_c7_3cca_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2300_c7_3cca_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2300_c7_3cca_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2300_c7_3cca_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2300_c7_3cca_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2300_c7_3cca_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2300_c7_3cca_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2268_c2_c9e8] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2268_c2_c9e8] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2268_c2_c9e8] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2292_c7_b1d3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_b1d3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_b1d3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_b1d3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_b1d3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_b1d3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_b1d3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_b1d3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_b1d3_return_output;

     -- t8_MUX[uxn_opcodes_h_l2284_c7_67dc] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2284_c7_67dc_cond <= VAR_t8_MUX_uxn_opcodes_h_l2284_c7_67dc_cond;
     t8_MUX_uxn_opcodes_h_l2284_c7_67dc_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2284_c7_67dc_iftrue;
     t8_MUX_uxn_opcodes_h_l2284_c7_67dc_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2284_c7_67dc_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output := t8_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2300_c7_3cca] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2300_c7_3cca_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2300_c7_3cca_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2300_c7_3cca_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2300_c7_3cca_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2300_c7_3cca_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2300_c7_3cca_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2300_c7_3cca_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2300_c7_3cca_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2290_c3_6234] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2290_c3_6234_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2290_c3_6234_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2290_c3_6234_return_output := CONST_SL_8_uxn_opcodes_h_l2290_c3_6234_return_output;

     -- Submodule level 2
     VAR_BIN_OP_SR_uxn_opcodes_h_l2295_c12_bd6d_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2293_c3_eeb3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2292_c7_b1d3_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2293_c3_eeb3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2300_c7_3cca_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2303_c21_3874_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2288_c7_1413_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2290_c3_6234_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_b1d3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2300_c7_3cca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_1413_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_b1d3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_b1d3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2300_c7_3cca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_b1d3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2300_c7_3cca_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2281_c7_0d7b_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output;
     -- BIN_OP_SR[uxn_opcodes_h_l2295_c12_bd6d] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l2295_c12_bd6d_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l2295_c12_bd6d_left;
     BIN_OP_SR_uxn_opcodes_h_l2295_c12_bd6d_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l2295_c12_bd6d_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l2295_c12_bd6d_return_output := BIN_OP_SR_uxn_opcodes_h_l2295_c12_bd6d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2300_c7_3cca] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2300_c7_3cca_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2300_c7_3cca_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2300_c7_3cca_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2300_c7_3cca_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2300_c7_3cca_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2300_c7_3cca_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2300_c7_3cca_return_output := result_u8_value_MUX_uxn_opcodes_h_l2300_c7_3cca_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2288_c7_1413] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_1413_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_1413_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_1413_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_1413_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_1413_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_1413_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_1413_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_1413_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2292_c7_b1d3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_b1d3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_b1d3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_b1d3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_b1d3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_b1d3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_b1d3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_b1d3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_b1d3_return_output;

     -- n16_MUX[uxn_opcodes_h_l2292_c7_b1d3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2292_c7_b1d3_cond <= VAR_n16_MUX_uxn_opcodes_h_l2292_c7_b1d3_cond;
     n16_MUX_uxn_opcodes_h_l2292_c7_b1d3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2292_c7_b1d3_iftrue;
     n16_MUX_uxn_opcodes_h_l2292_c7_b1d3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2292_c7_b1d3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2292_c7_b1d3_return_output := n16_MUX_uxn_opcodes_h_l2292_c7_b1d3_return_output;

     -- t8_MUX[uxn_opcodes_h_l2281_c7_0d7b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2281_c7_0d7b_cond <= VAR_t8_MUX_uxn_opcodes_h_l2281_c7_0d7b_cond;
     t8_MUX_uxn_opcodes_h_l2281_c7_0d7b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2281_c7_0d7b_iftrue;
     t8_MUX_uxn_opcodes_h_l2281_c7_0d7b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2281_c7_0d7b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output := t8_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2292_c7_b1d3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_b1d3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_b1d3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_b1d3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_b1d3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_b1d3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_b1d3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_b1d3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_b1d3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2292_c7_b1d3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_b1d3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_b1d3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_b1d3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_b1d3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_b1d3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_b1d3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_b1d3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_b1d3_return_output;

     -- Submodule level 3
     VAR_BIN_OP_SL_uxn_opcodes_h_l2295_c12_f23a_left := VAR_BIN_OP_SR_uxn_opcodes_h_l2295_c12_bd6d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2288_c7_1413_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2292_c7_b1d3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_1413_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_b1d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_67dc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_1413_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_1413_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_b1d3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_1413_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_b1d3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2292_c7_b1d3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2300_c7_3cca_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2284_c7_67dc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_67dc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_67dc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_67dc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_67dc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_67dc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_67dc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2288_c7_1413] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_1413_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_1413_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_1413_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_1413_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_1413_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_1413_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_1413_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_1413_return_output;

     -- t8_MUX[uxn_opcodes_h_l2268_c2_c9e8] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond <= VAR_t8_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond;
     t8_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue;
     t8_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output := t8_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output;

     -- BIN_OP_SL[uxn_opcodes_h_l2295_c12_f23a] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l2295_c12_f23a_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l2295_c12_f23a_left;
     BIN_OP_SL_uxn_opcodes_h_l2295_c12_f23a_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l2295_c12_f23a_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l2295_c12_f23a_return_output := BIN_OP_SL_uxn_opcodes_h_l2295_c12_f23a_return_output;

     -- n16_MUX[uxn_opcodes_h_l2288_c7_1413] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2288_c7_1413_cond <= VAR_n16_MUX_uxn_opcodes_h_l2288_c7_1413_cond;
     n16_MUX_uxn_opcodes_h_l2288_c7_1413_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2288_c7_1413_iftrue;
     n16_MUX_uxn_opcodes_h_l2288_c7_1413_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2288_c7_1413_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2288_c7_1413_return_output := n16_MUX_uxn_opcodes_h_l2288_c7_1413_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2288_c7_1413] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_1413_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_1413_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_1413_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_1413_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_1413_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_1413_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_1413_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_1413_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2288_c7_1413] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_1413_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_1413_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_1413_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_1413_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_1413_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_1413_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_1413_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_1413_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2292_c7_b1d3_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2295_c12_f23a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2284_c7_67dc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2288_c7_1413_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_67dc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_1413_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2281_c7_0d7b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_67dc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_1413_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_67dc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_1413_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output;
     -- n16_MUX[uxn_opcodes_h_l2284_c7_67dc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2284_c7_67dc_cond <= VAR_n16_MUX_uxn_opcodes_h_l2284_c7_67dc_cond;
     n16_MUX_uxn_opcodes_h_l2284_c7_67dc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2284_c7_67dc_iftrue;
     n16_MUX_uxn_opcodes_h_l2284_c7_67dc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2284_c7_67dc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output := n16_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2281_c7_0d7b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2281_c7_0d7b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2281_c7_0d7b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2281_c7_0d7b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2281_c7_0d7b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2281_c7_0d7b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2281_c7_0d7b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2284_c7_67dc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_67dc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_67dc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_67dc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_67dc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_67dc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_67dc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2298_c21_0470] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2298_c21_0470_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_SL_uxn_opcodes_h_l2295_c12_f23a_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2284_c7_67dc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_67dc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_67dc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_67dc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_67dc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_67dc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_67dc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2284_c7_67dc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_67dc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_67dc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_67dc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_67dc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_67dc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_67dc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2292_c7_b1d3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2292_c7_b1d3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2292_c7_b1d3_cond;
     tmp16_MUX_uxn_opcodes_h_l2292_c7_b1d3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2292_c7_b1d3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2292_c7_b1d3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2292_c7_b1d3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2292_c7_b1d3_return_output := tmp16_MUX_uxn_opcodes_h_l2292_c7_b1d3_return_output;

     -- Submodule level 5
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2292_c7_b1d3_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2298_c21_0470_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2281_c7_0d7b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2281_c7_0d7b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c7_0d7b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c7_0d7b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2288_c7_1413_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2292_c7_b1d3_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2281_c7_0d7b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c7_0d7b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c7_0d7b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c7_0d7b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c7_0d7b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c7_0d7b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c7_0d7b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2268_c2_c9e8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2281_c7_0d7b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2281_c7_0d7b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2281_c7_0d7b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2281_c7_0d7b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2281_c7_0d7b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2281_c7_0d7b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2281_c7_0d7b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2281_c7_0d7b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c7_0d7b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c7_0d7b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c7_0d7b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c7_0d7b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c7_0d7b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c7_0d7b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2292_c7_b1d3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2292_c7_b1d3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2292_c7_b1d3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2292_c7_b1d3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2292_c7_b1d3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2292_c7_b1d3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2292_c7_b1d3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2292_c7_b1d3_return_output := result_u8_value_MUX_uxn_opcodes_h_l2292_c7_b1d3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2288_c7_1413] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2288_c7_1413_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2288_c7_1413_cond;
     tmp16_MUX_uxn_opcodes_h_l2288_c7_1413_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2288_c7_1413_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2288_c7_1413_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2288_c7_1413_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2288_c7_1413_return_output := tmp16_MUX_uxn_opcodes_h_l2288_c7_1413_return_output;

     -- n16_MUX[uxn_opcodes_h_l2281_c7_0d7b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2281_c7_0d7b_cond <= VAR_n16_MUX_uxn_opcodes_h_l2281_c7_0d7b_cond;
     n16_MUX_uxn_opcodes_h_l2281_c7_0d7b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2281_c7_0d7b_iftrue;
     n16_MUX_uxn_opcodes_h_l2281_c7_0d7b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2281_c7_0d7b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output := n16_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2288_c7_1413_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2292_c7_b1d3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2284_c7_67dc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2288_c7_1413_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2284_c7_67dc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2284_c7_67dc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2284_c7_67dc_cond;
     tmp16_MUX_uxn_opcodes_h_l2284_c7_67dc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2284_c7_67dc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2284_c7_67dc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2284_c7_67dc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output := tmp16_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2288_c7_1413] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2288_c7_1413_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2288_c7_1413_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2288_c7_1413_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2288_c7_1413_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2288_c7_1413_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2288_c7_1413_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2288_c7_1413_return_output := result_u8_value_MUX_uxn_opcodes_h_l2288_c7_1413_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2268_c2_c9e8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2268_c2_c9e8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output;

     -- n16_MUX[uxn_opcodes_h_l2268_c2_c9e8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond <= VAR_n16_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond;
     n16_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue;
     n16_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output := n16_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2268_c2_c9e8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output;

     -- Submodule level 7
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_67dc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2288_c7_1413_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2281_c7_0d7b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2284_c7_67dc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2284_c7_67dc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_67dc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2284_c7_67dc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_67dc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2284_c7_67dc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_67dc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output := result_u8_value_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2281_c7_0d7b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2281_c7_0d7b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2281_c7_0d7b_cond;
     tmp16_MUX_uxn_opcodes_h_l2281_c7_0d7b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2281_c7_0d7b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2281_c7_0d7b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2281_c7_0d7b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output := tmp16_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output;

     -- Submodule level 8
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2281_c7_0d7b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_67dc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2281_c7_0d7b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2281_c7_0d7b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2281_c7_0d7b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2281_c7_0d7b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2281_c7_0d7b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2281_c7_0d7b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2281_c7_0d7b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2268_c2_c9e8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond;
     tmp16_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output := tmp16_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2281_c7_0d7b_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2268_c2_c9e8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c2_c9e8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c2_c9e8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c2_c9e8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output := result_u8_value_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l2263_l2307_DUPLICATE_fb13 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l2263_l2307_DUPLICATE_fb13_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_188e(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2268_c2_c9e8_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l2263_l2307_DUPLICATE_fb13_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l2263_l2307_DUPLICATE_fb13_return_output;
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
