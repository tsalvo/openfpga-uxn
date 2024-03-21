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
-- BIN_OP_EQ[uxn_opcodes_h_l2586_c6_15ab]
signal BIN_OP_EQ_uxn_opcodes_h_l2586_c6_15ab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2586_c6_15ab_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2586_c6_15ab_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2586_c2_7d24]
signal t16_low_MUX_uxn_opcodes_h_l2586_c2_7d24_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2586_c2_7d24]
signal t16_high_MUX_uxn_opcodes_h_l2586_c2_7d24_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2586_c2_7d24]
signal n16_low_MUX_uxn_opcodes_h_l2586_c2_7d24_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2586_c2_7d24]
signal n16_high_MUX_uxn_opcodes_h_l2586_c2_7d24_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2586_c2_7d24]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_7d24_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2586_c2_7d24]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_7d24_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2586_c2_7d24]
signal result_u8_value_MUX_uxn_opcodes_h_l2586_c2_7d24_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2586_c2_7d24]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_7d24_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2586_c2_7d24]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_7d24_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2586_c2_7d24]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_7d24_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2586_c2_7d24]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_7d24_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2586_c2_7d24]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_7d24_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2586_c2_7d24]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_7d24_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2599_c11_8650]
signal BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8650_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8650_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8650_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2599_c7_b804]
signal t16_low_MUX_uxn_opcodes_h_l2599_c7_b804_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2599_c7_b804_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2599_c7_b804_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2599_c7_b804_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2599_c7_b804]
signal t16_high_MUX_uxn_opcodes_h_l2599_c7_b804_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2599_c7_b804_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2599_c7_b804_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2599_c7_b804_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2599_c7_b804]
signal n16_low_MUX_uxn_opcodes_h_l2599_c7_b804_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2599_c7_b804_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2599_c7_b804_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2599_c7_b804_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2599_c7_b804]
signal n16_high_MUX_uxn_opcodes_h_l2599_c7_b804_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2599_c7_b804_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2599_c7_b804_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2599_c7_b804_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2599_c7_b804]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_b804_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_b804_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_b804_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_b804_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2599_c7_b804]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_b804_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_b804_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_b804_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_b804_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2599_c7_b804]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_b804_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_b804_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_b804_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_b804_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2599_c7_b804]
signal result_u8_value_MUX_uxn_opcodes_h_l2599_c7_b804_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2599_c7_b804_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2599_c7_b804_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2599_c7_b804_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2599_c7_b804]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_b804_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_b804_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_b804_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_b804_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2602_c11_b369]
signal BIN_OP_EQ_uxn_opcodes_h_l2602_c11_b369_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2602_c11_b369_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2602_c11_b369_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2602_c7_5594]
signal t16_low_MUX_uxn_opcodes_h_l2602_c7_5594_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2602_c7_5594_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2602_c7_5594_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2602_c7_5594_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2602_c7_5594]
signal t16_high_MUX_uxn_opcodes_h_l2602_c7_5594_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2602_c7_5594_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2602_c7_5594_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2602_c7_5594_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2602_c7_5594]
signal n16_low_MUX_uxn_opcodes_h_l2602_c7_5594_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2602_c7_5594_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2602_c7_5594_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2602_c7_5594_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2602_c7_5594]
signal n16_high_MUX_uxn_opcodes_h_l2602_c7_5594_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2602_c7_5594_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2602_c7_5594_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2602_c7_5594_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2602_c7_5594]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_5594_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_5594_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_5594_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_5594_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2602_c7_5594]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_5594_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_5594_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_5594_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_5594_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2602_c7_5594]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_5594_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_5594_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_5594_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_5594_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2602_c7_5594]
signal result_u8_value_MUX_uxn_opcodes_h_l2602_c7_5594_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2602_c7_5594_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2602_c7_5594_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2602_c7_5594_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2602_c7_5594]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_5594_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_5594_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_5594_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_5594_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2606_c11_f496]
signal BIN_OP_EQ_uxn_opcodes_h_l2606_c11_f496_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2606_c11_f496_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2606_c11_f496_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2606_c7_922d]
signal t16_low_MUX_uxn_opcodes_h_l2606_c7_922d_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2606_c7_922d_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2606_c7_922d_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2606_c7_922d_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2606_c7_922d]
signal n16_low_MUX_uxn_opcodes_h_l2606_c7_922d_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2606_c7_922d_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2606_c7_922d_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2606_c7_922d_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2606_c7_922d]
signal n16_high_MUX_uxn_opcodes_h_l2606_c7_922d_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2606_c7_922d_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2606_c7_922d_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2606_c7_922d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2606_c7_922d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_922d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_922d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_922d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_922d_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2606_c7_922d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_922d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_922d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_922d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_922d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2606_c7_922d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_922d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_922d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_922d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_922d_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2606_c7_922d]
signal result_u8_value_MUX_uxn_opcodes_h_l2606_c7_922d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2606_c7_922d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2606_c7_922d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2606_c7_922d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2606_c7_922d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_922d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_922d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_922d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_922d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2610_c11_c479]
signal BIN_OP_EQ_uxn_opcodes_h_l2610_c11_c479_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2610_c11_c479_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2610_c11_c479_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2610_c7_d35a]
signal n16_low_MUX_uxn_opcodes_h_l2610_c7_d35a_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2610_c7_d35a_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2610_c7_d35a_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2610_c7_d35a_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2610_c7_d35a]
signal n16_high_MUX_uxn_opcodes_h_l2610_c7_d35a_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2610_c7_d35a_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2610_c7_d35a_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2610_c7_d35a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2610_c7_d35a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_d35a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_d35a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_d35a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_d35a_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2610_c7_d35a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_d35a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_d35a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_d35a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_d35a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2610_c7_d35a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_d35a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_d35a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_d35a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_d35a_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2610_c7_d35a]
signal result_u8_value_MUX_uxn_opcodes_h_l2610_c7_d35a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2610_c7_d35a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2610_c7_d35a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2610_c7_d35a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2610_c7_d35a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_d35a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_d35a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_d35a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_d35a_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2612_c30_5662]
signal sp_relative_shift_uxn_opcodes_h_l2612_c30_5662_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2612_c30_5662_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2612_c30_5662_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2612_c30_5662_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2617_c11_0adc]
signal BIN_OP_EQ_uxn_opcodes_h_l2617_c11_0adc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2617_c11_0adc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2617_c11_0adc_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2617_c7_6497]
signal n16_low_MUX_uxn_opcodes_h_l2617_c7_6497_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2617_c7_6497_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2617_c7_6497_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2617_c7_6497_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2617_c7_6497]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_6497_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_6497_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_6497_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_6497_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2617_c7_6497]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_6497_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_6497_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_6497_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_6497_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2617_c7_6497]
signal result_u8_value_MUX_uxn_opcodes_h_l2617_c7_6497_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2617_c7_6497_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2617_c7_6497_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2617_c7_6497_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2617_c7_6497]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_6497_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_6497_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_6497_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_6497_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2623_c11_5e2c]
signal BIN_OP_EQ_uxn_opcodes_h_l2623_c11_5e2c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2623_c11_5e2c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2623_c11_5e2c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2623_c7_7e0e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_7e0e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_7e0e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_7e0e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_7e0e_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2623_c7_7e0e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_7e0e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_7e0e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_7e0e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_7e0e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2623_c7_7e0e]
signal result_u8_value_MUX_uxn_opcodes_h_l2623_c7_7e0e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2623_c7_7e0e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2623_c7_7e0e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2623_c7_7e0e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2627_c11_5ded]
signal BIN_OP_EQ_uxn_opcodes_h_l2627_c11_5ded_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2627_c11_5ded_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2627_c11_5ded_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2627_c7_50d7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_50d7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_50d7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_50d7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_50d7_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2627_c7_50d7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_50d7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_50d7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_50d7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_50d7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2627_c7_50d7]
signal result_u8_value_MUX_uxn_opcodes_h_l2627_c7_50d7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2627_c7_50d7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2627_c7_50d7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2627_c7_50d7_return_output : unsigned(7 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_a6df( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_vram_write := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.is_stack_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2586_c6_15ab
BIN_OP_EQ_uxn_opcodes_h_l2586_c6_15ab : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2586_c6_15ab_left,
BIN_OP_EQ_uxn_opcodes_h_l2586_c6_15ab_right,
BIN_OP_EQ_uxn_opcodes_h_l2586_c6_15ab_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2586_c2_7d24
t16_low_MUX_uxn_opcodes_h_l2586_c2_7d24 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2586_c2_7d24_cond,
t16_low_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue,
t16_low_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse,
t16_low_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2586_c2_7d24
t16_high_MUX_uxn_opcodes_h_l2586_c2_7d24 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2586_c2_7d24_cond,
t16_high_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue,
t16_high_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse,
t16_high_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2586_c2_7d24
n16_low_MUX_uxn_opcodes_h_l2586_c2_7d24 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2586_c2_7d24_cond,
n16_low_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue,
n16_low_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse,
n16_low_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2586_c2_7d24
n16_high_MUX_uxn_opcodes_h_l2586_c2_7d24 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2586_c2_7d24_cond,
n16_high_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue,
n16_high_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse,
n16_high_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_7d24
result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_7d24 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_7d24_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_7d24
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_7d24 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_7d24_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2586_c2_7d24
result_u8_value_MUX_uxn_opcodes_h_l2586_c2_7d24 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2586_c2_7d24_cond,
result_u8_value_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_7d24
result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_7d24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_7d24_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_7d24
result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_7d24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_7d24_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_7d24
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_7d24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_7d24_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_7d24
result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_7d24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_7d24_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_7d24
result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_7d24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_7d24_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_7d24
result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_7d24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_7d24_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8650
BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8650 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8650_left,
BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8650_right,
BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8650_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2599_c7_b804
t16_low_MUX_uxn_opcodes_h_l2599_c7_b804 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2599_c7_b804_cond,
t16_low_MUX_uxn_opcodes_h_l2599_c7_b804_iftrue,
t16_low_MUX_uxn_opcodes_h_l2599_c7_b804_iffalse,
t16_low_MUX_uxn_opcodes_h_l2599_c7_b804_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2599_c7_b804
t16_high_MUX_uxn_opcodes_h_l2599_c7_b804 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2599_c7_b804_cond,
t16_high_MUX_uxn_opcodes_h_l2599_c7_b804_iftrue,
t16_high_MUX_uxn_opcodes_h_l2599_c7_b804_iffalse,
t16_high_MUX_uxn_opcodes_h_l2599_c7_b804_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2599_c7_b804
n16_low_MUX_uxn_opcodes_h_l2599_c7_b804 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2599_c7_b804_cond,
n16_low_MUX_uxn_opcodes_h_l2599_c7_b804_iftrue,
n16_low_MUX_uxn_opcodes_h_l2599_c7_b804_iffalse,
n16_low_MUX_uxn_opcodes_h_l2599_c7_b804_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2599_c7_b804
n16_high_MUX_uxn_opcodes_h_l2599_c7_b804 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2599_c7_b804_cond,
n16_high_MUX_uxn_opcodes_h_l2599_c7_b804_iftrue,
n16_high_MUX_uxn_opcodes_h_l2599_c7_b804_iffalse,
n16_high_MUX_uxn_opcodes_h_l2599_c7_b804_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_b804
result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_b804 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_b804_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_b804_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_b804_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_b804_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_b804
result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_b804 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_b804_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_b804_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_b804_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_b804_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_b804
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_b804 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_b804_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_b804_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_b804_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_b804_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2599_c7_b804
result_u8_value_MUX_uxn_opcodes_h_l2599_c7_b804 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2599_c7_b804_cond,
result_u8_value_MUX_uxn_opcodes_h_l2599_c7_b804_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2599_c7_b804_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2599_c7_b804_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_b804
result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_b804 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_b804_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_b804_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_b804_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_b804_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2602_c11_b369
BIN_OP_EQ_uxn_opcodes_h_l2602_c11_b369 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2602_c11_b369_left,
BIN_OP_EQ_uxn_opcodes_h_l2602_c11_b369_right,
BIN_OP_EQ_uxn_opcodes_h_l2602_c11_b369_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2602_c7_5594
t16_low_MUX_uxn_opcodes_h_l2602_c7_5594 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2602_c7_5594_cond,
t16_low_MUX_uxn_opcodes_h_l2602_c7_5594_iftrue,
t16_low_MUX_uxn_opcodes_h_l2602_c7_5594_iffalse,
t16_low_MUX_uxn_opcodes_h_l2602_c7_5594_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2602_c7_5594
t16_high_MUX_uxn_opcodes_h_l2602_c7_5594 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2602_c7_5594_cond,
t16_high_MUX_uxn_opcodes_h_l2602_c7_5594_iftrue,
t16_high_MUX_uxn_opcodes_h_l2602_c7_5594_iffalse,
t16_high_MUX_uxn_opcodes_h_l2602_c7_5594_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2602_c7_5594
n16_low_MUX_uxn_opcodes_h_l2602_c7_5594 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2602_c7_5594_cond,
n16_low_MUX_uxn_opcodes_h_l2602_c7_5594_iftrue,
n16_low_MUX_uxn_opcodes_h_l2602_c7_5594_iffalse,
n16_low_MUX_uxn_opcodes_h_l2602_c7_5594_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2602_c7_5594
n16_high_MUX_uxn_opcodes_h_l2602_c7_5594 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2602_c7_5594_cond,
n16_high_MUX_uxn_opcodes_h_l2602_c7_5594_iftrue,
n16_high_MUX_uxn_opcodes_h_l2602_c7_5594_iffalse,
n16_high_MUX_uxn_opcodes_h_l2602_c7_5594_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_5594
result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_5594 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_5594_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_5594_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_5594_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_5594_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_5594
result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_5594 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_5594_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_5594_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_5594_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_5594_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_5594
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_5594 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_5594_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_5594_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_5594_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_5594_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2602_c7_5594
result_u8_value_MUX_uxn_opcodes_h_l2602_c7_5594 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2602_c7_5594_cond,
result_u8_value_MUX_uxn_opcodes_h_l2602_c7_5594_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2602_c7_5594_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2602_c7_5594_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_5594
result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_5594 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_5594_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_5594_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_5594_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_5594_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2606_c11_f496
BIN_OP_EQ_uxn_opcodes_h_l2606_c11_f496 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2606_c11_f496_left,
BIN_OP_EQ_uxn_opcodes_h_l2606_c11_f496_right,
BIN_OP_EQ_uxn_opcodes_h_l2606_c11_f496_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2606_c7_922d
t16_low_MUX_uxn_opcodes_h_l2606_c7_922d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2606_c7_922d_cond,
t16_low_MUX_uxn_opcodes_h_l2606_c7_922d_iftrue,
t16_low_MUX_uxn_opcodes_h_l2606_c7_922d_iffalse,
t16_low_MUX_uxn_opcodes_h_l2606_c7_922d_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2606_c7_922d
n16_low_MUX_uxn_opcodes_h_l2606_c7_922d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2606_c7_922d_cond,
n16_low_MUX_uxn_opcodes_h_l2606_c7_922d_iftrue,
n16_low_MUX_uxn_opcodes_h_l2606_c7_922d_iffalse,
n16_low_MUX_uxn_opcodes_h_l2606_c7_922d_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2606_c7_922d
n16_high_MUX_uxn_opcodes_h_l2606_c7_922d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2606_c7_922d_cond,
n16_high_MUX_uxn_opcodes_h_l2606_c7_922d_iftrue,
n16_high_MUX_uxn_opcodes_h_l2606_c7_922d_iffalse,
n16_high_MUX_uxn_opcodes_h_l2606_c7_922d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_922d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_922d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_922d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_922d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_922d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_922d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_922d
result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_922d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_922d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_922d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_922d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_922d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_922d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_922d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_922d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_922d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_922d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_922d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2606_c7_922d
result_u8_value_MUX_uxn_opcodes_h_l2606_c7_922d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2606_c7_922d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2606_c7_922d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2606_c7_922d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2606_c7_922d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_922d
result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_922d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_922d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_922d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_922d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_922d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2610_c11_c479
BIN_OP_EQ_uxn_opcodes_h_l2610_c11_c479 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2610_c11_c479_left,
BIN_OP_EQ_uxn_opcodes_h_l2610_c11_c479_right,
BIN_OP_EQ_uxn_opcodes_h_l2610_c11_c479_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2610_c7_d35a
n16_low_MUX_uxn_opcodes_h_l2610_c7_d35a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2610_c7_d35a_cond,
n16_low_MUX_uxn_opcodes_h_l2610_c7_d35a_iftrue,
n16_low_MUX_uxn_opcodes_h_l2610_c7_d35a_iffalse,
n16_low_MUX_uxn_opcodes_h_l2610_c7_d35a_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2610_c7_d35a
n16_high_MUX_uxn_opcodes_h_l2610_c7_d35a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2610_c7_d35a_cond,
n16_high_MUX_uxn_opcodes_h_l2610_c7_d35a_iftrue,
n16_high_MUX_uxn_opcodes_h_l2610_c7_d35a_iffalse,
n16_high_MUX_uxn_opcodes_h_l2610_c7_d35a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_d35a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_d35a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_d35a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_d35a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_d35a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_d35a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_d35a
result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_d35a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_d35a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_d35a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_d35a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_d35a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_d35a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_d35a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_d35a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_d35a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_d35a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_d35a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2610_c7_d35a
result_u8_value_MUX_uxn_opcodes_h_l2610_c7_d35a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2610_c7_d35a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2610_c7_d35a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2610_c7_d35a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2610_c7_d35a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_d35a
result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_d35a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_d35a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_d35a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_d35a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_d35a_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2612_c30_5662
sp_relative_shift_uxn_opcodes_h_l2612_c30_5662 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2612_c30_5662_ins,
sp_relative_shift_uxn_opcodes_h_l2612_c30_5662_x,
sp_relative_shift_uxn_opcodes_h_l2612_c30_5662_y,
sp_relative_shift_uxn_opcodes_h_l2612_c30_5662_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2617_c11_0adc
BIN_OP_EQ_uxn_opcodes_h_l2617_c11_0adc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2617_c11_0adc_left,
BIN_OP_EQ_uxn_opcodes_h_l2617_c11_0adc_right,
BIN_OP_EQ_uxn_opcodes_h_l2617_c11_0adc_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2617_c7_6497
n16_low_MUX_uxn_opcodes_h_l2617_c7_6497 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2617_c7_6497_cond,
n16_low_MUX_uxn_opcodes_h_l2617_c7_6497_iftrue,
n16_low_MUX_uxn_opcodes_h_l2617_c7_6497_iffalse,
n16_low_MUX_uxn_opcodes_h_l2617_c7_6497_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_6497
result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_6497 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_6497_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_6497_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_6497_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_6497_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_6497
result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_6497 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_6497_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_6497_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_6497_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_6497_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2617_c7_6497
result_u8_value_MUX_uxn_opcodes_h_l2617_c7_6497 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2617_c7_6497_cond,
result_u8_value_MUX_uxn_opcodes_h_l2617_c7_6497_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2617_c7_6497_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2617_c7_6497_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_6497
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_6497 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_6497_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_6497_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_6497_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_6497_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2623_c11_5e2c
BIN_OP_EQ_uxn_opcodes_h_l2623_c11_5e2c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2623_c11_5e2c_left,
BIN_OP_EQ_uxn_opcodes_h_l2623_c11_5e2c_right,
BIN_OP_EQ_uxn_opcodes_h_l2623_c11_5e2c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_7e0e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_7e0e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_7e0e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_7e0e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_7e0e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_7e0e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_7e0e
result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_7e0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_7e0e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_7e0e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_7e0e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_7e0e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2623_c7_7e0e
result_u8_value_MUX_uxn_opcodes_h_l2623_c7_7e0e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2623_c7_7e0e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2623_c7_7e0e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2623_c7_7e0e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2623_c7_7e0e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2627_c11_5ded
BIN_OP_EQ_uxn_opcodes_h_l2627_c11_5ded : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2627_c11_5ded_left,
BIN_OP_EQ_uxn_opcodes_h_l2627_c11_5ded_right,
BIN_OP_EQ_uxn_opcodes_h_l2627_c11_5ded_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_50d7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_50d7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_50d7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_50d7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_50d7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_50d7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_50d7
result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_50d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_50d7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_50d7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_50d7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_50d7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2627_c7_50d7
result_u8_value_MUX_uxn_opcodes_h_l2627_c7_50d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2627_c7_50d7_cond,
result_u8_value_MUX_uxn_opcodes_h_l2627_c7_50d7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2627_c7_50d7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2627_c7_50d7_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2586_c6_15ab_return_output,
 t16_low_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output,
 t16_high_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output,
 n16_low_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output,
 n16_high_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8650_return_output,
 t16_low_MUX_uxn_opcodes_h_l2599_c7_b804_return_output,
 t16_high_MUX_uxn_opcodes_h_l2599_c7_b804_return_output,
 n16_low_MUX_uxn_opcodes_h_l2599_c7_b804_return_output,
 n16_high_MUX_uxn_opcodes_h_l2599_c7_b804_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_b804_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_b804_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_b804_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2599_c7_b804_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_b804_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2602_c11_b369_return_output,
 t16_low_MUX_uxn_opcodes_h_l2602_c7_5594_return_output,
 t16_high_MUX_uxn_opcodes_h_l2602_c7_5594_return_output,
 n16_low_MUX_uxn_opcodes_h_l2602_c7_5594_return_output,
 n16_high_MUX_uxn_opcodes_h_l2602_c7_5594_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_5594_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_5594_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_5594_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2602_c7_5594_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_5594_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2606_c11_f496_return_output,
 t16_low_MUX_uxn_opcodes_h_l2606_c7_922d_return_output,
 n16_low_MUX_uxn_opcodes_h_l2606_c7_922d_return_output,
 n16_high_MUX_uxn_opcodes_h_l2606_c7_922d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_922d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_922d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_922d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2606_c7_922d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_922d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2610_c11_c479_return_output,
 n16_low_MUX_uxn_opcodes_h_l2610_c7_d35a_return_output,
 n16_high_MUX_uxn_opcodes_h_l2610_c7_d35a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_d35a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_d35a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_d35a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2610_c7_d35a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_d35a_return_output,
 sp_relative_shift_uxn_opcodes_h_l2612_c30_5662_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2617_c11_0adc_return_output,
 n16_low_MUX_uxn_opcodes_h_l2617_c7_6497_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_6497_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_6497_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2617_c7_6497_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_6497_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2623_c11_5e2c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_7e0e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_7e0e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2623_c7_7e0e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2627_c11_5ded_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_50d7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_50d7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2627_c7_50d7_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_15ab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_15ab_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_15ab_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2599_c7_b804_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2586_c2_7d24_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2599_c7_b804_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2586_c2_7d24_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2599_c7_b804_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2586_c2_7d24_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2599_c7_b804_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2586_c2_7d24_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2591_c3_65d3 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_b804_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_7d24_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2596_c3_ea3f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_b804_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_7d24_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_b804_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c2_7d24_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_b804_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_7d24_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2586_c2_7d24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_7d24_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2586_c2_7d24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_7d24_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2586_c2_7d24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_7d24_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2586_c2_7d24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_7d24_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_b804_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_7d24_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8650_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8650_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8650_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2599_c7_b804_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2599_c7_b804_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2602_c7_5594_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2599_c7_b804_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2599_c7_b804_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2599_c7_b804_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2602_c7_5594_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2599_c7_b804_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2599_c7_b804_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2599_c7_b804_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2602_c7_5594_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2599_c7_b804_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2599_c7_b804_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2599_c7_b804_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2602_c7_5594_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2599_c7_b804_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_b804_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_b804_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_5594_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_b804_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_b804_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_b804_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_5594_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_b804_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_b804_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2600_c3_ce37 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_b804_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_5594_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_b804_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_b804_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_b804_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_5594_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_b804_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_b804_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_b804_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_5594_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_b804_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_b369_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_b369_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_b369_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2602_c7_5594_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2602_c7_5594_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2606_c7_922d_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2602_c7_5594_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2602_c7_5594_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2602_c7_5594_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2602_c7_5594_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2602_c7_5594_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2602_c7_5594_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2606_c7_922d_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2602_c7_5594_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2602_c7_5594_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2602_c7_5594_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2606_c7_922d_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2602_c7_5594_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_5594_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_5594_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_922d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_5594_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_5594_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_5594_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_922d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_5594_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_5594_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2604_c3_0be2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_5594_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_922d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_5594_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_5594_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_5594_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2606_c7_922d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_5594_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_5594_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_5594_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_922d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_5594_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_f496_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_f496_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_f496_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2606_c7_922d_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2606_c7_922d_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2606_c7_922d_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2606_c7_922d_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2606_c7_922d_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2610_c7_d35a_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2606_c7_922d_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2606_c7_922d_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2606_c7_922d_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2610_c7_d35a_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2606_c7_922d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_922d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_922d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_d35a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_922d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_922d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_922d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_d35a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_922d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_922d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2608_c3_8630 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_922d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_d35a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_922d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2606_c7_922d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2606_c7_922d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c7_d35a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2606_c7_922d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_922d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_922d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_d35a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_922d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_c479_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_c479_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_c479_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2610_c7_d35a_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2610_c7_d35a_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2617_c7_6497_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2610_c7_d35a_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2610_c7_d35a_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2610_c7_d35a_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2610_c7_d35a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_d35a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_d35a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_6497_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_d35a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_d35a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_d35a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_6497_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_d35a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_d35a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2614_c3_0056 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_d35a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_6497_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_d35a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c7_d35a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c7_d35a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2617_c7_6497_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c7_d35a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_d35a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_d35a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_d35a_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2612_c30_5662_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2612_c30_5662_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2612_c30_5662_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2612_c30_5662_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_0adc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_0adc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_0adc_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2617_c7_6497_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2617_c7_6497_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2617_c7_6497_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_6497_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2619_c3_4b31 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_6497_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_6497_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_6497_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_6497_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_7e0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_6497_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2617_c7_6497_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2617_c7_6497_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_7e0e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2617_c7_6497_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_6497_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2620_c3_c144 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_6497_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_7e0e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_6497_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_5e2c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_5e2c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_5e2c_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_7e0e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2624_c3_0ea3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_7e0e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_50d7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_7e0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_7e0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_7e0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_50d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_7e0e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_7e0e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_7e0e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_50d7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_7e0e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_5ded_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_5ded_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_5ded_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_50d7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2628_c3_923d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_50d7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2627_c7_50d7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_50d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_50d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_50d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_50d7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_50d7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_50d7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_50d7_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2606_l2602_l2599_l2627_l2586_DUPLICATE_aecc_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2599_l2602_l2617_l2606_DUPLICATE_89c2_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2623_l2617_l2610_l2606_l2602_l2599_l2627_DUPLICATE_387c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2599_l2610_l2602_l2606_DUPLICATE_85b2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l2582_l2633_DUPLICATE_e1af_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2620_c3_c144 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_6497_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2620_c3_c144;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2628_c3_923d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_50d7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2628_c3_923d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_5e2c_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_50d7_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_b369_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8650_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2596_c3_ea3f := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2596_c3_ea3f;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_c479_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2604_c3_0be2 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_5594_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2604_c3_0be2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_0adc_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2612_c30_5662_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2591_c3_65d3 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2591_c3_65d3;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_5ded_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2614_c3_0056 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_d35a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2614_c3_0056;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2619_c3_4b31 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_6497_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2619_c3_4b31;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2624_c3_0ea3 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_7e0e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2624_c3_0ea3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_f496_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l2612_c30_5662_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_d35a_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2608_c3_8630 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_922d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2608_c3_8630;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2600_c3_ce37 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_b804_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2600_c3_ce37;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_15ab_right := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2612_c30_5662_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2599_c7_b804_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2602_c7_5594_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2606_c7_922d_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2610_c7_d35a_iffalse := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_7e0e_iftrue := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2599_c7_b804_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2602_c7_5594_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2606_c7_922d_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2610_c7_d35a_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2617_c7_6497_iffalse := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_50d7_iftrue := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_15ab_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8650_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_b369_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_f496_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_c479_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_0adc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_5e2c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_5ded_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l2610_c7_d35a_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l2617_c7_6497_iftrue := VAR_previous_stack_read;
     VAR_t16_high_MUX_uxn_opcodes_h_l2602_c7_5594_iftrue := VAR_previous_stack_read;
     VAR_t16_low_MUX_uxn_opcodes_h_l2606_c7_922d_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c7_d35a_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2599_c7_b804_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2602_c7_5594_iffalse := t16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2617_c7_6497_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2599_c7_b804_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2602_c7_5594_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2606_c7_922d_iffalse := t16_low;
     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2586_c2_7d24] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2586_c2_7d24_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2606_l2602_l2599_l2627_l2586_DUPLICATE_aecc LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2606_l2602_l2599_l2627_l2586_DUPLICATE_aecc_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2617_c11_0adc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2617_c11_0adc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_0adc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2617_c11_0adc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_0adc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_0adc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2617_c11_0adc_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2627_c7_50d7] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2627_c7_50d7_return_output := result.stack_address_sp_offset;

     -- sp_relative_shift[uxn_opcodes_h_l2612_c30_5662] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2612_c30_5662_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2612_c30_5662_ins;
     sp_relative_shift_uxn_opcodes_h_l2612_c30_5662_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2612_c30_5662_x;
     sp_relative_shift_uxn_opcodes_h_l2612_c30_5662_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2612_c30_5662_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2612_c30_5662_return_output := sp_relative_shift_uxn_opcodes_h_l2612_c30_5662_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2610_c11_c479] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2610_c11_c479_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_c479_left;
     BIN_OP_EQ_uxn_opcodes_h_l2610_c11_c479_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_c479_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_c479_return_output := BIN_OP_EQ_uxn_opcodes_h_l2610_c11_c479_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2586_c2_7d24] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2586_c2_7d24_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l2599_c11_8650] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8650_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8650_left;
     BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8650_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8650_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8650_return_output := BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8650_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2602_c11_b369] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2602_c11_b369_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_b369_left;
     BIN_OP_EQ_uxn_opcodes_h_l2602_c11_b369_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_b369_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_b369_return_output := BIN_OP_EQ_uxn_opcodes_h_l2602_c11_b369_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2586_c6_15ab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2586_c6_15ab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_15ab_left;
     BIN_OP_EQ_uxn_opcodes_h_l2586_c6_15ab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_15ab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_15ab_return_output := BIN_OP_EQ_uxn_opcodes_h_l2586_c6_15ab_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2599_l2602_l2617_l2606_DUPLICATE_89c2 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2599_l2602_l2617_l2606_DUPLICATE_89c2_return_output := result.sp_relative_shift;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2586_c2_7d24] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2586_c2_7d24_return_output := result.is_ram_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2586_c2_7d24] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2586_c2_7d24_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l2606_c11_f496] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2606_c11_f496_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_f496_left;
     BIN_OP_EQ_uxn_opcodes_h_l2606_c11_f496_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_f496_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_f496_return_output := BIN_OP_EQ_uxn_opcodes_h_l2606_c11_f496_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2627_c11_5ded] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2627_c11_5ded_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_5ded_left;
     BIN_OP_EQ_uxn_opcodes_h_l2627_c11_5ded_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_5ded_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_5ded_return_output := BIN_OP_EQ_uxn_opcodes_h_l2627_c11_5ded_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2623_l2617_l2610_l2606_l2602_l2599_l2627_DUPLICATE_387c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2623_l2617_l2610_l2606_l2602_l2599_l2627_DUPLICATE_387c_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2599_l2610_l2602_l2606_DUPLICATE_85b2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2599_l2610_l2602_l2606_DUPLICATE_85b2_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2623_c11_5e2c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2623_c11_5e2c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_5e2c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2623_c11_5e2c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_5e2c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_5e2c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2623_c11_5e2c_return_output;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l2586_c2_7d24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_15ab_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2586_c2_7d24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_15ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_7d24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_15ab_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_7d24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_15ab_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_7d24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_15ab_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_7d24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_15ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_7d24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_15ab_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_7d24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_15ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_7d24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_15ab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_7d24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_15ab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c2_7d24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_15ab_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2586_c2_7d24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_15ab_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2586_c2_7d24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_15ab_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2599_c7_b804_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8650_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2599_c7_b804_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8650_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_b804_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8650_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_b804_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8650_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_b804_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8650_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_b804_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8650_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_b804_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8650_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2599_c7_b804_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8650_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2599_c7_b804_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_8650_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2602_c7_5594_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_b369_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2602_c7_5594_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_b369_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_5594_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_b369_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_5594_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_b369_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_5594_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_b369_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_5594_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_b369_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_5594_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_b369_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2602_c7_5594_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_b369_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2602_c7_5594_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_b369_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2606_c7_922d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_f496_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2606_c7_922d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_f496_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_922d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_f496_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_922d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_f496_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_922d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_f496_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_922d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_f496_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2606_c7_922d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_f496_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2606_c7_922d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_f496_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2610_c7_d35a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_c479_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2610_c7_d35a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_c479_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_d35a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_c479_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_d35a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_c479_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_d35a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_c479_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_d35a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_c479_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c7_d35a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_c479_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2617_c7_6497_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_0adc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_6497_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_0adc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_6497_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_0adc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_6497_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_0adc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2617_c7_6497_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_0adc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_7e0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_5e2c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_7e0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_5e2c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_7e0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_5e2c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_50d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_5ded_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_50d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_5ded_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_50d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_5ded_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_b804_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2599_l2602_l2617_l2606_DUPLICATE_89c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_5594_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2599_l2602_l2617_l2606_DUPLICATE_89c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_922d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2599_l2602_l2617_l2606_DUPLICATE_89c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_6497_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2599_l2602_l2617_l2606_DUPLICATE_89c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_b804_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2623_l2617_l2610_l2606_l2602_l2599_l2627_DUPLICATE_387c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_5594_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2623_l2617_l2610_l2606_l2602_l2599_l2627_DUPLICATE_387c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_922d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2623_l2617_l2610_l2606_l2602_l2599_l2627_DUPLICATE_387c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_d35a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2623_l2617_l2610_l2606_l2602_l2599_l2627_DUPLICATE_387c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_6497_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2623_l2617_l2610_l2606_l2602_l2599_l2627_DUPLICATE_387c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_7e0e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2623_l2617_l2610_l2606_l2602_l2599_l2627_DUPLICATE_387c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_50d7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2623_l2617_l2610_l2606_l2602_l2599_l2627_DUPLICATE_387c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_b804_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2599_l2610_l2602_l2606_DUPLICATE_85b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_5594_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2599_l2610_l2602_l2606_DUPLICATE_85b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_922d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2599_l2610_l2602_l2606_DUPLICATE_85b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_d35a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2599_l2610_l2602_l2606_DUPLICATE_85b2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2606_l2602_l2599_l2627_l2586_DUPLICATE_aecc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_b804_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2606_l2602_l2599_l2627_l2586_DUPLICATE_aecc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_5594_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2606_l2602_l2599_l2627_l2586_DUPLICATE_aecc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2606_c7_922d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2606_l2602_l2599_l2627_l2586_DUPLICATE_aecc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_50d7_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2606_l2602_l2599_l2627_l2586_DUPLICATE_aecc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2586_c2_7d24_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2586_c2_7d24_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2586_c2_7d24_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2586_c2_7d24_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_50d7_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2627_c7_50d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_d35a_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2612_c30_5662_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2627_c7_50d7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_50d7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_50d7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_50d7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_50d7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_50d7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_50d7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_50d7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_50d7_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2586_c2_7d24] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_7d24_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_7d24_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2610_c7_d35a] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2610_c7_d35a_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2610_c7_d35a_cond;
     n16_high_MUX_uxn_opcodes_h_l2610_c7_d35a_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2610_c7_d35a_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2610_c7_d35a_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2610_c7_d35a_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2610_c7_d35a_return_output := n16_high_MUX_uxn_opcodes_h_l2610_c7_d35a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2610_c7_d35a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_d35a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_d35a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_d35a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_d35a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_d35a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_d35a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_d35a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_d35a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2627_c7_50d7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2627_c7_50d7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_50d7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2627_c7_50d7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_50d7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2627_c7_50d7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_50d7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_50d7_return_output := result_u8_value_MUX_uxn_opcodes_h_l2627_c7_50d7_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2586_c2_7d24] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_7d24_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_7d24_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2617_c7_6497] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2617_c7_6497_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2617_c7_6497_cond;
     n16_low_MUX_uxn_opcodes_h_l2617_c7_6497_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2617_c7_6497_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2617_c7_6497_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2617_c7_6497_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2617_c7_6497_return_output := n16_low_MUX_uxn_opcodes_h_l2617_c7_6497_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2627_c7_50d7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_50d7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_50d7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_50d7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_50d7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_50d7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_50d7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_50d7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_50d7_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2586_c2_7d24] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_7d24_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_7d24_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2586_c2_7d24] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_7d24_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_7d24_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2602_c7_5594] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2602_c7_5594_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2602_c7_5594_cond;
     t16_high_MUX_uxn_opcodes_h_l2602_c7_5594_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2602_c7_5594_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2602_c7_5594_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2602_c7_5594_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2602_c7_5594_return_output := t16_high_MUX_uxn_opcodes_h_l2602_c7_5594_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2617_c7_6497] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_6497_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_6497_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_6497_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_6497_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_6497_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_6497_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_6497_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_6497_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2606_c7_922d] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2606_c7_922d_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2606_c7_922d_cond;
     t16_low_MUX_uxn_opcodes_h_l2606_c7_922d_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2606_c7_922d_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2606_c7_922d_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2606_c7_922d_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2606_c7_922d_return_output := t16_low_MUX_uxn_opcodes_h_l2606_c7_922d_return_output;

     -- Submodule level 2
     VAR_n16_high_MUX_uxn_opcodes_h_l2606_c7_922d_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2610_c7_d35a_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2610_c7_d35a_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2617_c7_6497_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_7e0e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_50d7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_922d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_d35a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_d35a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_6497_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_7e0e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_50d7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_7e0e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_50d7_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2599_c7_b804_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2602_c7_5594_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2602_c7_5594_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2606_c7_922d_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2610_c7_d35a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_d35a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_d35a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_d35a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_d35a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_d35a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_d35a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_d35a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_d35a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2623_c7_7e0e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_7e0e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_7e0e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_7e0e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_7e0e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_7e0e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_7e0e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_7e0e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_7e0e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2623_c7_7e0e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_7e0e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_7e0e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_7e0e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_7e0e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_7e0e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_7e0e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_7e0e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_7e0e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2606_c7_922d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_922d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_922d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_922d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_922d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_922d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_922d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_922d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_922d_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2610_c7_d35a] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2610_c7_d35a_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2610_c7_d35a_cond;
     n16_low_MUX_uxn_opcodes_h_l2610_c7_d35a_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2610_c7_d35a_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2610_c7_d35a_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2610_c7_d35a_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2610_c7_d35a_return_output := n16_low_MUX_uxn_opcodes_h_l2610_c7_d35a_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2602_c7_5594] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2602_c7_5594_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2602_c7_5594_cond;
     t16_low_MUX_uxn_opcodes_h_l2602_c7_5594_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2602_c7_5594_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2602_c7_5594_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2602_c7_5594_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2602_c7_5594_return_output := t16_low_MUX_uxn_opcodes_h_l2602_c7_5594_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2623_c7_7e0e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2623_c7_7e0e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_7e0e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2623_c7_7e0e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_7e0e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2623_c7_7e0e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_7e0e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_7e0e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2623_c7_7e0e_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2599_c7_b804] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2599_c7_b804_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2599_c7_b804_cond;
     t16_high_MUX_uxn_opcodes_h_l2599_c7_b804_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2599_c7_b804_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2599_c7_b804_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2599_c7_b804_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2599_c7_b804_return_output := t16_high_MUX_uxn_opcodes_h_l2599_c7_b804_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2606_c7_922d] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2606_c7_922d_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2606_c7_922d_cond;
     n16_high_MUX_uxn_opcodes_h_l2606_c7_922d_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2606_c7_922d_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2606_c7_922d_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2606_c7_922d_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2606_c7_922d_return_output := n16_high_MUX_uxn_opcodes_h_l2606_c7_922d_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l2602_c7_5594_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2606_c7_922d_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2606_c7_922d_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2610_c7_d35a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_6497_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_7e0e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_5594_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_922d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_922d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_d35a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_6497_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_7e0e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2617_c7_6497_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_7e0e_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2599_c7_b804_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2599_c7_b804_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2602_c7_5594_return_output;
     -- n16_high_MUX[uxn_opcodes_h_l2602_c7_5594] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2602_c7_5594_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2602_c7_5594_cond;
     n16_high_MUX_uxn_opcodes_h_l2602_c7_5594_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2602_c7_5594_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2602_c7_5594_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2602_c7_5594_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2602_c7_5594_return_output := n16_high_MUX_uxn_opcodes_h_l2602_c7_5594_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2606_c7_922d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_922d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_922d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_922d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_922d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_922d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_922d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_922d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_922d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2602_c7_5594] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_5594_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_5594_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_5594_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_5594_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_5594_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_5594_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_5594_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_5594_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2617_c7_6497] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_6497_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_6497_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_6497_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_6497_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_6497_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_6497_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_6497_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_6497_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2606_c7_922d] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2606_c7_922d_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2606_c7_922d_cond;
     n16_low_MUX_uxn_opcodes_h_l2606_c7_922d_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2606_c7_922d_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2606_c7_922d_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2606_c7_922d_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2606_c7_922d_return_output := n16_low_MUX_uxn_opcodes_h_l2606_c7_922d_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2586_c2_7d24] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2586_c2_7d24_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2586_c2_7d24_cond;
     t16_high_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output := t16_high_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2617_c7_6497] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2617_c7_6497_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2617_c7_6497_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2617_c7_6497_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2617_c7_6497_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2617_c7_6497_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2617_c7_6497_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2617_c7_6497_return_output := result_u8_value_MUX_uxn_opcodes_h_l2617_c7_6497_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2599_c7_b804] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2599_c7_b804_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2599_c7_b804_cond;
     t16_low_MUX_uxn_opcodes_h_l2599_c7_b804_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2599_c7_b804_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2599_c7_b804_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2599_c7_b804_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2599_c7_b804_return_output := t16_low_MUX_uxn_opcodes_h_l2599_c7_b804_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2617_c7_6497] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_6497_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_6497_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_6497_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_6497_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_6497_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_6497_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_6497_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_6497_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l2599_c7_b804_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2602_c7_5594_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2602_c7_5594_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2606_c7_922d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_d35a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_6497_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_b804_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_5594_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_5594_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_922d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_d35a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_6497_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c7_d35a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2617_c7_6497_return_output;
     REG_VAR_t16_high := VAR_t16_high_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2599_c7_b804_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2602_c7_5594] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_5594_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_5594_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_5594_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_5594_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_5594_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_5594_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_5594_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_5594_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2586_c2_7d24] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2586_c2_7d24_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2586_c2_7d24_cond;
     t16_low_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output := t16_low_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2610_c7_d35a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_d35a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_d35a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_d35a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_d35a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_d35a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_d35a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_d35a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_d35a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2610_c7_d35a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_d35a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_d35a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_d35a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_d35a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_d35a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_d35a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_d35a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_d35a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2599_c7_b804] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_b804_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_b804_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_b804_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_b804_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_b804_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_b804_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_b804_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_b804_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2602_c7_5594] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2602_c7_5594_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2602_c7_5594_cond;
     n16_low_MUX_uxn_opcodes_h_l2602_c7_5594_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2602_c7_5594_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2602_c7_5594_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2602_c7_5594_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2602_c7_5594_return_output := n16_low_MUX_uxn_opcodes_h_l2602_c7_5594_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2610_c7_d35a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2610_c7_d35a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c7_d35a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2610_c7_d35a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c7_d35a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2610_c7_d35a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c7_d35a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c7_d35a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2610_c7_d35a_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2599_c7_b804] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2599_c7_b804_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2599_c7_b804_cond;
     n16_high_MUX_uxn_opcodes_h_l2599_c7_b804_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2599_c7_b804_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2599_c7_b804_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2599_c7_b804_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2599_c7_b804_return_output := n16_high_MUX_uxn_opcodes_h_l2599_c7_b804_return_output;

     -- Submodule level 5
     VAR_n16_high_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2599_c7_b804_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2599_c7_b804_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2602_c7_5594_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_922d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_d35a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_b804_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_b804_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_5594_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_922d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_d35a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2606_c7_922d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c7_d35a_return_output;
     REG_VAR_t16_low := VAR_t16_low_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2606_c7_922d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2606_c7_922d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2606_c7_922d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2606_c7_922d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2606_c7_922d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2606_c7_922d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2606_c7_922d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2606_c7_922d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2606_c7_922d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2586_c2_7d24] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_7d24_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_7d24_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2599_c7_b804] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2599_c7_b804_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2599_c7_b804_cond;
     n16_low_MUX_uxn_opcodes_h_l2599_c7_b804_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2599_c7_b804_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2599_c7_b804_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2599_c7_b804_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2599_c7_b804_return_output := n16_low_MUX_uxn_opcodes_h_l2599_c7_b804_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2606_c7_922d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_922d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_922d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_922d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_922d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_922d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_922d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_922d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_922d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2606_c7_922d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_922d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_922d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_922d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_922d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_922d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_922d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_922d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_922d_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2586_c2_7d24] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2586_c2_7d24_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2586_c2_7d24_cond;
     n16_high_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output := n16_high_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2599_c7_b804] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_b804_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_b804_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_b804_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_b804_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_b804_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_b804_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_b804_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_b804_return_output;

     -- Submodule level 6
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2599_c7_b804_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_5594_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_922d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_b804_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_5594_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_922d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_5594_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2606_c7_922d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2602_c7_5594] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_5594_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_5594_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_5594_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_5594_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_5594_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_5594_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_5594_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_5594_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2602_c7_5594] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2602_c7_5594_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_5594_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2602_c7_5594_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_5594_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2602_c7_5594_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_5594_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_5594_return_output := result_u8_value_MUX_uxn_opcodes_h_l2602_c7_5594_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2586_c2_7d24] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_7d24_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_7d24_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2602_c7_5594] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_5594_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_5594_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_5594_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_5594_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_5594_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_5594_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_5594_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_5594_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2586_c2_7d24] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2586_c2_7d24_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2586_c2_7d24_cond;
     n16_low_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output := n16_low_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output;

     -- Submodule level 7
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_b804_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_5594_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_b804_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_5594_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_b804_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_5594_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2599_c7_b804] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_b804_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_b804_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_b804_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_b804_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_b804_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_b804_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_b804_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_b804_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2599_c7_b804] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2599_c7_b804_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_b804_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2599_c7_b804_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_b804_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2599_c7_b804_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_b804_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_b804_return_output := result_u8_value_MUX_uxn_opcodes_h_l2599_c7_b804_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2599_c7_b804] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_b804_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_b804_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_b804_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_b804_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_b804_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_b804_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_b804_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_b804_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_b804_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_b804_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_b804_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2586_c2_7d24] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_7d24_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_7d24_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2586_c2_7d24] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_7d24_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_7d24_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2586_c2_7d24] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2586_c2_7d24_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c2_7d24_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c2_7d24_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c2_7d24_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output := result_u8_value_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l2582_l2633_DUPLICATE_e1af LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l2582_l2633_DUPLICATE_e1af_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a6df(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_7d24_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l2582_l2633_DUPLICATE_e1af_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l2582_l2633_DUPLICATE_e1af_return_output;
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
