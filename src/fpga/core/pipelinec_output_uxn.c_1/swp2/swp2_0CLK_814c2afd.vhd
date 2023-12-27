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
-- BIN_OP_EQ[uxn_opcodes_h_l2585_c6_3f59]
signal BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3f59_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3f59_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3f59_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2585_c2_43dc]
signal t16_low_MUX_uxn_opcodes_h_l2585_c2_43dc_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2585_c2_43dc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_43dc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2585_c2_43dc]
signal result_u8_value_MUX_uxn_opcodes_h_l2585_c2_43dc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2585_c2_43dc]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_43dc_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2585_c2_43dc]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_43dc_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2585_c2_43dc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_43dc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2585_c2_43dc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_43dc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2585_c2_43dc]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_43dc_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2585_c2_43dc]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_43dc_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2585_c2_43dc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_43dc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2585_c2_43dc]
signal n16_low_MUX_uxn_opcodes_h_l2585_c2_43dc_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2585_c2_43dc]
signal n16_high_MUX_uxn_opcodes_h_l2585_c2_43dc_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2585_c2_43dc]
signal t16_high_MUX_uxn_opcodes_h_l2585_c2_43dc_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2598_c11_45e0]
signal BIN_OP_EQ_uxn_opcodes_h_l2598_c11_45e0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2598_c11_45e0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2598_c11_45e0_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2598_c7_5b87]
signal t16_low_MUX_uxn_opcodes_h_l2598_c7_5b87_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2598_c7_5b87_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2598_c7_5b87_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2598_c7_5b87]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_5b87_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_5b87_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_5b87_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2598_c7_5b87]
signal result_u8_value_MUX_uxn_opcodes_h_l2598_c7_5b87_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2598_c7_5b87_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2598_c7_5b87_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2598_c7_5b87]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_5b87_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_5b87_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_5b87_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2598_c7_5b87]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_5b87_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_5b87_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_5b87_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2598_c7_5b87]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_5b87_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_5b87_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_5b87_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2598_c7_5b87]
signal n16_low_MUX_uxn_opcodes_h_l2598_c7_5b87_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2598_c7_5b87_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2598_c7_5b87_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2598_c7_5b87]
signal n16_high_MUX_uxn_opcodes_h_l2598_c7_5b87_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2598_c7_5b87_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2598_c7_5b87_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2598_c7_5b87]
signal t16_high_MUX_uxn_opcodes_h_l2598_c7_5b87_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2598_c7_5b87_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2598_c7_5b87_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2601_c11_4d3f]
signal BIN_OP_EQ_uxn_opcodes_h_l2601_c11_4d3f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2601_c11_4d3f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2601_c11_4d3f_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2601_c7_f9f4]
signal t16_low_MUX_uxn_opcodes_h_l2601_c7_f9f4_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2601_c7_f9f4_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2601_c7_f9f4_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2601_c7_f9f4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_f9f4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_f9f4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_f9f4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2601_c7_f9f4]
signal result_u8_value_MUX_uxn_opcodes_h_l2601_c7_f9f4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2601_c7_f9f4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2601_c7_f9f4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2601_c7_f9f4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_f9f4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_f9f4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_f9f4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2601_c7_f9f4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_f9f4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_f9f4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_f9f4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2601_c7_f9f4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_f9f4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_f9f4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_f9f4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2601_c7_f9f4]
signal n16_low_MUX_uxn_opcodes_h_l2601_c7_f9f4_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2601_c7_f9f4_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2601_c7_f9f4_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2601_c7_f9f4]
signal n16_high_MUX_uxn_opcodes_h_l2601_c7_f9f4_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2601_c7_f9f4_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2601_c7_f9f4_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2601_c7_f9f4]
signal t16_high_MUX_uxn_opcodes_h_l2601_c7_f9f4_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2601_c7_f9f4_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2601_c7_f9f4_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2605_c11_2421]
signal BIN_OP_EQ_uxn_opcodes_h_l2605_c11_2421_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2605_c11_2421_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2605_c11_2421_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2605_c7_595d]
signal t16_low_MUX_uxn_opcodes_h_l2605_c7_595d_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2605_c7_595d_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2605_c7_595d_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2605_c7_595d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2605_c7_595d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_595d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_595d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_595d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_595d_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2605_c7_595d]
signal result_u8_value_MUX_uxn_opcodes_h_l2605_c7_595d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2605_c7_595d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2605_c7_595d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2605_c7_595d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2605_c7_595d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_595d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_595d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_595d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_595d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2605_c7_595d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_595d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_595d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_595d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_595d_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2605_c7_595d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_595d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_595d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_595d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_595d_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2605_c7_595d]
signal n16_low_MUX_uxn_opcodes_h_l2605_c7_595d_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2605_c7_595d_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2605_c7_595d_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2605_c7_595d_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2605_c7_595d]
signal n16_high_MUX_uxn_opcodes_h_l2605_c7_595d_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2605_c7_595d_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2605_c7_595d_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2605_c7_595d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2609_c11_30e2]
signal BIN_OP_EQ_uxn_opcodes_h_l2609_c11_30e2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2609_c11_30e2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2609_c11_30e2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2609_c7_45ff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_45ff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_45ff_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_45ff_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_45ff_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2609_c7_45ff]
signal result_u8_value_MUX_uxn_opcodes_h_l2609_c7_45ff_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2609_c7_45ff_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2609_c7_45ff_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2609_c7_45ff_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2609_c7_45ff]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_45ff_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_45ff_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_45ff_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_45ff_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2609_c7_45ff]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_45ff_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_45ff_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_45ff_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_45ff_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2609_c7_45ff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_45ff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_45ff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_45ff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_45ff_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2609_c7_45ff]
signal n16_low_MUX_uxn_opcodes_h_l2609_c7_45ff_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2609_c7_45ff_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2609_c7_45ff_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2609_c7_45ff_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2609_c7_45ff]
signal n16_high_MUX_uxn_opcodes_h_l2609_c7_45ff_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2609_c7_45ff_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2609_c7_45ff_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2609_c7_45ff_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2611_c30_93cd]
signal sp_relative_shift_uxn_opcodes_h_l2611_c30_93cd_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2611_c30_93cd_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2611_c30_93cd_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2611_c30_93cd_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2616_c11_44d9]
signal BIN_OP_EQ_uxn_opcodes_h_l2616_c11_44d9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2616_c11_44d9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2616_c11_44d9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2616_c7_ea63]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_ea63_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_ea63_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_ea63_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_ea63_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2616_c7_ea63]
signal result_u8_value_MUX_uxn_opcodes_h_l2616_c7_ea63_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2616_c7_ea63_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2616_c7_ea63_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2616_c7_ea63_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2616_c7_ea63]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_ea63_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_ea63_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_ea63_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_ea63_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2616_c7_ea63]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_ea63_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_ea63_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_ea63_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_ea63_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2616_c7_ea63]
signal n16_low_MUX_uxn_opcodes_h_l2616_c7_ea63_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2616_c7_ea63_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2616_c7_ea63_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2616_c7_ea63_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2622_c11_d6c3]
signal BIN_OP_EQ_uxn_opcodes_h_l2622_c11_d6c3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2622_c11_d6c3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2622_c11_d6c3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2622_c7_de6f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_de6f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_de6f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_de6f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_de6f_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2622_c7_de6f]
signal result_u8_value_MUX_uxn_opcodes_h_l2622_c7_de6f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2622_c7_de6f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2622_c7_de6f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2622_c7_de6f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2622_c7_de6f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_de6f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_de6f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_de6f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_de6f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2626_c11_97b5]
signal BIN_OP_EQ_uxn_opcodes_h_l2626_c11_97b5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2626_c11_97b5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2626_c11_97b5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2626_c7_36d2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_36d2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_36d2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_36d2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_36d2_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2626_c7_36d2]
signal result_u8_value_MUX_uxn_opcodes_h_l2626_c7_36d2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2626_c7_36d2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2626_c7_36d2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2626_c7_36d2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2626_c7_36d2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_36d2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_36d2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_36d2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_36d2_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3f59
BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3f59 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3f59_left,
BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3f59_right,
BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3f59_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2585_c2_43dc
t16_low_MUX_uxn_opcodes_h_l2585_c2_43dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2585_c2_43dc_cond,
t16_low_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue,
t16_low_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse,
t16_low_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_43dc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_43dc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_43dc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2585_c2_43dc
result_u8_value_MUX_uxn_opcodes_h_l2585_c2_43dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2585_c2_43dc_cond,
result_u8_value_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_43dc
result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_43dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_43dc_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_43dc
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_43dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_43dc_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_43dc
result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_43dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_43dc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_43dc
result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_43dc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_43dc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_43dc
result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_43dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_43dc_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_43dc
result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_43dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_43dc_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_43dc
result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_43dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_43dc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2585_c2_43dc
n16_low_MUX_uxn_opcodes_h_l2585_c2_43dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2585_c2_43dc_cond,
n16_low_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue,
n16_low_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse,
n16_low_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2585_c2_43dc
n16_high_MUX_uxn_opcodes_h_l2585_c2_43dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2585_c2_43dc_cond,
n16_high_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue,
n16_high_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse,
n16_high_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2585_c2_43dc
t16_high_MUX_uxn_opcodes_h_l2585_c2_43dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2585_c2_43dc_cond,
t16_high_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue,
t16_high_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse,
t16_high_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2598_c11_45e0
BIN_OP_EQ_uxn_opcodes_h_l2598_c11_45e0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2598_c11_45e0_left,
BIN_OP_EQ_uxn_opcodes_h_l2598_c11_45e0_right,
BIN_OP_EQ_uxn_opcodes_h_l2598_c11_45e0_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2598_c7_5b87
t16_low_MUX_uxn_opcodes_h_l2598_c7_5b87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2598_c7_5b87_cond,
t16_low_MUX_uxn_opcodes_h_l2598_c7_5b87_iftrue,
t16_low_MUX_uxn_opcodes_h_l2598_c7_5b87_iffalse,
t16_low_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_5b87
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_5b87 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_5b87_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_5b87_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_5b87_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2598_c7_5b87
result_u8_value_MUX_uxn_opcodes_h_l2598_c7_5b87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2598_c7_5b87_cond,
result_u8_value_MUX_uxn_opcodes_h_l2598_c7_5b87_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2598_c7_5b87_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_5b87
result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_5b87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_5b87_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_5b87_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_5b87_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_5b87
result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_5b87 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_5b87_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_5b87_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_5b87_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_5b87
result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_5b87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_5b87_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_5b87_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_5b87_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2598_c7_5b87
n16_low_MUX_uxn_opcodes_h_l2598_c7_5b87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2598_c7_5b87_cond,
n16_low_MUX_uxn_opcodes_h_l2598_c7_5b87_iftrue,
n16_low_MUX_uxn_opcodes_h_l2598_c7_5b87_iffalse,
n16_low_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2598_c7_5b87
n16_high_MUX_uxn_opcodes_h_l2598_c7_5b87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2598_c7_5b87_cond,
n16_high_MUX_uxn_opcodes_h_l2598_c7_5b87_iftrue,
n16_high_MUX_uxn_opcodes_h_l2598_c7_5b87_iffalse,
n16_high_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2598_c7_5b87
t16_high_MUX_uxn_opcodes_h_l2598_c7_5b87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2598_c7_5b87_cond,
t16_high_MUX_uxn_opcodes_h_l2598_c7_5b87_iftrue,
t16_high_MUX_uxn_opcodes_h_l2598_c7_5b87_iffalse,
t16_high_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2601_c11_4d3f
BIN_OP_EQ_uxn_opcodes_h_l2601_c11_4d3f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2601_c11_4d3f_left,
BIN_OP_EQ_uxn_opcodes_h_l2601_c11_4d3f_right,
BIN_OP_EQ_uxn_opcodes_h_l2601_c11_4d3f_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2601_c7_f9f4
t16_low_MUX_uxn_opcodes_h_l2601_c7_f9f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2601_c7_f9f4_cond,
t16_low_MUX_uxn_opcodes_h_l2601_c7_f9f4_iftrue,
t16_low_MUX_uxn_opcodes_h_l2601_c7_f9f4_iffalse,
t16_low_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_f9f4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_f9f4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_f9f4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_f9f4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_f9f4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2601_c7_f9f4
result_u8_value_MUX_uxn_opcodes_h_l2601_c7_f9f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2601_c7_f9f4_cond,
result_u8_value_MUX_uxn_opcodes_h_l2601_c7_f9f4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2601_c7_f9f4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_f9f4
result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_f9f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_f9f4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_f9f4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_f9f4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_f9f4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_f9f4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_f9f4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_f9f4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_f9f4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_f9f4
result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_f9f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_f9f4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_f9f4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_f9f4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2601_c7_f9f4
n16_low_MUX_uxn_opcodes_h_l2601_c7_f9f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2601_c7_f9f4_cond,
n16_low_MUX_uxn_opcodes_h_l2601_c7_f9f4_iftrue,
n16_low_MUX_uxn_opcodes_h_l2601_c7_f9f4_iffalse,
n16_low_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2601_c7_f9f4
n16_high_MUX_uxn_opcodes_h_l2601_c7_f9f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2601_c7_f9f4_cond,
n16_high_MUX_uxn_opcodes_h_l2601_c7_f9f4_iftrue,
n16_high_MUX_uxn_opcodes_h_l2601_c7_f9f4_iffalse,
n16_high_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2601_c7_f9f4
t16_high_MUX_uxn_opcodes_h_l2601_c7_f9f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2601_c7_f9f4_cond,
t16_high_MUX_uxn_opcodes_h_l2601_c7_f9f4_iftrue,
t16_high_MUX_uxn_opcodes_h_l2601_c7_f9f4_iffalse,
t16_high_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2605_c11_2421
BIN_OP_EQ_uxn_opcodes_h_l2605_c11_2421 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2605_c11_2421_left,
BIN_OP_EQ_uxn_opcodes_h_l2605_c11_2421_right,
BIN_OP_EQ_uxn_opcodes_h_l2605_c11_2421_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2605_c7_595d
t16_low_MUX_uxn_opcodes_h_l2605_c7_595d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2605_c7_595d_cond,
t16_low_MUX_uxn_opcodes_h_l2605_c7_595d_iftrue,
t16_low_MUX_uxn_opcodes_h_l2605_c7_595d_iffalse,
t16_low_MUX_uxn_opcodes_h_l2605_c7_595d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_595d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_595d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_595d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_595d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_595d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_595d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2605_c7_595d
result_u8_value_MUX_uxn_opcodes_h_l2605_c7_595d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2605_c7_595d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2605_c7_595d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2605_c7_595d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2605_c7_595d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_595d
result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_595d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_595d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_595d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_595d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_595d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_595d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_595d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_595d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_595d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_595d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_595d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_595d
result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_595d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_595d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_595d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_595d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_595d_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2605_c7_595d
n16_low_MUX_uxn_opcodes_h_l2605_c7_595d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2605_c7_595d_cond,
n16_low_MUX_uxn_opcodes_h_l2605_c7_595d_iftrue,
n16_low_MUX_uxn_opcodes_h_l2605_c7_595d_iffalse,
n16_low_MUX_uxn_opcodes_h_l2605_c7_595d_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2605_c7_595d
n16_high_MUX_uxn_opcodes_h_l2605_c7_595d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2605_c7_595d_cond,
n16_high_MUX_uxn_opcodes_h_l2605_c7_595d_iftrue,
n16_high_MUX_uxn_opcodes_h_l2605_c7_595d_iffalse,
n16_high_MUX_uxn_opcodes_h_l2605_c7_595d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2609_c11_30e2
BIN_OP_EQ_uxn_opcodes_h_l2609_c11_30e2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2609_c11_30e2_left,
BIN_OP_EQ_uxn_opcodes_h_l2609_c11_30e2_right,
BIN_OP_EQ_uxn_opcodes_h_l2609_c11_30e2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_45ff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_45ff : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_45ff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_45ff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_45ff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_45ff_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2609_c7_45ff
result_u8_value_MUX_uxn_opcodes_h_l2609_c7_45ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2609_c7_45ff_cond,
result_u8_value_MUX_uxn_opcodes_h_l2609_c7_45ff_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2609_c7_45ff_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2609_c7_45ff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_45ff
result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_45ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_45ff_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_45ff_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_45ff_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_45ff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_45ff
result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_45ff : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_45ff_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_45ff_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_45ff_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_45ff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_45ff
result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_45ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_45ff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_45ff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_45ff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_45ff_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2609_c7_45ff
n16_low_MUX_uxn_opcodes_h_l2609_c7_45ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2609_c7_45ff_cond,
n16_low_MUX_uxn_opcodes_h_l2609_c7_45ff_iftrue,
n16_low_MUX_uxn_opcodes_h_l2609_c7_45ff_iffalse,
n16_low_MUX_uxn_opcodes_h_l2609_c7_45ff_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2609_c7_45ff
n16_high_MUX_uxn_opcodes_h_l2609_c7_45ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2609_c7_45ff_cond,
n16_high_MUX_uxn_opcodes_h_l2609_c7_45ff_iftrue,
n16_high_MUX_uxn_opcodes_h_l2609_c7_45ff_iffalse,
n16_high_MUX_uxn_opcodes_h_l2609_c7_45ff_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2611_c30_93cd
sp_relative_shift_uxn_opcodes_h_l2611_c30_93cd : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2611_c30_93cd_ins,
sp_relative_shift_uxn_opcodes_h_l2611_c30_93cd_x,
sp_relative_shift_uxn_opcodes_h_l2611_c30_93cd_y,
sp_relative_shift_uxn_opcodes_h_l2611_c30_93cd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2616_c11_44d9
BIN_OP_EQ_uxn_opcodes_h_l2616_c11_44d9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2616_c11_44d9_left,
BIN_OP_EQ_uxn_opcodes_h_l2616_c11_44d9_right,
BIN_OP_EQ_uxn_opcodes_h_l2616_c11_44d9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_ea63
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_ea63 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_ea63_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_ea63_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_ea63_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_ea63_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2616_c7_ea63
result_u8_value_MUX_uxn_opcodes_h_l2616_c7_ea63 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2616_c7_ea63_cond,
result_u8_value_MUX_uxn_opcodes_h_l2616_c7_ea63_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2616_c7_ea63_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2616_c7_ea63_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_ea63
result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_ea63 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_ea63_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_ea63_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_ea63_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_ea63_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_ea63
result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_ea63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_ea63_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_ea63_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_ea63_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_ea63_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2616_c7_ea63
n16_low_MUX_uxn_opcodes_h_l2616_c7_ea63 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2616_c7_ea63_cond,
n16_low_MUX_uxn_opcodes_h_l2616_c7_ea63_iftrue,
n16_low_MUX_uxn_opcodes_h_l2616_c7_ea63_iffalse,
n16_low_MUX_uxn_opcodes_h_l2616_c7_ea63_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2622_c11_d6c3
BIN_OP_EQ_uxn_opcodes_h_l2622_c11_d6c3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2622_c11_d6c3_left,
BIN_OP_EQ_uxn_opcodes_h_l2622_c11_d6c3_right,
BIN_OP_EQ_uxn_opcodes_h_l2622_c11_d6c3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_de6f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_de6f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_de6f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_de6f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_de6f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_de6f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2622_c7_de6f
result_u8_value_MUX_uxn_opcodes_h_l2622_c7_de6f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2622_c7_de6f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2622_c7_de6f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2622_c7_de6f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2622_c7_de6f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_de6f
result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_de6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_de6f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_de6f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_de6f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_de6f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2626_c11_97b5
BIN_OP_EQ_uxn_opcodes_h_l2626_c11_97b5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2626_c11_97b5_left,
BIN_OP_EQ_uxn_opcodes_h_l2626_c11_97b5_right,
BIN_OP_EQ_uxn_opcodes_h_l2626_c11_97b5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_36d2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_36d2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_36d2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_36d2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_36d2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_36d2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2626_c7_36d2
result_u8_value_MUX_uxn_opcodes_h_l2626_c7_36d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2626_c7_36d2_cond,
result_u8_value_MUX_uxn_opcodes_h_l2626_c7_36d2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2626_c7_36d2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2626_c7_36d2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_36d2
result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_36d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_36d2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_36d2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_36d2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_36d2_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3f59_return_output,
 t16_low_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output,
 n16_low_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output,
 n16_high_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output,
 t16_high_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2598_c11_45e0_return_output,
 t16_low_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output,
 n16_low_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output,
 n16_high_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output,
 t16_high_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2601_c11_4d3f_return_output,
 t16_low_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output,
 n16_low_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output,
 n16_high_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output,
 t16_high_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2605_c11_2421_return_output,
 t16_low_MUX_uxn_opcodes_h_l2605_c7_595d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_595d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2605_c7_595d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_595d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_595d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_595d_return_output,
 n16_low_MUX_uxn_opcodes_h_l2605_c7_595d_return_output,
 n16_high_MUX_uxn_opcodes_h_l2605_c7_595d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2609_c11_30e2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_45ff_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2609_c7_45ff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_45ff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_45ff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_45ff_return_output,
 n16_low_MUX_uxn_opcodes_h_l2609_c7_45ff_return_output,
 n16_high_MUX_uxn_opcodes_h_l2609_c7_45ff_return_output,
 sp_relative_shift_uxn_opcodes_h_l2611_c30_93cd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2616_c11_44d9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_ea63_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2616_c7_ea63_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_ea63_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_ea63_return_output,
 n16_low_MUX_uxn_opcodes_h_l2616_c7_ea63_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2622_c11_d6c3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_de6f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2622_c7_de6f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_de6f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2626_c11_97b5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_36d2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2626_c7_36d2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_36d2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3f59_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3f59_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3f59_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_43dc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2595_c3_168a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_43dc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_43dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2585_c2_43dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_43dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2585_c2_43dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_43dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_43dc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2590_c3_bdc3 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_43dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2585_c2_43dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_43dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2585_c2_43dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_43dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_43dc_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_43dc_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_43dc_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_43dc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_45e0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_45e0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_45e0_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_5b87_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_5b87_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_5b87_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_5b87_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2599_c3_6554 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_5b87_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_5b87_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_5b87_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_5b87_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_5b87_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_5b87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_5b87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_5b87_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_5b87_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_5b87_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_5b87_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_5b87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_5b87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_5b87_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_5b87_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_5b87_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_5b87_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_5b87_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_5b87_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_5b87_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_5b87_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_5b87_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_5b87_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_4d3f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_4d3f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_4d3f_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_f9f4_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_f9f4_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_595d_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_f9f4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_f9f4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2603_c3_ef03 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_f9f4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_595d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_f9f4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_f9f4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_f9f4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_595d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_f9f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_f9f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_f9f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_595d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_f9f4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_f9f4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_f9f4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_595d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_f9f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_f9f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_f9f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_595d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_f9f4_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_f9f4_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_f9f4_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_595d_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_f9f4_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_f9f4_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_f9f4_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_595d_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_f9f4_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_f9f4_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_f9f4_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_f9f4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_2421_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_2421_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_2421_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_595d_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_595d_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_595d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_595d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2607_c3_fd14 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_595d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_45ff_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_595d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_595d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_595d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_45ff_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_595d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_595d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_595d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_45ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_595d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_595d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_595d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_45ff_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_595d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_595d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_595d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_45ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_595d_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_595d_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_595d_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_45ff_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_595d_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_595d_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_595d_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_45ff_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_595d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_30e2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_30e2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_30e2_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_45ff_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2613_c3_a6bd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_45ff_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_ea63_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_45ff_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_45ff_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_45ff_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_ea63_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_45ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_45ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_45ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_45ff_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_45ff_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_45ff_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_ea63_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_45ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_45ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_45ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_ea63_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_45ff_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_45ff_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_45ff_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_ea63_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_45ff_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_45ff_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_45ff_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_45ff_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_93cd_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_93cd_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_93cd_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_93cd_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_44d9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_44d9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_44d9_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_ea63_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2619_c3_45eb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_ea63_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_de6f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_ea63_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_ea63_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_ea63_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_de6f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_ea63_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_ea63_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2618_c3_b758 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_ea63_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_ea63_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_ea63_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_ea63_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_de6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_ea63_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_ea63_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_ea63_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_ea63_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_d6c3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_d6c3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_d6c3_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_de6f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2623_c3_19c0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_de6f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_36d2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_de6f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_de6f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_de6f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_36d2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_de6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_de6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_de6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_36d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_de6f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_97b5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_97b5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_97b5_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_36d2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2627_c3_93d2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_36d2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2626_c7_36d2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_36d2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_36d2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_36d2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_36d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_36d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_36d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_36d2_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2626_l2585_l2605_l2601_l2598_DUPLICATE_fe0b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2609_l2601_l2605_l2598_DUPLICATE_6334_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2601_l2616_l2605_l2598_DUPLICATE_b8a3_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2626_l2622_l2616_l2609_l2605_l2601_l2598_DUPLICATE_bfbd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l2632_l2581_DUPLICATE_790e_return_output : opcode_result_t;
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
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3f59_right := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2618_c3_b758 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_ea63_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2618_c3_b758;
     VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_93cd_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2603_c3_ef03 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_f9f4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2603_c3_ef03;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2595_c3_168a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2595_c3_168a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_2421_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_93cd_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_44d9_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2607_c3_fd14 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_595d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2607_c3_fd14;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_30e2_right := to_unsigned(4, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2590_c3_bdc3 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2590_c3_bdc3;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2599_c3_6554 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_5b87_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2599_c3_6554;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2613_c3_a6bd := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_45ff_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2613_c3_a6bd;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_d6c3_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_45e0_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2623_c3_19c0 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_de6f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2623_c3_19c0;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_36d2_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2619_c3_45eb := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_ea63_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2619_c3_45eb;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2627_c3_93d2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_36d2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2627_c3_93d2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_97b5_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_4d3f_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_45ff_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_93cd_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_5b87_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_f9f4_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_595d_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_45ff_iffalse := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_de6f_iftrue := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_5b87_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_f9f4_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_595d_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_45ff_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_ea63_iffalse := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_36d2_iftrue := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3f59_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_45e0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_4d3f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_2421_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_30e2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_44d9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_d6c3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_97b5_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_45ff_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_ea63_iftrue := VAR_previous_stack_read;
     VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_f9f4_iftrue := VAR_previous_stack_read;
     VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_595d_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_45ff_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_5b87_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_f9f4_iffalse := t16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_ea63_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_5b87_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_f9f4_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_595d_iffalse := t16_low;
     -- BIN_OP_EQ[uxn_opcodes_h_l2598_c11_45e0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2598_c11_45e0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_45e0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2598_c11_45e0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_45e0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_45e0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2598_c11_45e0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2622_c11_d6c3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2622_c11_d6c3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_d6c3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2622_c11_d6c3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_d6c3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_d6c3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2622_c11_d6c3_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2611_c30_93cd] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2611_c30_93cd_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_93cd_ins;
     sp_relative_shift_uxn_opcodes_h_l2611_c30_93cd_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_93cd_x;
     sp_relative_shift_uxn_opcodes_h_l2611_c30_93cd_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_93cd_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_93cd_return_output := sp_relative_shift_uxn_opcodes_h_l2611_c30_93cd_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2585_c2_43dc] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2585_c2_43dc_return_output := result.is_ram_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2585_c2_43dc] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2585_c2_43dc_return_output := result.is_stack_index_flipped;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2585_c2_43dc] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2585_c2_43dc_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l2616_c11_44d9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2616_c11_44d9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_44d9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2616_c11_44d9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_44d9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_44d9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2616_c11_44d9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2605_c11_2421] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2605_c11_2421_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_2421_left;
     BIN_OP_EQ_uxn_opcodes_h_l2605_c11_2421_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_2421_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_2421_return_output := BIN_OP_EQ_uxn_opcodes_h_l2605_c11_2421_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2626_c11_97b5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2626_c11_97b5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_97b5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2626_c11_97b5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_97b5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_97b5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2626_c11_97b5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2626_l2622_l2616_l2609_l2605_l2601_l2598_DUPLICATE_bfbd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2626_l2622_l2616_l2609_l2605_l2601_l2598_DUPLICATE_bfbd_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2601_c11_4d3f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2601_c11_4d3f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_4d3f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2601_c11_4d3f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_4d3f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_4d3f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2601_c11_4d3f_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2626_l2585_l2605_l2601_l2598_DUPLICATE_fe0b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2626_l2585_l2605_l2601_l2598_DUPLICATE_fe0b_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2609_c11_30e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2609_c11_30e2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_30e2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2609_c11_30e2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_30e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_30e2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2609_c11_30e2_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2585_c2_43dc] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2585_c2_43dc_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2609_l2601_l2605_l2598_DUPLICATE_6334 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2609_l2601_l2605_l2598_DUPLICATE_6334_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2585_c6_3f59] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3f59_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3f59_left;
     BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3f59_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3f59_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3f59_return_output := BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3f59_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2626_c7_36d2] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2626_c7_36d2_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2601_l2616_l2605_l2598_DUPLICATE_b8a3 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2601_l2616_l2605_l2598_DUPLICATE_b8a3_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_43dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3f59_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_43dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3f59_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_43dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3f59_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_43dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3f59_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_43dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3f59_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_43dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3f59_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_43dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3f59_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_43dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3f59_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_43dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3f59_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_43dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3f59_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_43dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3f59_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_43dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3f59_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_43dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3f59_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_5b87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_45e0_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_5b87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_45e0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_5b87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_45e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_5b87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_45e0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_5b87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_45e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_5b87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_45e0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_5b87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_45e0_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_5b87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_45e0_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_5b87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_45e0_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_f9f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_4d3f_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_f9f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_4d3f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_f9f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_4d3f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_f9f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_4d3f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_f9f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_4d3f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_f9f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_4d3f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_f9f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_4d3f_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_f9f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_4d3f_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_f9f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_4d3f_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_595d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_2421_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_595d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_2421_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_595d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_2421_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_595d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_2421_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_595d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_2421_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_595d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_2421_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_595d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_2421_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_595d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_2421_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_45ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_30e2_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_45ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_30e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_45ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_30e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_45ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_30e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_45ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_30e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_45ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_30e2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_45ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_30e2_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_ea63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_44d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_ea63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_44d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_ea63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_44d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_ea63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_44d9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_ea63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_44d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_de6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_d6c3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_de6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_d6c3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_de6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_d6c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_36d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_97b5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_36d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_97b5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_36d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_97b5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_5b87_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2601_l2616_l2605_l2598_DUPLICATE_b8a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_f9f4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2601_l2616_l2605_l2598_DUPLICATE_b8a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_595d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2601_l2616_l2605_l2598_DUPLICATE_b8a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_ea63_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2601_l2616_l2605_l2598_DUPLICATE_b8a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_5b87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2626_l2622_l2616_l2609_l2605_l2601_l2598_DUPLICATE_bfbd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_f9f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2626_l2622_l2616_l2609_l2605_l2601_l2598_DUPLICATE_bfbd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_595d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2626_l2622_l2616_l2609_l2605_l2601_l2598_DUPLICATE_bfbd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_45ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2626_l2622_l2616_l2609_l2605_l2601_l2598_DUPLICATE_bfbd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_ea63_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2626_l2622_l2616_l2609_l2605_l2601_l2598_DUPLICATE_bfbd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_de6f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2626_l2622_l2616_l2609_l2605_l2601_l2598_DUPLICATE_bfbd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_36d2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2626_l2622_l2616_l2609_l2605_l2601_l2598_DUPLICATE_bfbd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_5b87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2609_l2601_l2605_l2598_DUPLICATE_6334_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_f9f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2609_l2601_l2605_l2598_DUPLICATE_6334_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_595d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2609_l2601_l2605_l2598_DUPLICATE_6334_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_45ff_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2609_l2601_l2605_l2598_DUPLICATE_6334_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2626_l2585_l2605_l2601_l2598_DUPLICATE_fe0b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_5b87_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2626_l2585_l2605_l2601_l2598_DUPLICATE_fe0b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_f9f4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2626_l2585_l2605_l2601_l2598_DUPLICATE_fe0b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_595d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2626_l2585_l2605_l2601_l2598_DUPLICATE_fe0b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_36d2_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2626_l2585_l2605_l2601_l2598_DUPLICATE_fe0b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2585_c2_43dc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2585_c2_43dc_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2585_c2_43dc_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2585_c2_43dc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_36d2_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2626_c7_36d2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_45ff_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_93cd_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2626_c7_36d2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_36d2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_36d2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_36d2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_36d2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_36d2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_36d2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_36d2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_36d2_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2616_c7_ea63] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2616_c7_ea63_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_ea63_cond;
     n16_low_MUX_uxn_opcodes_h_l2616_c7_ea63_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_ea63_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2616_c7_ea63_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_ea63_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_ea63_return_output := n16_low_MUX_uxn_opcodes_h_l2616_c7_ea63_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2626_c7_36d2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2626_c7_36d2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_36d2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2626_c7_36d2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_36d2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2626_c7_36d2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_36d2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_36d2_return_output := result_u8_value_MUX_uxn_opcodes_h_l2626_c7_36d2_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2609_c7_45ff] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2609_c7_45ff_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_45ff_cond;
     n16_high_MUX_uxn_opcodes_h_l2609_c7_45ff_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_45ff_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2609_c7_45ff_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_45ff_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_45ff_return_output := n16_high_MUX_uxn_opcodes_h_l2609_c7_45ff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2626_c7_36d2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_36d2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_36d2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_36d2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_36d2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_36d2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_36d2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_36d2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_36d2_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2585_c2_43dc] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_43dc_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_43dc_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2585_c2_43dc] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_43dc_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_43dc_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2616_c7_ea63] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_ea63_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_ea63_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_ea63_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_ea63_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_ea63_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_ea63_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_ea63_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_ea63_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2585_c2_43dc] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_43dc_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_43dc_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2585_c2_43dc] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_43dc_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_43dc_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2609_c7_45ff] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_45ff_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_45ff_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_45ff_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_45ff_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_45ff_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_45ff_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_45ff_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_45ff_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2601_c7_f9f4] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2601_c7_f9f4_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_f9f4_cond;
     t16_high_MUX_uxn_opcodes_h_l2601_c7_f9f4_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_f9f4_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2601_c7_f9f4_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_f9f4_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output := t16_high_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2605_c7_595d] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2605_c7_595d_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_595d_cond;
     t16_low_MUX_uxn_opcodes_h_l2605_c7_595d_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_595d_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2605_c7_595d_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_595d_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_595d_return_output := t16_low_MUX_uxn_opcodes_h_l2605_c7_595d_return_output;

     -- Submodule level 2
     VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_595d_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_45ff_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_45ff_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_ea63_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_de6f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_36d2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_595d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_45ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_45ff_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_ea63_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_de6f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_36d2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_de6f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_36d2_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_5b87_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_f9f4_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_595d_return_output;
     -- n16_high_MUX[uxn_opcodes_h_l2605_c7_595d] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2605_c7_595d_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_595d_cond;
     n16_high_MUX_uxn_opcodes_h_l2605_c7_595d_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_595d_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2605_c7_595d_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_595d_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_595d_return_output := n16_high_MUX_uxn_opcodes_h_l2605_c7_595d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2609_c7_45ff] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_45ff_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_45ff_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_45ff_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_45ff_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_45ff_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_45ff_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_45ff_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_45ff_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2598_c7_5b87] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2598_c7_5b87_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_5b87_cond;
     t16_high_MUX_uxn_opcodes_h_l2598_c7_5b87_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_5b87_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2598_c7_5b87_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_5b87_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output := t16_high_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2622_c7_de6f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2622_c7_de6f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_de6f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2622_c7_de6f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_de6f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2622_c7_de6f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_de6f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_de6f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2622_c7_de6f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2605_c7_595d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_595d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_595d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_595d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_595d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_595d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_595d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_595d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_595d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2622_c7_de6f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_de6f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_de6f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_de6f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_de6f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_de6f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_de6f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_de6f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_de6f_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2609_c7_45ff] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2609_c7_45ff_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_45ff_cond;
     n16_low_MUX_uxn_opcodes_h_l2609_c7_45ff_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_45ff_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2609_c7_45ff_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_45ff_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_45ff_return_output := n16_low_MUX_uxn_opcodes_h_l2609_c7_45ff_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2601_c7_f9f4] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2601_c7_f9f4_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_f9f4_cond;
     t16_low_MUX_uxn_opcodes_h_l2601_c7_f9f4_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_f9f4_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2601_c7_f9f4_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_f9f4_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output := t16_low_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2622_c7_de6f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_de6f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_de6f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_de6f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_de6f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_de6f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_de6f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_de6f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_de6f_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_f9f4_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_595d_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_595d_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_45ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_ea63_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_de6f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_f9f4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_595d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_595d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_45ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_ea63_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_de6f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_ea63_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_de6f_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_5b87_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output;
     -- n16_high_MUX[uxn_opcodes_h_l2601_c7_f9f4] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2601_c7_f9f4_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_f9f4_cond;
     n16_high_MUX_uxn_opcodes_h_l2601_c7_f9f4_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_f9f4_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2601_c7_f9f4_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_f9f4_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output := n16_high_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2601_c7_f9f4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_f9f4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_f9f4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_f9f4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_f9f4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_f9f4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_f9f4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2605_c7_595d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_595d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_595d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_595d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_595d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_595d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_595d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_595d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_595d_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2605_c7_595d] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2605_c7_595d_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_595d_cond;
     n16_low_MUX_uxn_opcodes_h_l2605_c7_595d_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_595d_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2605_c7_595d_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_595d_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_595d_return_output := n16_low_MUX_uxn_opcodes_h_l2605_c7_595d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2616_c7_ea63] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_ea63_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_ea63_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_ea63_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_ea63_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_ea63_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_ea63_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_ea63_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_ea63_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2585_c2_43dc] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2585_c2_43dc_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_43dc_cond;
     t16_high_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output := t16_high_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2598_c7_5b87] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2598_c7_5b87_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_5b87_cond;
     t16_low_MUX_uxn_opcodes_h_l2598_c7_5b87_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_5b87_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2598_c7_5b87_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_5b87_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output := t16_low_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2616_c7_ea63] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2616_c7_ea63_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_ea63_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2616_c7_ea63_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_ea63_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2616_c7_ea63_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_ea63_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_ea63_return_output := result_u8_value_MUX_uxn_opcodes_h_l2616_c7_ea63_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2616_c7_ea63] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_ea63_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_ea63_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_ea63_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_ea63_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_ea63_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_ea63_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_ea63_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_ea63_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_5b87_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_f9f4_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_595d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_45ff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_ea63_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_5b87_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_f9f4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_595d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_45ff_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_ea63_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_45ff_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_ea63_return_output;
     REG_VAR_t16_high := VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output;
     -- n16_high_MUX[uxn_opcodes_h_l2598_c7_5b87] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2598_c7_5b87_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_5b87_cond;
     n16_high_MUX_uxn_opcodes_h_l2598_c7_5b87_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_5b87_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2598_c7_5b87_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_5b87_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output := n16_high_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2601_c7_f9f4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_f9f4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_f9f4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_f9f4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_f9f4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_f9f4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_f9f4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2598_c7_5b87] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_5b87_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_5b87_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_5b87_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_5b87_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_5b87_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_5b87_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2585_c2_43dc] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2585_c2_43dc_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_43dc_cond;
     t16_low_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output := t16_low_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2601_c7_f9f4] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2601_c7_f9f4_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_f9f4_cond;
     n16_low_MUX_uxn_opcodes_h_l2601_c7_f9f4_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_f9f4_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2601_c7_f9f4_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_f9f4_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output := n16_low_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2609_c7_45ff] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2609_c7_45ff_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_45ff_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2609_c7_45ff_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_45ff_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2609_c7_45ff_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_45ff_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_45ff_return_output := result_u8_value_MUX_uxn_opcodes_h_l2609_c7_45ff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2609_c7_45ff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_45ff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_45ff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_45ff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_45ff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_45ff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_45ff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_45ff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_45ff_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2609_c7_45ff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_45ff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_45ff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_45ff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_45ff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_45ff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_45ff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_45ff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_45ff_return_output;

     -- Submodule level 5
     VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_5b87_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_595d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_45ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_5b87_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_595d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_45ff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_595d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_45ff_return_output;
     REG_VAR_t16_low := VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output;
     -- n16_high_MUX[uxn_opcodes_h_l2585_c2_43dc] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2585_c2_43dc_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_43dc_cond;
     n16_high_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output := n16_high_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2605_c7_595d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_595d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_595d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_595d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_595d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_595d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_595d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_595d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_595d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2585_c2_43dc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_43dc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_43dc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2598_c7_5b87] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2598_c7_5b87_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_5b87_cond;
     n16_low_MUX_uxn_opcodes_h_l2598_c7_5b87_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_5b87_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2598_c7_5b87_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_5b87_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output := n16_low_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2605_c7_595d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_595d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_595d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_595d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_595d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_595d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_595d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_595d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_595d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2605_c7_595d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2605_c7_595d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_595d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2605_c7_595d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_595d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2605_c7_595d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_595d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_595d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2605_c7_595d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2598_c7_5b87] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_5b87_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_5b87_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_5b87_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_5b87_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_5b87_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_5b87_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output;

     -- Submodule level 6
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_f9f4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_595d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_f9f4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_595d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_f9f4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_595d_return_output;
     -- n16_low_MUX[uxn_opcodes_h_l2585_c2_43dc] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2585_c2_43dc_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_43dc_cond;
     n16_low_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output := n16_low_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2601_c7_f9f4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_f9f4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_f9f4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_f9f4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_f9f4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_f9f4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_f9f4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2601_c7_f9f4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_f9f4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_f9f4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_f9f4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_f9f4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_f9f4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_f9f4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2601_c7_f9f4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2601_c7_f9f4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_f9f4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2601_c7_f9f4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_f9f4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2601_c7_f9f4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_f9f4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output := result_u8_value_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2585_c2_43dc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_43dc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_43dc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output;

     -- Submodule level 7
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_5b87_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_5b87_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_5b87_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_f9f4_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2598_c7_5b87] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2598_c7_5b87_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_5b87_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2598_c7_5b87_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_5b87_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2598_c7_5b87_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_5b87_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output := result_u8_value_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2598_c7_5b87] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_5b87_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_5b87_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_5b87_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_5b87_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_5b87_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_5b87_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2598_c7_5b87] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_5b87_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_5b87_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_5b87_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_5b87_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_5b87_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_5b87_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_5b87_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2585_c2_43dc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_43dc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_43dc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2585_c2_43dc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2585_c2_43dc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_43dc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output := result_u8_value_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2585_c2_43dc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_43dc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_43dc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_43dc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_43dc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l2632_l2581_DUPLICATE_790e LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l2632_l2581_DUPLICATE_790e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b856(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_43dc_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l2632_l2581_DUPLICATE_790e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l2632_l2581_DUPLICATE_790e_return_output;
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
