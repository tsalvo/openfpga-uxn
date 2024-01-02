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
-- BIN_OP_EQ[uxn_opcodes_h_l2585_c6_c51b]
signal BIN_OP_EQ_uxn_opcodes_h_l2585_c6_c51b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2585_c6_c51b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2585_c6_c51b_return_output : unsigned(0 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2585_c2_48d6]
signal t16_high_MUX_uxn_opcodes_h_l2585_c2_48d6_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2585_c2_48d6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_48d6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2585_c2_48d6]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_48d6_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2585_c2_48d6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_48d6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2585_c2_48d6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_48d6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2585_c2_48d6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_48d6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2585_c2_48d6]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_48d6_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2585_c2_48d6]
signal result_u8_value_MUX_uxn_opcodes_h_l2585_c2_48d6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2585_c2_48d6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_48d6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2585_c2_48d6]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_48d6_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2585_c2_48d6]
signal n16_high_MUX_uxn_opcodes_h_l2585_c2_48d6_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2585_c2_48d6]
signal t16_low_MUX_uxn_opcodes_h_l2585_c2_48d6_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2585_c2_48d6]
signal n16_low_MUX_uxn_opcodes_h_l2585_c2_48d6_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2598_c11_5979]
signal BIN_OP_EQ_uxn_opcodes_h_l2598_c11_5979_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2598_c11_5979_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2598_c11_5979_return_output : unsigned(0 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2598_c7_7812]
signal t16_high_MUX_uxn_opcodes_h_l2598_c7_7812_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2598_c7_7812_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2598_c7_7812_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2598_c7_7812_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2598_c7_7812]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_7812_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_7812_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_7812_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_7812_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2598_c7_7812]
signal result_u8_value_MUX_uxn_opcodes_h_l2598_c7_7812_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2598_c7_7812_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2598_c7_7812_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2598_c7_7812_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2598_c7_7812]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_7812_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_7812_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_7812_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_7812_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2598_c7_7812]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_7812_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_7812_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_7812_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_7812_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2598_c7_7812]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_7812_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_7812_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_7812_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_7812_return_output : unsigned(3 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2598_c7_7812]
signal n16_high_MUX_uxn_opcodes_h_l2598_c7_7812_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2598_c7_7812_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2598_c7_7812_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2598_c7_7812_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2598_c7_7812]
signal t16_low_MUX_uxn_opcodes_h_l2598_c7_7812_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2598_c7_7812_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2598_c7_7812_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2598_c7_7812_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2598_c7_7812]
signal n16_low_MUX_uxn_opcodes_h_l2598_c7_7812_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2598_c7_7812_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2598_c7_7812_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2598_c7_7812_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2601_c11_dbe8]
signal BIN_OP_EQ_uxn_opcodes_h_l2601_c11_dbe8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2601_c11_dbe8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2601_c11_dbe8_return_output : unsigned(0 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2601_c7_f764]
signal t16_high_MUX_uxn_opcodes_h_l2601_c7_f764_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2601_c7_f764_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2601_c7_f764_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2601_c7_f764_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2601_c7_f764]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_f764_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_f764_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_f764_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_f764_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2601_c7_f764]
signal result_u8_value_MUX_uxn_opcodes_h_l2601_c7_f764_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2601_c7_f764_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2601_c7_f764_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2601_c7_f764_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2601_c7_f764]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_f764_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_f764_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_f764_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_f764_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2601_c7_f764]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_f764_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_f764_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_f764_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_f764_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2601_c7_f764]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_f764_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_f764_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_f764_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_f764_return_output : unsigned(3 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2601_c7_f764]
signal n16_high_MUX_uxn_opcodes_h_l2601_c7_f764_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2601_c7_f764_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2601_c7_f764_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2601_c7_f764_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2601_c7_f764]
signal t16_low_MUX_uxn_opcodes_h_l2601_c7_f764_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2601_c7_f764_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2601_c7_f764_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2601_c7_f764_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2601_c7_f764]
signal n16_low_MUX_uxn_opcodes_h_l2601_c7_f764_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2601_c7_f764_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2601_c7_f764_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2601_c7_f764_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2605_c11_6c81]
signal BIN_OP_EQ_uxn_opcodes_h_l2605_c11_6c81_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2605_c11_6c81_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2605_c11_6c81_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2605_c7_2483]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_2483_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_2483_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_2483_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_2483_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2605_c7_2483]
signal result_u8_value_MUX_uxn_opcodes_h_l2605_c7_2483_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2605_c7_2483_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2605_c7_2483_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2605_c7_2483_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2605_c7_2483]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_2483_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_2483_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_2483_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_2483_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2605_c7_2483]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_2483_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_2483_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_2483_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_2483_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2605_c7_2483]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_2483_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_2483_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_2483_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_2483_return_output : unsigned(3 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2605_c7_2483]
signal n16_high_MUX_uxn_opcodes_h_l2605_c7_2483_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2605_c7_2483_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2605_c7_2483_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2605_c7_2483_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2605_c7_2483]
signal t16_low_MUX_uxn_opcodes_h_l2605_c7_2483_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2605_c7_2483_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2605_c7_2483_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2605_c7_2483_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2605_c7_2483]
signal n16_low_MUX_uxn_opcodes_h_l2605_c7_2483_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2605_c7_2483_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2605_c7_2483_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2605_c7_2483_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2609_c11_47d5]
signal BIN_OP_EQ_uxn_opcodes_h_l2609_c11_47d5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2609_c11_47d5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2609_c11_47d5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2609_c7_afac]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_afac_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_afac_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_afac_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_afac_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2609_c7_afac]
signal result_u8_value_MUX_uxn_opcodes_h_l2609_c7_afac_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2609_c7_afac_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2609_c7_afac_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2609_c7_afac_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2609_c7_afac]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_afac_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_afac_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_afac_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_afac_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2609_c7_afac]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_afac_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_afac_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_afac_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_afac_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2609_c7_afac]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_afac_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_afac_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_afac_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_afac_return_output : unsigned(3 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2609_c7_afac]
signal n16_high_MUX_uxn_opcodes_h_l2609_c7_afac_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2609_c7_afac_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2609_c7_afac_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2609_c7_afac_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2609_c7_afac]
signal n16_low_MUX_uxn_opcodes_h_l2609_c7_afac_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2609_c7_afac_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2609_c7_afac_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2609_c7_afac_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2611_c30_3a4e]
signal sp_relative_shift_uxn_opcodes_h_l2611_c30_3a4e_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2611_c30_3a4e_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2611_c30_3a4e_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2611_c30_3a4e_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2616_c11_c005]
signal BIN_OP_EQ_uxn_opcodes_h_l2616_c11_c005_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2616_c11_c005_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2616_c11_c005_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2616_c7_af6f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_af6f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_af6f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_af6f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_af6f_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2616_c7_af6f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_af6f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_af6f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_af6f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_af6f_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2616_c7_af6f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_af6f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_af6f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_af6f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_af6f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2616_c7_af6f]
signal result_u8_value_MUX_uxn_opcodes_h_l2616_c7_af6f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2616_c7_af6f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2616_c7_af6f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2616_c7_af6f_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2616_c7_af6f]
signal n16_low_MUX_uxn_opcodes_h_l2616_c7_af6f_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2616_c7_af6f_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2616_c7_af6f_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2616_c7_af6f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2622_c11_75cf]
signal BIN_OP_EQ_uxn_opcodes_h_l2622_c11_75cf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2622_c11_75cf_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2622_c11_75cf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2622_c7_3623]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_3623_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_3623_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_3623_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_3623_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2622_c7_3623]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_3623_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_3623_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_3623_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_3623_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2622_c7_3623]
signal result_u8_value_MUX_uxn_opcodes_h_l2622_c7_3623_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2622_c7_3623_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2622_c7_3623_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2622_c7_3623_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2626_c11_f174]
signal BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f174_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f174_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f174_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2626_c7_08b3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_08b3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_08b3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_08b3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_08b3_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2626_c7_08b3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_08b3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_08b3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_08b3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_08b3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2626_c7_08b3]
signal result_u8_value_MUX_uxn_opcodes_h_l2626_c7_08b3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2626_c7_08b3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2626_c7_08b3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2626_c7_08b3_return_output : unsigned(7 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2585_c6_c51b
BIN_OP_EQ_uxn_opcodes_h_l2585_c6_c51b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2585_c6_c51b_left,
BIN_OP_EQ_uxn_opcodes_h_l2585_c6_c51b_right,
BIN_OP_EQ_uxn_opcodes_h_l2585_c6_c51b_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2585_c2_48d6
t16_high_MUX_uxn_opcodes_h_l2585_c2_48d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2585_c2_48d6_cond,
t16_high_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue,
t16_high_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse,
t16_high_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_48d6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_48d6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_48d6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_48d6
result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_48d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_48d6_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_48d6
result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_48d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_48d6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_48d6
result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_48d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_48d6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_48d6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_48d6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_48d6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_48d6
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_48d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_48d6_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2585_c2_48d6
result_u8_value_MUX_uxn_opcodes_h_l2585_c2_48d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2585_c2_48d6_cond,
result_u8_value_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_48d6
result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_48d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_48d6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_48d6
result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_48d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_48d6_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2585_c2_48d6
n16_high_MUX_uxn_opcodes_h_l2585_c2_48d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2585_c2_48d6_cond,
n16_high_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue,
n16_high_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse,
n16_high_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2585_c2_48d6
t16_low_MUX_uxn_opcodes_h_l2585_c2_48d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2585_c2_48d6_cond,
t16_low_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue,
t16_low_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse,
t16_low_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2585_c2_48d6
n16_low_MUX_uxn_opcodes_h_l2585_c2_48d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2585_c2_48d6_cond,
n16_low_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue,
n16_low_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse,
n16_low_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2598_c11_5979
BIN_OP_EQ_uxn_opcodes_h_l2598_c11_5979 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2598_c11_5979_left,
BIN_OP_EQ_uxn_opcodes_h_l2598_c11_5979_right,
BIN_OP_EQ_uxn_opcodes_h_l2598_c11_5979_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2598_c7_7812
t16_high_MUX_uxn_opcodes_h_l2598_c7_7812 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2598_c7_7812_cond,
t16_high_MUX_uxn_opcodes_h_l2598_c7_7812_iftrue,
t16_high_MUX_uxn_opcodes_h_l2598_c7_7812_iffalse,
t16_high_MUX_uxn_opcodes_h_l2598_c7_7812_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_7812
result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_7812 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_7812_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_7812_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_7812_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_7812_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2598_c7_7812
result_u8_value_MUX_uxn_opcodes_h_l2598_c7_7812 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2598_c7_7812_cond,
result_u8_value_MUX_uxn_opcodes_h_l2598_c7_7812_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2598_c7_7812_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2598_c7_7812_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_7812
result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_7812 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_7812_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_7812_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_7812_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_7812_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_7812
result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_7812 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_7812_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_7812_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_7812_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_7812_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_7812
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_7812 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_7812_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_7812_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_7812_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_7812_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2598_c7_7812
n16_high_MUX_uxn_opcodes_h_l2598_c7_7812 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2598_c7_7812_cond,
n16_high_MUX_uxn_opcodes_h_l2598_c7_7812_iftrue,
n16_high_MUX_uxn_opcodes_h_l2598_c7_7812_iffalse,
n16_high_MUX_uxn_opcodes_h_l2598_c7_7812_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2598_c7_7812
t16_low_MUX_uxn_opcodes_h_l2598_c7_7812 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2598_c7_7812_cond,
t16_low_MUX_uxn_opcodes_h_l2598_c7_7812_iftrue,
t16_low_MUX_uxn_opcodes_h_l2598_c7_7812_iffalse,
t16_low_MUX_uxn_opcodes_h_l2598_c7_7812_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2598_c7_7812
n16_low_MUX_uxn_opcodes_h_l2598_c7_7812 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2598_c7_7812_cond,
n16_low_MUX_uxn_opcodes_h_l2598_c7_7812_iftrue,
n16_low_MUX_uxn_opcodes_h_l2598_c7_7812_iffalse,
n16_low_MUX_uxn_opcodes_h_l2598_c7_7812_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2601_c11_dbe8
BIN_OP_EQ_uxn_opcodes_h_l2601_c11_dbe8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2601_c11_dbe8_left,
BIN_OP_EQ_uxn_opcodes_h_l2601_c11_dbe8_right,
BIN_OP_EQ_uxn_opcodes_h_l2601_c11_dbe8_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2601_c7_f764
t16_high_MUX_uxn_opcodes_h_l2601_c7_f764 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2601_c7_f764_cond,
t16_high_MUX_uxn_opcodes_h_l2601_c7_f764_iftrue,
t16_high_MUX_uxn_opcodes_h_l2601_c7_f764_iffalse,
t16_high_MUX_uxn_opcodes_h_l2601_c7_f764_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_f764
result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_f764 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_f764_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_f764_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_f764_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_f764_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2601_c7_f764
result_u8_value_MUX_uxn_opcodes_h_l2601_c7_f764 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2601_c7_f764_cond,
result_u8_value_MUX_uxn_opcodes_h_l2601_c7_f764_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2601_c7_f764_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2601_c7_f764_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_f764
result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_f764 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_f764_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_f764_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_f764_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_f764_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_f764
result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_f764 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_f764_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_f764_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_f764_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_f764_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_f764
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_f764 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_f764_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_f764_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_f764_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_f764_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2601_c7_f764
n16_high_MUX_uxn_opcodes_h_l2601_c7_f764 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2601_c7_f764_cond,
n16_high_MUX_uxn_opcodes_h_l2601_c7_f764_iftrue,
n16_high_MUX_uxn_opcodes_h_l2601_c7_f764_iffalse,
n16_high_MUX_uxn_opcodes_h_l2601_c7_f764_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2601_c7_f764
t16_low_MUX_uxn_opcodes_h_l2601_c7_f764 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2601_c7_f764_cond,
t16_low_MUX_uxn_opcodes_h_l2601_c7_f764_iftrue,
t16_low_MUX_uxn_opcodes_h_l2601_c7_f764_iffalse,
t16_low_MUX_uxn_opcodes_h_l2601_c7_f764_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2601_c7_f764
n16_low_MUX_uxn_opcodes_h_l2601_c7_f764 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2601_c7_f764_cond,
n16_low_MUX_uxn_opcodes_h_l2601_c7_f764_iftrue,
n16_low_MUX_uxn_opcodes_h_l2601_c7_f764_iffalse,
n16_low_MUX_uxn_opcodes_h_l2601_c7_f764_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2605_c11_6c81
BIN_OP_EQ_uxn_opcodes_h_l2605_c11_6c81 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2605_c11_6c81_left,
BIN_OP_EQ_uxn_opcodes_h_l2605_c11_6c81_right,
BIN_OP_EQ_uxn_opcodes_h_l2605_c11_6c81_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_2483
result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_2483 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_2483_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_2483_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_2483_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_2483_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2605_c7_2483
result_u8_value_MUX_uxn_opcodes_h_l2605_c7_2483 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2605_c7_2483_cond,
result_u8_value_MUX_uxn_opcodes_h_l2605_c7_2483_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2605_c7_2483_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2605_c7_2483_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_2483
result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_2483 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_2483_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_2483_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_2483_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_2483_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_2483
result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_2483 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_2483_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_2483_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_2483_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_2483_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_2483
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_2483 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_2483_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_2483_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_2483_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_2483_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2605_c7_2483
n16_high_MUX_uxn_opcodes_h_l2605_c7_2483 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2605_c7_2483_cond,
n16_high_MUX_uxn_opcodes_h_l2605_c7_2483_iftrue,
n16_high_MUX_uxn_opcodes_h_l2605_c7_2483_iffalse,
n16_high_MUX_uxn_opcodes_h_l2605_c7_2483_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2605_c7_2483
t16_low_MUX_uxn_opcodes_h_l2605_c7_2483 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2605_c7_2483_cond,
t16_low_MUX_uxn_opcodes_h_l2605_c7_2483_iftrue,
t16_low_MUX_uxn_opcodes_h_l2605_c7_2483_iffalse,
t16_low_MUX_uxn_opcodes_h_l2605_c7_2483_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2605_c7_2483
n16_low_MUX_uxn_opcodes_h_l2605_c7_2483 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2605_c7_2483_cond,
n16_low_MUX_uxn_opcodes_h_l2605_c7_2483_iftrue,
n16_low_MUX_uxn_opcodes_h_l2605_c7_2483_iffalse,
n16_low_MUX_uxn_opcodes_h_l2605_c7_2483_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2609_c11_47d5
BIN_OP_EQ_uxn_opcodes_h_l2609_c11_47d5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2609_c11_47d5_left,
BIN_OP_EQ_uxn_opcodes_h_l2609_c11_47d5_right,
BIN_OP_EQ_uxn_opcodes_h_l2609_c11_47d5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_afac
result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_afac : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_afac_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_afac_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_afac_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_afac_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2609_c7_afac
result_u8_value_MUX_uxn_opcodes_h_l2609_c7_afac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2609_c7_afac_cond,
result_u8_value_MUX_uxn_opcodes_h_l2609_c7_afac_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2609_c7_afac_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2609_c7_afac_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_afac
result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_afac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_afac_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_afac_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_afac_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_afac_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_afac
result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_afac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_afac_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_afac_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_afac_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_afac_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_afac
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_afac : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_afac_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_afac_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_afac_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_afac_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2609_c7_afac
n16_high_MUX_uxn_opcodes_h_l2609_c7_afac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2609_c7_afac_cond,
n16_high_MUX_uxn_opcodes_h_l2609_c7_afac_iftrue,
n16_high_MUX_uxn_opcodes_h_l2609_c7_afac_iffalse,
n16_high_MUX_uxn_opcodes_h_l2609_c7_afac_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2609_c7_afac
n16_low_MUX_uxn_opcodes_h_l2609_c7_afac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2609_c7_afac_cond,
n16_low_MUX_uxn_opcodes_h_l2609_c7_afac_iftrue,
n16_low_MUX_uxn_opcodes_h_l2609_c7_afac_iffalse,
n16_low_MUX_uxn_opcodes_h_l2609_c7_afac_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2611_c30_3a4e
sp_relative_shift_uxn_opcodes_h_l2611_c30_3a4e : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2611_c30_3a4e_ins,
sp_relative_shift_uxn_opcodes_h_l2611_c30_3a4e_x,
sp_relative_shift_uxn_opcodes_h_l2611_c30_3a4e_y,
sp_relative_shift_uxn_opcodes_h_l2611_c30_3a4e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2616_c11_c005
BIN_OP_EQ_uxn_opcodes_h_l2616_c11_c005 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2616_c11_c005_left,
BIN_OP_EQ_uxn_opcodes_h_l2616_c11_c005_right,
BIN_OP_EQ_uxn_opcodes_h_l2616_c11_c005_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_af6f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_af6f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_af6f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_af6f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_af6f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_af6f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_af6f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_af6f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_af6f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_af6f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_af6f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_af6f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_af6f
result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_af6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_af6f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_af6f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_af6f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_af6f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2616_c7_af6f
result_u8_value_MUX_uxn_opcodes_h_l2616_c7_af6f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2616_c7_af6f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2616_c7_af6f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2616_c7_af6f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2616_c7_af6f_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2616_c7_af6f
n16_low_MUX_uxn_opcodes_h_l2616_c7_af6f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2616_c7_af6f_cond,
n16_low_MUX_uxn_opcodes_h_l2616_c7_af6f_iftrue,
n16_low_MUX_uxn_opcodes_h_l2616_c7_af6f_iffalse,
n16_low_MUX_uxn_opcodes_h_l2616_c7_af6f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2622_c11_75cf
BIN_OP_EQ_uxn_opcodes_h_l2622_c11_75cf : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2622_c11_75cf_left,
BIN_OP_EQ_uxn_opcodes_h_l2622_c11_75cf_right,
BIN_OP_EQ_uxn_opcodes_h_l2622_c11_75cf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_3623
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_3623 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_3623_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_3623_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_3623_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_3623_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_3623
result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_3623 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_3623_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_3623_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_3623_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_3623_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2622_c7_3623
result_u8_value_MUX_uxn_opcodes_h_l2622_c7_3623 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2622_c7_3623_cond,
result_u8_value_MUX_uxn_opcodes_h_l2622_c7_3623_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2622_c7_3623_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2622_c7_3623_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f174
BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f174 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f174_left,
BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f174_right,
BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f174_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_08b3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_08b3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_08b3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_08b3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_08b3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_08b3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_08b3
result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_08b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_08b3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_08b3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_08b3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_08b3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2626_c7_08b3
result_u8_value_MUX_uxn_opcodes_h_l2626_c7_08b3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2626_c7_08b3_cond,
result_u8_value_MUX_uxn_opcodes_h_l2626_c7_08b3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2626_c7_08b3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2626_c7_08b3_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2585_c6_c51b_return_output,
 t16_high_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output,
 n16_high_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output,
 t16_low_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output,
 n16_low_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2598_c11_5979_return_output,
 t16_high_MUX_uxn_opcodes_h_l2598_c7_7812_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_7812_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2598_c7_7812_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_7812_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_7812_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_7812_return_output,
 n16_high_MUX_uxn_opcodes_h_l2598_c7_7812_return_output,
 t16_low_MUX_uxn_opcodes_h_l2598_c7_7812_return_output,
 n16_low_MUX_uxn_opcodes_h_l2598_c7_7812_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2601_c11_dbe8_return_output,
 t16_high_MUX_uxn_opcodes_h_l2601_c7_f764_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_f764_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2601_c7_f764_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_f764_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_f764_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_f764_return_output,
 n16_high_MUX_uxn_opcodes_h_l2601_c7_f764_return_output,
 t16_low_MUX_uxn_opcodes_h_l2601_c7_f764_return_output,
 n16_low_MUX_uxn_opcodes_h_l2601_c7_f764_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2605_c11_6c81_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_2483_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2605_c7_2483_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_2483_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_2483_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_2483_return_output,
 n16_high_MUX_uxn_opcodes_h_l2605_c7_2483_return_output,
 t16_low_MUX_uxn_opcodes_h_l2605_c7_2483_return_output,
 n16_low_MUX_uxn_opcodes_h_l2605_c7_2483_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2609_c11_47d5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_afac_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2609_c7_afac_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_afac_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_afac_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_afac_return_output,
 n16_high_MUX_uxn_opcodes_h_l2609_c7_afac_return_output,
 n16_low_MUX_uxn_opcodes_h_l2609_c7_afac_return_output,
 sp_relative_shift_uxn_opcodes_h_l2611_c30_3a4e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2616_c11_c005_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_af6f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_af6f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_af6f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2616_c7_af6f_return_output,
 n16_low_MUX_uxn_opcodes_h_l2616_c7_af6f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2622_c11_75cf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_3623_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_3623_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2622_c7_3623_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f174_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_08b3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_08b3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2626_c7_08b3_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_c51b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_c51b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_c51b_return_output : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_7812_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_48d6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2590_c3_bcfe : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_7812_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_48d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2585_c2_48d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_48d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_7812_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_48d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_7812_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_48d6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2595_c3_5a7d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_7812_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_48d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2585_c2_48d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_48d6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_7812_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_48d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2585_c2_48d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_48d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2585_c2_48d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_48d6_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_7812_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_48d6_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_7812_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_48d6_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_7812_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_48d6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_5979_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_5979_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_5979_return_output : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_7812_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_7812_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_f764_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_7812_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_7812_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_7812_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_f764_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_7812_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_7812_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_7812_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_f764_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_7812_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_7812_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_7812_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_f764_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_7812_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_7812_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_7812_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_f764_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_7812_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_7812_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2599_c3_5faf : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_7812_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_f764_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_7812_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_7812_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_7812_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_f764_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_7812_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_7812_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_7812_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_f764_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_7812_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_7812_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_7812_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_f764_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_7812_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_dbe8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_dbe8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_dbe8_return_output : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_f764_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_f764_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_f764_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_f764_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_f764_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_2483_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_f764_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_f764_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_f764_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_2483_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_f764_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_f764_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_f764_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_2483_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_f764_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_f764_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_f764_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_2483_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_f764_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_f764_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2603_c3_de24 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_f764_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_2483_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_f764_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_f764_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_f764_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_2483_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_f764_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_f764_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_f764_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_2483_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_f764_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_f764_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_f764_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_2483_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_f764_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_6c81_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_6c81_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_6c81_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_2483_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_2483_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_afac_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_2483_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_2483_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_2483_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_afac_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_2483_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_2483_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_2483_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_afac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_2483_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_2483_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_2483_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_afac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_2483_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_2483_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2607_c3_4059 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_2483_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_afac_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_2483_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_2483_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_2483_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_afac_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_2483_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_2483_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_2483_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_2483_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_2483_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_2483_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_afac_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_2483_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_47d5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_47d5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_47d5_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_afac_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_afac_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_af6f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_afac_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_afac_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_afac_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_af6f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_afac_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_afac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_afac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_afac_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_afac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_afac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_af6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_afac_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_afac_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2613_c3_b57e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_afac_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_af6f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_afac_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_afac_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_afac_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_afac_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_afac_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_afac_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_af6f_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_afac_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_3a4e_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_3a4e_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_3a4e_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_3a4e_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_c005_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_c005_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_c005_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_af6f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2618_c3_6ceb : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_af6f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_af6f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_af6f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2619_c3_220c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_af6f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_3623_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_af6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_af6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_af6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_3623_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_af6f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_af6f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_af6f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_3623_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_af6f_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_af6f_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_af6f_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_af6f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_75cf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_75cf_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_75cf_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_3623_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2623_c3_884c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_3623_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_08b3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_3623_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_3623_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_3623_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_08b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_3623_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_3623_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_3623_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_08b3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_3623_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f174_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f174_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f174_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_08b3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2627_c3_90bb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_08b3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2626_c7_08b3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_08b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_08b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_08b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_08b3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_08b3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_08b3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_08b3_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2598_l2626_l2585_l2605_l2601_DUPLICATE_4eba_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2605_l2598_l2601_l2616_DUPLICATE_3fa6_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2605_l2598_l2609_l2601_DUPLICATE_1062_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2598_l2626_l2622_l2616_l2609_l2605_l2601_DUPLICATE_93e4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l2632_l2581_DUPLICATE_70a4_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2595_c3_5a7d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2595_c3_5a7d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2599_c3_5faf := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_7812_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2599_c3_5faf;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_afac_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_3a4e_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2619_c3_220c := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_af6f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2619_c3_220c;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2607_c3_4059 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_2483_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2607_c3_4059;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2613_c3_b57e := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_afac_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2613_c3_b57e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f174_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_47d5_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_5979_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_c51b_right := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_08b3_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2623_c3_884c := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_3623_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2623_c3_884c;
     VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_3a4e_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2627_c3_90bb := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_08b3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2627_c3_90bb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_c005_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_6c81_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2618_c3_6ceb := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_af6f_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2618_c3_6ceb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_75cf_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_dbe8_right := to_unsigned(2, 2);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2603_c3_de24 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_f764_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2603_c3_de24;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2590_c3_bcfe := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2590_c3_bcfe;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_3a4e_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_7812_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_f764_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_2483_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_afac_iffalse := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_3623_iftrue := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_7812_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_f764_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_2483_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_afac_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_af6f_iffalse := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_08b3_iftrue := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_c51b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_5979_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_dbe8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_6c81_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_47d5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_c005_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_75cf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f174_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_afac_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_af6f_iftrue := VAR_previous_stack_read;
     VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_f764_iftrue := VAR_previous_stack_read;
     VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_2483_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_afac_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_7812_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_f764_iffalse := t16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_af6f_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_7812_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_f764_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_2483_iffalse := t16_low;
     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2585_c2_48d6] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2585_c2_48d6_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l2598_c11_5979] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2598_c11_5979_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_5979_left;
     BIN_OP_EQ_uxn_opcodes_h_l2598_c11_5979_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_5979_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_5979_return_output := BIN_OP_EQ_uxn_opcodes_h_l2598_c11_5979_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2609_c11_47d5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2609_c11_47d5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_47d5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2609_c11_47d5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_47d5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_47d5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2609_c11_47d5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2616_c11_c005] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2616_c11_c005_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_c005_left;
     BIN_OP_EQ_uxn_opcodes_h_l2616_c11_c005_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_c005_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_c005_return_output := BIN_OP_EQ_uxn_opcodes_h_l2616_c11_c005_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2598_l2626_l2585_l2605_l2601_DUPLICATE_4eba LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2598_l2626_l2585_l2605_l2601_DUPLICATE_4eba_return_output := result.u8_value;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2626_c7_08b3] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2626_c7_08b3_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2626_c11_f174] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f174_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f174_left;
     BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f174_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f174_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f174_return_output := BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f174_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2585_c2_48d6] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2585_c2_48d6_return_output := result.is_pc_updated;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2585_c2_48d6] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2585_c2_48d6_return_output := result.is_vram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2605_l2598_l2601_l2616_DUPLICATE_3fa6 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2605_l2598_l2601_l2616_DUPLICATE_3fa6_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2622_c11_75cf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2622_c11_75cf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_75cf_left;
     BIN_OP_EQ_uxn_opcodes_h_l2622_c11_75cf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_75cf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_75cf_return_output := BIN_OP_EQ_uxn_opcodes_h_l2622_c11_75cf_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2611_c30_3a4e] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2611_c30_3a4e_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_3a4e_ins;
     sp_relative_shift_uxn_opcodes_h_l2611_c30_3a4e_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_3a4e_x;
     sp_relative_shift_uxn_opcodes_h_l2611_c30_3a4e_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_3a4e_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_3a4e_return_output := sp_relative_shift_uxn_opcodes_h_l2611_c30_3a4e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2598_l2626_l2622_l2616_l2609_l2605_l2601_DUPLICATE_93e4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2598_l2626_l2622_l2616_l2609_l2605_l2601_DUPLICATE_93e4_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2585_c6_c51b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2585_c6_c51b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_c51b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2585_c6_c51b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_c51b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_c51b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2585_c6_c51b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2601_c11_dbe8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2601_c11_dbe8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_dbe8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2601_c11_dbe8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_dbe8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_dbe8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2601_c11_dbe8_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2585_c2_48d6] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2585_c2_48d6_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2605_l2598_l2609_l2601_DUPLICATE_1062 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2605_l2598_l2609_l2601_DUPLICATE_1062_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2605_c11_6c81] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2605_c11_6c81_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_6c81_left;
     BIN_OP_EQ_uxn_opcodes_h_l2605_c11_6c81_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_6c81_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_6c81_return_output := BIN_OP_EQ_uxn_opcodes_h_l2605_c11_6c81_return_output;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_48d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_c51b_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_48d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_c51b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_48d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_c51b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_48d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_c51b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_48d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_c51b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_48d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_c51b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_48d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_c51b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_48d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_c51b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_48d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_c51b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_48d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_c51b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_48d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_c51b_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_48d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_c51b_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_48d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_c51b_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_7812_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_5979_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_7812_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_5979_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_7812_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_5979_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_7812_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_5979_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_7812_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_5979_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_7812_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_5979_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_7812_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_5979_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_7812_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_5979_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_7812_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_5979_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_f764_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_dbe8_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_f764_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_dbe8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_f764_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_dbe8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_f764_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_dbe8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_f764_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_dbe8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_f764_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_dbe8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_f764_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_dbe8_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_f764_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_dbe8_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_f764_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_dbe8_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_2483_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_6c81_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_2483_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_6c81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_2483_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_6c81_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_2483_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_6c81_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_2483_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_6c81_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_2483_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_6c81_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_2483_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_6c81_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_2483_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_6c81_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_afac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_47d5_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_afac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_47d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_afac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_47d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_afac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_47d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_afac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_47d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_afac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_47d5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_afac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_47d5_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_af6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_c005_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_af6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_c005_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_af6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_c005_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_af6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_c005_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_af6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_c005_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_3623_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_75cf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_3623_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_75cf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_3623_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_75cf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_08b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f174_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_08b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f174_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_08b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f174_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_7812_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2605_l2598_l2601_l2616_DUPLICATE_3fa6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_f764_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2605_l2598_l2601_l2616_DUPLICATE_3fa6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_2483_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2605_l2598_l2601_l2616_DUPLICATE_3fa6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_af6f_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2605_l2598_l2601_l2616_DUPLICATE_3fa6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_7812_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2598_l2626_l2622_l2616_l2609_l2605_l2601_DUPLICATE_93e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_f764_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2598_l2626_l2622_l2616_l2609_l2605_l2601_DUPLICATE_93e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_2483_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2598_l2626_l2622_l2616_l2609_l2605_l2601_DUPLICATE_93e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_afac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2598_l2626_l2622_l2616_l2609_l2605_l2601_DUPLICATE_93e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_af6f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2598_l2626_l2622_l2616_l2609_l2605_l2601_DUPLICATE_93e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_3623_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2598_l2626_l2622_l2616_l2609_l2605_l2601_DUPLICATE_93e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_08b3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2598_l2626_l2622_l2616_l2609_l2605_l2601_DUPLICATE_93e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_7812_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2605_l2598_l2609_l2601_DUPLICATE_1062_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_f764_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2605_l2598_l2609_l2601_DUPLICATE_1062_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_2483_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2605_l2598_l2609_l2601_DUPLICATE_1062_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_afac_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2605_l2598_l2609_l2601_DUPLICATE_1062_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2598_l2626_l2585_l2605_l2601_DUPLICATE_4eba_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_7812_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2598_l2626_l2585_l2605_l2601_DUPLICATE_4eba_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_f764_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2598_l2626_l2585_l2605_l2601_DUPLICATE_4eba_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_2483_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2598_l2626_l2585_l2605_l2601_DUPLICATE_4eba_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_08b3_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2598_l2626_l2585_l2605_l2601_DUPLICATE_4eba_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2585_c2_48d6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2585_c2_48d6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2585_c2_48d6_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2585_c2_48d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_08b3_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2626_c7_08b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_afac_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_3a4e_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2609_c7_afac] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_afac_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_afac_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_afac_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_afac_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_afac_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_afac_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_afac_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_afac_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2616_c7_af6f] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2616_c7_af6f_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_af6f_cond;
     n16_low_MUX_uxn_opcodes_h_l2616_c7_af6f_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_af6f_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2616_c7_af6f_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_af6f_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_af6f_return_output := n16_low_MUX_uxn_opcodes_h_l2616_c7_af6f_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2585_c2_48d6] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_48d6_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_48d6_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2609_c7_afac] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2609_c7_afac_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_afac_cond;
     n16_high_MUX_uxn_opcodes_h_l2609_c7_afac_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_afac_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2609_c7_afac_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_afac_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_afac_return_output := n16_high_MUX_uxn_opcodes_h_l2609_c7_afac_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2616_c7_af6f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_af6f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_af6f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_af6f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_af6f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_af6f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_af6f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_af6f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_af6f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2626_c7_08b3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_08b3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_08b3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_08b3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_08b3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_08b3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_08b3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_08b3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_08b3_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2585_c2_48d6] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_48d6_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_48d6_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2626_c7_08b3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2626_c7_08b3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_08b3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2626_c7_08b3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_08b3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2626_c7_08b3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_08b3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_08b3_return_output := result_u8_value_MUX_uxn_opcodes_h_l2626_c7_08b3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2626_c7_08b3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_08b3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_08b3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_08b3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_08b3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_08b3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_08b3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_08b3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_08b3_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2585_c2_48d6] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_48d6_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_48d6_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2605_c7_2483] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2605_c7_2483_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_2483_cond;
     t16_low_MUX_uxn_opcodes_h_l2605_c7_2483_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_2483_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2605_c7_2483_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_2483_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_2483_return_output := t16_low_MUX_uxn_opcodes_h_l2605_c7_2483_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2585_c2_48d6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_48d6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_48d6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2601_c7_f764] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2601_c7_f764_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_f764_cond;
     t16_high_MUX_uxn_opcodes_h_l2601_c7_f764_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_f764_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2601_c7_f764_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_f764_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_f764_return_output := t16_high_MUX_uxn_opcodes_h_l2601_c7_f764_return_output;

     -- Submodule level 2
     VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_2483_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_afac_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_afac_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_af6f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_3623_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_08b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_2483_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_afac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_afac_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_af6f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_3623_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_08b3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_3623_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_08b3_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_7812_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_f764_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_f764_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_2483_return_output;
     -- n16_high_MUX[uxn_opcodes_h_l2605_c7_2483] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2605_c7_2483_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_2483_cond;
     n16_high_MUX_uxn_opcodes_h_l2605_c7_2483_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_2483_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2605_c7_2483_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_2483_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_2483_return_output := n16_high_MUX_uxn_opcodes_h_l2605_c7_2483_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2605_c7_2483] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_2483_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_2483_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_2483_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_2483_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_2483_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_2483_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_2483_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_2483_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2622_c7_3623] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_3623_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_3623_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_3623_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_3623_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_3623_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_3623_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_3623_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_3623_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2609_c7_afac] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2609_c7_afac_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_afac_cond;
     n16_low_MUX_uxn_opcodes_h_l2609_c7_afac_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_afac_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2609_c7_afac_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_afac_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_afac_return_output := n16_low_MUX_uxn_opcodes_h_l2609_c7_afac_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2622_c7_3623] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_3623_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_3623_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_3623_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_3623_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_3623_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_3623_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_3623_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_3623_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2601_c7_f764] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2601_c7_f764_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_f764_cond;
     t16_low_MUX_uxn_opcodes_h_l2601_c7_f764_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_f764_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2601_c7_f764_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_f764_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_f764_return_output := t16_low_MUX_uxn_opcodes_h_l2601_c7_f764_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2622_c7_3623] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2622_c7_3623_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_3623_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2622_c7_3623_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_3623_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2622_c7_3623_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_3623_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_3623_return_output := result_u8_value_MUX_uxn_opcodes_h_l2622_c7_3623_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2609_c7_afac] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_afac_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_afac_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_afac_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_afac_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_afac_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_afac_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_afac_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_afac_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2598_c7_7812] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2598_c7_7812_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_7812_cond;
     t16_high_MUX_uxn_opcodes_h_l2598_c7_7812_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_7812_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2598_c7_7812_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_7812_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_7812_return_output := t16_high_MUX_uxn_opcodes_h_l2598_c7_7812_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_f764_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_2483_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_2483_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_afac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_af6f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_3623_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_f764_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_2483_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_2483_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_afac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_af6f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_3623_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_af6f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_3623_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_7812_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_7812_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_f764_return_output;
     -- t16_low_MUX[uxn_opcodes_h_l2598_c7_7812] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2598_c7_7812_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_7812_cond;
     t16_low_MUX_uxn_opcodes_h_l2598_c7_7812_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_7812_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2598_c7_7812_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_7812_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_7812_return_output := t16_low_MUX_uxn_opcodes_h_l2598_c7_7812_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2601_c7_f764] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_f764_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_f764_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_f764_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_f764_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_f764_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_f764_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_f764_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_f764_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2605_c7_2483] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_2483_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_2483_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_2483_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_2483_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_2483_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_2483_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_2483_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_2483_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2616_c7_af6f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_af6f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_af6f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_af6f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_af6f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_af6f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_af6f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_af6f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_af6f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2616_c7_af6f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_af6f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_af6f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_af6f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_af6f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_af6f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_af6f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_af6f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_af6f_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2585_c2_48d6] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2585_c2_48d6_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_48d6_cond;
     t16_high_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output := t16_high_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2601_c7_f764] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2601_c7_f764_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_f764_cond;
     n16_high_MUX_uxn_opcodes_h_l2601_c7_f764_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_f764_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2601_c7_f764_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_f764_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_f764_return_output := n16_high_MUX_uxn_opcodes_h_l2601_c7_f764_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2605_c7_2483] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2605_c7_2483_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_2483_cond;
     n16_low_MUX_uxn_opcodes_h_l2605_c7_2483_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_2483_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2605_c7_2483_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_2483_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_2483_return_output := n16_low_MUX_uxn_opcodes_h_l2605_c7_2483_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2616_c7_af6f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2616_c7_af6f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_af6f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2616_c7_af6f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_af6f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2616_c7_af6f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_af6f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_af6f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2616_c7_af6f_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_7812_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_f764_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_f764_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_2483_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_afac_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_af6f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_7812_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_f764_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_f764_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_2483_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_afac_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_af6f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_afac_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_af6f_return_output;
     REG_VAR_t16_high := VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_7812_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2609_c7_afac] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_afac_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_afac_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_afac_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_afac_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_afac_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_afac_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_afac_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_afac_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2598_c7_7812] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2598_c7_7812_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_7812_cond;
     n16_high_MUX_uxn_opcodes_h_l2598_c7_7812_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_7812_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2598_c7_7812_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_7812_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_7812_return_output := n16_high_MUX_uxn_opcodes_h_l2598_c7_7812_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2598_c7_7812] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_7812_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_7812_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_7812_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_7812_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_7812_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_7812_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_7812_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_7812_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2601_c7_f764] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_f764_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_f764_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_f764_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_f764_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_f764_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_f764_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_f764_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_f764_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2601_c7_f764] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2601_c7_f764_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_f764_cond;
     n16_low_MUX_uxn_opcodes_h_l2601_c7_f764_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_f764_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2601_c7_f764_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_f764_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_f764_return_output := n16_low_MUX_uxn_opcodes_h_l2601_c7_f764_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2609_c7_afac] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2609_c7_afac_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_afac_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2609_c7_afac_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_afac_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2609_c7_afac_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_afac_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_afac_return_output := result_u8_value_MUX_uxn_opcodes_h_l2609_c7_afac_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2585_c2_48d6] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2585_c2_48d6_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_48d6_cond;
     t16_low_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output := t16_low_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2609_c7_afac] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_afac_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_afac_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_afac_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_afac_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_afac_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_afac_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_afac_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_afac_return_output;

     -- Submodule level 5
     VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_7812_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_7812_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_f764_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_2483_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_afac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_7812_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_7812_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_f764_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_2483_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_afac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_2483_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_afac_return_output;
     REG_VAR_t16_low := VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2585_c2_48d6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_48d6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_48d6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2598_c7_7812] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_7812_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_7812_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_7812_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_7812_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_7812_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_7812_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_7812_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_7812_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2605_c7_2483] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_2483_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_2483_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_2483_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_2483_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_2483_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_2483_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_2483_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_2483_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2605_c7_2483] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2605_c7_2483_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_2483_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2605_c7_2483_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_2483_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2605_c7_2483_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_2483_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_2483_return_output := result_u8_value_MUX_uxn_opcodes_h_l2605_c7_2483_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2605_c7_2483] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_2483_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_2483_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_2483_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_2483_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_2483_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_2483_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_2483_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_2483_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2585_c2_48d6] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2585_c2_48d6_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_48d6_cond;
     n16_high_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output := n16_high_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2598_c7_7812] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2598_c7_7812_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_7812_cond;
     n16_low_MUX_uxn_opcodes_h_l2598_c7_7812_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_7812_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2598_c7_7812_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_7812_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_7812_return_output := n16_low_MUX_uxn_opcodes_h_l2598_c7_7812_return_output;

     -- Submodule level 6
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_7812_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_f764_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_2483_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_7812_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_f764_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_2483_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_f764_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_2483_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2601_c7_f764] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_f764_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_f764_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_f764_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_f764_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_f764_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_f764_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_f764_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_f764_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2585_c2_48d6] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2585_c2_48d6_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_48d6_cond;
     n16_low_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output := n16_low_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2601_c7_f764] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_f764_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_f764_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_f764_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_f764_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_f764_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_f764_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_f764_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_f764_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2585_c2_48d6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_48d6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_48d6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2601_c7_f764] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2601_c7_f764_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_f764_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2601_c7_f764_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_f764_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2601_c7_f764_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_f764_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_f764_return_output := result_u8_value_MUX_uxn_opcodes_h_l2601_c7_f764_return_output;

     -- Submodule level 7
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_7812_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_f764_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_7812_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_f764_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_7812_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_f764_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2598_c7_7812] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_7812_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_7812_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_7812_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_7812_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_7812_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_7812_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_7812_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_7812_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2598_c7_7812] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_7812_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_7812_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_7812_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_7812_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_7812_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_7812_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_7812_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_7812_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2598_c7_7812] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2598_c7_7812_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_7812_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2598_c7_7812_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_7812_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2598_c7_7812_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_7812_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_7812_return_output := result_u8_value_MUX_uxn_opcodes_h_l2598_c7_7812_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_7812_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_7812_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_7812_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2585_c2_48d6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2585_c2_48d6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_48d6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output := result_u8_value_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2585_c2_48d6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_48d6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_48d6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2585_c2_48d6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_48d6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_48d6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_48d6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_48d6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l2632_l2581_DUPLICATE_70a4 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l2632_l2581_DUPLICATE_70a4_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_ee25(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_48d6_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l2632_l2581_DUPLICATE_70a4_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l2632_l2581_DUPLICATE_70a4_return_output;
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
