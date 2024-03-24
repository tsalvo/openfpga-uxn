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
-- BIN_OP_EQ[uxn_opcodes_h_l2586_c6_9804]
signal BIN_OP_EQ_uxn_opcodes_h_l2586_c6_9804_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2586_c6_9804_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2586_c6_9804_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2586_c2_6dce]
signal t16_low_MUX_uxn_opcodes_h_l2586_c2_6dce_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2586_c2_6dce]
signal n16_low_MUX_uxn_opcodes_h_l2586_c2_6dce_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2586_c2_6dce]
signal n16_high_MUX_uxn_opcodes_h_l2586_c2_6dce_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2586_c2_6dce]
signal t16_high_MUX_uxn_opcodes_h_l2586_c2_6dce_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2586_c2_6dce]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_6dce_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2586_c2_6dce]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_6dce_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2586_c2_6dce]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_6dce_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2586_c2_6dce]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_6dce_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2586_c2_6dce]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_6dce_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2586_c2_6dce]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_6dce_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2586_c2_6dce]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_6dce_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2586_c2_6dce]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_6dce_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2586_c2_6dce]
signal result_u8_value_MUX_uxn_opcodes_h_l2586_c2_6dce_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2599_c11_7310]
signal BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7310_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7310_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7310_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2599_c7_f2f0]
signal t16_low_MUX_uxn_opcodes_h_l2599_c7_f2f0_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2599_c7_f2f0_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2599_c7_f2f0_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2599_c7_f2f0]
signal n16_low_MUX_uxn_opcodes_h_l2599_c7_f2f0_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2599_c7_f2f0_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2599_c7_f2f0_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2599_c7_f2f0]
signal n16_high_MUX_uxn_opcodes_h_l2599_c7_f2f0_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2599_c7_f2f0_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2599_c7_f2f0_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2599_c7_f2f0]
signal t16_high_MUX_uxn_opcodes_h_l2599_c7_f2f0_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2599_c7_f2f0_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2599_c7_f2f0_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2599_c7_f2f0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_f2f0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_f2f0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_f2f0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2599_c7_f2f0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_f2f0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_f2f0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_f2f0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2599_c7_f2f0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_f2f0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_f2f0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_f2f0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2599_c7_f2f0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_f2f0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_f2f0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_f2f0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2599_c7_f2f0]
signal result_u8_value_MUX_uxn_opcodes_h_l2599_c7_f2f0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2599_c7_f2f0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2599_c7_f2f0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2602_c11_f1af]
signal BIN_OP_EQ_uxn_opcodes_h_l2602_c11_f1af_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2602_c11_f1af_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2602_c11_f1af_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2602_c7_5755]
signal t16_low_MUX_uxn_opcodes_h_l2602_c7_5755_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2602_c7_5755_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2602_c7_5755_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2602_c7_5755_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2602_c7_5755]
signal n16_low_MUX_uxn_opcodes_h_l2602_c7_5755_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2602_c7_5755_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2602_c7_5755_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2602_c7_5755_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2602_c7_5755]
signal n16_high_MUX_uxn_opcodes_h_l2602_c7_5755_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2602_c7_5755_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2602_c7_5755_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2602_c7_5755_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2602_c7_5755]
signal t16_high_MUX_uxn_opcodes_h_l2602_c7_5755_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2602_c7_5755_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2602_c7_5755_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2602_c7_5755_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2602_c7_5755]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_5755_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_5755_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_5755_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_5755_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2602_c7_5755]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_5755_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_5755_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_5755_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_5755_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2602_c7_5755]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_5755_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_5755_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_5755_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_5755_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2602_c7_5755]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_5755_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_5755_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_5755_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_5755_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2602_c7_5755]
signal result_u8_value_MUX_uxn_opcodes_h_l2602_c7_5755_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2602_c7_5755_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2602_c7_5755_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2602_c7_5755_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2606_c11_ded8]
signal BIN_OP_EQ_uxn_opcodes_h_l2606_c11_ded8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2606_c11_ded8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2606_c11_ded8_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2606_c7_b44d]
signal t16_low_MUX_uxn_opcodes_h_l2606_c7_b44d_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2606_c7_b44d_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2606_c7_b44d_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2606_c7_b44d]
signal n16_low_MUX_uxn_opcodes_h_l2606_c7_b44d_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2606_c7_b44d_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2606_c7_b44d_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2606_c7_b44d]
signal n16_high_MUX_uxn_opcodes_h_l2606_c7_b44d_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2606_c7_b44d_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2606_c7_b44d_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2606_c7_b44d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_b44d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_b44d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_b44d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2606_c7_b44d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_b44d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_b44d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_b44d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2606_c7_b44d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_b44d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_b44d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_b44d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2606_c7_b44d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_b44d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_b44d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_b44d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2606_c7_b44d]
signal result_u8_value_MUX_uxn_opcodes_h_l2606_c7_b44d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2606_c7_b44d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2606_c7_b44d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2610_c11_3adc]
signal BIN_OP_EQ_uxn_opcodes_h_l2610_c11_3adc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2610_c11_3adc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2610_c11_3adc_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2610_c7_63b0]
signal n16_low_MUX_uxn_opcodes_h_l2610_c7_63b0_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2610_c7_63b0_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2610_c7_63b0_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2610_c7_63b0_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2610_c7_63b0]
signal n16_high_MUX_uxn_opcodes_h_l2610_c7_63b0_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2610_c7_63b0_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2610_c7_63b0_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2610_c7_63b0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2610_c7_63b0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_63b0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_63b0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_63b0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_63b0_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2610_c7_63b0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_63b0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_63b0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_63b0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_63b0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2610_c7_63b0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_63b0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_63b0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_63b0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_63b0_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2610_c7_63b0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_63b0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_63b0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_63b0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_63b0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2610_c7_63b0]
signal result_u8_value_MUX_uxn_opcodes_h_l2610_c7_63b0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2610_c7_63b0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2610_c7_63b0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2610_c7_63b0_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2612_c30_bdc3]
signal sp_relative_shift_uxn_opcodes_h_l2612_c30_bdc3_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2612_c30_bdc3_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2612_c30_bdc3_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2612_c30_bdc3_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2617_c11_fc73]
signal BIN_OP_EQ_uxn_opcodes_h_l2617_c11_fc73_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2617_c11_fc73_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2617_c11_fc73_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2617_c7_79d7]
signal n16_low_MUX_uxn_opcodes_h_l2617_c7_79d7_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2617_c7_79d7_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2617_c7_79d7_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2617_c7_79d7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2617_c7_79d7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_79d7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_79d7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_79d7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_79d7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2617_c7_79d7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_79d7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_79d7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_79d7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_79d7_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2617_c7_79d7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_79d7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_79d7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_79d7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_79d7_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2617_c7_79d7]
signal result_u8_value_MUX_uxn_opcodes_h_l2617_c7_79d7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2617_c7_79d7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2617_c7_79d7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2617_c7_79d7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2623_c11_ea76]
signal BIN_OP_EQ_uxn_opcodes_h_l2623_c11_ea76_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2623_c11_ea76_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2623_c11_ea76_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2623_c7_87e1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_87e1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_87e1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_87e1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_87e1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2623_c7_87e1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_87e1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_87e1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_87e1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_87e1_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2623_c7_87e1]
signal result_u8_value_MUX_uxn_opcodes_h_l2623_c7_87e1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2623_c7_87e1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2623_c7_87e1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2623_c7_87e1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2627_c11_09ec]
signal BIN_OP_EQ_uxn_opcodes_h_l2627_c11_09ec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2627_c11_09ec_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2627_c11_09ec_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2627_c7_1f6f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_1f6f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_1f6f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_1f6f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_1f6f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2627_c7_1f6f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_1f6f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_1f6f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_1f6f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_1f6f_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2627_c7_1f6f]
signal result_u8_value_MUX_uxn_opcodes_h_l2627_c7_1f6f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2627_c7_1f6f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2627_c7_1f6f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2627_c7_1f6f_return_output : unsigned(7 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2586_c6_9804
BIN_OP_EQ_uxn_opcodes_h_l2586_c6_9804 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2586_c6_9804_left,
BIN_OP_EQ_uxn_opcodes_h_l2586_c6_9804_right,
BIN_OP_EQ_uxn_opcodes_h_l2586_c6_9804_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2586_c2_6dce
t16_low_MUX_uxn_opcodes_h_l2586_c2_6dce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2586_c2_6dce_cond,
t16_low_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue,
t16_low_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse,
t16_low_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2586_c2_6dce
n16_low_MUX_uxn_opcodes_h_l2586_c2_6dce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2586_c2_6dce_cond,
n16_low_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue,
n16_low_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse,
n16_low_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2586_c2_6dce
n16_high_MUX_uxn_opcodes_h_l2586_c2_6dce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2586_c2_6dce_cond,
n16_high_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue,
n16_high_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse,
n16_high_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2586_c2_6dce
t16_high_MUX_uxn_opcodes_h_l2586_c2_6dce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2586_c2_6dce_cond,
t16_high_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue,
t16_high_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse,
t16_high_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_6dce
result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_6dce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_6dce_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_6dce
result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_6dce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_6dce_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_6dce
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_6dce : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_6dce_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_6dce
result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_6dce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_6dce_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_6dce
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_6dce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_6dce_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_6dce
result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_6dce : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_6dce_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_6dce
result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_6dce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_6dce_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_6dce
result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_6dce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_6dce_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2586_c2_6dce
result_u8_value_MUX_uxn_opcodes_h_l2586_c2_6dce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2586_c2_6dce_cond,
result_u8_value_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7310
BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7310 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7310_left,
BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7310_right,
BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7310_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2599_c7_f2f0
t16_low_MUX_uxn_opcodes_h_l2599_c7_f2f0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2599_c7_f2f0_cond,
t16_low_MUX_uxn_opcodes_h_l2599_c7_f2f0_iftrue,
t16_low_MUX_uxn_opcodes_h_l2599_c7_f2f0_iffalse,
t16_low_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2599_c7_f2f0
n16_low_MUX_uxn_opcodes_h_l2599_c7_f2f0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2599_c7_f2f0_cond,
n16_low_MUX_uxn_opcodes_h_l2599_c7_f2f0_iftrue,
n16_low_MUX_uxn_opcodes_h_l2599_c7_f2f0_iffalse,
n16_low_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2599_c7_f2f0
n16_high_MUX_uxn_opcodes_h_l2599_c7_f2f0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2599_c7_f2f0_cond,
n16_high_MUX_uxn_opcodes_h_l2599_c7_f2f0_iftrue,
n16_high_MUX_uxn_opcodes_h_l2599_c7_f2f0_iffalse,
n16_high_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2599_c7_f2f0
t16_high_MUX_uxn_opcodes_h_l2599_c7_f2f0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2599_c7_f2f0_cond,
t16_high_MUX_uxn_opcodes_h_l2599_c7_f2f0_iftrue,
t16_high_MUX_uxn_opcodes_h_l2599_c7_f2f0_iffalse,
t16_high_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_f2f0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_f2f0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_f2f0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_f2f0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_f2f0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_f2f0
result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_f2f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_f2f0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_f2f0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_f2f0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_f2f0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_f2f0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_f2f0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_f2f0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_f2f0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_f2f0
result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_f2f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_f2f0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_f2f0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_f2f0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2599_c7_f2f0
result_u8_value_MUX_uxn_opcodes_h_l2599_c7_f2f0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2599_c7_f2f0_cond,
result_u8_value_MUX_uxn_opcodes_h_l2599_c7_f2f0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2599_c7_f2f0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2602_c11_f1af
BIN_OP_EQ_uxn_opcodes_h_l2602_c11_f1af : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2602_c11_f1af_left,
BIN_OP_EQ_uxn_opcodes_h_l2602_c11_f1af_right,
BIN_OP_EQ_uxn_opcodes_h_l2602_c11_f1af_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2602_c7_5755
t16_low_MUX_uxn_opcodes_h_l2602_c7_5755 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2602_c7_5755_cond,
t16_low_MUX_uxn_opcodes_h_l2602_c7_5755_iftrue,
t16_low_MUX_uxn_opcodes_h_l2602_c7_5755_iffalse,
t16_low_MUX_uxn_opcodes_h_l2602_c7_5755_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2602_c7_5755
n16_low_MUX_uxn_opcodes_h_l2602_c7_5755 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2602_c7_5755_cond,
n16_low_MUX_uxn_opcodes_h_l2602_c7_5755_iftrue,
n16_low_MUX_uxn_opcodes_h_l2602_c7_5755_iffalse,
n16_low_MUX_uxn_opcodes_h_l2602_c7_5755_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2602_c7_5755
n16_high_MUX_uxn_opcodes_h_l2602_c7_5755 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2602_c7_5755_cond,
n16_high_MUX_uxn_opcodes_h_l2602_c7_5755_iftrue,
n16_high_MUX_uxn_opcodes_h_l2602_c7_5755_iffalse,
n16_high_MUX_uxn_opcodes_h_l2602_c7_5755_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2602_c7_5755
t16_high_MUX_uxn_opcodes_h_l2602_c7_5755 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2602_c7_5755_cond,
t16_high_MUX_uxn_opcodes_h_l2602_c7_5755_iftrue,
t16_high_MUX_uxn_opcodes_h_l2602_c7_5755_iffalse,
t16_high_MUX_uxn_opcodes_h_l2602_c7_5755_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_5755
result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_5755 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_5755_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_5755_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_5755_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_5755_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_5755
result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_5755 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_5755_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_5755_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_5755_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_5755_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_5755
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_5755 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_5755_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_5755_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_5755_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_5755_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_5755
result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_5755 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_5755_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_5755_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_5755_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_5755_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2602_c7_5755
result_u8_value_MUX_uxn_opcodes_h_l2602_c7_5755 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2602_c7_5755_cond,
result_u8_value_MUX_uxn_opcodes_h_l2602_c7_5755_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2602_c7_5755_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2602_c7_5755_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2606_c11_ded8
BIN_OP_EQ_uxn_opcodes_h_l2606_c11_ded8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2606_c11_ded8_left,
BIN_OP_EQ_uxn_opcodes_h_l2606_c11_ded8_right,
BIN_OP_EQ_uxn_opcodes_h_l2606_c11_ded8_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2606_c7_b44d
t16_low_MUX_uxn_opcodes_h_l2606_c7_b44d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2606_c7_b44d_cond,
t16_low_MUX_uxn_opcodes_h_l2606_c7_b44d_iftrue,
t16_low_MUX_uxn_opcodes_h_l2606_c7_b44d_iffalse,
t16_low_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2606_c7_b44d
n16_low_MUX_uxn_opcodes_h_l2606_c7_b44d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2606_c7_b44d_cond,
n16_low_MUX_uxn_opcodes_h_l2606_c7_b44d_iftrue,
n16_low_MUX_uxn_opcodes_h_l2606_c7_b44d_iffalse,
n16_low_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2606_c7_b44d
n16_high_MUX_uxn_opcodes_h_l2606_c7_b44d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2606_c7_b44d_cond,
n16_high_MUX_uxn_opcodes_h_l2606_c7_b44d_iftrue,
n16_high_MUX_uxn_opcodes_h_l2606_c7_b44d_iffalse,
n16_high_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_b44d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_b44d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_b44d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_b44d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_b44d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_b44d
result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_b44d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_b44d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_b44d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_b44d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_b44d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_b44d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_b44d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_b44d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_b44d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_b44d
result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_b44d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_b44d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_b44d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_b44d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2606_c7_b44d
result_u8_value_MUX_uxn_opcodes_h_l2606_c7_b44d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2606_c7_b44d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2606_c7_b44d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2606_c7_b44d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2610_c11_3adc
BIN_OP_EQ_uxn_opcodes_h_l2610_c11_3adc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2610_c11_3adc_left,
BIN_OP_EQ_uxn_opcodes_h_l2610_c11_3adc_right,
BIN_OP_EQ_uxn_opcodes_h_l2610_c11_3adc_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2610_c7_63b0
n16_low_MUX_uxn_opcodes_h_l2610_c7_63b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2610_c7_63b0_cond,
n16_low_MUX_uxn_opcodes_h_l2610_c7_63b0_iftrue,
n16_low_MUX_uxn_opcodes_h_l2610_c7_63b0_iffalse,
n16_low_MUX_uxn_opcodes_h_l2610_c7_63b0_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2610_c7_63b0
n16_high_MUX_uxn_opcodes_h_l2610_c7_63b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2610_c7_63b0_cond,
n16_high_MUX_uxn_opcodes_h_l2610_c7_63b0_iftrue,
n16_high_MUX_uxn_opcodes_h_l2610_c7_63b0_iffalse,
n16_high_MUX_uxn_opcodes_h_l2610_c7_63b0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_63b0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_63b0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_63b0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_63b0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_63b0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_63b0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_63b0
result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_63b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_63b0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_63b0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_63b0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_63b0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_63b0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_63b0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_63b0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_63b0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_63b0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_63b0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_63b0
result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_63b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_63b0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_63b0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_63b0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_63b0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2610_c7_63b0
result_u8_value_MUX_uxn_opcodes_h_l2610_c7_63b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2610_c7_63b0_cond,
result_u8_value_MUX_uxn_opcodes_h_l2610_c7_63b0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2610_c7_63b0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2610_c7_63b0_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2612_c30_bdc3
sp_relative_shift_uxn_opcodes_h_l2612_c30_bdc3 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2612_c30_bdc3_ins,
sp_relative_shift_uxn_opcodes_h_l2612_c30_bdc3_x,
sp_relative_shift_uxn_opcodes_h_l2612_c30_bdc3_y,
sp_relative_shift_uxn_opcodes_h_l2612_c30_bdc3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2617_c11_fc73
BIN_OP_EQ_uxn_opcodes_h_l2617_c11_fc73 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2617_c11_fc73_left,
BIN_OP_EQ_uxn_opcodes_h_l2617_c11_fc73_right,
BIN_OP_EQ_uxn_opcodes_h_l2617_c11_fc73_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2617_c7_79d7
n16_low_MUX_uxn_opcodes_h_l2617_c7_79d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2617_c7_79d7_cond,
n16_low_MUX_uxn_opcodes_h_l2617_c7_79d7_iftrue,
n16_low_MUX_uxn_opcodes_h_l2617_c7_79d7_iffalse,
n16_low_MUX_uxn_opcodes_h_l2617_c7_79d7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_79d7
result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_79d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_79d7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_79d7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_79d7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_79d7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_79d7
result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_79d7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_79d7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_79d7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_79d7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_79d7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_79d7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_79d7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_79d7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_79d7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_79d7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_79d7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2617_c7_79d7
result_u8_value_MUX_uxn_opcodes_h_l2617_c7_79d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2617_c7_79d7_cond,
result_u8_value_MUX_uxn_opcodes_h_l2617_c7_79d7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2617_c7_79d7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2617_c7_79d7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2623_c11_ea76
BIN_OP_EQ_uxn_opcodes_h_l2623_c11_ea76 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2623_c11_ea76_left,
BIN_OP_EQ_uxn_opcodes_h_l2623_c11_ea76_right,
BIN_OP_EQ_uxn_opcodes_h_l2623_c11_ea76_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_87e1
result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_87e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_87e1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_87e1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_87e1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_87e1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_87e1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_87e1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_87e1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_87e1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_87e1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_87e1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2623_c7_87e1
result_u8_value_MUX_uxn_opcodes_h_l2623_c7_87e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2623_c7_87e1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2623_c7_87e1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2623_c7_87e1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2623_c7_87e1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2627_c11_09ec
BIN_OP_EQ_uxn_opcodes_h_l2627_c11_09ec : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2627_c11_09ec_left,
BIN_OP_EQ_uxn_opcodes_h_l2627_c11_09ec_right,
BIN_OP_EQ_uxn_opcodes_h_l2627_c11_09ec_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_1f6f
result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_1f6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_1f6f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_1f6f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_1f6f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_1f6f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_1f6f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_1f6f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_1f6f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_1f6f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_1f6f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_1f6f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2627_c7_1f6f
result_u8_value_MUX_uxn_opcodes_h_l2627_c7_1f6f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2627_c7_1f6f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2627_c7_1f6f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2627_c7_1f6f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2627_c7_1f6f_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2586_c6_9804_return_output,
 t16_low_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output,
 n16_low_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output,
 n16_high_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output,
 t16_high_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7310_return_output,
 t16_low_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output,
 n16_low_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output,
 n16_high_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output,
 t16_high_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2602_c11_f1af_return_output,
 t16_low_MUX_uxn_opcodes_h_l2602_c7_5755_return_output,
 n16_low_MUX_uxn_opcodes_h_l2602_c7_5755_return_output,
 n16_high_MUX_uxn_opcodes_h_l2602_c7_5755_return_output,
 t16_high_MUX_uxn_opcodes_h_l2602_c7_5755_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_5755_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_5755_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_5755_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_5755_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2602_c7_5755_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2606_c11_ded8_return_output,
 t16_low_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output,
 n16_low_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output,
 n16_high_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2610_c11_3adc_return_output,
 n16_low_MUX_uxn_opcodes_h_l2610_c7_63b0_return_output,
 n16_high_MUX_uxn_opcodes_h_l2610_c7_63b0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_63b0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_63b0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_63b0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_63b0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2610_c7_63b0_return_output,
 sp_relative_shift_uxn_opcodes_h_l2612_c30_bdc3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2617_c11_fc73_return_output,
 n16_low_MUX_uxn_opcodes_h_l2617_c7_79d7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_79d7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_79d7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_79d7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2617_c7_79d7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2623_c11_ea76_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_87e1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_87e1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2623_c7_87e1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2627_c11_09ec_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_1f6f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_1f6f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2627_c7_1f6f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_9804_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_9804_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_9804_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2586_c2_6dce_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2586_c2_6dce_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2586_c2_6dce_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2586_c2_6dce_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_6dce_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2586_c2_6dce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_6dce_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2596_c3_3fc8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_6dce_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_6dce_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2586_c2_6dce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_6dce_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2591_c3_22e1 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_6dce_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2586_c2_6dce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_6dce_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2586_c2_6dce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_6dce_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c2_6dce_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7310_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7310_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7310_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2599_c7_f2f0_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2599_c7_f2f0_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2602_c7_5755_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2599_c7_f2f0_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2599_c7_f2f0_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2599_c7_f2f0_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2602_c7_5755_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2599_c7_f2f0_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2599_c7_f2f0_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2599_c7_f2f0_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2602_c7_5755_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2599_c7_f2f0_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2599_c7_f2f0_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2599_c7_f2f0_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2602_c7_5755_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2599_c7_f2f0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_f2f0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_f2f0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_5755_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_f2f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_f2f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_f2f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_5755_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_f2f0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_f2f0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2600_c3_3cec : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_f2f0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_5755_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_f2f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_f2f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_f2f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_5755_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_f2f0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_f2f0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_f2f0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_5755_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_f2f0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_f1af_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_f1af_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_f1af_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2602_c7_5755_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2602_c7_5755_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2602_c7_5755_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2602_c7_5755_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2602_c7_5755_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2602_c7_5755_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2602_c7_5755_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2602_c7_5755_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2602_c7_5755_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2602_c7_5755_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2602_c7_5755_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2602_c7_5755_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_5755_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_5755_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_5755_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_5755_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_5755_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_5755_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_5755_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2604_c3_b0ae : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_5755_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_5755_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_5755_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_5755_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_5755_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_5755_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_5755_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_5755_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_ded8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_ded8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_ded8_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2606_c7_b44d_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2606_c7_b44d_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2606_c7_b44d_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2606_c7_b44d_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2606_c7_b44d_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2610_c7_63b0_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2606_c7_b44d_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2606_c7_b44d_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2606_c7_b44d_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2610_c7_63b0_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2606_c7_b44d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_b44d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_b44d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_63b0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_b44d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_b44d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_b44d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_63b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_b44d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_b44d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2608_c3_4503 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_b44d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_63b0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_b44d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_b44d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_b44d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_63b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_b44d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2606_c7_b44d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2606_c7_b44d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c7_63b0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2606_c7_b44d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_3adc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_3adc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_3adc_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2610_c7_63b0_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2610_c7_63b0_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2617_c7_79d7_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2610_c7_63b0_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2610_c7_63b0_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2610_c7_63b0_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2610_c7_63b0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_63b0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_63b0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_79d7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_63b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_63b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_63b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_79d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_63b0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_63b0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2614_c3_4cf5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_63b0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_79d7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_63b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_63b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_63b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_63b0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c7_63b0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c7_63b0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2617_c7_79d7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c7_63b0_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2612_c30_bdc3_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2612_c30_bdc3_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2612_c30_bdc3_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2612_c30_bdc3_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_fc73_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_fc73_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_fc73_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2617_c7_79d7_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2617_c7_79d7_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2617_c7_79d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_79d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_79d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_87e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_79d7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_79d7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2619_c3_35b5 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_79d7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_79d7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_79d7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2620_c3_9a61 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_79d7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_87e1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_79d7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2617_c7_79d7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2617_c7_79d7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_87e1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2617_c7_79d7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_ea76_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_ea76_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_ea76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_87e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_87e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_1f6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_87e1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_87e1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2624_c3_e923 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_87e1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_1f6f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_87e1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_87e1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_87e1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_1f6f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_87e1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_09ec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_09ec_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_09ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_1f6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_1f6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_1f6f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_1f6f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2628_c3_7a82 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_1f6f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2627_c7_1f6f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_1f6f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_1f6f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_1f6f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_1f6f_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2586_l2606_l2602_l2599_l2627_DUPLICATE_196b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2602_l2617_l2606_l2599_DUPLICATE_7d9a_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2623_l2617_l2610_l2606_l2602_l2599_l2627_DUPLICATE_d63a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2602_l2606_l2599_l2610_DUPLICATE_1b72_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l2633_l2582_DUPLICATE_c2fe_return_output : opcode_result_t;
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
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_f1af_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l2612_c30_bdc3_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2600_c3_3cec := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_f2f0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2600_c3_3cec;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_1f6f_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_3adc_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2614_c3_4cf5 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_63b0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2614_c3_4cf5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_9804_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_ea76_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2628_c3_7a82 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_1f6f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2628_c3_7a82;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2604_c3_b0ae := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_5755_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2604_c3_b0ae;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_63b0_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2608_c3_4503 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_b44d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2608_c3_4503;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7310_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2591_c3_22e1 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2591_c3_22e1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_ded8_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_fc73_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2624_c3_e923 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_87e1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2624_c3_e923;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_09ec_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2596_c3_3fc8 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2596_c3_3fc8;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2620_c3_9a61 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_79d7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2620_c3_9a61;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2619_c3_35b5 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_79d7_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2619_c3_35b5;
     VAR_sp_relative_shift_uxn_opcodes_h_l2612_c30_bdc3_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2612_c30_bdc3_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2599_c7_f2f0_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2602_c7_5755_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2606_c7_b44d_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2610_c7_63b0_iffalse := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_87e1_iftrue := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2599_c7_f2f0_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2602_c7_5755_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2606_c7_b44d_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2610_c7_63b0_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2617_c7_79d7_iffalse := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_1f6f_iftrue := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_9804_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7310_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_f1af_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_ded8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_3adc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_fc73_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_ea76_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_09ec_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l2610_c7_63b0_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l2617_c7_79d7_iftrue := VAR_previous_stack_read;
     VAR_t16_high_MUX_uxn_opcodes_h_l2602_c7_5755_iftrue := VAR_previous_stack_read;
     VAR_t16_low_MUX_uxn_opcodes_h_l2606_c7_b44d_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c7_63b0_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2599_c7_f2f0_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2602_c7_5755_iffalse := t16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2617_c7_79d7_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2599_c7_f2f0_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2602_c7_5755_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2606_c7_b44d_iffalse := t16_low;
     -- BIN_OP_EQ[uxn_opcodes_h_l2586_c6_9804] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2586_c6_9804_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_9804_left;
     BIN_OP_EQ_uxn_opcodes_h_l2586_c6_9804_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_9804_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_9804_return_output := BIN_OP_EQ_uxn_opcodes_h_l2586_c6_9804_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2602_l2617_l2606_l2599_DUPLICATE_7d9a LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2602_l2617_l2606_l2599_DUPLICATE_7d9a_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2617_c11_fc73] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2617_c11_fc73_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_fc73_left;
     BIN_OP_EQ_uxn_opcodes_h_l2617_c11_fc73_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_fc73_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_fc73_return_output := BIN_OP_EQ_uxn_opcodes_h_l2617_c11_fc73_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2602_l2606_l2599_l2610_DUPLICATE_1b72 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2602_l2606_l2599_l2610_DUPLICATE_1b72_return_output := result.is_stack_write;

     -- sp_relative_shift[uxn_opcodes_h_l2612_c30_bdc3] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2612_c30_bdc3_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2612_c30_bdc3_ins;
     sp_relative_shift_uxn_opcodes_h_l2612_c30_bdc3_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2612_c30_bdc3_x;
     sp_relative_shift_uxn_opcodes_h_l2612_c30_bdc3_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2612_c30_bdc3_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2612_c30_bdc3_return_output := sp_relative_shift_uxn_opcodes_h_l2612_c30_bdc3_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2586_c2_6dce] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2586_c2_6dce_return_output := result.is_vram_write;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2586_c2_6dce] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2586_c2_6dce_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2623_l2617_l2610_l2606_l2602_l2599_l2627_DUPLICATE_d63a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2623_l2617_l2610_l2606_l2602_l2599_l2627_DUPLICATE_d63a_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2623_c11_ea76] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2623_c11_ea76_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_ea76_left;
     BIN_OP_EQ_uxn_opcodes_h_l2623_c11_ea76_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_ea76_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_ea76_return_output := BIN_OP_EQ_uxn_opcodes_h_l2623_c11_ea76_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2610_c11_3adc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2610_c11_3adc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_3adc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2610_c11_3adc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_3adc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_3adc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2610_c11_3adc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2606_c11_ded8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2606_c11_ded8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_ded8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2606_c11_ded8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_ded8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_ded8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2606_c11_ded8_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2586_c2_6dce] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2586_c2_6dce_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l2602_c11_f1af] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2602_c11_f1af_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_f1af_left;
     BIN_OP_EQ_uxn_opcodes_h_l2602_c11_f1af_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_f1af_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_f1af_return_output := BIN_OP_EQ_uxn_opcodes_h_l2602_c11_f1af_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2586_l2606_l2602_l2599_l2627_DUPLICATE_196b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2586_l2606_l2602_l2599_l2627_DUPLICATE_196b_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2599_c11_7310] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7310_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7310_left;
     BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7310_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7310_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7310_return_output := BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7310_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2627_c11_09ec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2627_c11_09ec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_09ec_left;
     BIN_OP_EQ_uxn_opcodes_h_l2627_c11_09ec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_09ec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_09ec_return_output := BIN_OP_EQ_uxn_opcodes_h_l2627_c11_09ec_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2627_c7_1f6f] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2627_c7_1f6f_return_output := result.stack_address_sp_offset;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2586_c2_6dce] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2586_c2_6dce_return_output := result.is_stack_index_flipped;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l2586_c2_6dce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_9804_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2586_c2_6dce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_9804_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_6dce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_9804_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_6dce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_9804_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_6dce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_9804_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_6dce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_9804_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_6dce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_9804_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_6dce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_9804_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_6dce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_9804_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_6dce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_9804_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c2_6dce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_9804_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2586_c2_6dce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_9804_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2586_c2_6dce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2586_c6_9804_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2599_c7_f2f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7310_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2599_c7_f2f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7310_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_f2f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7310_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_f2f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7310_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_f2f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7310_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_f2f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7310_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_f2f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7310_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2599_c7_f2f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7310_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2599_c7_f2f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7310_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2602_c7_5755_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_f1af_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2602_c7_5755_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_f1af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_5755_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_f1af_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_5755_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_f1af_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_5755_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_f1af_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_5755_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_f1af_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_5755_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_f1af_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2602_c7_5755_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_f1af_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2602_c7_5755_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c11_f1af_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2606_c7_b44d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_ded8_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2606_c7_b44d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_ded8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_b44d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_ded8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_b44d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_ded8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_b44d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_ded8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_b44d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_ded8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2606_c7_b44d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_ded8_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2606_c7_b44d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2606_c11_ded8_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2610_c7_63b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_3adc_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2610_c7_63b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_3adc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_63b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_3adc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_63b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_3adc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_63b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_3adc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_63b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_3adc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c7_63b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2610_c11_3adc_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2617_c7_79d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_fc73_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_79d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_fc73_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_79d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_fc73_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_79d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_fc73_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2617_c7_79d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_fc73_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_87e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_ea76_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_87e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_ea76_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_87e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2623_c11_ea76_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_1f6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_09ec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_1f6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_09ec_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_1f6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2627_c11_09ec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_f2f0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2602_l2617_l2606_l2599_DUPLICATE_7d9a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_5755_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2602_l2617_l2606_l2599_DUPLICATE_7d9a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_b44d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2602_l2617_l2606_l2599_DUPLICATE_7d9a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_79d7_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2602_l2617_l2606_l2599_DUPLICATE_7d9a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_f2f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2623_l2617_l2610_l2606_l2602_l2599_l2627_DUPLICATE_d63a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_5755_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2623_l2617_l2610_l2606_l2602_l2599_l2627_DUPLICATE_d63a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_b44d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2623_l2617_l2610_l2606_l2602_l2599_l2627_DUPLICATE_d63a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_63b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2623_l2617_l2610_l2606_l2602_l2599_l2627_DUPLICATE_d63a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_79d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2623_l2617_l2610_l2606_l2602_l2599_l2627_DUPLICATE_d63a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_87e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2623_l2617_l2610_l2606_l2602_l2599_l2627_DUPLICATE_d63a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_1f6f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2623_l2617_l2610_l2606_l2602_l2599_l2627_DUPLICATE_d63a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_f2f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2602_l2606_l2599_l2610_DUPLICATE_1b72_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_5755_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2602_l2606_l2599_l2610_DUPLICATE_1b72_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_b44d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2602_l2606_l2599_l2610_DUPLICATE_1b72_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_63b0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2602_l2606_l2599_l2610_DUPLICATE_1b72_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2586_l2606_l2602_l2599_l2627_DUPLICATE_196b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_f2f0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2586_l2606_l2602_l2599_l2627_DUPLICATE_196b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_5755_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2586_l2606_l2602_l2599_l2627_DUPLICATE_196b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2606_c7_b44d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2586_l2606_l2602_l2599_l2627_DUPLICATE_196b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_1f6f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2586_l2606_l2602_l2599_l2627_DUPLICATE_196b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2586_c2_6dce_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2586_c2_6dce_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2586_c2_6dce_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2586_c2_6dce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_1f6f_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2627_c7_1f6f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_63b0_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2612_c30_bdc3_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2586_c2_6dce] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_6dce_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_6dce_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2586_c2_6dce] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_6dce_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_6dce_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2606_c7_b44d] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2606_c7_b44d_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2606_c7_b44d_cond;
     t16_low_MUX_uxn_opcodes_h_l2606_c7_b44d_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2606_c7_b44d_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2606_c7_b44d_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2606_c7_b44d_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output := t16_low_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2586_c2_6dce] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_6dce_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_6dce_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2627_c7_1f6f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_1f6f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_1f6f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_1f6f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_1f6f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_1f6f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_1f6f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_1f6f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_1f6f_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2617_c7_79d7] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2617_c7_79d7_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2617_c7_79d7_cond;
     n16_low_MUX_uxn_opcodes_h_l2617_c7_79d7_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2617_c7_79d7_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2617_c7_79d7_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2617_c7_79d7_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2617_c7_79d7_return_output := n16_low_MUX_uxn_opcodes_h_l2617_c7_79d7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2617_c7_79d7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_79d7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_79d7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_79d7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_79d7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_79d7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_79d7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_79d7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_79d7_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2586_c2_6dce] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_6dce_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_6dce_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2602_c7_5755] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2602_c7_5755_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2602_c7_5755_cond;
     t16_high_MUX_uxn_opcodes_h_l2602_c7_5755_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2602_c7_5755_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2602_c7_5755_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2602_c7_5755_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2602_c7_5755_return_output := t16_high_MUX_uxn_opcodes_h_l2602_c7_5755_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2627_c7_1f6f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_1f6f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_1f6f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_1f6f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_1f6f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_1f6f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_1f6f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_1f6f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_1f6f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2610_c7_63b0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_63b0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_63b0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_63b0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_63b0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_63b0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_63b0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_63b0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_63b0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2627_c7_1f6f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2627_c7_1f6f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_1f6f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2627_c7_1f6f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_1f6f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2627_c7_1f6f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_1f6f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_1f6f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2627_c7_1f6f_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2610_c7_63b0] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2610_c7_63b0_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2610_c7_63b0_cond;
     n16_high_MUX_uxn_opcodes_h_l2610_c7_63b0_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2610_c7_63b0_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2610_c7_63b0_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2610_c7_63b0_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2610_c7_63b0_return_output := n16_high_MUX_uxn_opcodes_h_l2610_c7_63b0_return_output;

     -- Submodule level 2
     VAR_n16_high_MUX_uxn_opcodes_h_l2606_c7_b44d_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2610_c7_63b0_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2610_c7_63b0_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2617_c7_79d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_87e1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2627_c7_1f6f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_b44d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2610_c7_63b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_63b0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_79d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_87e1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2627_c7_1f6f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_87e1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2627_c7_1f6f_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2599_c7_f2f0_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2602_c7_5755_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2602_c7_5755_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2606_c7_b44d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_b44d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_b44d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_b44d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_b44d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_b44d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_b44d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2606_c7_b44d] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2606_c7_b44d_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2606_c7_b44d_cond;
     n16_high_MUX_uxn_opcodes_h_l2606_c7_b44d_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2606_c7_b44d_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2606_c7_b44d_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2606_c7_b44d_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output := n16_high_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2623_c7_87e1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_87e1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_87e1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_87e1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_87e1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_87e1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_87e1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_87e1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_87e1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2623_c7_87e1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_87e1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_87e1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_87e1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_87e1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_87e1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_87e1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_87e1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_87e1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2623_c7_87e1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2623_c7_87e1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_87e1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2623_c7_87e1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_87e1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2623_c7_87e1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_87e1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_87e1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2623_c7_87e1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2610_c7_63b0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_63b0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_63b0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_63b0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_63b0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_63b0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_63b0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_63b0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_63b0_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2599_c7_f2f0] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2599_c7_f2f0_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2599_c7_f2f0_cond;
     t16_high_MUX_uxn_opcodes_h_l2599_c7_f2f0_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2599_c7_f2f0_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2599_c7_f2f0_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2599_c7_f2f0_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output := t16_high_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2602_c7_5755] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2602_c7_5755_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2602_c7_5755_cond;
     t16_low_MUX_uxn_opcodes_h_l2602_c7_5755_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2602_c7_5755_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2602_c7_5755_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2602_c7_5755_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2602_c7_5755_return_output := t16_low_MUX_uxn_opcodes_h_l2602_c7_5755_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2610_c7_63b0] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2610_c7_63b0_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2610_c7_63b0_cond;
     n16_low_MUX_uxn_opcodes_h_l2610_c7_63b0_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2610_c7_63b0_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2610_c7_63b0_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2610_c7_63b0_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2610_c7_63b0_return_output := n16_low_MUX_uxn_opcodes_h_l2610_c7_63b0_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l2602_c7_5755_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2606_c7_b44d_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2610_c7_63b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_79d7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2623_c7_87e1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_5755_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_b44d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2610_c7_63b0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_79d7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2623_c7_87e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2617_c7_79d7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2623_c7_87e1_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2599_c7_f2f0_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2602_c7_5755_return_output;
     -- t16_high_MUX[uxn_opcodes_h_l2586_c2_6dce] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2586_c2_6dce_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2586_c2_6dce_cond;
     t16_high_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output := t16_high_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2599_c7_f2f0] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2599_c7_f2f0_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2599_c7_f2f0_cond;
     t16_low_MUX_uxn_opcodes_h_l2599_c7_f2f0_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2599_c7_f2f0_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2599_c7_f2f0_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2599_c7_f2f0_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output := t16_low_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2602_c7_5755] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_5755_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_5755_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_5755_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_5755_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_5755_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_5755_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_5755_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_5755_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2602_c7_5755] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2602_c7_5755_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2602_c7_5755_cond;
     n16_high_MUX_uxn_opcodes_h_l2602_c7_5755_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2602_c7_5755_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2602_c7_5755_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2602_c7_5755_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2602_c7_5755_return_output := n16_high_MUX_uxn_opcodes_h_l2602_c7_5755_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2606_c7_b44d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_b44d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_b44d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_b44d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_b44d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_b44d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_b44d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2617_c7_79d7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_79d7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_79d7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_79d7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_79d7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_79d7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_79d7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_79d7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_79d7_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2606_c7_b44d] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2606_c7_b44d_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2606_c7_b44d_cond;
     n16_low_MUX_uxn_opcodes_h_l2606_c7_b44d_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2606_c7_b44d_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2606_c7_b44d_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2606_c7_b44d_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output := n16_low_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2617_c7_79d7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_79d7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_79d7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_79d7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_79d7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_79d7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_79d7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_79d7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_79d7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2617_c7_79d7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2617_c7_79d7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2617_c7_79d7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2617_c7_79d7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2617_c7_79d7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2617_c7_79d7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2617_c7_79d7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2617_c7_79d7_return_output := result_u8_value_MUX_uxn_opcodes_h_l2617_c7_79d7_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l2599_c7_f2f0_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2602_c7_5755_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2602_c7_5755_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_63b0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_79d7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_f2f0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c7_5755_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_5755_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_63b0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_79d7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c7_63b0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2617_c7_79d7_return_output;
     REG_VAR_t16_high := VAR_t16_high_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2599_c7_f2f0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_f2f0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_f2f0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_f2f0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_f2f0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_f2f0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_f2f0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2602_c7_5755] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_5755_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_5755_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_5755_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_5755_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_5755_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_5755_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_5755_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_5755_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2586_c2_6dce] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2586_c2_6dce_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2586_c2_6dce_cond;
     t16_low_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output := t16_low_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2610_c7_63b0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_63b0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_63b0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_63b0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_63b0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_63b0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_63b0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_63b0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_63b0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2610_c7_63b0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2610_c7_63b0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c7_63b0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2610_c7_63b0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c7_63b0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2610_c7_63b0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c7_63b0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c7_63b0_return_output := result_u8_value_MUX_uxn_opcodes_h_l2610_c7_63b0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2610_c7_63b0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_63b0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_63b0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_63b0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_63b0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_63b0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_63b0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_63b0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_63b0_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2599_c7_f2f0] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2599_c7_f2f0_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2599_c7_f2f0_cond;
     n16_high_MUX_uxn_opcodes_h_l2599_c7_f2f0_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2599_c7_f2f0_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2599_c7_f2f0_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2599_c7_f2f0_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output := n16_high_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2602_c7_5755] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2602_c7_5755_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2602_c7_5755_cond;
     n16_low_MUX_uxn_opcodes_h_l2602_c7_5755_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2602_c7_5755_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2602_c7_5755_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2602_c7_5755_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2602_c7_5755_return_output := n16_low_MUX_uxn_opcodes_h_l2602_c7_5755_return_output;

     -- Submodule level 5
     VAR_n16_high_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2599_c7_f2f0_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2602_c7_5755_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_b44d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2610_c7_63b0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_f2f0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c7_5755_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_b44d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2610_c7_63b0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2606_c7_b44d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2610_c7_63b0_return_output;
     REG_VAR_t16_low := VAR_t16_low_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output;
     -- n16_high_MUX[uxn_opcodes_h_l2586_c2_6dce] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2586_c2_6dce_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2586_c2_6dce_cond;
     n16_high_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output := n16_high_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2586_c2_6dce] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_6dce_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_6dce_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2599_c7_f2f0] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2599_c7_f2f0_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2599_c7_f2f0_cond;
     n16_low_MUX_uxn_opcodes_h_l2599_c7_f2f0_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2599_c7_f2f0_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2599_c7_f2f0_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2599_c7_f2f0_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output := n16_low_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2606_c7_b44d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2606_c7_b44d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2606_c7_b44d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2606_c7_b44d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2606_c7_b44d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2606_c7_b44d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2606_c7_b44d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2599_c7_f2f0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_f2f0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_f2f0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_f2f0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_f2f0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_f2f0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_f2f0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2606_c7_b44d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_b44d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_b44d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_b44d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_b44d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_b44d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_b44d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2606_c7_b44d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_b44d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_b44d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_b44d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_b44d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_b44d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_b44d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output;

     -- Submodule level 6
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_5755_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_5755_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_5755_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2606_c7_b44d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2602_c7_5755] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_5755_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_5755_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_5755_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_5755_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_5755_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_5755_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_5755_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_5755_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2586_c2_6dce] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_6dce_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_6dce_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2586_c2_6dce] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2586_c2_6dce_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2586_c2_6dce_cond;
     n16_low_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output := n16_low_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2602_c7_5755] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_5755_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_5755_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_5755_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_5755_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_5755_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_5755_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_5755_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_5755_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2602_c7_5755] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2602_c7_5755_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_5755_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2602_c7_5755_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_5755_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2602_c7_5755_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_5755_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_5755_return_output := result_u8_value_MUX_uxn_opcodes_h_l2602_c7_5755_return_output;

     -- Submodule level 7
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_f2f0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c7_5755_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_f2f0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c7_5755_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_f2f0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c7_5755_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2599_c7_f2f0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_f2f0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_f2f0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_f2f0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_f2f0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_f2f0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_f2f0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2599_c7_f2f0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2599_c7_f2f0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_f2f0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2599_c7_f2f0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_f2f0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2599_c7_f2f0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_f2f0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output := result_u8_value_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2599_c7_f2f0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_f2f0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_f2f0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_f2f0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_f2f0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_f2f0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_f2f0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_f2f0_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2586_c2_6dce] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_6dce_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_6dce_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2586_c2_6dce] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_6dce_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_6dce_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2586_c2_6dce] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2586_c2_6dce_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c2_6dce_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c2_6dce_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c2_6dce_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output := result_u8_value_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l2633_l2582_DUPLICATE_c2fe LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l2633_l2582_DUPLICATE_c2fe_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_04b4(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2586_c2_6dce_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l2633_l2582_DUPLICATE_c2fe_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l2633_l2582_DUPLICATE_c2fe_return_output;
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
