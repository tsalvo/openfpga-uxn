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
-- Submodules: 67
entity swp2_0CLK_814c2afd is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end swp2_0CLK_814c2afd;
architecture arch of swp2_0CLK_814c2afd is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16_high : unsigned(7 downto 0) := to_unsigned(0, 8);
signal t16_low : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16_high : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16_low : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16_high : unsigned(7 downto 0);
signal REG_COMB_t16_low : unsigned(7 downto 0);
signal REG_COMB_n16_high : unsigned(7 downto 0);
signal REG_COMB_n16_low : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2586_c6_54f6]
signal BIN_OP_EQ_uxn_opcodes_h_l2586_c6_54f6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2586_c6_54f6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2586_c6_54f6_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2586_c2_8dc1]
signal t16_low_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2586_c2_8dc1]
signal t16_high_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2586_c2_8dc1]
signal result_u8_value_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2586_c2_8dc1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2586_c2_8dc1]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2586_c2_8dc1]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2586_c2_8dc1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2586_c2_8dc1]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2586_c2_8dc1]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2586_c2_8dc1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2586_c2_8dc1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2586_c2_8dc1]
signal n16_low_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2586_c2_8dc1]
signal n16_high_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2599_c11_010b]
signal BIN_OP_EQ_uxn_opcodes_h_l2599_c11_010b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2599_c11_010b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2599_c11_010b_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2599_c7_3d4d]
signal t16_low_MUX_uxn_opcodes_h_l2599_c7_3d4d_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2599_c7_3d4d_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2599_c7_3d4d_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2599_c7_3d4d]
signal t16_high_MUX_uxn_opcodes_h_l2599_c7_3d4d_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2599_c7_3d4d_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2599_c7_3d4d_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2599_c7_3d4d]
signal result_u8_value_MUX_uxn_opcodes_h_l2599_c7_3d4d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2599_c7_3d4d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2599_c7_3d4d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2599_c7_3d4d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_3d4d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_3d4d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_3d4d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2599_c7_3d4d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_3d4d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_3d4d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_3d4d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2599_c7_3d4d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_3d4d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_3d4d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_3d4d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2599_c7_3d4d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_3d4d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_3d4d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_3d4d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2599_c7_3d4d]
signal n16_low_MUX_uxn_opcodes_h_l2599_c7_3d4d_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2599_c7_3d4d_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2599_c7_3d4d_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2599_c7_3d4d]
signal n16_high_MUX_uxn_opcodes_h_l2599_c7_3d4d_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2599_c7_3d4d_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2599_c7_3d4d_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2602_c11_e400]
signal BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e400_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e400_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e400_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2602_c7_2ae1]
signal t16_low_MUX_uxn_opcodes_h_l2602_c7_2ae1_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2602_c7_2ae1_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2602_c7_2ae1_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2602_c7_2ae1]
signal t16_high_MUX_uxn_opcodes_h_l2602_c7_2ae1_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2602_c7_2ae1_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2602_c7_2ae1_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2602_c7_2ae1]
signal result_u8_value_MUX_uxn_opcodes_h_l2602_c7_2ae1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2602_c7_2ae1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2602_c7_2ae1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2602_c7_2ae1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_2ae1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_2ae1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_2ae1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2602_c7_2ae1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_2ae1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_2ae1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_2ae1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2602_c7_2ae1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_2ae1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_2ae1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_2ae1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2602_c7_2ae1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_2ae1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_2ae1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_2ae1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2602_c7_2ae1]
signal n16_low_MUX_uxn_opcodes_h_l2602_c7_2ae1_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2602_c7_2ae1_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2602_c7_2ae1_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2602_c7_2ae1]
signal n16_high_MUX_uxn_opcodes_h_l2602_c7_2ae1_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2602_c7_2ae1_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2602_c7_2ae1_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2606_c11_9751]
signal BIN_OP_EQ_uxn_opcodes_h_l2606_c11_9751_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2606_c11_9751_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2606_c11_9751_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2606_c7_da0b]
signal t16_low_MUX_uxn_opcodes_h_l2606_c7_da0b_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2606_c7_da0b_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2606_c7_da0b_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2606_c7_da0b]
signal result_u8_value_MUX_uxn_opcodes_h_l2606_c7_da0b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2606_c7_da0b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2606_c7_da0b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2606_c7_da0b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_da0b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_da0b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_da0b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2606_c7_da0b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_da0b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_da0b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_da0b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2606_c7_da0b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_da0b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_da0b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_da0b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2606_c7_da0b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_da0b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_da0b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_da0b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2606_c7_da0b]
signal n16_low_MUX_uxn_opcodes_h_l2606_c7_da0b_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2606_c7_da0b_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2606_c7_da0b_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2606_c7_da0b]
signal n16_high_MUX_uxn_opcodes_h_l2606_c7_da0b_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2606_c7_da0b_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2606_c7_da0b_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2610_c11_f365]
signal BIN_OP_EQ_uxn_opcodes_h_l2610_c11_f365_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2610_c11_f365_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2610_c11_f365_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2610_c7_8fa2]
signal result_u8_value_MUX_uxn_opcodes_h_l2610_c7_8fa2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2610_c7_8fa2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2610_c7_8fa2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2610_c7_8fa2_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2610_c7_8fa2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_8fa2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_8fa2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_8fa2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_8fa2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2610_c7_8fa2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_8fa2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_8fa2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_8fa2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_8fa2_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2610_c7_8fa2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_8fa2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_8fa2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_8fa2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_8fa2_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2610_c7_8fa2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_8fa2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_8fa2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_8fa2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_8fa2_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2610_c7_8fa2]
signal n16_low_MUX_uxn_opcodes_h_l2610_c7_8fa2_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2610_c7_8fa2_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2610_c7_8fa2_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2610_c7_8fa2_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2610_c7_8fa2]
signal n16_high_MUX_uxn_opcodes_h_l2610_c7_8fa2_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2610_c7_8fa2_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2610_c7_8fa2_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2610_c7_8fa2_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2612_c30_500e]
signal sp_relative_shift_uxn_opcodes_h_l2612_c30_500e_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2612_c30_500e_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2612_c30_500e_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2612_c30_500e_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2617_c11_350d]
signal BIN_OP_EQ_uxn_opcodes_h_l2617_c11_350d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2617_c11_350d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2617_c11_350d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2617_c7_8ed8]
signal result_u8_value_MUX_uxn_opcodes_h_l2617_c7_8ed8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2617_c7_8ed8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2617_c7_8ed8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2617_c7_8ed8_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2617_c7_8ed8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_8ed8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_8ed8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_8ed8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_8ed8_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2617_c7_8ed8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_8ed8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_8ed8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_8ed8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_8ed8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2617_c7_8ed8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_8ed8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_8ed8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_8ed8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_8ed8_return_output : unsigned(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2617_c7_8ed8]
signal n16_low_MUX_uxn_opcodes_h_l2617_c7_8ed8_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2617_c7_8ed8_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2617_c7_8ed8_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2617_c7_8ed8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2623_c11_fe8b]
signal BIN_OP_EQ_uxn_opcodes_h_l2623_c11_fe8b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2623_c11_fe8b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2623_c11_fe8b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2623_c7_8406]
signal result_u8_value_MUX_uxn_opcodes_h_l2623_c7_8406_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2623_c7_8406_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2623_c7_8406_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2623_c7_8406_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2623_c7_8406]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_8406_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_8406_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_8406_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_8406_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2623_c7_8406]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_8406_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_8406_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_8406_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_8406_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2627_c11_51c0]
signal BIN_OP_EQ_uxn_opcodes_h_l2627_c11_51c0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2627_c11_51c0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2627_c11_51c0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2627_c7_83f4]
signal result_u8_value_MUX_uxn_opcodes_h_l2627_c7_83f4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2627_c7_83f4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2627_c7_83f4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2627_c7_83f4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2627_c7_83f4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_83f4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_83f4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_83f4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_83f4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2627_c7_83f4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_83f4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_83f4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_83f4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_83f4_return_output : unsigned(3 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2586_c6_54f6
BIN_OP_EQ_uxn_opcodes_h_l2586_c6_54f6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2586_c6_54f6_left,
BIN_OP_EQ_uxn_opcodes_h_l2586_c6_54f6_right,
BIN_OP_EQ_uxn_opcodes_h_l2586_c6_54f6_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2586_c2_8dc1
t16_low_MUX_uxn_opcodes_h_l2586_c2_8dc1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond,
t16_low_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue,
t16_low_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse,
t16_low_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2586_c2_8dc1
t16_high_MUX_uxn_opcodes_h_l2586_c2_8dc1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond,
t16_high_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue,
t16_high_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse,
t16_high_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2586_c2_8dc1
result_u8_value_MUX_uxn_opcodes_h_l2586_c2_8dc1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_8dc1
result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_8dc1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_8dc1
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_8dc1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_8dc1
result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_8dc1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_8dc1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_8dc1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_8dc1
result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_8dc1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_8dc1
result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_8dc1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_8dc1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_8dc1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_8dc1
result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_8dc1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2586_c2_8dc1
n16_low_MUX_uxn_opcodes_h_l2586_c2_8dc1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond,
n16_low_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue,
n16_low_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse,
n16_low_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2586_c2_8dc1
n16_high_MUX_uxn_opcodes_h_l2586_c2_8dc1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond,
n16_high_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue,
n16_high_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse,
n16_high_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2599_c11_010b
BIN_OP_EQ_uxn_opcodes_h_l2599_c11_010b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2599_c11_010b_left,
BIN_OP_EQ_uxn_opcodes_h_l2599_c11_010b_right,
BIN_OP_EQ_uxn_opcodes_h_l2599_c11_010b_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2599_c7_3d4d
t16_low_MUX_uxn_opcodes_h_l2599_c7_3d4d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2599_c7_3d4d_cond,
t16_low_MUX_uxn_opcodes_h_l2599_c7_3d4d_iftrue,
t16_low_MUX_uxn_opcodes_h_l2599_c7_3d4d_iffalse,
t16_low_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2599_c7_3d4d
t16_high_MUX_uxn_opcodes_h_l2599_c7_3d4d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2599_c7_3d4d_cond,
t16_high_MUX_uxn_opcodes_h_l2599_c7_3d4d_iftrue,
t16_high_MUX_uxn_opcodes_h_l2599_c7_3d4d_iffalse,
t16_high_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2599_c7_3d4d
result_u8_value_MUX_uxn_opcodes_h_l2599_c7_3d4d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2599_c7_3d4d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2599_c7_3d4d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2599_c7_3d4d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_3d4d
result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_3d4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_3d4d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_3d4d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_3d4d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_3d4d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_3d4d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_3d4d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_3d4d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_3d4d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_3d4d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_3d4d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_3d4d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_3d4d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_3d4d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_3d4d
result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_3d4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_3d4d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_3d4d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_3d4d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2599_c7_3d4d
n16_low_MUX_uxn_opcodes_h_l2599_c7_3d4d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2599_c7_3d4d_cond,
n16_low_MUX_uxn_opcodes_h_l2599_c7_3d4d_iftrue,
n16_low_MUX_uxn_opcodes_h_l2599_c7_3d4d_iffalse,
n16_low_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2599_c7_3d4d
n16_high_MUX_uxn_opcodes_h_l2599_c7_3d4d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2599_c7_3d4d_cond,
n16_high_MUX_uxn_opcodes_h_l2599_c7_3d4d_iftrue,
n16_high_MUX_uxn_opcodes_h_l2599_c7_3d4d_iffalse,
n16_high_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e400
BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e400 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e400_left,
BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e400_right,
BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e400_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2602_c7_2ae1
t16_low_MUX_uxn_opcodes_h_l2602_c7_2ae1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2602_c7_2ae1_cond,
t16_low_MUX_uxn_opcodes_h_l2602_c7_2ae1_iftrue,
t16_low_MUX_uxn_opcodes_h_l2602_c7_2ae1_iffalse,
t16_low_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2602_c7_2ae1
t16_high_MUX_uxn_opcodes_h_l2602_c7_2ae1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2602_c7_2ae1_cond,
t16_high_MUX_uxn_opcodes_h_l2602_c7_2ae1_iftrue,
t16_high_MUX_uxn_opcodes_h_l2602_c7_2ae1_iffalse,
t16_high_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2602_c7_2ae1
result_u8_value_MUX_uxn_opcodes_h_l2602_c7_2ae1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2602_c7_2ae1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2602_c7_2ae1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2602_c7_2ae1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_2ae1
result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_2ae1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_2ae1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_2ae1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_2ae1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_2ae1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_2ae1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_2ae1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_2ae1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_2ae1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_2ae1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_2ae1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_2ae1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_2ae1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_2ae1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_2ae1
result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_2ae1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_2ae1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_2ae1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_2ae1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2602_c7_2ae1
n16_low_MUX_uxn_opcodes_h_l2602_c7_2ae1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2602_c7_2ae1_cond,
n16_low_MUX_uxn_opcodes_h_l2602_c7_2ae1_iftrue,
n16_low_MUX_uxn_opcodes_h_l2602_c7_2ae1_iffalse,
n16_low_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2602_c7_2ae1
n16_high_MUX_uxn_opcodes_h_l2602_c7_2ae1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2602_c7_2ae1_cond,
n16_high_MUX_uxn_opcodes_h_l2602_c7_2ae1_iftrue,
n16_high_MUX_uxn_opcodes_h_l2602_c7_2ae1_iffalse,
n16_high_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2606_c11_9751
BIN_OP_EQ_uxn_opcodes_h_l2606_c11_9751 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2606_c11_9751_left,
BIN_OP_EQ_uxn_opcodes_h_l2606_c11_9751_right,
BIN_OP_EQ_uxn_opcodes_h_l2606_c11_9751_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2606_c7_da0b
t16_low_MUX_uxn_opcodes_h_l2606_c7_da0b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2606_c7_da0b_cond,
t16_low_MUX_uxn_opcodes_h_l2606_c7_da0b_iftrue,
t16_low_MUX_uxn_opcodes_h_l2606_c7_da0b_iffalse,
t16_low_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2606_c7_da0b
result_u8_value_MUX_uxn_opcodes_h_l2606_c7_da0b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2606_c7_da0b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2606_c7_da0b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2606_c7_da0b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_da0b
result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_da0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_da0b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_da0b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_da0b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_da0b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_da0b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_da0b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_da0b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_da0b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_da0b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_da0b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_da0b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_da0b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_da0b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_da0b
result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_da0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_da0b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_da0b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_da0b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2606_c7_da0b
n16_low_MUX_uxn_opcodes_h_l2606_c7_da0b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2606_c7_da0b_cond,
n16_low_MUX_uxn_opcodes_h_l2606_c7_da0b_iftrue,
n16_low_MUX_uxn_opcodes_h_l2606_c7_da0b_iffalse,
n16_low_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2606_c7_da0b
n16_high_MUX_uxn_opcodes_h_l2606_c7_da0b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2606_c7_da0b_cond,
n16_high_MUX_uxn_opcodes_h_l2606_c7_da0b_iftrue,
n16_high_MUX_uxn_opcodes_h_l2606_c7_da0b_iffalse,
n16_high_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2610_c11_f365
BIN_OP_EQ_uxn_opcodes_h_l2610_c11_f365 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2610_c11_f365_left,
BIN_OP_EQ_uxn_opcodes_h_l2610_c11_f365_right,
BIN_OP_EQ_uxn_opcodes_h_l2610_c11_f365_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2610_c7_8fa2
result_u8_value_MUX_uxn_opcodes_h_l2610_c7_8fa2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2610_c7_8fa2_cond,
result_u8_value_MUX_uxn_opcodes_h_l2610_c7_8fa2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2610_c7_8fa2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2610_c7_8fa2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_8fa2
result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_8fa2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_8fa2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_8fa2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_8fa2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_8fa2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_8fa2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_8fa2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_8fa2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_8fa2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_8fa2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_8fa2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_8fa2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_8fa2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_8fa2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_8fa2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_8fa2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_8fa2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_8fa2
result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_8fa2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_8fa2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_8fa2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_8fa2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_8fa2_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2610_c7_8fa2
n16_low_MUX_uxn_opcodes_h_l2610_c7_8fa2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2610_c7_8fa2_cond,
n16_low_MUX_uxn_opcodes_h_l2610_c7_8fa2_iftrue,
n16_low_MUX_uxn_opcodes_h_l2610_c7_8fa2_iffalse,
n16_low_MUX_uxn_opcodes_h_l2610_c7_8fa2_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2610_c7_8fa2
n16_high_MUX_uxn_opcodes_h_l2610_c7_8fa2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2610_c7_8fa2_cond,
n16_high_MUX_uxn_opcodes_h_l2610_c7_8fa2_iftrue,
n16_high_MUX_uxn_opcodes_h_l2610_c7_8fa2_iffalse,
n16_high_MUX_uxn_opcodes_h_l2610_c7_8fa2_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2612_c30_500e
sp_relative_shift_uxn_opcodes_h_l2612_c30_500e : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2612_c30_500e_ins,
sp_relative_shift_uxn_opcodes_h_l2612_c30_500e_x,
sp_relative_shift_uxn_opcodes_h_l2612_c30_500e_y,
sp_relative_shift_uxn_opcodes_h_l2612_c30_500e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2617_c11_350d
BIN_OP_EQ_uxn_opcodes_h_l2617_c11_350d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2617_c11_350d_left,
BIN_OP_EQ_uxn_opcodes_h_l2617_c11_350d_right,
BIN_OP_EQ_uxn_opcodes_h_l2617_c11_350d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2617_c7_8ed8
result_u8_value_MUX_uxn_opcodes_h_l2617_c7_8ed8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2617_c7_8ed8_cond,
result_u8_value_MUX_uxn_opcodes_h_l2617_c7_8ed8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2617_c7_8ed8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2617_c7_8ed8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_8ed8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_8ed8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_8ed8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_8ed8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_8ed8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_8ed8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_8ed8
result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_8ed8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_8ed8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_8ed8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_8ed8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_8ed8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_8ed8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_8ed8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_8ed8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_8ed8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_8ed8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_8ed8_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2617_c7_8ed8
n16_low_MUX_uxn_opcodes_h_l2617_c7_8ed8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2617_c7_8ed8_cond,
n16_low_MUX_uxn_opcodes_h_l2617_c7_8ed8_iftrue,
n16_low_MUX_uxn_opcodes_h_l2617_c7_8ed8_iffalse,
n16_low_MUX_uxn_opcodes_h_l2617_c7_8ed8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2623_c11_fe8b
BIN_OP_EQ_uxn_opcodes_h_l2623_c11_fe8b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2623_c11_fe8b_left,
BIN_OP_EQ_uxn_opcodes_h_l2623_c11_fe8b_right,
BIN_OP_EQ_uxn_opcodes_h_l2623_c11_fe8b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2623_c7_8406
result_u8_value_MUX_uxn_opcodes_h_l2623_c7_8406 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2623_c7_8406_cond,
result_u8_value_MUX_uxn_opcodes_h_l2623_c7_8406_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2623_c7_8406_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2623_c7_8406_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_8406
result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_8406 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_8406_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_8406_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_8406_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_8406_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_8406
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_8406 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_8406_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_8406_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_8406_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_8406_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2627_c11_51c0
BIN_OP_EQ_uxn_opcodes_h_l2627_c11_51c0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2627_c11_51c0_left,
BIN_OP_EQ_uxn_opcodes_h_l2627_c11_51c0_right,
BIN_OP_EQ_uxn_opcodes_h_l2627_c11_51c0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2627_c7_83f4
result_u8_value_MUX_uxn_opcodes_h_l2627_c7_83f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2627_c7_83f4_cond,
result_u8_value_MUX_uxn_opcodes_h_l2627_c7_83f4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2627_c7_83f4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2627_c7_83f4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_83f4
result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_83f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_83f4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_83f4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_83f4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_83f4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_83f4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_83f4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_83f4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_83f4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_83f4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_83f4_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16_high,
 t16_low,
 n16_high,
 n16_low,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2586_c6_54f6_return_output,
 t16_low_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output,
 t16_high_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output,
 n16_low_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output,
 n16_high_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2599_c11_010b_return_output,
 t16_low_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output,
 t16_high_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output,
 n16_low_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output,
 n16_high_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e400_return_output,
 t16_low_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output,
 t16_high_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output,
 n16_low_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output,
 n16_high_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2606_c11_9751_return_output,
 t16_low_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output,
 n16_low_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output,
 n16_high_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2610_c11_f365_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2610_c7_8fa2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_8fa2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_8fa2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_8fa2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_8fa2_return_output,
 n16_low_MUX_uxn_opcodes_h_l2610_c7_8fa2_return_output,
 n16_high_MUX_uxn_opcodes_h_l2610_c7_8fa2_return_output,
 sp_relative_shift_uxn_opcodes_h_l2612_c30_500e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2617_c11_350d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2617_c7_8ed8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_8ed8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_8ed8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_8ed8_return_output,
 n16_low_MUX_uxn_opcodes_h_l2617_c7_8ed8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2623_c11_fe8b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2623_c7_8406_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_8406_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_8406_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2627_c11_51c0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2627_c7_83f4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_83f4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_83f4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_54f6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_54f6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_54f6_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2586_c2_8dc1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2586_c2_8dc1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2596_c3_6105 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2586_c2_8dc1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2586_c2_8dc1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2591_c3_bef4 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_010b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_010b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_010b_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2599_c7_3d4d_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2599_c7_3d4d_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2599_c7_3d4d_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2599_c7_3d4d_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2599_c7_3d4d_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2599_c7_3d4d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_3d4d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_3d4d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_3d4d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_3d4d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_3d4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_3d4d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_3d4d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2600_c3_437e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_3d4d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_3d4d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_3d4d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_3d4d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_3d4d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_3d4d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_3d4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_3d4d_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2599_c7_3d4d_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2599_c7_3d4d_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2599_c7_3d4d_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2599_c7_3d4d_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2599_c7_3d4d_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2599_c7_3d4d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e400_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e400_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e400_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2602_c7_2ae1_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2602_c7_2ae1_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2602_c7_2ae1_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2602_c7_2ae1_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2602_c7_2ae1_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2602_c7_2ae1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_2ae1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_2ae1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_2ae1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_2ae1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_2ae1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_2ae1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_2ae1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2604_c3_1f03 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_2ae1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_2ae1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_2ae1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_2ae1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_2ae1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_2ae1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_2ae1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_2ae1_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2602_c7_2ae1_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2602_c7_2ae1_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2602_c7_2ae1_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2602_c7_2ae1_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2602_c7_2ae1_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2602_c7_2ae1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_9751_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_9751_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_9751_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2606_c7_da0b_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2606_c7_da0b_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2606_c7_da0b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2606_c7_da0b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2606_c7_da0b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c7_8fa2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2606_c7_da0b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_da0b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_da0b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_8fa2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_da0b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_da0b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2608_c3_7f81 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_da0b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_8fa2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_da0b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_da0b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_da0b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_8fa2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_da0b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_da0b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_da0b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_8fa2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_da0b_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2606_c7_da0b_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2606_c7_da0b_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2610_c7_8fa2_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2606_c7_da0b_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2606_c7_da0b_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2606_c7_da0b_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2610_c7_8fa2_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2606_c7_da0b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_f365_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_f365_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_f365_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c7_8fa2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c7_8fa2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2617_c7_8ed8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c7_8fa2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_8fa2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_8fa2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_8fa2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_8fa2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2614_c3_6068 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_8fa2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_8ed8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_8fa2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_8fa2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_8fa2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_8ed8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_8fa2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_8fa2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_8fa2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_8ed8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_8fa2_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2610_c7_8fa2_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2610_c7_8fa2_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2617_c7_8ed8_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2610_c7_8fa2_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2610_c7_8fa2_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2610_c7_8fa2_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2610_c7_8fa2_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2612_c30_500e_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2612_c30_500e_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2612_c30_500e_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2612_c30_500e_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_350d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_350d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_350d_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2617_c7_8ed8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2617_c7_8ed8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_8406_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2617_c7_8ed8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_8ed8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2619_c3_4093 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_8ed8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_8ed8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_8ed8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_8ed8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_8406_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_8ed8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_8ed8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2620_c3_0ed4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_8ed8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_8406_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_8ed8_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2617_c7_8ed8_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2617_c7_8ed8_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2617_c7_8ed8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_fe8b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_fe8b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_fe8b_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_8406_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_8406_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_83f4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_8406_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_8406_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_8406_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_83f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_8406_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_8406_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2624_c3_07c6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_8406_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_83f4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_8406_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_51c0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_51c0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_51c0_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_83f4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_83f4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_83f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_83f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_83f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_83f4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_83f4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2628_c3_5e3d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_83f4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2627_c7_83f4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_83f4_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2599_l2627_l2586_l2606_l2602_DUPLICATE_d939_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2606_l2599_l2610_l2602_DUPLICATE_1326_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2606_l2599_l2602_l2617_DUPLICATE_a922_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2599_l2627_l2623_l2617_l2610_l2606_l2602_DUPLICATE_6bec_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l2633_l2582_DUPLICATE_2cd7_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16_high : unsigned(7 downto 0);
variable REG_VAR_t16_low : unsigned(7 downto 0);
variable REG_VAR_n16_high : unsigned(7 downto 0);
variable REG_VAR_n16_low : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16_high := t16_high;
  REG_VAR_t16_low := t16_low;
  REG_VAR_n16_high := n16_high;
  REG_VAR_n16_low := n16_low;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_51c0_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_350d_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2600_c3_437e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_3d4d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2600_c3_437e;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2604_c3_1f03 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_2ae1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2604_c3_1f03;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2591_c3_bef4 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2591_c3_bef4;
     VAR_sp_relative_shift_uxn_opcodes_h_l2612_c30_500e_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2596_c3_6105 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2596_c3_6105;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2628_c3_5e3d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_83f4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2628_c3_5e3d;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_83f4_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_8fa2_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_f365_right := to_unsigned(4, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2619_c3_4093 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_8ed8_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2619_c3_4093;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2608_c3_7f81 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_da0b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2608_c3_7f81;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_010b_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_fe8b_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_9751_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_54f6_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2612_c30_500e_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e400_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2614_c3_6068 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_8fa2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2614_c3_6068;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2624_c3_07c6 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_8406_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2624_c3_07c6;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2620_c3_0ed4 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_8ed8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2620_c3_0ed4;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2612_c30_500e_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2599_c7_3d4d_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2602_c7_2ae1_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2606_c7_da0b_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2610_c7_8fa2_iffalse := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_8406_iftrue := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2599_c7_3d4d_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2602_c7_2ae1_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2606_c7_da0b_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2610_c7_8fa2_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2617_c7_8ed8_iffalse := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_83f4_iftrue := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_54f6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_010b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e400_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_9751_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_f365_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_350d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_fe8b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_51c0_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l2610_c7_8fa2_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l2617_c7_8ed8_iftrue := VAR_previous_stack_read;
     VAR_t16_high_MUX_uxn_opcodes_h_l2602_c7_2ae1_iftrue := VAR_previous_stack_read;
     VAR_t16_low_MUX_uxn_opcodes_h_l2606_c7_da0b_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c7_8fa2_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2599_c7_3d4d_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2602_c7_2ae1_iffalse := t16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2617_c7_8ed8_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2599_c7_3d4d_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2602_c7_2ae1_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2606_c7_da0b_iffalse := t16_low;
     -- BIN_OP_EQ[uxn_opcodes_h_l2623_c11_fe8b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2623_c11_fe8b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_fe8b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2623_c11_fe8b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_fe8b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_fe8b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2623_c11_fe8b_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2606_l2599_l2602_l2617_DUPLICATE_a922 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2606_l2599_l2602_l2617_DUPLICATE_a922_return_output := result.sp_relative_shift;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2586_c2_8dc1] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2586_c2_8dc1_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l2586_c6_54f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2586_c6_54f6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_54f6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2586_c6_54f6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_54f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_54f6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2586_c6_54f6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2599_c11_010b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2599_c11_010b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_010b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2599_c11_010b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_010b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_010b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2599_c11_010b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2602_c11_e400] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e400_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e400_left;
     BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e400_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e400_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e400_return_output := BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e400_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2617_c11_350d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2617_c11_350d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_350d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2617_c11_350d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_350d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_350d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2617_c11_350d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2606_l2599_l2610_l2602_DUPLICATE_1326 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2606_l2599_l2610_l2602_DUPLICATE_1326_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2610_c11_f365] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2610_c11_f365_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_f365_left;
     BIN_OP_EQ_uxn_opcodes_h_l2610_c11_f365_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_f365_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_f365_return_output := BIN_OP_EQ_uxn_opcodes_h_l2610_c11_f365_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2586_c2_8dc1] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2586_c2_8dc1_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2599_l2627_l2623_l2617_l2610_l2606_l2602_DUPLICATE_6bec LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2599_l2627_l2623_l2617_l2610_l2606_l2602_DUPLICATE_6bec_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2627_c11_51c0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2627_c11_51c0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_51c0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2627_c11_51c0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_51c0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_51c0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2627_c11_51c0_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2612_c30_500e] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2612_c30_500e_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2612_c30_500e_ins;
     sp_relative_shift_uxn_opcodes_h_l2612_c30_500e_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2612_c30_500e_x;
     sp_relative_shift_uxn_opcodes_h_l2612_c30_500e_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2612_c30_500e_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2612_c30_500e_return_output := sp_relative_shift_uxn_opcodes_h_l2612_c30_500e_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2586_c2_8dc1] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2586_c2_8dc1_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2606_c11_9751] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2606_c11_9751_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_9751_left;
     BIN_OP_EQ_uxn_opcodes_h_l2606_c11_9751_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_9751_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_9751_return_output := BIN_OP_EQ_uxn_opcodes_h_l2606_c11_9751_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2586_c2_8dc1] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2586_c2_8dc1_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2599_l2627_l2586_l2606_l2602_DUPLICATE_d939 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2599_l2627_l2586_l2606_l2602_DUPLICATE_d939_return_output := result.u8_value;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2627_c7_83f4] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2627_c7_83f4_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_54f6_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_54f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_54f6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_54f6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_54f6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_54f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_54f6_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_54f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_54f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_54f6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_54f6_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_54f6_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_54f6_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2599_c7_3d4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_010b_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2599_c7_3d4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_010b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_3d4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_010b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_3d4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_010b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_3d4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_010b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_3d4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_010b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_3d4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_010b_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2599_c7_3d4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_010b_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2599_c7_3d4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_010b_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2602_c7_2ae1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e400_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2602_c7_2ae1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e400_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_2ae1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e400_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_2ae1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e400_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_2ae1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e400_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_2ae1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e400_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_2ae1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e400_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2602_c7_2ae1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e400_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2602_c7_2ae1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_e400_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2606_c7_da0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_9751_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2606_c7_da0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_9751_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_da0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_9751_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_da0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_9751_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_da0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_9751_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_da0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_9751_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2606_c7_da0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_9751_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2606_c7_da0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_9751_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2610_c7_8fa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_f365_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2610_c7_8fa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_f365_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_8fa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_f365_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_8fa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_f365_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_8fa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_f365_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_8fa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_f365_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c7_8fa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_f365_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2617_c7_8ed8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_350d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_8ed8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_350d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_8ed8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_350d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_8ed8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_350d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2617_c7_8ed8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_350d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_8406_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_fe8b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_8406_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_fe8b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_8406_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_fe8b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_83f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_51c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_83f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_51c0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_83f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_51c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_3d4d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2606_l2599_l2602_l2617_DUPLICATE_a922_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_2ae1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2606_l2599_l2602_l2617_DUPLICATE_a922_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_da0b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2606_l2599_l2602_l2617_DUPLICATE_a922_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_8ed8_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2606_l2599_l2602_l2617_DUPLICATE_a922_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_3d4d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2599_l2627_l2623_l2617_l2610_l2606_l2602_DUPLICATE_6bec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_2ae1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2599_l2627_l2623_l2617_l2610_l2606_l2602_DUPLICATE_6bec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_da0b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2599_l2627_l2623_l2617_l2610_l2606_l2602_DUPLICATE_6bec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_8fa2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2599_l2627_l2623_l2617_l2610_l2606_l2602_DUPLICATE_6bec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_8ed8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2599_l2627_l2623_l2617_l2610_l2606_l2602_DUPLICATE_6bec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_8406_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2599_l2627_l2623_l2617_l2610_l2606_l2602_DUPLICATE_6bec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_83f4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2599_l2627_l2623_l2617_l2610_l2606_l2602_DUPLICATE_6bec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_3d4d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2606_l2599_l2610_l2602_DUPLICATE_1326_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_2ae1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2606_l2599_l2610_l2602_DUPLICATE_1326_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_da0b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2606_l2599_l2610_l2602_DUPLICATE_1326_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_8fa2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2606_l2599_l2610_l2602_DUPLICATE_1326_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2599_l2627_l2586_l2606_l2602_DUPLICATE_d939_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_3d4d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2599_l2627_l2586_l2606_l2602_DUPLICATE_d939_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_2ae1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2599_l2627_l2586_l2606_l2602_DUPLICATE_d939_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2606_c7_da0b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2599_l2627_l2586_l2606_l2602_DUPLICATE_d939_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_83f4_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2599_l2627_l2586_l2606_l2602_DUPLICATE_d939_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2586_c2_8dc1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2586_c2_8dc1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2586_c2_8dc1_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2586_c2_8dc1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_83f4_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2627_c7_83f4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_8fa2_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2612_c30_500e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2627_c7_83f4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_83f4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_83f4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_83f4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_83f4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_83f4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_83f4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_83f4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_83f4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2617_c7_8ed8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_8ed8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_8ed8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_8ed8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_8ed8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_8ed8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_8ed8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_8ed8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_8ed8_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2586_c2_8dc1] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2627_c7_83f4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2627_c7_83f4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_83f4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2627_c7_83f4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_83f4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2627_c7_83f4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_83f4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_83f4_return_output := result_u8_value_MUX_uxn_opcodes_h_l2627_c7_83f4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2610_c7_8fa2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_8fa2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_8fa2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_8fa2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_8fa2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_8fa2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_8fa2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_8fa2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_8fa2_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2610_c7_8fa2] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2610_c7_8fa2_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2610_c7_8fa2_cond;
     n16_high_MUX_uxn_opcodes_h_l2610_c7_8fa2_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2610_c7_8fa2_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2610_c7_8fa2_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2610_c7_8fa2_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2610_c7_8fa2_return_output := n16_high_MUX_uxn_opcodes_h_l2610_c7_8fa2_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2586_c2_8dc1] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2602_c7_2ae1] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2602_c7_2ae1_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2602_c7_2ae1_cond;
     t16_high_MUX_uxn_opcodes_h_l2602_c7_2ae1_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2602_c7_2ae1_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2602_c7_2ae1_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2602_c7_2ae1_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output := t16_high_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2627_c7_83f4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_83f4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_83f4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_83f4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_83f4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_83f4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_83f4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_83f4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_83f4_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2606_c7_da0b] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2606_c7_da0b_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2606_c7_da0b_cond;
     t16_low_MUX_uxn_opcodes_h_l2606_c7_da0b_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2606_c7_da0b_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2606_c7_da0b_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2606_c7_da0b_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output := t16_low_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2586_c2_8dc1] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2586_c2_8dc1] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2617_c7_8ed8] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2617_c7_8ed8_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2617_c7_8ed8_cond;
     n16_low_MUX_uxn_opcodes_h_l2617_c7_8ed8_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2617_c7_8ed8_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2617_c7_8ed8_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2617_c7_8ed8_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2617_c7_8ed8_return_output := n16_low_MUX_uxn_opcodes_h_l2617_c7_8ed8_return_output;

     -- Submodule level 2
     VAR_n16_high_MUX_uxn_opcodes_h_l2606_c7_da0b_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2610_c7_8fa2_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2610_c7_8fa2_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2617_c7_8ed8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_8406_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_83f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_da0b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_8fa2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_8fa2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_8ed8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_8406_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_83f4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_8406_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_83f4_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2599_c7_3d4d_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2602_c7_2ae1_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2623_c7_8406] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_8406_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_8406_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_8406_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_8406_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_8406_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_8406_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_8406_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_8406_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2602_c7_2ae1] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2602_c7_2ae1_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2602_c7_2ae1_cond;
     t16_low_MUX_uxn_opcodes_h_l2602_c7_2ae1_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2602_c7_2ae1_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2602_c7_2ae1_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2602_c7_2ae1_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output := t16_low_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2606_c7_da0b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_da0b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_da0b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_da0b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_da0b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_da0b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_da0b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2606_c7_da0b] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2606_c7_da0b_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2606_c7_da0b_cond;
     n16_high_MUX_uxn_opcodes_h_l2606_c7_da0b_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2606_c7_da0b_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2606_c7_da0b_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2606_c7_da0b_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output := n16_high_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2610_c7_8fa2] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2610_c7_8fa2_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2610_c7_8fa2_cond;
     n16_low_MUX_uxn_opcodes_h_l2610_c7_8fa2_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2610_c7_8fa2_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2610_c7_8fa2_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2610_c7_8fa2_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2610_c7_8fa2_return_output := n16_low_MUX_uxn_opcodes_h_l2610_c7_8fa2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2623_c7_8406] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_8406_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_8406_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_8406_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_8406_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_8406_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_8406_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_8406_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_8406_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2610_c7_8fa2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_8fa2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_8fa2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_8fa2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_8fa2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_8fa2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_8fa2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_8fa2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_8fa2_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2599_c7_3d4d] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2599_c7_3d4d_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2599_c7_3d4d_cond;
     t16_high_MUX_uxn_opcodes_h_l2599_c7_3d4d_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2599_c7_3d4d_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2599_c7_3d4d_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2599_c7_3d4d_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output := t16_high_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2623_c7_8406] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2623_c7_8406_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_8406_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2623_c7_8406_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_8406_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2623_c7_8406_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_8406_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_8406_return_output := result_u8_value_MUX_uxn_opcodes_h_l2623_c7_8406_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l2602_c7_2ae1_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2606_c7_da0b_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2610_c7_8fa2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_8ed8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_8406_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_2ae1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_da0b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_8fa2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_8ed8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_8406_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2617_c7_8ed8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_8406_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2599_c7_3d4d_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2602_c7_2ae1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_2ae1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_2ae1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_2ae1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_2ae1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_2ae1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_2ae1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2602_c7_2ae1] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2602_c7_2ae1_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2602_c7_2ae1_cond;
     n16_high_MUX_uxn_opcodes_h_l2602_c7_2ae1_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2602_c7_2ae1_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2602_c7_2ae1_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2602_c7_2ae1_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output := n16_high_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2617_c7_8ed8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_8ed8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_8ed8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_8ed8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_8ed8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_8ed8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_8ed8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_8ed8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_8ed8_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2606_c7_da0b] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2606_c7_da0b_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2606_c7_da0b_cond;
     n16_low_MUX_uxn_opcodes_h_l2606_c7_da0b_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2606_c7_da0b_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2606_c7_da0b_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2606_c7_da0b_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output := n16_low_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2586_c2_8dc1] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond;
     t16_high_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output := t16_high_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2606_c7_da0b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_da0b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_da0b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_da0b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_da0b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_da0b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_da0b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2617_c7_8ed8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2617_c7_8ed8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2617_c7_8ed8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2617_c7_8ed8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2617_c7_8ed8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2617_c7_8ed8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2617_c7_8ed8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2617_c7_8ed8_return_output := result_u8_value_MUX_uxn_opcodes_h_l2617_c7_8ed8_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2599_c7_3d4d] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2599_c7_3d4d_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2599_c7_3d4d_cond;
     t16_low_MUX_uxn_opcodes_h_l2599_c7_3d4d_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2599_c7_3d4d_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2599_c7_3d4d_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2599_c7_3d4d_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output := t16_low_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2617_c7_8ed8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_8ed8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_8ed8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_8ed8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_8ed8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_8ed8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_8ed8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_8ed8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_8ed8_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l2599_c7_3d4d_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2602_c7_2ae1_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_8fa2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_8ed8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_3d4d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_2ae1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_8fa2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_8ed8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c7_8fa2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2617_c7_8ed8_return_output;
     REG_VAR_t16_high := VAR_t16_high_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2602_c7_2ae1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_2ae1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_2ae1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_2ae1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_2ae1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_2ae1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_2ae1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2610_c7_8fa2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_8fa2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_8fa2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_8fa2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_8fa2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_8fa2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_8fa2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_8fa2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_8fa2_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2602_c7_2ae1] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2602_c7_2ae1_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2602_c7_2ae1_cond;
     n16_low_MUX_uxn_opcodes_h_l2602_c7_2ae1_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2602_c7_2ae1_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2602_c7_2ae1_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2602_c7_2ae1_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output := n16_low_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2610_c7_8fa2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_8fa2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_8fa2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_8fa2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_8fa2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_8fa2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_8fa2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_8fa2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_8fa2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2599_c7_3d4d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_3d4d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_3d4d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_3d4d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_3d4d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_3d4d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_3d4d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2586_c2_8dc1] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond;
     t16_low_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output := t16_low_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2610_c7_8fa2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2610_c7_8fa2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c7_8fa2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2610_c7_8fa2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c7_8fa2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2610_c7_8fa2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c7_8fa2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c7_8fa2_return_output := result_u8_value_MUX_uxn_opcodes_h_l2610_c7_8fa2_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2599_c7_3d4d] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2599_c7_3d4d_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2599_c7_3d4d_cond;
     n16_high_MUX_uxn_opcodes_h_l2599_c7_3d4d_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2599_c7_3d4d_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2599_c7_3d4d_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2599_c7_3d4d_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output := n16_high_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output;

     -- Submodule level 5
     VAR_n16_high_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2599_c7_3d4d_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_da0b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_8fa2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_3d4d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_da0b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_8fa2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2606_c7_da0b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c7_8fa2_return_output;
     REG_VAR_t16_low := VAR_t16_low_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2606_c7_da0b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_da0b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_da0b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_da0b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_da0b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_da0b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_da0b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2586_c2_8dc1] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond;
     n16_high_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output := n16_high_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2586_c2_8dc1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2599_c7_3d4d] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2599_c7_3d4d_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2599_c7_3d4d_cond;
     n16_low_MUX_uxn_opcodes_h_l2599_c7_3d4d_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2599_c7_3d4d_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2599_c7_3d4d_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2599_c7_3d4d_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output := n16_low_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2606_c7_da0b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2606_c7_da0b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2606_c7_da0b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2606_c7_da0b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2606_c7_da0b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2606_c7_da0b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2606_c7_da0b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2606_c7_da0b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_da0b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_da0b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_da0b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_da0b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_da0b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_da0b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2599_c7_3d4d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_3d4d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_3d4d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_3d4d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_3d4d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_3d4d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_3d4d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output;

     -- Submodule level 6
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_2ae1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_2ae1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_2ae1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2606_c7_da0b_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2586_c2_8dc1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2602_c7_2ae1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_2ae1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_2ae1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_2ae1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_2ae1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_2ae1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_2ae1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2602_c7_2ae1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2602_c7_2ae1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_2ae1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2602_c7_2ae1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_2ae1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2602_c7_2ae1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_2ae1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2602_c7_2ae1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_2ae1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_2ae1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_2ae1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_2ae1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_2ae1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_2ae1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2586_c2_8dc1] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond;
     n16_low_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output := n16_low_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output;

     -- Submodule level 7
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_3d4d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_3d4d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_3d4d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_2ae1_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2599_c7_3d4d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2599_c7_3d4d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_3d4d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2599_c7_3d4d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_3d4d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2599_c7_3d4d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_3d4d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2599_c7_3d4d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_3d4d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_3d4d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_3d4d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_3d4d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_3d4d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_3d4d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2599_c7_3d4d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_3d4d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_3d4d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_3d4d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_3d4d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_3d4d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_3d4d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_3d4d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2586_c2_8dc1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2586_c2_8dc1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2586_c2_8dc1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c2_8dc1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c2_8dc1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c2_8dc1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l2633_l2582_DUPLICATE_2cd7 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l2633_l2582_DUPLICATE_2cd7_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_243c(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_8dc1_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l2633_l2582_DUPLICATE_2cd7_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l2633_l2582_DUPLICATE_2cd7_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16_high <= REG_VAR_t16_high;
REG_COMB_t16_low <= REG_VAR_t16_low;
REG_COMB_n16_high <= REG_VAR_n16_high;
REG_COMB_n16_low <= REG_VAR_n16_low;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16_high <= REG_COMB_t16_high;
     t16_low <= REG_COMB_t16_low;
     n16_high <= REG_COMB_n16_high;
     n16_low <= REG_COMB_n16_low;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
