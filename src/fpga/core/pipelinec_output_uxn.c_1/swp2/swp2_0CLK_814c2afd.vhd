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
-- BIN_OP_EQ[uxn_opcodes_h_l2585_c6_3125]
signal BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3125_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3125_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3125_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2585_c2_b628]
signal t16_low_MUX_uxn_opcodes_h_l2585_c2_b628_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2585_c2_b628_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2585_c2_b628]
signal n16_high_MUX_uxn_opcodes_h_l2585_c2_b628_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2585_c2_b628_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2585_c2_b628]
signal t16_high_MUX_uxn_opcodes_h_l2585_c2_b628_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2585_c2_b628_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2585_c2_b628]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_b628_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_b628_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2585_c2_b628]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_b628_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_b628_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2585_c2_b628]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_b628_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_b628_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2585_c2_b628]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_b628_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_b628_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2585_c2_b628]
signal result_u8_value_MUX_uxn_opcodes_h_l2585_c2_b628_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2585_c2_b628_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2585_c2_b628]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_b628_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_b628_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2585_c2_b628]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_b628_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_b628_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2585_c2_b628]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_b628_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_b628_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2585_c2_b628]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_b628_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_b628_return_output : unsigned(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2585_c2_b628]
signal n16_low_MUX_uxn_opcodes_h_l2585_c2_b628_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2585_c2_b628_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2598_c11_c46e]
signal BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c46e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c46e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c46e_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2598_c7_7907]
signal t16_low_MUX_uxn_opcodes_h_l2598_c7_7907_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2598_c7_7907_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2598_c7_7907_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2598_c7_7907_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2598_c7_7907]
signal n16_high_MUX_uxn_opcodes_h_l2598_c7_7907_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2598_c7_7907_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2598_c7_7907_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2598_c7_7907_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2598_c7_7907]
signal t16_high_MUX_uxn_opcodes_h_l2598_c7_7907_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2598_c7_7907_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2598_c7_7907_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2598_c7_7907_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2598_c7_7907]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_7907_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_7907_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_7907_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_7907_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2598_c7_7907]
signal result_u8_value_MUX_uxn_opcodes_h_l2598_c7_7907_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2598_c7_7907_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2598_c7_7907_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2598_c7_7907_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2598_c7_7907]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_7907_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_7907_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_7907_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_7907_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2598_c7_7907]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_7907_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_7907_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_7907_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_7907_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2598_c7_7907]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_7907_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_7907_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_7907_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_7907_return_output : unsigned(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2598_c7_7907]
signal n16_low_MUX_uxn_opcodes_h_l2598_c7_7907_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2598_c7_7907_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2598_c7_7907_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2598_c7_7907_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2601_c11_6b3a]
signal BIN_OP_EQ_uxn_opcodes_h_l2601_c11_6b3a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2601_c11_6b3a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2601_c11_6b3a_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2601_c7_28d2]
signal t16_low_MUX_uxn_opcodes_h_l2601_c7_28d2_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2601_c7_28d2_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2601_c7_28d2_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2601_c7_28d2]
signal n16_high_MUX_uxn_opcodes_h_l2601_c7_28d2_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2601_c7_28d2_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2601_c7_28d2_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2601_c7_28d2]
signal t16_high_MUX_uxn_opcodes_h_l2601_c7_28d2_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2601_c7_28d2_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2601_c7_28d2_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2601_c7_28d2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_28d2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_28d2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_28d2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2601_c7_28d2]
signal result_u8_value_MUX_uxn_opcodes_h_l2601_c7_28d2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2601_c7_28d2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2601_c7_28d2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2601_c7_28d2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_28d2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_28d2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_28d2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2601_c7_28d2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_28d2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_28d2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_28d2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2601_c7_28d2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_28d2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_28d2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_28d2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output : unsigned(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2601_c7_28d2]
signal n16_low_MUX_uxn_opcodes_h_l2601_c7_28d2_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2601_c7_28d2_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2601_c7_28d2_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2605_c11_153a]
signal BIN_OP_EQ_uxn_opcodes_h_l2605_c11_153a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2605_c11_153a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2605_c11_153a_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2605_c7_4a23]
signal t16_low_MUX_uxn_opcodes_h_l2605_c7_4a23_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2605_c7_4a23_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2605_c7_4a23_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2605_c7_4a23]
signal n16_high_MUX_uxn_opcodes_h_l2605_c7_4a23_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2605_c7_4a23_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2605_c7_4a23_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2605_c7_4a23]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_4a23_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_4a23_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_4a23_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2605_c7_4a23]
signal result_u8_value_MUX_uxn_opcodes_h_l2605_c7_4a23_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2605_c7_4a23_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2605_c7_4a23_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2605_c7_4a23]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_4a23_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_4a23_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_4a23_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2605_c7_4a23]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_4a23_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_4a23_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_4a23_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2605_c7_4a23]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_4a23_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_4a23_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_4a23_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output : unsigned(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2605_c7_4a23]
signal n16_low_MUX_uxn_opcodes_h_l2605_c7_4a23_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2605_c7_4a23_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2605_c7_4a23_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2609_c11_6e53]
signal BIN_OP_EQ_uxn_opcodes_h_l2609_c11_6e53_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2609_c11_6e53_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2609_c11_6e53_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2609_c7_f9be]
signal n16_high_MUX_uxn_opcodes_h_l2609_c7_f9be_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2609_c7_f9be_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2609_c7_f9be_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2609_c7_f9be_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2609_c7_f9be]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_f9be_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_f9be_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_f9be_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_f9be_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2609_c7_f9be]
signal result_u8_value_MUX_uxn_opcodes_h_l2609_c7_f9be_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2609_c7_f9be_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2609_c7_f9be_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2609_c7_f9be_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2609_c7_f9be]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_f9be_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_f9be_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_f9be_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_f9be_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2609_c7_f9be]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_f9be_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_f9be_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_f9be_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_f9be_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2609_c7_f9be]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_f9be_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_f9be_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_f9be_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_f9be_return_output : unsigned(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2609_c7_f9be]
signal n16_low_MUX_uxn_opcodes_h_l2609_c7_f9be_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2609_c7_f9be_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2609_c7_f9be_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2609_c7_f9be_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2611_c30_c69b]
signal sp_relative_shift_uxn_opcodes_h_l2611_c30_c69b_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2611_c30_c69b_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2611_c30_c69b_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2611_c30_c69b_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2616_c11_2621]
signal BIN_OP_EQ_uxn_opcodes_h_l2616_c11_2621_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2616_c11_2621_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2616_c11_2621_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2616_c7_a145]
signal result_u8_value_MUX_uxn_opcodes_h_l2616_c7_a145_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2616_c7_a145_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2616_c7_a145_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2616_c7_a145_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2616_c7_a145]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_a145_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_a145_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_a145_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_a145_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2616_c7_a145]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_a145_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_a145_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_a145_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_a145_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2616_c7_a145]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_a145_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_a145_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_a145_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_a145_return_output : unsigned(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2616_c7_a145]
signal n16_low_MUX_uxn_opcodes_h_l2616_c7_a145_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2616_c7_a145_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2616_c7_a145_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2616_c7_a145_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2622_c11_8ed0]
signal BIN_OP_EQ_uxn_opcodes_h_l2622_c11_8ed0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2622_c11_8ed0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2622_c11_8ed0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2622_c7_9733]
signal result_u8_value_MUX_uxn_opcodes_h_l2622_c7_9733_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2622_c7_9733_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2622_c7_9733_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2622_c7_9733_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2622_c7_9733]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_9733_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_9733_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_9733_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_9733_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2622_c7_9733]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_9733_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_9733_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_9733_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_9733_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2626_c11_c4dd]
signal BIN_OP_EQ_uxn_opcodes_h_l2626_c11_c4dd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2626_c11_c4dd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2626_c11_c4dd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2626_c7_3e42]
signal result_u8_value_MUX_uxn_opcodes_h_l2626_c7_3e42_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2626_c7_3e42_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2626_c7_3e42_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2626_c7_3e42_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2626_c7_3e42]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_3e42_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_3e42_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_3e42_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_3e42_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2626_c7_3e42]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_3e42_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_3e42_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_3e42_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_3e42_return_output : unsigned(3 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3125
BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3125 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3125_left,
BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3125_right,
BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3125_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2585_c2_b628
t16_low_MUX_uxn_opcodes_h_l2585_c2_b628 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2585_c2_b628_cond,
t16_low_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue,
t16_low_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse,
t16_low_MUX_uxn_opcodes_h_l2585_c2_b628_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2585_c2_b628
n16_high_MUX_uxn_opcodes_h_l2585_c2_b628 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2585_c2_b628_cond,
n16_high_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue,
n16_high_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse,
n16_high_MUX_uxn_opcodes_h_l2585_c2_b628_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2585_c2_b628
t16_high_MUX_uxn_opcodes_h_l2585_c2_b628 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2585_c2_b628_cond,
t16_high_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue,
t16_high_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse,
t16_high_MUX_uxn_opcodes_h_l2585_c2_b628_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_b628
result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_b628 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_b628_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_b628_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_b628
result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_b628 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_b628_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_b628_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_b628
result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_b628 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_b628_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_b628_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_b628
result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_b628 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_b628_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_b628_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2585_c2_b628
result_u8_value_MUX_uxn_opcodes_h_l2585_c2_b628 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2585_c2_b628_cond,
result_u8_value_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2585_c2_b628_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_b628
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_b628 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_b628_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_b628_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_b628
result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_b628 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_b628_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_b628_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_b628
result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_b628 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_b628_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_b628_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_b628
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_b628 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_b628_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_b628_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2585_c2_b628
n16_low_MUX_uxn_opcodes_h_l2585_c2_b628 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2585_c2_b628_cond,
n16_low_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue,
n16_low_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse,
n16_low_MUX_uxn_opcodes_h_l2585_c2_b628_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c46e
BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c46e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c46e_left,
BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c46e_right,
BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c46e_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2598_c7_7907
t16_low_MUX_uxn_opcodes_h_l2598_c7_7907 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2598_c7_7907_cond,
t16_low_MUX_uxn_opcodes_h_l2598_c7_7907_iftrue,
t16_low_MUX_uxn_opcodes_h_l2598_c7_7907_iffalse,
t16_low_MUX_uxn_opcodes_h_l2598_c7_7907_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2598_c7_7907
n16_high_MUX_uxn_opcodes_h_l2598_c7_7907 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2598_c7_7907_cond,
n16_high_MUX_uxn_opcodes_h_l2598_c7_7907_iftrue,
n16_high_MUX_uxn_opcodes_h_l2598_c7_7907_iffalse,
n16_high_MUX_uxn_opcodes_h_l2598_c7_7907_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2598_c7_7907
t16_high_MUX_uxn_opcodes_h_l2598_c7_7907 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2598_c7_7907_cond,
t16_high_MUX_uxn_opcodes_h_l2598_c7_7907_iftrue,
t16_high_MUX_uxn_opcodes_h_l2598_c7_7907_iffalse,
t16_high_MUX_uxn_opcodes_h_l2598_c7_7907_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_7907
result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_7907 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_7907_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_7907_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_7907_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_7907_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2598_c7_7907
result_u8_value_MUX_uxn_opcodes_h_l2598_c7_7907 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2598_c7_7907_cond,
result_u8_value_MUX_uxn_opcodes_h_l2598_c7_7907_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2598_c7_7907_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2598_c7_7907_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_7907
result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_7907 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_7907_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_7907_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_7907_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_7907_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_7907
result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_7907 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_7907_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_7907_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_7907_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_7907_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_7907
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_7907 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_7907_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_7907_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_7907_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_7907_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2598_c7_7907
n16_low_MUX_uxn_opcodes_h_l2598_c7_7907 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2598_c7_7907_cond,
n16_low_MUX_uxn_opcodes_h_l2598_c7_7907_iftrue,
n16_low_MUX_uxn_opcodes_h_l2598_c7_7907_iffalse,
n16_low_MUX_uxn_opcodes_h_l2598_c7_7907_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2601_c11_6b3a
BIN_OP_EQ_uxn_opcodes_h_l2601_c11_6b3a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2601_c11_6b3a_left,
BIN_OP_EQ_uxn_opcodes_h_l2601_c11_6b3a_right,
BIN_OP_EQ_uxn_opcodes_h_l2601_c11_6b3a_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2601_c7_28d2
t16_low_MUX_uxn_opcodes_h_l2601_c7_28d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2601_c7_28d2_cond,
t16_low_MUX_uxn_opcodes_h_l2601_c7_28d2_iftrue,
t16_low_MUX_uxn_opcodes_h_l2601_c7_28d2_iffalse,
t16_low_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2601_c7_28d2
n16_high_MUX_uxn_opcodes_h_l2601_c7_28d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2601_c7_28d2_cond,
n16_high_MUX_uxn_opcodes_h_l2601_c7_28d2_iftrue,
n16_high_MUX_uxn_opcodes_h_l2601_c7_28d2_iffalse,
n16_high_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2601_c7_28d2
t16_high_MUX_uxn_opcodes_h_l2601_c7_28d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2601_c7_28d2_cond,
t16_high_MUX_uxn_opcodes_h_l2601_c7_28d2_iftrue,
t16_high_MUX_uxn_opcodes_h_l2601_c7_28d2_iffalse,
t16_high_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_28d2
result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_28d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_28d2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_28d2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_28d2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2601_c7_28d2
result_u8_value_MUX_uxn_opcodes_h_l2601_c7_28d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2601_c7_28d2_cond,
result_u8_value_MUX_uxn_opcodes_h_l2601_c7_28d2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2601_c7_28d2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_28d2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_28d2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_28d2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_28d2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_28d2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_28d2
result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_28d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_28d2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_28d2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_28d2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_28d2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_28d2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_28d2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_28d2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_28d2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2601_c7_28d2
n16_low_MUX_uxn_opcodes_h_l2601_c7_28d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2601_c7_28d2_cond,
n16_low_MUX_uxn_opcodes_h_l2601_c7_28d2_iftrue,
n16_low_MUX_uxn_opcodes_h_l2601_c7_28d2_iffalse,
n16_low_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2605_c11_153a
BIN_OP_EQ_uxn_opcodes_h_l2605_c11_153a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2605_c11_153a_left,
BIN_OP_EQ_uxn_opcodes_h_l2605_c11_153a_right,
BIN_OP_EQ_uxn_opcodes_h_l2605_c11_153a_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2605_c7_4a23
t16_low_MUX_uxn_opcodes_h_l2605_c7_4a23 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2605_c7_4a23_cond,
t16_low_MUX_uxn_opcodes_h_l2605_c7_4a23_iftrue,
t16_low_MUX_uxn_opcodes_h_l2605_c7_4a23_iffalse,
t16_low_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2605_c7_4a23
n16_high_MUX_uxn_opcodes_h_l2605_c7_4a23 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2605_c7_4a23_cond,
n16_high_MUX_uxn_opcodes_h_l2605_c7_4a23_iftrue,
n16_high_MUX_uxn_opcodes_h_l2605_c7_4a23_iffalse,
n16_high_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_4a23
result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_4a23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_4a23_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_4a23_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_4a23_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2605_c7_4a23
result_u8_value_MUX_uxn_opcodes_h_l2605_c7_4a23 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2605_c7_4a23_cond,
result_u8_value_MUX_uxn_opcodes_h_l2605_c7_4a23_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2605_c7_4a23_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_4a23
result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_4a23 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_4a23_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_4a23_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_4a23_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_4a23
result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_4a23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_4a23_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_4a23_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_4a23_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_4a23
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_4a23 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_4a23_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_4a23_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_4a23_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2605_c7_4a23
n16_low_MUX_uxn_opcodes_h_l2605_c7_4a23 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2605_c7_4a23_cond,
n16_low_MUX_uxn_opcodes_h_l2605_c7_4a23_iftrue,
n16_low_MUX_uxn_opcodes_h_l2605_c7_4a23_iffalse,
n16_low_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2609_c11_6e53
BIN_OP_EQ_uxn_opcodes_h_l2609_c11_6e53 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2609_c11_6e53_left,
BIN_OP_EQ_uxn_opcodes_h_l2609_c11_6e53_right,
BIN_OP_EQ_uxn_opcodes_h_l2609_c11_6e53_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2609_c7_f9be
n16_high_MUX_uxn_opcodes_h_l2609_c7_f9be : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2609_c7_f9be_cond,
n16_high_MUX_uxn_opcodes_h_l2609_c7_f9be_iftrue,
n16_high_MUX_uxn_opcodes_h_l2609_c7_f9be_iffalse,
n16_high_MUX_uxn_opcodes_h_l2609_c7_f9be_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_f9be
result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_f9be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_f9be_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_f9be_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_f9be_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_f9be_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2609_c7_f9be
result_u8_value_MUX_uxn_opcodes_h_l2609_c7_f9be : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2609_c7_f9be_cond,
result_u8_value_MUX_uxn_opcodes_h_l2609_c7_f9be_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2609_c7_f9be_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2609_c7_f9be_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_f9be
result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_f9be : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_f9be_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_f9be_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_f9be_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_f9be_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_f9be
result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_f9be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_f9be_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_f9be_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_f9be_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_f9be_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_f9be
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_f9be : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_f9be_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_f9be_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_f9be_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_f9be_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2609_c7_f9be
n16_low_MUX_uxn_opcodes_h_l2609_c7_f9be : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2609_c7_f9be_cond,
n16_low_MUX_uxn_opcodes_h_l2609_c7_f9be_iftrue,
n16_low_MUX_uxn_opcodes_h_l2609_c7_f9be_iffalse,
n16_low_MUX_uxn_opcodes_h_l2609_c7_f9be_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2611_c30_c69b
sp_relative_shift_uxn_opcodes_h_l2611_c30_c69b : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2611_c30_c69b_ins,
sp_relative_shift_uxn_opcodes_h_l2611_c30_c69b_x,
sp_relative_shift_uxn_opcodes_h_l2611_c30_c69b_y,
sp_relative_shift_uxn_opcodes_h_l2611_c30_c69b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2616_c11_2621
BIN_OP_EQ_uxn_opcodes_h_l2616_c11_2621 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2616_c11_2621_left,
BIN_OP_EQ_uxn_opcodes_h_l2616_c11_2621_right,
BIN_OP_EQ_uxn_opcodes_h_l2616_c11_2621_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2616_c7_a145
result_u8_value_MUX_uxn_opcodes_h_l2616_c7_a145 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2616_c7_a145_cond,
result_u8_value_MUX_uxn_opcodes_h_l2616_c7_a145_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2616_c7_a145_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2616_c7_a145_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_a145
result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_a145 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_a145_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_a145_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_a145_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_a145_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_a145
result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_a145 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_a145_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_a145_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_a145_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_a145_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_a145
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_a145 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_a145_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_a145_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_a145_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_a145_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2616_c7_a145
n16_low_MUX_uxn_opcodes_h_l2616_c7_a145 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2616_c7_a145_cond,
n16_low_MUX_uxn_opcodes_h_l2616_c7_a145_iftrue,
n16_low_MUX_uxn_opcodes_h_l2616_c7_a145_iffalse,
n16_low_MUX_uxn_opcodes_h_l2616_c7_a145_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2622_c11_8ed0
BIN_OP_EQ_uxn_opcodes_h_l2622_c11_8ed0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2622_c11_8ed0_left,
BIN_OP_EQ_uxn_opcodes_h_l2622_c11_8ed0_right,
BIN_OP_EQ_uxn_opcodes_h_l2622_c11_8ed0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2622_c7_9733
result_u8_value_MUX_uxn_opcodes_h_l2622_c7_9733 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2622_c7_9733_cond,
result_u8_value_MUX_uxn_opcodes_h_l2622_c7_9733_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2622_c7_9733_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2622_c7_9733_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_9733
result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_9733 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_9733_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_9733_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_9733_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_9733_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_9733
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_9733 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_9733_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_9733_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_9733_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_9733_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2626_c11_c4dd
BIN_OP_EQ_uxn_opcodes_h_l2626_c11_c4dd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2626_c11_c4dd_left,
BIN_OP_EQ_uxn_opcodes_h_l2626_c11_c4dd_right,
BIN_OP_EQ_uxn_opcodes_h_l2626_c11_c4dd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2626_c7_3e42
result_u8_value_MUX_uxn_opcodes_h_l2626_c7_3e42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2626_c7_3e42_cond,
result_u8_value_MUX_uxn_opcodes_h_l2626_c7_3e42_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2626_c7_3e42_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2626_c7_3e42_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_3e42
result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_3e42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_3e42_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_3e42_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_3e42_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_3e42_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_3e42
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_3e42 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_3e42_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_3e42_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_3e42_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_3e42_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3125_return_output,
 t16_low_MUX_uxn_opcodes_h_l2585_c2_b628_return_output,
 n16_high_MUX_uxn_opcodes_h_l2585_c2_b628_return_output,
 t16_high_MUX_uxn_opcodes_h_l2585_c2_b628_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_b628_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_b628_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_b628_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_b628_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2585_c2_b628_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_b628_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_b628_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_b628_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_b628_return_output,
 n16_low_MUX_uxn_opcodes_h_l2585_c2_b628_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c46e_return_output,
 t16_low_MUX_uxn_opcodes_h_l2598_c7_7907_return_output,
 n16_high_MUX_uxn_opcodes_h_l2598_c7_7907_return_output,
 t16_high_MUX_uxn_opcodes_h_l2598_c7_7907_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_7907_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2598_c7_7907_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_7907_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_7907_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_7907_return_output,
 n16_low_MUX_uxn_opcodes_h_l2598_c7_7907_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2601_c11_6b3a_return_output,
 t16_low_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output,
 n16_high_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output,
 t16_high_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output,
 n16_low_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2605_c11_153a_return_output,
 t16_low_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output,
 n16_high_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output,
 n16_low_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2609_c11_6e53_return_output,
 n16_high_MUX_uxn_opcodes_h_l2609_c7_f9be_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_f9be_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2609_c7_f9be_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_f9be_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_f9be_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_f9be_return_output,
 n16_low_MUX_uxn_opcodes_h_l2609_c7_f9be_return_output,
 sp_relative_shift_uxn_opcodes_h_l2611_c30_c69b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2616_c11_2621_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2616_c7_a145_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_a145_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_a145_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_a145_return_output,
 n16_low_MUX_uxn_opcodes_h_l2616_c7_a145_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2622_c11_8ed0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2622_c7_9733_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_9733_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_9733_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2626_c11_c4dd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2626_c7_3e42_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_3e42_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_3e42_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3125_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3125_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3125_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_7907_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_b628_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_b628_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_7907_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_b628_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_b628_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_7907_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_b628_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_b628_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2585_c2_b628_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_b628_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_b628_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_7907_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_b628_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_b628_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2585_c2_b628_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_b628_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_b628_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2585_c2_b628_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_b628_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_b628_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_7907_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_b628_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_b628_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2585_c2_b628_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_b628_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_b628_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2590_c3_8049 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_7907_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_b628_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_b628_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_7907_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_b628_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_b628_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2595_c3_4704 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_7907_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_b628_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_b628_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_7907_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_b628_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_b628_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c46e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c46e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c46e_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_7907_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_7907_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_7907_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_7907_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_7907_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_7907_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_7907_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_7907_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_7907_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_7907_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_7907_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_7907_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_7907_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_7907_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_7907_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_7907_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_7907_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_7907_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_7907_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_7907_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_7907_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_7907_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2599_c3_15b2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_7907_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_7907_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_7907_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_7907_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_7907_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_6b3a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_6b3a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_6b3a_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_28d2_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_28d2_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_28d2_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_28d2_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_28d2_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_28d2_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_28d2_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_28d2_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_28d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_28d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_28d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_28d2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_28d2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_28d2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_28d2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_28d2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_28d2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_28d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_28d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_28d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_28d2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_28d2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2603_c3_df74 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_28d2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_28d2_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_28d2_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_28d2_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_28d2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_153a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_153a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_153a_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_4a23_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_4a23_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_4a23_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_4a23_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_4a23_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_f9be_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_4a23_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_4a23_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_4a23_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_f9be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_4a23_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_4a23_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_4a23_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_f9be_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_4a23_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_4a23_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_4a23_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_f9be_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_4a23_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_4a23_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_4a23_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_f9be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_4a23_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_4a23_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2607_c3_c044 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_4a23_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_f9be_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_4a23_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_4a23_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_4a23_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_f9be_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_4a23_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_6e53_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_6e53_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_6e53_return_output : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_f9be_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_f9be_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_f9be_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_f9be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_f9be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_f9be_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_f9be_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_f9be_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_a145_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_f9be_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_f9be_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_f9be_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_a145_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_f9be_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_f9be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_f9be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_a145_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_f9be_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_f9be_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2613_c3_0f4d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_f9be_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_a145_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_f9be_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_f9be_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_f9be_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_a145_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_f9be_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_c69b_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_c69b_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_c69b_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_c69b_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_2621_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_2621_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_2621_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_a145_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_a145_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_9733_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_a145_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_a145_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2618_c3_e03b : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_a145_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_a145_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_a145_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_a145_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_9733_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_a145_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_a145_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2619_c3_459d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_a145_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_9733_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_a145_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_a145_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_a145_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_a145_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_8ed0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_8ed0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_8ed0_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_9733_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_9733_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_3e42_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_9733_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_9733_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_9733_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_3e42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_9733_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_9733_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2623_c3_f1fd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_9733_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_3e42_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_9733_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_c4dd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_c4dd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_c4dd_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_3e42_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_3e42_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_3e42_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_3e42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_3e42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_3e42_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_3e42_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2627_c3_0426 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_3e42_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2626_c7_3e42_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_3e42_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2626_l2585_l2605_l2601_l2598_DUPLICATE_b188_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2609_l2601_l2605_l2598_DUPLICATE_c10d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2601_l2616_l2605_l2598_DUPLICATE_32b7_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2626_l2622_l2616_l2609_l2605_l2601_l2598_DUPLICATE_6d15_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l2581_l2632_DUPLICATE_bae0_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2627_c3_0426 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_3e42_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2627_c3_0426;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_c4dd_right := to_unsigned(7, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_c69b_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_8ed0_right := to_unsigned(6, 3);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2599_c3_15b2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_7907_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2599_c3_15b2;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2613_c3_0f4d := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_f9be_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2613_c3_0f4d;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_f9be_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_153a_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2623_c3_f1fd := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_9733_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2623_c3_f1fd;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_6b3a_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2607_c3_c044 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_4a23_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2607_c3_c044;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_6e53_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_c69b_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2619_c3_459d := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_a145_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2619_c3_459d;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_3e42_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2603_c3_df74 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_28d2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2603_c3_df74;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2618_c3_e03b := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_a145_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2618_c3_e03b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2595_c3_4704 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2595_c3_4704;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2590_c3_8049 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2590_c3_8049;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_2621_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c46e_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3125_right := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_c69b_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_7907_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_28d2_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_4a23_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_f9be_iffalse := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_9733_iftrue := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_7907_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_28d2_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_4a23_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_f9be_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_a145_iffalse := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_3e42_iftrue := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3125_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c46e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_6b3a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_153a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_6e53_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_2621_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_8ed0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_c4dd_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_f9be_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_a145_iftrue := VAR_previous_stack_read;
     VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_28d2_iftrue := VAR_previous_stack_read;
     VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_4a23_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_f9be_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_7907_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_28d2_iffalse := t16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_a145_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_7907_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_28d2_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_4a23_iffalse := t16_low;
     -- BIN_OP_EQ[uxn_opcodes_h_l2622_c11_8ed0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2622_c11_8ed0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_8ed0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2622_c11_8ed0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_8ed0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_8ed0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2622_c11_8ed0_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2626_c7_3e42] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2626_c7_3e42_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2601_l2616_l2605_l2598_DUPLICATE_32b7 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2601_l2616_l2605_l2598_DUPLICATE_32b7_return_output := result.sp_relative_shift;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2585_c2_b628] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2585_c2_b628_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l2601_c11_6b3a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2601_c11_6b3a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_6b3a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2601_c11_6b3a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_6b3a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_6b3a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2601_c11_6b3a_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2585_c2_b628] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2585_c2_b628_return_output := result.is_vram_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2585_c2_b628] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2585_c2_b628_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2609_l2601_l2605_l2598_DUPLICATE_c10d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2609_l2601_l2605_l2598_DUPLICATE_c10d_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2585_c6_3125] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3125_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3125_left;
     BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3125_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3125_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3125_return_output := BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3125_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2626_l2622_l2616_l2609_l2605_l2601_l2598_DUPLICATE_6d15 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2626_l2622_l2616_l2609_l2605_l2601_l2598_DUPLICATE_6d15_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2616_c11_2621] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2616_c11_2621_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_2621_left;
     BIN_OP_EQ_uxn_opcodes_h_l2616_c11_2621_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_2621_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_2621_return_output := BIN_OP_EQ_uxn_opcodes_h_l2616_c11_2621_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2605_c11_153a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2605_c11_153a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_153a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2605_c11_153a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_153a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_153a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2605_c11_153a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2609_c11_6e53] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2609_c11_6e53_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_6e53_left;
     BIN_OP_EQ_uxn_opcodes_h_l2609_c11_6e53_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_6e53_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_6e53_return_output := BIN_OP_EQ_uxn_opcodes_h_l2609_c11_6e53_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2611_c30_c69b] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2611_c30_c69b_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_c69b_ins;
     sp_relative_shift_uxn_opcodes_h_l2611_c30_c69b_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_c69b_x;
     sp_relative_shift_uxn_opcodes_h_l2611_c30_c69b_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_c69b_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_c69b_return_output := sp_relative_shift_uxn_opcodes_h_l2611_c30_c69b_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2585_c2_b628] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2585_c2_b628_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2598_c11_c46e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c46e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c46e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c46e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c46e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c46e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c46e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2626_c11_c4dd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2626_c11_c4dd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_c4dd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2626_c11_c4dd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_c4dd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_c4dd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2626_c11_c4dd_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2626_l2585_l2605_l2601_l2598_DUPLICATE_b188 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2626_l2585_l2605_l2601_l2598_DUPLICATE_b188_return_output := result.u8_value;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_b628_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3125_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_b628_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3125_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_b628_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3125_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_b628_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3125_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_b628_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3125_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_b628_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3125_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_b628_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3125_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_b628_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3125_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_b628_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3125_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_b628_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3125_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_b628_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3125_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_b628_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3125_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_b628_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_3125_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_7907_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c46e_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_7907_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c46e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_7907_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c46e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_7907_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c46e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_7907_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c46e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_7907_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c46e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_7907_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c46e_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_7907_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c46e_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_7907_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c46e_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_28d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_6b3a_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_28d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_6b3a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_28d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_6b3a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_28d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_6b3a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_28d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_6b3a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_28d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_6b3a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_28d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_6b3a_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_28d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_6b3a_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_28d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_6b3a_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_4a23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_153a_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_4a23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_153a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_4a23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_153a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_4a23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_153a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_4a23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_153a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_4a23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_153a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_4a23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_153a_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_4a23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_153a_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_f9be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_6e53_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_f9be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_6e53_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_f9be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_6e53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_f9be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_6e53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_f9be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_6e53_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_f9be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_6e53_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_f9be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_6e53_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_a145_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_2621_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_a145_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_2621_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_a145_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_2621_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_a145_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_2621_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_a145_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_2621_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_9733_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_8ed0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_9733_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_8ed0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_9733_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_8ed0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_3e42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_c4dd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_3e42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_c4dd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_3e42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_c4dd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_7907_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2601_l2616_l2605_l2598_DUPLICATE_32b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_28d2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2601_l2616_l2605_l2598_DUPLICATE_32b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_4a23_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2601_l2616_l2605_l2598_DUPLICATE_32b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_a145_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2601_l2616_l2605_l2598_DUPLICATE_32b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_7907_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2626_l2622_l2616_l2609_l2605_l2601_l2598_DUPLICATE_6d15_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_28d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2626_l2622_l2616_l2609_l2605_l2601_l2598_DUPLICATE_6d15_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_4a23_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2626_l2622_l2616_l2609_l2605_l2601_l2598_DUPLICATE_6d15_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_f9be_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2626_l2622_l2616_l2609_l2605_l2601_l2598_DUPLICATE_6d15_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_a145_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2626_l2622_l2616_l2609_l2605_l2601_l2598_DUPLICATE_6d15_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_9733_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2626_l2622_l2616_l2609_l2605_l2601_l2598_DUPLICATE_6d15_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_3e42_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2626_l2622_l2616_l2609_l2605_l2601_l2598_DUPLICATE_6d15_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_7907_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2609_l2601_l2605_l2598_DUPLICATE_c10d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_28d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2609_l2601_l2605_l2598_DUPLICATE_c10d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_4a23_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2609_l2601_l2605_l2598_DUPLICATE_c10d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_f9be_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2609_l2601_l2605_l2598_DUPLICATE_c10d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2626_l2585_l2605_l2601_l2598_DUPLICATE_b188_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_7907_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2626_l2585_l2605_l2601_l2598_DUPLICATE_b188_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_28d2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2626_l2585_l2605_l2601_l2598_DUPLICATE_b188_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_4a23_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2626_l2585_l2605_l2601_l2598_DUPLICATE_b188_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_3e42_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2626_l2585_l2605_l2601_l2598_DUPLICATE_b188_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2585_c2_b628_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2585_c2_b628_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2585_c2_b628_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2585_c2_b628_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_3e42_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2626_c7_3e42_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_f9be_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_c69b_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2626_c7_3e42] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2626_c7_3e42_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_3e42_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2626_c7_3e42_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_3e42_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2626_c7_3e42_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_3e42_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_3e42_return_output := result_u8_value_MUX_uxn_opcodes_h_l2626_c7_3e42_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2585_c2_b628] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_b628_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_b628_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_b628_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_b628_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2601_c7_28d2] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2601_c7_28d2_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_28d2_cond;
     t16_high_MUX_uxn_opcodes_h_l2601_c7_28d2_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_28d2_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2601_c7_28d2_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_28d2_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output := t16_high_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2609_c7_f9be] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_f9be_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_f9be_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_f9be_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_f9be_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_f9be_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_f9be_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_f9be_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_f9be_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2616_c7_a145] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_a145_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_a145_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_a145_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_a145_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_a145_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_a145_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_a145_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_a145_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2626_c7_3e42] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_3e42_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_3e42_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_3e42_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_3e42_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_3e42_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_3e42_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_3e42_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_3e42_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2585_c2_b628] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_b628_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_b628_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_b628_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_b628_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2616_c7_a145] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2616_c7_a145_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_a145_cond;
     n16_low_MUX_uxn_opcodes_h_l2616_c7_a145_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_a145_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2616_c7_a145_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_a145_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_a145_return_output := n16_low_MUX_uxn_opcodes_h_l2616_c7_a145_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2626_c7_3e42] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_3e42_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_3e42_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_3e42_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_3e42_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_3e42_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_3e42_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_3e42_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_3e42_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2585_c2_b628] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_b628_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_b628_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_b628_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_b628_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2605_c7_4a23] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2605_c7_4a23_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_4a23_cond;
     t16_low_MUX_uxn_opcodes_h_l2605_c7_4a23_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_4a23_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2605_c7_4a23_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_4a23_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output := t16_low_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2585_c2_b628] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_b628_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_b628_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_b628_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_b628_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2609_c7_f9be] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2609_c7_f9be_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_f9be_cond;
     n16_high_MUX_uxn_opcodes_h_l2609_c7_f9be_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_f9be_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2609_c7_f9be_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_f9be_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_f9be_return_output := n16_high_MUX_uxn_opcodes_h_l2609_c7_f9be_return_output;

     -- Submodule level 2
     VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_4a23_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_f9be_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_f9be_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_a145_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_9733_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_3e42_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_4a23_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_f9be_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_f9be_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_a145_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_9733_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_3e42_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_9733_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_3e42_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_7907_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_28d2_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2622_c7_9733] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_9733_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_9733_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_9733_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_9733_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_9733_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_9733_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_9733_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_9733_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2609_c7_f9be] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2609_c7_f9be_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_f9be_cond;
     n16_low_MUX_uxn_opcodes_h_l2609_c7_f9be_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_f9be_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2609_c7_f9be_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_f9be_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_f9be_return_output := n16_low_MUX_uxn_opcodes_h_l2609_c7_f9be_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2605_c7_4a23] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2605_c7_4a23_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_4a23_cond;
     n16_high_MUX_uxn_opcodes_h_l2605_c7_4a23_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_4a23_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2605_c7_4a23_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_4a23_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output := n16_high_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2601_c7_28d2] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2601_c7_28d2_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_28d2_cond;
     t16_low_MUX_uxn_opcodes_h_l2601_c7_28d2_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_28d2_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2601_c7_28d2_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_28d2_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output := t16_low_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2622_c7_9733] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_9733_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_9733_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_9733_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_9733_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_9733_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_9733_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_9733_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_9733_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2622_c7_9733] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2622_c7_9733_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_9733_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2622_c7_9733_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_9733_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2622_c7_9733_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_9733_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_9733_return_output := result_u8_value_MUX_uxn_opcodes_h_l2622_c7_9733_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2605_c7_4a23] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_4a23_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_4a23_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_4a23_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_4a23_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_4a23_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_4a23_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2598_c7_7907] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2598_c7_7907_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_7907_cond;
     t16_high_MUX_uxn_opcodes_h_l2598_c7_7907_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_7907_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2598_c7_7907_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_7907_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_7907_return_output := t16_high_MUX_uxn_opcodes_h_l2598_c7_7907_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2609_c7_f9be] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_f9be_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_f9be_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_f9be_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_f9be_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_f9be_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_f9be_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_f9be_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_f9be_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_28d2_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_4a23_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_f9be_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_a145_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_9733_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_28d2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_4a23_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_f9be_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_a145_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_9733_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_a145_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_9733_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_7907_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_7907_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output;
     -- t16_low_MUX[uxn_opcodes_h_l2598_c7_7907] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2598_c7_7907_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_7907_cond;
     t16_low_MUX_uxn_opcodes_h_l2598_c7_7907_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_7907_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2598_c7_7907_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_7907_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_7907_return_output := t16_low_MUX_uxn_opcodes_h_l2598_c7_7907_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2605_c7_4a23] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_4a23_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_4a23_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_4a23_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_4a23_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_4a23_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_4a23_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2616_c7_a145] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2616_c7_a145_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_a145_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2616_c7_a145_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_a145_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2616_c7_a145_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_a145_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_a145_return_output := result_u8_value_MUX_uxn_opcodes_h_l2616_c7_a145_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2605_c7_4a23] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2605_c7_4a23_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_4a23_cond;
     n16_low_MUX_uxn_opcodes_h_l2605_c7_4a23_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_4a23_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2605_c7_4a23_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_4a23_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output := n16_low_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2616_c7_a145] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_a145_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_a145_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_a145_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_a145_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_a145_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_a145_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_a145_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_a145_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2601_c7_28d2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_28d2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_28d2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_28d2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_28d2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_28d2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_28d2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2616_c7_a145] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_a145_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_a145_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_a145_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_a145_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_a145_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_a145_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_a145_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_a145_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2585_c2_b628] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2585_c2_b628_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_b628_cond;
     t16_high_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_b628_return_output := t16_high_MUX_uxn_opcodes_h_l2585_c2_b628_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2601_c7_28d2] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2601_c7_28d2_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_28d2_cond;
     n16_high_MUX_uxn_opcodes_h_l2601_c7_28d2_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_28d2_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2601_c7_28d2_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_28d2_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output := n16_high_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_7907_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_28d2_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_f9be_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_a145_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_7907_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_28d2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_f9be_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_a145_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_f9be_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_a145_return_output;
     REG_VAR_t16_high := VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_b628_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_7907_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2601_c7_28d2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_28d2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_28d2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_28d2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_28d2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_28d2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_28d2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2601_c7_28d2] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2601_c7_28d2_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_28d2_cond;
     n16_low_MUX_uxn_opcodes_h_l2601_c7_28d2_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_28d2_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2601_c7_28d2_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_28d2_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output := n16_low_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2609_c7_f9be] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_f9be_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_f9be_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_f9be_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_f9be_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_f9be_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_f9be_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_f9be_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_f9be_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2598_c7_7907] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2598_c7_7907_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_7907_cond;
     n16_high_MUX_uxn_opcodes_h_l2598_c7_7907_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_7907_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2598_c7_7907_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_7907_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_7907_return_output := n16_high_MUX_uxn_opcodes_h_l2598_c7_7907_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2609_c7_f9be] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_f9be_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_f9be_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_f9be_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_f9be_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_f9be_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_f9be_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_f9be_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_f9be_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2598_c7_7907] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_7907_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_7907_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_7907_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_7907_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_7907_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_7907_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_7907_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_7907_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2609_c7_f9be] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2609_c7_f9be_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_f9be_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2609_c7_f9be_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_f9be_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2609_c7_f9be_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_f9be_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_f9be_return_output := result_u8_value_MUX_uxn_opcodes_h_l2609_c7_f9be_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2585_c2_b628] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2585_c2_b628_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_b628_cond;
     t16_low_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_b628_return_output := t16_low_MUX_uxn_opcodes_h_l2585_c2_b628_return_output;

     -- Submodule level 5
     VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_7907_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_7907_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_4a23_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_f9be_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_7907_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_7907_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_4a23_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_f9be_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_4a23_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_f9be_return_output;
     REG_VAR_t16_low := VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_b628_return_output;
     -- n16_low_MUX[uxn_opcodes_h_l2598_c7_7907] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2598_c7_7907_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_7907_cond;
     n16_low_MUX_uxn_opcodes_h_l2598_c7_7907_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_7907_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2598_c7_7907_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_7907_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_7907_return_output := n16_low_MUX_uxn_opcodes_h_l2598_c7_7907_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2605_c7_4a23] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2605_c7_4a23_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_4a23_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2605_c7_4a23_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_4a23_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2605_c7_4a23_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_4a23_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output := result_u8_value_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2585_c2_b628] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_b628_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_b628_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_b628_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_b628_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2598_c7_7907] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_7907_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_7907_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_7907_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_7907_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_7907_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_7907_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_7907_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_7907_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2605_c7_4a23] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_4a23_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_4a23_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_4a23_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_4a23_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_4a23_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_4a23_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2585_c2_b628] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2585_c2_b628_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_b628_cond;
     n16_high_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_b628_return_output := n16_high_MUX_uxn_opcodes_h_l2585_c2_b628_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2605_c7_4a23] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_4a23_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_4a23_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_4a23_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_4a23_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_4a23_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_4a23_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output;

     -- Submodule level 6
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_b628_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_7907_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_28d2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_7907_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_28d2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_28d2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_4a23_return_output;
     -- n16_low_MUX[uxn_opcodes_h_l2585_c2_b628] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2585_c2_b628_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_b628_cond;
     n16_low_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_b628_return_output := n16_low_MUX_uxn_opcodes_h_l2585_c2_b628_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2601_c7_28d2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_28d2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_28d2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_28d2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_28d2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_28d2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_28d2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2601_c7_28d2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_28d2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_28d2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_28d2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_28d2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_28d2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_28d2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2585_c2_b628] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_b628_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_b628_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_b628_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_b628_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2601_c7_28d2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2601_c7_28d2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_28d2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2601_c7_28d2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_28d2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2601_c7_28d2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_28d2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output := result_u8_value_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output;

     -- Submodule level 7
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_b628_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_7907_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_7907_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_7907_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_28d2_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2598_c7_7907] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_7907_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_7907_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_7907_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_7907_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_7907_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_7907_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_7907_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_7907_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2598_c7_7907] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2598_c7_7907_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_7907_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2598_c7_7907_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_7907_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2598_c7_7907_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_7907_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_7907_return_output := result_u8_value_MUX_uxn_opcodes_h_l2598_c7_7907_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2598_c7_7907] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_7907_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_7907_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_7907_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_7907_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_7907_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_7907_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_7907_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_7907_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_7907_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_7907_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_7907_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2585_c2_b628] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_b628_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_b628_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_b628_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_b628_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2585_c2_b628] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_b628_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_b628_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_b628_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_b628_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2585_c2_b628] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2585_c2_b628_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_b628_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_b628_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_b628_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_b628_return_output := result_u8_value_MUX_uxn_opcodes_h_l2585_c2_b628_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l2581_l2632_DUPLICATE_bae0 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l2581_l2632_DUPLICATE_bae0_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_b628_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_b628_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_b628_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_b628_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_b628_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_b628_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_b628_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_b628_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_b628_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l2581_l2632_DUPLICATE_bae0_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l2581_l2632_DUPLICATE_bae0_return_output;
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
