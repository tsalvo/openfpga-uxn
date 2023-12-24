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
-- BIN_OP_EQ[uxn_opcodes_h_l2585_c6_8a4b]
signal BIN_OP_EQ_uxn_opcodes_h_l2585_c6_8a4b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2585_c6_8a4b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2585_c6_8a4b_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2585_c2_c697]
signal n16_low_MUX_uxn_opcodes_h_l2585_c2_c697_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2585_c2_c697_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2585_c2_c697]
signal n16_high_MUX_uxn_opcodes_h_l2585_c2_c697_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2585_c2_c697_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2585_c2_c697]
signal result_u8_value_MUX_uxn_opcodes_h_l2585_c2_c697_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2585_c2_c697_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2585_c2_c697]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_c697_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_c697_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2585_c2_c697]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_c697_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_c697_return_output : unsigned(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2585_c2_c697]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_c697_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_c697_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2585_c2_c697]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_c697_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_c697_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2585_c2_c697]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_c697_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_c697_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2585_c2_c697]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_c697_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_c697_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2585_c2_c697]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_c697_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_c697_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2585_c2_c697]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_c697_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_c697_return_output : unsigned(0 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2585_c2_c697]
signal t16_high_MUX_uxn_opcodes_h_l2585_c2_c697_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2585_c2_c697_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2585_c2_c697]
signal t16_low_MUX_uxn_opcodes_h_l2585_c2_c697_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2585_c2_c697_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2598_c11_f54e]
signal BIN_OP_EQ_uxn_opcodes_h_l2598_c11_f54e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2598_c11_f54e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2598_c11_f54e_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2598_c7_76e8]
signal n16_low_MUX_uxn_opcodes_h_l2598_c7_76e8_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2598_c7_76e8_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2598_c7_76e8_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2598_c7_76e8]
signal n16_high_MUX_uxn_opcodes_h_l2598_c7_76e8_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2598_c7_76e8_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2598_c7_76e8_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2598_c7_76e8]
signal result_u8_value_MUX_uxn_opcodes_h_l2598_c7_76e8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2598_c7_76e8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2598_c7_76e8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2598_c7_76e8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_76e8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_76e8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_76e8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2598_c7_76e8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_76e8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_76e8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_76e8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2598_c7_76e8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_76e8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_76e8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_76e8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2598_c7_76e8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_76e8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_76e8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_76e8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output : unsigned(0 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2598_c7_76e8]
signal t16_high_MUX_uxn_opcodes_h_l2598_c7_76e8_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2598_c7_76e8_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2598_c7_76e8_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2598_c7_76e8]
signal t16_low_MUX_uxn_opcodes_h_l2598_c7_76e8_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2598_c7_76e8_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2598_c7_76e8_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2601_c11_44e4]
signal BIN_OP_EQ_uxn_opcodes_h_l2601_c11_44e4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2601_c11_44e4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2601_c11_44e4_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2601_c7_7a9e]
signal n16_low_MUX_uxn_opcodes_h_l2601_c7_7a9e_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2601_c7_7a9e_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2601_c7_7a9e_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2601_c7_7a9e]
signal n16_high_MUX_uxn_opcodes_h_l2601_c7_7a9e_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2601_c7_7a9e_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2601_c7_7a9e_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2601_c7_7a9e]
signal result_u8_value_MUX_uxn_opcodes_h_l2601_c7_7a9e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2601_c7_7a9e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2601_c7_7a9e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2601_c7_7a9e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_7a9e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_7a9e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_7a9e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2601_c7_7a9e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_7a9e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_7a9e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_7a9e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2601_c7_7a9e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_7a9e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_7a9e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_7a9e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2601_c7_7a9e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_7a9e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_7a9e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_7a9e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output : unsigned(0 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2601_c7_7a9e]
signal t16_high_MUX_uxn_opcodes_h_l2601_c7_7a9e_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2601_c7_7a9e_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2601_c7_7a9e_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2601_c7_7a9e]
signal t16_low_MUX_uxn_opcodes_h_l2601_c7_7a9e_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2601_c7_7a9e_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2601_c7_7a9e_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2605_c11_9c68]
signal BIN_OP_EQ_uxn_opcodes_h_l2605_c11_9c68_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2605_c11_9c68_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2605_c11_9c68_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2605_c7_4a83]
signal n16_low_MUX_uxn_opcodes_h_l2605_c7_4a83_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2605_c7_4a83_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2605_c7_4a83_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2605_c7_4a83]
signal n16_high_MUX_uxn_opcodes_h_l2605_c7_4a83_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2605_c7_4a83_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2605_c7_4a83_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2605_c7_4a83]
signal result_u8_value_MUX_uxn_opcodes_h_l2605_c7_4a83_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2605_c7_4a83_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2605_c7_4a83_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2605_c7_4a83]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_4a83_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_4a83_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_4a83_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2605_c7_4a83]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_4a83_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_4a83_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_4a83_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2605_c7_4a83]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_4a83_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_4a83_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_4a83_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2605_c7_4a83]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_4a83_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_4a83_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_4a83_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2605_c7_4a83]
signal t16_low_MUX_uxn_opcodes_h_l2605_c7_4a83_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2605_c7_4a83_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2605_c7_4a83_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2609_c11_f0d0]
signal BIN_OP_EQ_uxn_opcodes_h_l2609_c11_f0d0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2609_c11_f0d0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2609_c11_f0d0_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2609_c7_4383]
signal n16_low_MUX_uxn_opcodes_h_l2609_c7_4383_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2609_c7_4383_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2609_c7_4383_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2609_c7_4383_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2609_c7_4383]
signal n16_high_MUX_uxn_opcodes_h_l2609_c7_4383_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2609_c7_4383_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2609_c7_4383_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2609_c7_4383_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2609_c7_4383]
signal result_u8_value_MUX_uxn_opcodes_h_l2609_c7_4383_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2609_c7_4383_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2609_c7_4383_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2609_c7_4383_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2609_c7_4383]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_4383_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_4383_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_4383_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_4383_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2609_c7_4383]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_4383_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_4383_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_4383_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_4383_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2609_c7_4383]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_4383_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_4383_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_4383_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_4383_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2609_c7_4383]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_4383_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_4383_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_4383_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_4383_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2611_c30_afff]
signal sp_relative_shift_uxn_opcodes_h_l2611_c30_afff_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2611_c30_afff_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2611_c30_afff_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2611_c30_afff_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2616_c11_7199]
signal BIN_OP_EQ_uxn_opcodes_h_l2616_c11_7199_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2616_c11_7199_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2616_c11_7199_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2616_c7_f8e0]
signal n16_low_MUX_uxn_opcodes_h_l2616_c7_f8e0_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2616_c7_f8e0_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2616_c7_f8e0_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2616_c7_f8e0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2616_c7_f8e0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_f8e0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_f8e0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_f8e0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_f8e0_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2616_c7_f8e0]
signal result_u8_value_MUX_uxn_opcodes_h_l2616_c7_f8e0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2616_c7_f8e0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2616_c7_f8e0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2616_c7_f8e0_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2616_c7_f8e0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_f8e0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_f8e0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_f8e0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_f8e0_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2616_c7_f8e0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_f8e0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_f8e0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_f8e0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_f8e0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2622_c11_5c85]
signal BIN_OP_EQ_uxn_opcodes_h_l2622_c11_5c85_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2622_c11_5c85_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2622_c11_5c85_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2622_c7_1c38]
signal result_u8_value_MUX_uxn_opcodes_h_l2622_c7_1c38_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2622_c7_1c38_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2622_c7_1c38_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2622_c7_1c38_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2622_c7_1c38]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_1c38_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_1c38_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_1c38_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_1c38_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2622_c7_1c38]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_1c38_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_1c38_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_1c38_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_1c38_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2626_c11_65db]
signal BIN_OP_EQ_uxn_opcodes_h_l2626_c11_65db_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2626_c11_65db_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2626_c11_65db_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2626_c7_cdc4]
signal result_u8_value_MUX_uxn_opcodes_h_l2626_c7_cdc4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2626_c7_cdc4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2626_c7_cdc4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2626_c7_cdc4_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2626_c7_cdc4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_cdc4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_cdc4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_cdc4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_cdc4_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2626_c7_cdc4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_cdc4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_cdc4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_cdc4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_cdc4_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_922a( ref_toks_0 : opcode_result_t;
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
      base.u8_value := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_pc_updated := ref_toks_6;
      base.is_opc_done := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.is_stack_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2585_c6_8a4b
BIN_OP_EQ_uxn_opcodes_h_l2585_c6_8a4b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2585_c6_8a4b_left,
BIN_OP_EQ_uxn_opcodes_h_l2585_c6_8a4b_right,
BIN_OP_EQ_uxn_opcodes_h_l2585_c6_8a4b_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2585_c2_c697
n16_low_MUX_uxn_opcodes_h_l2585_c2_c697 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2585_c2_c697_cond,
n16_low_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue,
n16_low_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse,
n16_low_MUX_uxn_opcodes_h_l2585_c2_c697_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2585_c2_c697
n16_high_MUX_uxn_opcodes_h_l2585_c2_c697 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2585_c2_c697_cond,
n16_high_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue,
n16_high_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse,
n16_high_MUX_uxn_opcodes_h_l2585_c2_c697_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2585_c2_c697
result_u8_value_MUX_uxn_opcodes_h_l2585_c2_c697 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2585_c2_c697_cond,
result_u8_value_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2585_c2_c697_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_c697
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_c697 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_c697_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_c697_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_c697
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_c697 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_c697_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_c697_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_c697
result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_c697 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_c697_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_c697_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_c697
result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_c697 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_c697_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_c697_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_c697
result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_c697 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_c697_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_c697_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_c697
result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_c697 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_c697_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_c697_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_c697
result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_c697 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_c697_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_c697_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_c697
result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_c697 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_c697_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_c697_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2585_c2_c697
t16_high_MUX_uxn_opcodes_h_l2585_c2_c697 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2585_c2_c697_cond,
t16_high_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue,
t16_high_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse,
t16_high_MUX_uxn_opcodes_h_l2585_c2_c697_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2585_c2_c697
t16_low_MUX_uxn_opcodes_h_l2585_c2_c697 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2585_c2_c697_cond,
t16_low_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue,
t16_low_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse,
t16_low_MUX_uxn_opcodes_h_l2585_c2_c697_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2598_c11_f54e
BIN_OP_EQ_uxn_opcodes_h_l2598_c11_f54e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2598_c11_f54e_left,
BIN_OP_EQ_uxn_opcodes_h_l2598_c11_f54e_right,
BIN_OP_EQ_uxn_opcodes_h_l2598_c11_f54e_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2598_c7_76e8
n16_low_MUX_uxn_opcodes_h_l2598_c7_76e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2598_c7_76e8_cond,
n16_low_MUX_uxn_opcodes_h_l2598_c7_76e8_iftrue,
n16_low_MUX_uxn_opcodes_h_l2598_c7_76e8_iffalse,
n16_low_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2598_c7_76e8
n16_high_MUX_uxn_opcodes_h_l2598_c7_76e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2598_c7_76e8_cond,
n16_high_MUX_uxn_opcodes_h_l2598_c7_76e8_iftrue,
n16_high_MUX_uxn_opcodes_h_l2598_c7_76e8_iffalse,
n16_high_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2598_c7_76e8
result_u8_value_MUX_uxn_opcodes_h_l2598_c7_76e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2598_c7_76e8_cond,
result_u8_value_MUX_uxn_opcodes_h_l2598_c7_76e8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2598_c7_76e8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_76e8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_76e8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_76e8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_76e8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_76e8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_76e8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_76e8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_76e8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_76e8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_76e8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_76e8
result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_76e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_76e8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_76e8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_76e8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_76e8
result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_76e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_76e8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_76e8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_76e8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2598_c7_76e8
t16_high_MUX_uxn_opcodes_h_l2598_c7_76e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2598_c7_76e8_cond,
t16_high_MUX_uxn_opcodes_h_l2598_c7_76e8_iftrue,
t16_high_MUX_uxn_opcodes_h_l2598_c7_76e8_iffalse,
t16_high_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2598_c7_76e8
t16_low_MUX_uxn_opcodes_h_l2598_c7_76e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2598_c7_76e8_cond,
t16_low_MUX_uxn_opcodes_h_l2598_c7_76e8_iftrue,
t16_low_MUX_uxn_opcodes_h_l2598_c7_76e8_iffalse,
t16_low_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2601_c11_44e4
BIN_OP_EQ_uxn_opcodes_h_l2601_c11_44e4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2601_c11_44e4_left,
BIN_OP_EQ_uxn_opcodes_h_l2601_c11_44e4_right,
BIN_OP_EQ_uxn_opcodes_h_l2601_c11_44e4_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2601_c7_7a9e
n16_low_MUX_uxn_opcodes_h_l2601_c7_7a9e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2601_c7_7a9e_cond,
n16_low_MUX_uxn_opcodes_h_l2601_c7_7a9e_iftrue,
n16_low_MUX_uxn_opcodes_h_l2601_c7_7a9e_iffalse,
n16_low_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2601_c7_7a9e
n16_high_MUX_uxn_opcodes_h_l2601_c7_7a9e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2601_c7_7a9e_cond,
n16_high_MUX_uxn_opcodes_h_l2601_c7_7a9e_iftrue,
n16_high_MUX_uxn_opcodes_h_l2601_c7_7a9e_iffalse,
n16_high_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2601_c7_7a9e
result_u8_value_MUX_uxn_opcodes_h_l2601_c7_7a9e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2601_c7_7a9e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2601_c7_7a9e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2601_c7_7a9e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_7a9e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_7a9e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_7a9e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_7a9e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_7a9e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_7a9e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_7a9e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_7a9e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_7a9e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_7a9e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_7a9e
result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_7a9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_7a9e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_7a9e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_7a9e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_7a9e
result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_7a9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_7a9e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_7a9e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_7a9e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2601_c7_7a9e
t16_high_MUX_uxn_opcodes_h_l2601_c7_7a9e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2601_c7_7a9e_cond,
t16_high_MUX_uxn_opcodes_h_l2601_c7_7a9e_iftrue,
t16_high_MUX_uxn_opcodes_h_l2601_c7_7a9e_iffalse,
t16_high_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2601_c7_7a9e
t16_low_MUX_uxn_opcodes_h_l2601_c7_7a9e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2601_c7_7a9e_cond,
t16_low_MUX_uxn_opcodes_h_l2601_c7_7a9e_iftrue,
t16_low_MUX_uxn_opcodes_h_l2601_c7_7a9e_iffalse,
t16_low_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2605_c11_9c68
BIN_OP_EQ_uxn_opcodes_h_l2605_c11_9c68 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2605_c11_9c68_left,
BIN_OP_EQ_uxn_opcodes_h_l2605_c11_9c68_right,
BIN_OP_EQ_uxn_opcodes_h_l2605_c11_9c68_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2605_c7_4a83
n16_low_MUX_uxn_opcodes_h_l2605_c7_4a83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2605_c7_4a83_cond,
n16_low_MUX_uxn_opcodes_h_l2605_c7_4a83_iftrue,
n16_low_MUX_uxn_opcodes_h_l2605_c7_4a83_iffalse,
n16_low_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2605_c7_4a83
n16_high_MUX_uxn_opcodes_h_l2605_c7_4a83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2605_c7_4a83_cond,
n16_high_MUX_uxn_opcodes_h_l2605_c7_4a83_iftrue,
n16_high_MUX_uxn_opcodes_h_l2605_c7_4a83_iffalse,
n16_high_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2605_c7_4a83
result_u8_value_MUX_uxn_opcodes_h_l2605_c7_4a83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2605_c7_4a83_cond,
result_u8_value_MUX_uxn_opcodes_h_l2605_c7_4a83_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2605_c7_4a83_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_4a83
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_4a83 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_4a83_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_4a83_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_4a83_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_4a83
result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_4a83 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_4a83_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_4a83_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_4a83_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_4a83
result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_4a83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_4a83_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_4a83_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_4a83_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_4a83
result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_4a83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_4a83_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_4a83_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_4a83_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2605_c7_4a83
t16_low_MUX_uxn_opcodes_h_l2605_c7_4a83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2605_c7_4a83_cond,
t16_low_MUX_uxn_opcodes_h_l2605_c7_4a83_iftrue,
t16_low_MUX_uxn_opcodes_h_l2605_c7_4a83_iffalse,
t16_low_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2609_c11_f0d0
BIN_OP_EQ_uxn_opcodes_h_l2609_c11_f0d0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2609_c11_f0d0_left,
BIN_OP_EQ_uxn_opcodes_h_l2609_c11_f0d0_right,
BIN_OP_EQ_uxn_opcodes_h_l2609_c11_f0d0_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2609_c7_4383
n16_low_MUX_uxn_opcodes_h_l2609_c7_4383 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2609_c7_4383_cond,
n16_low_MUX_uxn_opcodes_h_l2609_c7_4383_iftrue,
n16_low_MUX_uxn_opcodes_h_l2609_c7_4383_iffalse,
n16_low_MUX_uxn_opcodes_h_l2609_c7_4383_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2609_c7_4383
n16_high_MUX_uxn_opcodes_h_l2609_c7_4383 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2609_c7_4383_cond,
n16_high_MUX_uxn_opcodes_h_l2609_c7_4383_iftrue,
n16_high_MUX_uxn_opcodes_h_l2609_c7_4383_iffalse,
n16_high_MUX_uxn_opcodes_h_l2609_c7_4383_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2609_c7_4383
result_u8_value_MUX_uxn_opcodes_h_l2609_c7_4383 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2609_c7_4383_cond,
result_u8_value_MUX_uxn_opcodes_h_l2609_c7_4383_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2609_c7_4383_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2609_c7_4383_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_4383
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_4383 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_4383_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_4383_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_4383_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_4383_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_4383
result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_4383 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_4383_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_4383_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_4383_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_4383_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_4383
result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_4383 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_4383_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_4383_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_4383_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_4383_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_4383
result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_4383 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_4383_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_4383_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_4383_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_4383_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2611_c30_afff
sp_relative_shift_uxn_opcodes_h_l2611_c30_afff : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2611_c30_afff_ins,
sp_relative_shift_uxn_opcodes_h_l2611_c30_afff_x,
sp_relative_shift_uxn_opcodes_h_l2611_c30_afff_y,
sp_relative_shift_uxn_opcodes_h_l2611_c30_afff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2616_c11_7199
BIN_OP_EQ_uxn_opcodes_h_l2616_c11_7199 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2616_c11_7199_left,
BIN_OP_EQ_uxn_opcodes_h_l2616_c11_7199_right,
BIN_OP_EQ_uxn_opcodes_h_l2616_c11_7199_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2616_c7_f8e0
n16_low_MUX_uxn_opcodes_h_l2616_c7_f8e0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2616_c7_f8e0_cond,
n16_low_MUX_uxn_opcodes_h_l2616_c7_f8e0_iftrue,
n16_low_MUX_uxn_opcodes_h_l2616_c7_f8e0_iffalse,
n16_low_MUX_uxn_opcodes_h_l2616_c7_f8e0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_f8e0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_f8e0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_f8e0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_f8e0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_f8e0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_f8e0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2616_c7_f8e0
result_u8_value_MUX_uxn_opcodes_h_l2616_c7_f8e0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2616_c7_f8e0_cond,
result_u8_value_MUX_uxn_opcodes_h_l2616_c7_f8e0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2616_c7_f8e0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2616_c7_f8e0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_f8e0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_f8e0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_f8e0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_f8e0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_f8e0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_f8e0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_f8e0
result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_f8e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_f8e0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_f8e0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_f8e0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_f8e0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2622_c11_5c85
BIN_OP_EQ_uxn_opcodes_h_l2622_c11_5c85 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2622_c11_5c85_left,
BIN_OP_EQ_uxn_opcodes_h_l2622_c11_5c85_right,
BIN_OP_EQ_uxn_opcodes_h_l2622_c11_5c85_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2622_c7_1c38
result_u8_value_MUX_uxn_opcodes_h_l2622_c7_1c38 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2622_c7_1c38_cond,
result_u8_value_MUX_uxn_opcodes_h_l2622_c7_1c38_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2622_c7_1c38_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2622_c7_1c38_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_1c38
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_1c38 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_1c38_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_1c38_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_1c38_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_1c38_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_1c38
result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_1c38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_1c38_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_1c38_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_1c38_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_1c38_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2626_c11_65db
BIN_OP_EQ_uxn_opcodes_h_l2626_c11_65db : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2626_c11_65db_left,
BIN_OP_EQ_uxn_opcodes_h_l2626_c11_65db_right,
BIN_OP_EQ_uxn_opcodes_h_l2626_c11_65db_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2626_c7_cdc4
result_u8_value_MUX_uxn_opcodes_h_l2626_c7_cdc4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2626_c7_cdc4_cond,
result_u8_value_MUX_uxn_opcodes_h_l2626_c7_cdc4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2626_c7_cdc4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2626_c7_cdc4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_cdc4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_cdc4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_cdc4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_cdc4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_cdc4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_cdc4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_cdc4
result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_cdc4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_cdc4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_cdc4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_cdc4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_cdc4_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2585_c6_8a4b_return_output,
 n16_low_MUX_uxn_opcodes_h_l2585_c2_c697_return_output,
 n16_high_MUX_uxn_opcodes_h_l2585_c2_c697_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2585_c2_c697_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_c697_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_c697_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_c697_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_c697_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_c697_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_c697_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_c697_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_c697_return_output,
 t16_high_MUX_uxn_opcodes_h_l2585_c2_c697_return_output,
 t16_low_MUX_uxn_opcodes_h_l2585_c2_c697_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2598_c11_f54e_return_output,
 n16_low_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output,
 n16_high_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output,
 t16_high_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output,
 t16_low_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2601_c11_44e4_return_output,
 n16_low_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output,
 n16_high_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output,
 t16_high_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output,
 t16_low_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2605_c11_9c68_return_output,
 n16_low_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output,
 n16_high_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output,
 t16_low_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2609_c11_f0d0_return_output,
 n16_low_MUX_uxn_opcodes_h_l2609_c7_4383_return_output,
 n16_high_MUX_uxn_opcodes_h_l2609_c7_4383_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2609_c7_4383_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_4383_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_4383_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_4383_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_4383_return_output,
 sp_relative_shift_uxn_opcodes_h_l2611_c30_afff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2616_c11_7199_return_output,
 n16_low_MUX_uxn_opcodes_h_l2616_c7_f8e0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_f8e0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2616_c7_f8e0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_f8e0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_f8e0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2622_c11_5c85_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2622_c7_1c38_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_1c38_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_1c38_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2626_c11_65db_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2626_c7_cdc4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_cdc4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_cdc4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_8a4b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_8a4b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_8a4b_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_c697_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_c697_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_c697_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_c697_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_c697_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_c697_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2585_c2_c697_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_c697_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_c697_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2595_c3_54a0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_c697_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_c697_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2585_c2_c697_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_c697_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_c697_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2590_c3_3283 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_c697_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_c697_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2585_c2_c697_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_c697_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_c697_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_c697_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_c697_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2585_c2_c697_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_c697_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_c697_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_c697_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_c697_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_c697_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_c697_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_c697_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_c697_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_f54e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_f54e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_f54e_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_76e8_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_76e8_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_76e8_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_76e8_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_76e8_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_76e8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_76e8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_76e8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_76e8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_76e8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2599_c3_714e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_76e8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_76e8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_76e8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_76e8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_76e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_76e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_76e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_76e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_76e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_76e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_76e8_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_76e8_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_76e8_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_76e8_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_76e8_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_76e8_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_76e8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_44e4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_44e4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_44e4_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_7a9e_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_7a9e_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_7a9e_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_7a9e_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_7a9e_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_7a9e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_7a9e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_7a9e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_7a9e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_7a9e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2603_c3_9136 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_7a9e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_7a9e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_7a9e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_7a9e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_7a9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_7a9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_7a9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_7a9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_7a9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_7a9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_7a9e_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_7a9e_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_7a9e_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_7a9e_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_7a9e_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_7a9e_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_7a9e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_9c68_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_9c68_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_9c68_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_4a83_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_4a83_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_4383_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_4a83_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_4a83_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_4a83_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_4383_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_4a83_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_4a83_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_4a83_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_4383_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_4a83_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_4a83_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2607_c3_d6f8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_4a83_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_4383_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_4a83_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_4a83_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_4a83_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_4383_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_4a83_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_4a83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_4a83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_4383_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_4a83_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_4a83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_4a83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_4383_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_4a83_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_4a83_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_4a83_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_4a83_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_f0d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_f0d0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_f0d0_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_4383_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_4383_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_f8e0_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_4383_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_4383_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_4383_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_4383_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_4383_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_4383_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_f8e0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_4383_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_4383_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2613_c3_18c0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_4383_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_f8e0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_4383_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_4383_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_4383_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_f8e0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_4383_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_4383_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_4383_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_f8e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_4383_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_4383_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_4383_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_4383_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_afff_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_afff_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_afff_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_afff_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_7199_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_7199_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_7199_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_f8e0_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_f8e0_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_f8e0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_f8e0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2618_c3_bcf8 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_f8e0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_f8e0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_f8e0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_f8e0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_1c38_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_f8e0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_f8e0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2619_c3_ea77 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_f8e0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_1c38_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_f8e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_f8e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_f8e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_1c38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_f8e0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_5c85_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_5c85_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_5c85_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_1c38_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_1c38_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_cdc4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_1c38_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_1c38_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2623_c3_4e26 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_1c38_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_cdc4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_1c38_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_1c38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_1c38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_cdc4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_1c38_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_65db_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_65db_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_65db_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_cdc4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_cdc4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_cdc4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_cdc4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2627_c3_3113 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_cdc4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2626_c7_cdc4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_cdc4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_cdc4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_cdc4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_cdc4_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2605_l2601_l2598_l2626_l2585_DUPLICATE_bcb9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2598_l2601_l2616_l2605_DUPLICATE_abb4_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2609_l2605_l2601_l2598_l2626_l2622_l2616_DUPLICATE_82fb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2598_l2609_l2601_l2605_DUPLICATE_4dd5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l2632_l2581_DUPLICATE_2b73_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2623_c3_4e26 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_1c38_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2623_c3_4e26;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_afff_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_7199_right := to_unsigned(5, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2618_c3_bcf8 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_f8e0_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2618_c3_bcf8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_44e4_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2607_c3_d6f8 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_4a83_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2607_c3_d6f8;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2590_c3_3283 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2590_c3_3283;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_cdc4_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2627_c3_3113 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_cdc4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2627_c3_3113;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2613_c3_18c0 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_4383_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2613_c3_18c0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_f54e_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_5c85_right := to_unsigned(6, 3);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_8a4b_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_4383_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_f0d0_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2619_c3_ea77 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_f8e0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2619_c3_ea77;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2599_c3_714e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_76e8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2599_c3_714e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_65db_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_9c68_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_afff_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2603_c3_9136 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_7a9e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2603_c3_9136;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2595_c3_54a0 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2595_c3_54a0;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_afff_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_76e8_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_7a9e_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_4a83_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_4383_iffalse := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_1c38_iftrue := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_76e8_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_7a9e_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_4a83_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_4383_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_f8e0_iffalse := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_cdc4_iftrue := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_8a4b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_f54e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_44e4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_9c68_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_f0d0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_7199_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_5c85_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_65db_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_4383_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_f8e0_iftrue := VAR_previous_stack_read;
     VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_7a9e_iftrue := VAR_previous_stack_read;
     VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_4a83_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_4383_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_76e8_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_7a9e_iffalse := t16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_f8e0_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_76e8_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_7a9e_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_4a83_iffalse := t16_low;
     -- BIN_OP_EQ[uxn_opcodes_h_l2605_c11_9c68] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2605_c11_9c68_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_9c68_left;
     BIN_OP_EQ_uxn_opcodes_h_l2605_c11_9c68_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_9c68_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_9c68_return_output := BIN_OP_EQ_uxn_opcodes_h_l2605_c11_9c68_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2598_c11_f54e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2598_c11_f54e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_f54e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2598_c11_f54e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_f54e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_f54e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2598_c11_f54e_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2585_c2_c697] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2585_c2_c697_return_output := result.is_stack_index_flipped;

     -- sp_relative_shift[uxn_opcodes_h_l2611_c30_afff] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2611_c30_afff_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_afff_ins;
     sp_relative_shift_uxn_opcodes_h_l2611_c30_afff_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_afff_x;
     sp_relative_shift_uxn_opcodes_h_l2611_c30_afff_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_afff_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_afff_return_output := sp_relative_shift_uxn_opcodes_h_l2611_c30_afff_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2626_c11_65db] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2626_c11_65db_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_65db_left;
     BIN_OP_EQ_uxn_opcodes_h_l2626_c11_65db_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_65db_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_65db_return_output := BIN_OP_EQ_uxn_opcodes_h_l2626_c11_65db_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2585_c6_8a4b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2585_c6_8a4b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_8a4b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2585_c6_8a4b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_8a4b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_8a4b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2585_c6_8a4b_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2585_c2_c697] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2585_c2_c697_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2609_l2605_l2601_l2598_l2626_l2622_l2616_DUPLICATE_82fb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2609_l2605_l2601_l2598_l2626_l2622_l2616_DUPLICATE_82fb_return_output := result.is_opc_done;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2585_c2_c697] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2585_c2_c697_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2605_l2601_l2598_l2626_l2585_DUPLICATE_bcb9 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2605_l2601_l2598_l2626_l2585_DUPLICATE_bcb9_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2601_c11_44e4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2601_c11_44e4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_44e4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2601_c11_44e4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_44e4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_44e4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2601_c11_44e4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2616_c11_7199] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2616_c11_7199_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_7199_left;
     BIN_OP_EQ_uxn_opcodes_h_l2616_c11_7199_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_7199_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_7199_return_output := BIN_OP_EQ_uxn_opcodes_h_l2616_c11_7199_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2598_l2609_l2601_l2605_DUPLICATE_4dd5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2598_l2609_l2601_l2605_DUPLICATE_4dd5_return_output := result.is_stack_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2598_l2601_l2616_l2605_DUPLICATE_abb4 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2598_l2601_l2616_l2605_DUPLICATE_abb4_return_output := result.sp_relative_shift;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2626_c7_cdc4] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2626_c7_cdc4_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2622_c11_5c85] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2622_c11_5c85_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_5c85_left;
     BIN_OP_EQ_uxn_opcodes_h_l2622_c11_5c85_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_5c85_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_5c85_return_output := BIN_OP_EQ_uxn_opcodes_h_l2622_c11_5c85_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2585_c2_c697] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2585_c2_c697_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2609_c11_f0d0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2609_c11_f0d0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_f0d0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2609_c11_f0d0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_f0d0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_f0d0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2609_c11_f0d0_return_output;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_c697_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_8a4b_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_c697_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_8a4b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_c697_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_8a4b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_c697_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_8a4b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_c697_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_8a4b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_c697_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_8a4b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_c697_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_8a4b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_c697_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_8a4b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_c697_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_8a4b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_c697_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_8a4b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_c697_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_8a4b_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_c697_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_8a4b_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_c697_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_8a4b_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_76e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_f54e_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_76e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_f54e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_76e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_f54e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_76e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_f54e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_76e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_f54e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_76e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_f54e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_76e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_f54e_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_76e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_f54e_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_76e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_f54e_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_7a9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_44e4_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_7a9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_44e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_7a9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_44e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_7a9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_44e4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_7a9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_44e4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_7a9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_44e4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_7a9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_44e4_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_7a9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_44e4_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_7a9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_44e4_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_4a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_9c68_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_4a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_9c68_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_4a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_9c68_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_4a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_9c68_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_4a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_9c68_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_4a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_9c68_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_4a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_9c68_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_4a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_9c68_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_4383_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_f0d0_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_4383_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_f0d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_4383_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_f0d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_4383_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_f0d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_4383_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_f0d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_4383_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_f0d0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_4383_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_f0d0_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_f8e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_7199_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_f8e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_7199_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_f8e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_7199_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_f8e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_7199_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_f8e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_7199_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_1c38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_5c85_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_1c38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_5c85_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_1c38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_5c85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_cdc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_65db_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_cdc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_65db_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_cdc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_65db_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_76e8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2598_l2601_l2616_l2605_DUPLICATE_abb4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_7a9e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2598_l2601_l2616_l2605_DUPLICATE_abb4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_4a83_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2598_l2601_l2616_l2605_DUPLICATE_abb4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_f8e0_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2598_l2601_l2616_l2605_DUPLICATE_abb4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_76e8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2609_l2605_l2601_l2598_l2626_l2622_l2616_DUPLICATE_82fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_7a9e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2609_l2605_l2601_l2598_l2626_l2622_l2616_DUPLICATE_82fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_4a83_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2609_l2605_l2601_l2598_l2626_l2622_l2616_DUPLICATE_82fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_4383_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2609_l2605_l2601_l2598_l2626_l2622_l2616_DUPLICATE_82fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_f8e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2609_l2605_l2601_l2598_l2626_l2622_l2616_DUPLICATE_82fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_1c38_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2609_l2605_l2601_l2598_l2626_l2622_l2616_DUPLICATE_82fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_cdc4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2609_l2605_l2601_l2598_l2626_l2622_l2616_DUPLICATE_82fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_76e8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2598_l2609_l2601_l2605_DUPLICATE_4dd5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_7a9e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2598_l2609_l2601_l2605_DUPLICATE_4dd5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_4a83_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2598_l2609_l2601_l2605_DUPLICATE_4dd5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_4383_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2598_l2609_l2601_l2605_DUPLICATE_4dd5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2605_l2601_l2598_l2626_l2585_DUPLICATE_bcb9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_76e8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2605_l2601_l2598_l2626_l2585_DUPLICATE_bcb9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_7a9e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2605_l2601_l2598_l2626_l2585_DUPLICATE_bcb9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_4a83_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2605_l2601_l2598_l2626_l2585_DUPLICATE_bcb9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_cdc4_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2605_l2601_l2598_l2626_l2585_DUPLICATE_bcb9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2585_c2_c697_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2585_c2_c697_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2585_c2_c697_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2585_c2_c697_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_cdc4_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2626_c7_cdc4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_4383_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_afff_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2585_c2_c697] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_c697_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_c697_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_c697_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_c697_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2585_c2_c697] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_c697_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_c697_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_c697_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_c697_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2601_c7_7a9e] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2601_c7_7a9e_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_7a9e_cond;
     t16_high_MUX_uxn_opcodes_h_l2601_c7_7a9e_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_7a9e_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2601_c7_7a9e_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_7a9e_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output := t16_high_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2609_c7_4383] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2609_c7_4383_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_4383_cond;
     n16_high_MUX_uxn_opcodes_h_l2609_c7_4383_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_4383_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2609_c7_4383_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_4383_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_4383_return_output := n16_high_MUX_uxn_opcodes_h_l2609_c7_4383_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2585_c2_c697] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_c697_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_c697_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_c697_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_c697_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2605_c7_4a83] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2605_c7_4a83_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_4a83_cond;
     t16_low_MUX_uxn_opcodes_h_l2605_c7_4a83_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_4a83_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2605_c7_4a83_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_4a83_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output := t16_low_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2626_c7_cdc4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2626_c7_cdc4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_cdc4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2626_c7_cdc4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_cdc4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2626_c7_cdc4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_cdc4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_cdc4_return_output := result_u8_value_MUX_uxn_opcodes_h_l2626_c7_cdc4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2616_c7_f8e0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_f8e0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_f8e0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_f8e0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_f8e0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_f8e0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_f8e0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_f8e0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_f8e0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2626_c7_cdc4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_cdc4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_cdc4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_cdc4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_cdc4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_cdc4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_cdc4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_cdc4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_cdc4_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2616_c7_f8e0] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2616_c7_f8e0_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_f8e0_cond;
     n16_low_MUX_uxn_opcodes_h_l2616_c7_f8e0_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_f8e0_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2616_c7_f8e0_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_f8e0_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_f8e0_return_output := n16_low_MUX_uxn_opcodes_h_l2616_c7_f8e0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2626_c7_cdc4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_cdc4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_cdc4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_cdc4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_cdc4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_cdc4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_cdc4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_cdc4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_cdc4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2609_c7_4383] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_4383_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_4383_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_4383_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_4383_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_4383_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_4383_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_4383_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_4383_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2585_c2_c697] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_c697_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_c697_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_c697_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_c697_return_output;

     -- Submodule level 2
     VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_4a83_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_4383_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_4383_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_f8e0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_1c38_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_cdc4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_4a83_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_4383_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_4383_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_f8e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_1c38_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_cdc4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_1c38_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_cdc4_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_76e8_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_7a9e_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2605_c7_4a83] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_4a83_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_4a83_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_4a83_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_4a83_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_4a83_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_4a83_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2609_c7_4383] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_4383_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_4383_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_4383_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_4383_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_4383_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_4383_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_4383_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_4383_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2605_c7_4a83] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2605_c7_4a83_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_4a83_cond;
     n16_high_MUX_uxn_opcodes_h_l2605_c7_4a83_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_4a83_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2605_c7_4a83_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_4a83_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output := n16_high_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2622_c7_1c38] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2622_c7_1c38_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_1c38_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2622_c7_1c38_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_1c38_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2622_c7_1c38_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_1c38_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_1c38_return_output := result_u8_value_MUX_uxn_opcodes_h_l2622_c7_1c38_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2598_c7_76e8] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2598_c7_76e8_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_76e8_cond;
     t16_high_MUX_uxn_opcodes_h_l2598_c7_76e8_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_76e8_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2598_c7_76e8_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_76e8_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output := t16_high_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2622_c7_1c38] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_1c38_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_1c38_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_1c38_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_1c38_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_1c38_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_1c38_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_1c38_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_1c38_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2622_c7_1c38] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_1c38_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_1c38_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_1c38_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_1c38_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_1c38_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_1c38_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_1c38_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_1c38_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2601_c7_7a9e] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2601_c7_7a9e_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_7a9e_cond;
     t16_low_MUX_uxn_opcodes_h_l2601_c7_7a9e_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_7a9e_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2601_c7_7a9e_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_7a9e_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output := t16_low_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2609_c7_4383] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2609_c7_4383_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_4383_cond;
     n16_low_MUX_uxn_opcodes_h_l2609_c7_4383_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_4383_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2609_c7_4383_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_4383_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_4383_return_output := n16_low_MUX_uxn_opcodes_h_l2609_c7_4383_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_7a9e_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_4a83_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_4383_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_f8e0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_1c38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_7a9e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_4a83_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_4383_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_f8e0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_1c38_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_f8e0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_1c38_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_76e8_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2616_c7_f8e0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_f8e0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_f8e0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_f8e0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_f8e0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_f8e0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_f8e0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_f8e0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_f8e0_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2601_c7_7a9e] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2601_c7_7a9e_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_7a9e_cond;
     n16_high_MUX_uxn_opcodes_h_l2601_c7_7a9e_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_7a9e_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2601_c7_7a9e_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_7a9e_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output := n16_high_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2616_c7_f8e0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2616_c7_f8e0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_f8e0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2616_c7_f8e0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_f8e0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2616_c7_f8e0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_f8e0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_f8e0_return_output := result_u8_value_MUX_uxn_opcodes_h_l2616_c7_f8e0_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2598_c7_76e8] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2598_c7_76e8_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_76e8_cond;
     t16_low_MUX_uxn_opcodes_h_l2598_c7_76e8_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_76e8_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2598_c7_76e8_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_76e8_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output := t16_low_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2616_c7_f8e0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_f8e0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_f8e0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_f8e0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_f8e0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_f8e0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_f8e0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_f8e0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_f8e0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2601_c7_7a9e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_7a9e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_7a9e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_7a9e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_7a9e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_7a9e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_7a9e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2605_c7_4a83] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2605_c7_4a83_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_4a83_cond;
     n16_low_MUX_uxn_opcodes_h_l2605_c7_4a83_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_4a83_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2605_c7_4a83_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_4a83_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output := n16_low_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2585_c2_c697] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2585_c2_c697_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_c697_cond;
     t16_high_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_c697_return_output := t16_high_MUX_uxn_opcodes_h_l2585_c2_c697_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2605_c7_4a83] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_4a83_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_4a83_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_4a83_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_4a83_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_4a83_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_4a83_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_76e8_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_7a9e_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_4383_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_f8e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_76e8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_7a9e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_4383_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_f8e0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_4383_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_f8e0_return_output;
     REG_VAR_t16_high := VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_c697_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output;
     -- n16_low_MUX[uxn_opcodes_h_l2601_c7_7a9e] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2601_c7_7a9e_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_7a9e_cond;
     n16_low_MUX_uxn_opcodes_h_l2601_c7_7a9e_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_7a9e_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2601_c7_7a9e_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_7a9e_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output := n16_low_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2598_c7_76e8] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2598_c7_76e8_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_76e8_cond;
     n16_high_MUX_uxn_opcodes_h_l2598_c7_76e8_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_76e8_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2598_c7_76e8_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_76e8_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output := n16_high_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2609_c7_4383] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_4383_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_4383_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_4383_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_4383_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_4383_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_4383_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_4383_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_4383_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2585_c2_c697] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2585_c2_c697_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_c697_cond;
     t16_low_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_c697_return_output := t16_low_MUX_uxn_opcodes_h_l2585_c2_c697_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2598_c7_76e8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_76e8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_76e8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_76e8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_76e8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_76e8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_76e8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2609_c7_4383] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_4383_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_4383_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_4383_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_4383_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_4383_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_4383_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_4383_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_4383_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2601_c7_7a9e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_7a9e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_7a9e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_7a9e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_7a9e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_7a9e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_7a9e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2609_c7_4383] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2609_c7_4383_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_4383_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2609_c7_4383_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_4383_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2609_c7_4383_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_4383_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_4383_return_output := result_u8_value_MUX_uxn_opcodes_h_l2609_c7_4383_return_output;

     -- Submodule level 5
     VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_76e8_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_4a83_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_4383_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_76e8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_4a83_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_4383_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_4a83_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_4383_return_output;
     REG_VAR_t16_low := VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_c697_return_output;
     -- n16_high_MUX[uxn_opcodes_h_l2585_c2_c697] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2585_c2_c697_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_c697_cond;
     n16_high_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_c697_return_output := n16_high_MUX_uxn_opcodes_h_l2585_c2_c697_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2605_c7_4a83] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_4a83_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_4a83_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_4a83_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_4a83_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_4a83_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_4a83_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2605_c7_4a83] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_4a83_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_4a83_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_4a83_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_4a83_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_4a83_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_4a83_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2598_c7_76e8] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2598_c7_76e8_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_76e8_cond;
     n16_low_MUX_uxn_opcodes_h_l2598_c7_76e8_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_76e8_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2598_c7_76e8_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_76e8_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output := n16_low_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2585_c2_c697] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_c697_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_c697_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_c697_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_c697_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2598_c7_76e8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_76e8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_76e8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_76e8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_76e8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_76e8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_76e8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2605_c7_4a83] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2605_c7_4a83_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_4a83_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2605_c7_4a83_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_4a83_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2605_c7_4a83_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_4a83_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output := result_u8_value_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output;

     -- Submodule level 6
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_c697_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_7a9e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_7a9e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_7a9e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_4a83_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2585_c2_c697] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_c697_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_c697_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_c697_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_c697_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2601_c7_7a9e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2601_c7_7a9e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_7a9e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2601_c7_7a9e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_7a9e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2601_c7_7a9e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_7a9e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2601_c7_7a9e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_7a9e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_7a9e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_7a9e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_7a9e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_7a9e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_7a9e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2585_c2_c697] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2585_c2_c697_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_c697_cond;
     n16_low_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_c697_return_output := n16_low_MUX_uxn_opcodes_h_l2585_c2_c697_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2601_c7_7a9e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_7a9e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_7a9e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_7a9e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_7a9e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_7a9e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_7a9e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output;

     -- Submodule level 7
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_c697_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_76e8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_76e8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_76e8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_7a9e_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2598_c7_76e8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2598_c7_76e8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_76e8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2598_c7_76e8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_76e8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2598_c7_76e8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_76e8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output := result_u8_value_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2598_c7_76e8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_76e8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_76e8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_76e8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_76e8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_76e8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_76e8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2598_c7_76e8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_76e8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_76e8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_76e8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_76e8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_76e8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_76e8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_76e8_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2585_c2_c697] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_c697_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_c697_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_c697_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_c697_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2585_c2_c697] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2585_c2_c697_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_c697_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_c697_return_output := result_u8_value_MUX_uxn_opcodes_h_l2585_c2_c697_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2585_c2_c697] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_c697_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_c697_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_c697_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_c697_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_c697_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_c697_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l2632_l2581_DUPLICATE_2b73 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l2632_l2581_DUPLICATE_2b73_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_922a(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_c697_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_c697_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_c697_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_c697_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_c697_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_c697_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_c697_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_c697_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_c697_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l2632_l2581_DUPLICATE_2b73_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l2632_l2581_DUPLICATE_2b73_return_output;
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
