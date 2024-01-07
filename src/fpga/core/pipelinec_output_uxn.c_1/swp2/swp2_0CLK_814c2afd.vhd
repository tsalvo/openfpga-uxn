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
-- BIN_OP_EQ[uxn_opcodes_h_l2585_c6_0ded]
signal BIN_OP_EQ_uxn_opcodes_h_l2585_c6_0ded_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2585_c6_0ded_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2585_c6_0ded_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2585_c2_eb77]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_eb77_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2585_c2_eb77]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_eb77_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2585_c2_eb77]
signal result_u8_value_MUX_uxn_opcodes_h_l2585_c2_eb77_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2585_c2_eb77]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_eb77_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2585_c2_eb77]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_eb77_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2585_c2_eb77]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_eb77_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2585_c2_eb77]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_eb77_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2585_c2_eb77]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_eb77_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2585_c2_eb77]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_eb77_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2585_c2_eb77]
signal n16_high_MUX_uxn_opcodes_h_l2585_c2_eb77_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2585_c2_eb77]
signal n16_low_MUX_uxn_opcodes_h_l2585_c2_eb77_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2585_c2_eb77]
signal t16_low_MUX_uxn_opcodes_h_l2585_c2_eb77_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2585_c2_eb77]
signal t16_high_MUX_uxn_opcodes_h_l2585_c2_eb77_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2598_c11_c2c0]
signal BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c2c0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c2c0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c2c0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2598_c7_9992]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_9992_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_9992_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_9992_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_9992_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2598_c7_9992]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_9992_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_9992_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_9992_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_9992_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2598_c7_9992]
signal result_u8_value_MUX_uxn_opcodes_h_l2598_c7_9992_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2598_c7_9992_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2598_c7_9992_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2598_c7_9992_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2598_c7_9992]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_9992_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_9992_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_9992_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_9992_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2598_c7_9992]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_9992_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_9992_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_9992_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_9992_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2598_c7_9992]
signal n16_high_MUX_uxn_opcodes_h_l2598_c7_9992_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2598_c7_9992_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2598_c7_9992_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2598_c7_9992_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2598_c7_9992]
signal n16_low_MUX_uxn_opcodes_h_l2598_c7_9992_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2598_c7_9992_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2598_c7_9992_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2598_c7_9992_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2598_c7_9992]
signal t16_low_MUX_uxn_opcodes_h_l2598_c7_9992_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2598_c7_9992_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2598_c7_9992_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2598_c7_9992_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2598_c7_9992]
signal t16_high_MUX_uxn_opcodes_h_l2598_c7_9992_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2598_c7_9992_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2598_c7_9992_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2598_c7_9992_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2601_c11_93e3]
signal BIN_OP_EQ_uxn_opcodes_h_l2601_c11_93e3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2601_c11_93e3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2601_c11_93e3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2601_c7_ca81]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_ca81_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_ca81_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_ca81_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2601_c7_ca81]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_ca81_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_ca81_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_ca81_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2601_c7_ca81]
signal result_u8_value_MUX_uxn_opcodes_h_l2601_c7_ca81_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2601_c7_ca81_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2601_c7_ca81_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2601_c7_ca81]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_ca81_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_ca81_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_ca81_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2601_c7_ca81]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_ca81_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_ca81_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_ca81_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2601_c7_ca81]
signal n16_high_MUX_uxn_opcodes_h_l2601_c7_ca81_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2601_c7_ca81_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2601_c7_ca81_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2601_c7_ca81]
signal n16_low_MUX_uxn_opcodes_h_l2601_c7_ca81_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2601_c7_ca81_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2601_c7_ca81_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2601_c7_ca81]
signal t16_low_MUX_uxn_opcodes_h_l2601_c7_ca81_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2601_c7_ca81_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2601_c7_ca81_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2601_c7_ca81]
signal t16_high_MUX_uxn_opcodes_h_l2601_c7_ca81_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2601_c7_ca81_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2601_c7_ca81_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2605_c11_1d1e]
signal BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d1e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d1e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d1e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2605_c7_40dc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_40dc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_40dc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_40dc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2605_c7_40dc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_40dc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_40dc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_40dc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2605_c7_40dc]
signal result_u8_value_MUX_uxn_opcodes_h_l2605_c7_40dc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2605_c7_40dc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2605_c7_40dc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2605_c7_40dc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_40dc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_40dc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_40dc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2605_c7_40dc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_40dc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_40dc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_40dc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2605_c7_40dc]
signal n16_high_MUX_uxn_opcodes_h_l2605_c7_40dc_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2605_c7_40dc_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2605_c7_40dc_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2605_c7_40dc]
signal n16_low_MUX_uxn_opcodes_h_l2605_c7_40dc_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2605_c7_40dc_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2605_c7_40dc_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2605_c7_40dc]
signal t16_low_MUX_uxn_opcodes_h_l2605_c7_40dc_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2605_c7_40dc_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2605_c7_40dc_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2609_c11_5e28]
signal BIN_OP_EQ_uxn_opcodes_h_l2609_c11_5e28_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2609_c11_5e28_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2609_c11_5e28_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2609_c7_870f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_870f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_870f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_870f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_870f_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2609_c7_870f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_870f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_870f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_870f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_870f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2609_c7_870f]
signal result_u8_value_MUX_uxn_opcodes_h_l2609_c7_870f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2609_c7_870f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2609_c7_870f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2609_c7_870f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2609_c7_870f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_870f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_870f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_870f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_870f_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2609_c7_870f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_870f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_870f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_870f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_870f_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2609_c7_870f]
signal n16_high_MUX_uxn_opcodes_h_l2609_c7_870f_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2609_c7_870f_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2609_c7_870f_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2609_c7_870f_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2609_c7_870f]
signal n16_low_MUX_uxn_opcodes_h_l2609_c7_870f_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2609_c7_870f_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2609_c7_870f_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2609_c7_870f_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2611_c30_fffd]
signal sp_relative_shift_uxn_opcodes_h_l2611_c30_fffd_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2611_c30_fffd_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2611_c30_fffd_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2611_c30_fffd_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2616_c11_e5a3]
signal BIN_OP_EQ_uxn_opcodes_h_l2616_c11_e5a3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2616_c11_e5a3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2616_c11_e5a3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2616_c7_c964]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_c964_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_c964_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_c964_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_c964_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2616_c7_c964]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_c964_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_c964_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_c964_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_c964_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2616_c7_c964]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_c964_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_c964_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_c964_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_c964_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2616_c7_c964]
signal result_u8_value_MUX_uxn_opcodes_h_l2616_c7_c964_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2616_c7_c964_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2616_c7_c964_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2616_c7_c964_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2616_c7_c964]
signal n16_low_MUX_uxn_opcodes_h_l2616_c7_c964_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2616_c7_c964_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2616_c7_c964_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2616_c7_c964_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2622_c11_9f85]
signal BIN_OP_EQ_uxn_opcodes_h_l2622_c11_9f85_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2622_c11_9f85_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2622_c11_9f85_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2622_c7_45c1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_45c1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_45c1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_45c1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_45c1_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2622_c7_45c1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_45c1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_45c1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_45c1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_45c1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2622_c7_45c1]
signal result_u8_value_MUX_uxn_opcodes_h_l2622_c7_45c1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2622_c7_45c1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2622_c7_45c1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2622_c7_45c1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2626_c11_f5a2]
signal BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f5a2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f5a2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f5a2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2626_c7_0a86]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_0a86_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_0a86_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_0a86_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_0a86_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2626_c7_0a86]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_0a86_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_0a86_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_0a86_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_0a86_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2626_c7_0a86]
signal result_u8_value_MUX_uxn_opcodes_h_l2626_c7_0a86_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2626_c7_0a86_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2626_c7_0a86_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2626_c7_0a86_return_output : unsigned(7 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2585_c6_0ded
BIN_OP_EQ_uxn_opcodes_h_l2585_c6_0ded : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2585_c6_0ded_left,
BIN_OP_EQ_uxn_opcodes_h_l2585_c6_0ded_right,
BIN_OP_EQ_uxn_opcodes_h_l2585_c6_0ded_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_eb77
result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_eb77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_eb77_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_eb77
result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_eb77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_eb77_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2585_c2_eb77
result_u8_value_MUX_uxn_opcodes_h_l2585_c2_eb77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2585_c2_eb77_cond,
result_u8_value_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_eb77
result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_eb77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_eb77_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_eb77
result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_eb77 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_eb77_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_eb77
result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_eb77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_eb77_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_eb77
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_eb77 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_eb77_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_eb77
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_eb77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_eb77_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_eb77
result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_eb77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_eb77_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2585_c2_eb77
n16_high_MUX_uxn_opcodes_h_l2585_c2_eb77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2585_c2_eb77_cond,
n16_high_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue,
n16_high_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse,
n16_high_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2585_c2_eb77
n16_low_MUX_uxn_opcodes_h_l2585_c2_eb77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2585_c2_eb77_cond,
n16_low_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue,
n16_low_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse,
n16_low_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2585_c2_eb77
t16_low_MUX_uxn_opcodes_h_l2585_c2_eb77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2585_c2_eb77_cond,
t16_low_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue,
t16_low_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse,
t16_low_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2585_c2_eb77
t16_high_MUX_uxn_opcodes_h_l2585_c2_eb77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2585_c2_eb77_cond,
t16_high_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue,
t16_high_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse,
t16_high_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c2c0
BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c2c0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c2c0_left,
BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c2c0_right,
BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c2c0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_9992
result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_9992 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_9992_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_9992_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_9992_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_9992_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_9992
result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_9992 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_9992_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_9992_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_9992_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_9992_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2598_c7_9992
result_u8_value_MUX_uxn_opcodes_h_l2598_c7_9992 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2598_c7_9992_cond,
result_u8_value_MUX_uxn_opcodes_h_l2598_c7_9992_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2598_c7_9992_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2598_c7_9992_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_9992
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_9992 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_9992_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_9992_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_9992_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_9992_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_9992
result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_9992 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_9992_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_9992_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_9992_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_9992_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2598_c7_9992
n16_high_MUX_uxn_opcodes_h_l2598_c7_9992 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2598_c7_9992_cond,
n16_high_MUX_uxn_opcodes_h_l2598_c7_9992_iftrue,
n16_high_MUX_uxn_opcodes_h_l2598_c7_9992_iffalse,
n16_high_MUX_uxn_opcodes_h_l2598_c7_9992_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2598_c7_9992
n16_low_MUX_uxn_opcodes_h_l2598_c7_9992 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2598_c7_9992_cond,
n16_low_MUX_uxn_opcodes_h_l2598_c7_9992_iftrue,
n16_low_MUX_uxn_opcodes_h_l2598_c7_9992_iffalse,
n16_low_MUX_uxn_opcodes_h_l2598_c7_9992_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2598_c7_9992
t16_low_MUX_uxn_opcodes_h_l2598_c7_9992 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2598_c7_9992_cond,
t16_low_MUX_uxn_opcodes_h_l2598_c7_9992_iftrue,
t16_low_MUX_uxn_opcodes_h_l2598_c7_9992_iffalse,
t16_low_MUX_uxn_opcodes_h_l2598_c7_9992_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2598_c7_9992
t16_high_MUX_uxn_opcodes_h_l2598_c7_9992 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2598_c7_9992_cond,
t16_high_MUX_uxn_opcodes_h_l2598_c7_9992_iftrue,
t16_high_MUX_uxn_opcodes_h_l2598_c7_9992_iffalse,
t16_high_MUX_uxn_opcodes_h_l2598_c7_9992_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2601_c11_93e3
BIN_OP_EQ_uxn_opcodes_h_l2601_c11_93e3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2601_c11_93e3_left,
BIN_OP_EQ_uxn_opcodes_h_l2601_c11_93e3_right,
BIN_OP_EQ_uxn_opcodes_h_l2601_c11_93e3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_ca81
result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_ca81 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_ca81_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_ca81_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_ca81_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_ca81
result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_ca81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_ca81_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_ca81_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_ca81_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2601_c7_ca81
result_u8_value_MUX_uxn_opcodes_h_l2601_c7_ca81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2601_c7_ca81_cond,
result_u8_value_MUX_uxn_opcodes_h_l2601_c7_ca81_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2601_c7_ca81_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_ca81
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_ca81 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_ca81_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_ca81_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_ca81_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_ca81
result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_ca81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_ca81_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_ca81_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_ca81_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2601_c7_ca81
n16_high_MUX_uxn_opcodes_h_l2601_c7_ca81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2601_c7_ca81_cond,
n16_high_MUX_uxn_opcodes_h_l2601_c7_ca81_iftrue,
n16_high_MUX_uxn_opcodes_h_l2601_c7_ca81_iffalse,
n16_high_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2601_c7_ca81
n16_low_MUX_uxn_opcodes_h_l2601_c7_ca81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2601_c7_ca81_cond,
n16_low_MUX_uxn_opcodes_h_l2601_c7_ca81_iftrue,
n16_low_MUX_uxn_opcodes_h_l2601_c7_ca81_iffalse,
n16_low_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2601_c7_ca81
t16_low_MUX_uxn_opcodes_h_l2601_c7_ca81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2601_c7_ca81_cond,
t16_low_MUX_uxn_opcodes_h_l2601_c7_ca81_iftrue,
t16_low_MUX_uxn_opcodes_h_l2601_c7_ca81_iffalse,
t16_low_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2601_c7_ca81
t16_high_MUX_uxn_opcodes_h_l2601_c7_ca81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2601_c7_ca81_cond,
t16_high_MUX_uxn_opcodes_h_l2601_c7_ca81_iftrue,
t16_high_MUX_uxn_opcodes_h_l2601_c7_ca81_iffalse,
t16_high_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d1e
BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d1e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d1e_left,
BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d1e_right,
BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d1e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_40dc
result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_40dc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_40dc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_40dc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_40dc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_40dc
result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_40dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_40dc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_40dc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_40dc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2605_c7_40dc
result_u8_value_MUX_uxn_opcodes_h_l2605_c7_40dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2605_c7_40dc_cond,
result_u8_value_MUX_uxn_opcodes_h_l2605_c7_40dc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2605_c7_40dc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_40dc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_40dc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_40dc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_40dc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_40dc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_40dc
result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_40dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_40dc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_40dc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_40dc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2605_c7_40dc
n16_high_MUX_uxn_opcodes_h_l2605_c7_40dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2605_c7_40dc_cond,
n16_high_MUX_uxn_opcodes_h_l2605_c7_40dc_iftrue,
n16_high_MUX_uxn_opcodes_h_l2605_c7_40dc_iffalse,
n16_high_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2605_c7_40dc
n16_low_MUX_uxn_opcodes_h_l2605_c7_40dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2605_c7_40dc_cond,
n16_low_MUX_uxn_opcodes_h_l2605_c7_40dc_iftrue,
n16_low_MUX_uxn_opcodes_h_l2605_c7_40dc_iffalse,
n16_low_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2605_c7_40dc
t16_low_MUX_uxn_opcodes_h_l2605_c7_40dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2605_c7_40dc_cond,
t16_low_MUX_uxn_opcodes_h_l2605_c7_40dc_iftrue,
t16_low_MUX_uxn_opcodes_h_l2605_c7_40dc_iffalse,
t16_low_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2609_c11_5e28
BIN_OP_EQ_uxn_opcodes_h_l2609_c11_5e28 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2609_c11_5e28_left,
BIN_OP_EQ_uxn_opcodes_h_l2609_c11_5e28_right,
BIN_OP_EQ_uxn_opcodes_h_l2609_c11_5e28_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_870f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_870f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_870f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_870f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_870f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_870f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_870f
result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_870f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_870f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_870f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_870f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_870f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2609_c7_870f
result_u8_value_MUX_uxn_opcodes_h_l2609_c7_870f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2609_c7_870f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2609_c7_870f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2609_c7_870f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2609_c7_870f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_870f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_870f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_870f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_870f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_870f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_870f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_870f
result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_870f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_870f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_870f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_870f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_870f_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2609_c7_870f
n16_high_MUX_uxn_opcodes_h_l2609_c7_870f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2609_c7_870f_cond,
n16_high_MUX_uxn_opcodes_h_l2609_c7_870f_iftrue,
n16_high_MUX_uxn_opcodes_h_l2609_c7_870f_iffalse,
n16_high_MUX_uxn_opcodes_h_l2609_c7_870f_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2609_c7_870f
n16_low_MUX_uxn_opcodes_h_l2609_c7_870f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2609_c7_870f_cond,
n16_low_MUX_uxn_opcodes_h_l2609_c7_870f_iftrue,
n16_low_MUX_uxn_opcodes_h_l2609_c7_870f_iffalse,
n16_low_MUX_uxn_opcodes_h_l2609_c7_870f_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2611_c30_fffd
sp_relative_shift_uxn_opcodes_h_l2611_c30_fffd : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2611_c30_fffd_ins,
sp_relative_shift_uxn_opcodes_h_l2611_c30_fffd_x,
sp_relative_shift_uxn_opcodes_h_l2611_c30_fffd_y,
sp_relative_shift_uxn_opcodes_h_l2611_c30_fffd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2616_c11_e5a3
BIN_OP_EQ_uxn_opcodes_h_l2616_c11_e5a3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2616_c11_e5a3_left,
BIN_OP_EQ_uxn_opcodes_h_l2616_c11_e5a3_right,
BIN_OP_EQ_uxn_opcodes_h_l2616_c11_e5a3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_c964
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_c964 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_c964_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_c964_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_c964_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_c964_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_c964
result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_c964 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_c964_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_c964_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_c964_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_c964_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_c964
result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_c964 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_c964_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_c964_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_c964_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_c964_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2616_c7_c964
result_u8_value_MUX_uxn_opcodes_h_l2616_c7_c964 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2616_c7_c964_cond,
result_u8_value_MUX_uxn_opcodes_h_l2616_c7_c964_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2616_c7_c964_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2616_c7_c964_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2616_c7_c964
n16_low_MUX_uxn_opcodes_h_l2616_c7_c964 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2616_c7_c964_cond,
n16_low_MUX_uxn_opcodes_h_l2616_c7_c964_iftrue,
n16_low_MUX_uxn_opcodes_h_l2616_c7_c964_iffalse,
n16_low_MUX_uxn_opcodes_h_l2616_c7_c964_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2622_c11_9f85
BIN_OP_EQ_uxn_opcodes_h_l2622_c11_9f85 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2622_c11_9f85_left,
BIN_OP_EQ_uxn_opcodes_h_l2622_c11_9f85_right,
BIN_OP_EQ_uxn_opcodes_h_l2622_c11_9f85_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_45c1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_45c1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_45c1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_45c1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_45c1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_45c1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_45c1
result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_45c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_45c1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_45c1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_45c1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_45c1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2622_c7_45c1
result_u8_value_MUX_uxn_opcodes_h_l2622_c7_45c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2622_c7_45c1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2622_c7_45c1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2622_c7_45c1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2622_c7_45c1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f5a2
BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f5a2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f5a2_left,
BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f5a2_right,
BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f5a2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_0a86
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_0a86 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_0a86_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_0a86_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_0a86_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_0a86_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_0a86
result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_0a86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_0a86_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_0a86_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_0a86_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_0a86_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2626_c7_0a86
result_u8_value_MUX_uxn_opcodes_h_l2626_c7_0a86 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2626_c7_0a86_cond,
result_u8_value_MUX_uxn_opcodes_h_l2626_c7_0a86_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2626_c7_0a86_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2626_c7_0a86_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2585_c6_0ded_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output,
 n16_high_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output,
 n16_low_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output,
 t16_low_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output,
 t16_high_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c2c0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_9992_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_9992_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2598_c7_9992_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_9992_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_9992_return_output,
 n16_high_MUX_uxn_opcodes_h_l2598_c7_9992_return_output,
 n16_low_MUX_uxn_opcodes_h_l2598_c7_9992_return_output,
 t16_low_MUX_uxn_opcodes_h_l2598_c7_9992_return_output,
 t16_high_MUX_uxn_opcodes_h_l2598_c7_9992_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2601_c11_93e3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output,
 n16_high_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output,
 n16_low_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output,
 t16_low_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output,
 t16_high_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d1e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output,
 n16_high_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output,
 n16_low_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output,
 t16_low_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2609_c11_5e28_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_870f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_870f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2609_c7_870f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_870f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_870f_return_output,
 n16_high_MUX_uxn_opcodes_h_l2609_c7_870f_return_output,
 n16_low_MUX_uxn_opcodes_h_l2609_c7_870f_return_output,
 sp_relative_shift_uxn_opcodes_h_l2611_c30_fffd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2616_c11_e5a3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_c964_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_c964_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_c964_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2616_c7_c964_return_output,
 n16_low_MUX_uxn_opcodes_h_l2616_c7_c964_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2622_c11_9f85_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_45c1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_45c1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2622_c7_45c1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f5a2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_0a86_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_0a86_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2626_c7_0a86_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_0ded_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_0ded_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_0ded_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2585_c2_eb77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_eb77_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2585_c2_eb77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_eb77_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_9992_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_eb77_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2585_c2_eb77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_eb77_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2590_c3_2594 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_9992_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_eb77_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_9992_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_eb77_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2595_c3_e67c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_9992_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_eb77_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2585_c2_eb77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_eb77_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_9992_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_eb77_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_9992_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_eb77_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_9992_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_eb77_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_9992_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_eb77_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_9992_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_eb77_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c2c0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c2c0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c2c0_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_9992_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_9992_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_9992_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_9992_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_9992_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_9992_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_9992_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_9992_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_9992_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_9992_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2599_c3_11fa : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_9992_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_9992_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_9992_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_9992_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_9992_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_9992_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_9992_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_9992_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_9992_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_9992_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_9992_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_9992_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_9992_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_9992_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_9992_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_9992_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_9992_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_93e3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_93e3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_93e3_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_ca81_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_ca81_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_ca81_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_ca81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_ca81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_ca81_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_ca81_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_ca81_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_ca81_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_ca81_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2603_c3_2dd2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_ca81_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_ca81_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_ca81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_ca81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_ca81_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_ca81_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_ca81_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_ca81_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_ca81_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_ca81_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_ca81_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_ca81_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_ca81_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_ca81_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_ca81_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_ca81_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_ca81_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d1e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d1e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d1e_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_40dc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_40dc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_870f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_40dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_40dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_40dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_870f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_40dc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_40dc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_40dc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_870f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_40dc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_40dc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2607_c3_ce46 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_40dc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_870f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_40dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_40dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_40dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_870f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_40dc_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_40dc_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_40dc_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_870f_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_40dc_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_40dc_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_40dc_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_870f_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_40dc_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_40dc_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_40dc_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_40dc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_5e28_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_5e28_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_5e28_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_870f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_870f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_c964_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_870f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_870f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_870f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_870f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_870f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_870f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_c964_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_870f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_870f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2613_c3_8fe6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_870f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_c964_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_870f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_870f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_870f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_c964_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_870f_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_870f_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_870f_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_870f_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_870f_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_870f_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_c964_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_870f_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_fffd_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_fffd_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_fffd_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_fffd_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_e5a3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_e5a3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_e5a3_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_c964_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2619_c3_8b30 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_c964_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_45c1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_c964_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_c964_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2618_c3_bcec : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_c964_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_c964_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_c964_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_c964_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_45c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_c964_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_c964_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_c964_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_45c1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_c964_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_c964_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_c964_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_c964_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_9f85_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_9f85_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_9f85_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_45c1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2623_c3_d9bc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_45c1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_0a86_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_45c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_45c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_45c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_0a86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_45c1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_45c1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_45c1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_0a86_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_45c1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f5a2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f5a2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f5a2_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_0a86_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2627_c3_b60f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_0a86_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2626_c7_0a86_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_0a86_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_0a86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_0a86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_0a86_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_0a86_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_0a86_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_0a86_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2601_l2598_l2626_l2585_l2605_DUPLICATE_a996_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2601_l2616_l2605_l2598_DUPLICATE_3d7c_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2609_l2601_l2605_l2598_DUPLICATE_1813_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2601_l2598_l2626_l2622_l2616_l2609_l2605_DUPLICATE_8e60_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l2581_l2632_DUPLICATE_e477_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2619_c3_8b30 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_c964_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2619_c3_8b30;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2599_c3_11fa := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_9992_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2599_c3_11fa;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_0a86_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_93e3_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_9f85_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_5e28_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_0ded_right := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2618_c3_bcec := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_c964_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2618_c3_bcec;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d1e_right := to_unsigned(3, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_e5a3_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2613_c3_8fe6 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_870f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2613_c3_8fe6;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2627_c3_b60f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_0a86_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2627_c3_b60f;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c2c0_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2607_c3_ce46 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_40dc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2607_c3_ce46;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2595_c3_e67c := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2595_c3_e67c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f5a2_right := to_unsigned(7, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_870f_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2603_c3_2dd2 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_ca81_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2603_c3_2dd2;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2623_c3_d9bc := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_45c1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2623_c3_d9bc;
     VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_fffd_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2590_c3_2594 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2590_c3_2594;
     VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_fffd_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_fffd_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_9992_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_ca81_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_40dc_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_870f_iffalse := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_45c1_iftrue := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_9992_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_ca81_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_40dc_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_870f_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_c964_iffalse := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_0a86_iftrue := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_0ded_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c2c0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_93e3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d1e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_5e28_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_e5a3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_9f85_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f5a2_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_870f_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_c964_iftrue := VAR_previous_stack_read;
     VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_ca81_iftrue := VAR_previous_stack_read;
     VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_40dc_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_870f_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_9992_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_ca81_iffalse := t16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_c964_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_9992_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_ca81_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_40dc_iffalse := t16_low;
     -- sp_relative_shift[uxn_opcodes_h_l2611_c30_fffd] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2611_c30_fffd_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_fffd_ins;
     sp_relative_shift_uxn_opcodes_h_l2611_c30_fffd_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_fffd_x;
     sp_relative_shift_uxn_opcodes_h_l2611_c30_fffd_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_fffd_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_fffd_return_output := sp_relative_shift_uxn_opcodes_h_l2611_c30_fffd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2616_c11_e5a3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2616_c11_e5a3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_e5a3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2616_c11_e5a3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_e5a3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_e5a3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2616_c11_e5a3_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2585_c2_eb77] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2585_c2_eb77_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2601_l2598_l2626_l2622_l2616_l2609_l2605_DUPLICATE_8e60 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2601_l2598_l2626_l2622_l2616_l2609_l2605_DUPLICATE_8e60_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2622_c11_9f85] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2622_c11_9f85_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_9f85_left;
     BIN_OP_EQ_uxn_opcodes_h_l2622_c11_9f85_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_9f85_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_9f85_return_output := BIN_OP_EQ_uxn_opcodes_h_l2622_c11_9f85_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2585_c2_eb77] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2585_c2_eb77_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l2605_c11_1d1e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d1e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d1e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d1e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d1e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d1e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d1e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2609_l2601_l2605_l2598_DUPLICATE_1813 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2609_l2601_l2605_l2598_DUPLICATE_1813_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2598_c11_c2c0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c2c0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c2c0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c2c0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c2c0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c2c0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c2c0_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2626_c7_0a86] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2626_c7_0a86_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2585_c6_0ded] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2585_c6_0ded_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_0ded_left;
     BIN_OP_EQ_uxn_opcodes_h_l2585_c6_0ded_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_0ded_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_0ded_return_output := BIN_OP_EQ_uxn_opcodes_h_l2585_c6_0ded_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2601_l2616_l2605_l2598_DUPLICATE_3d7c LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2601_l2616_l2605_l2598_DUPLICATE_3d7c_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2601_l2598_l2626_l2585_l2605_DUPLICATE_a996 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2601_l2598_l2626_l2585_l2605_DUPLICATE_a996_return_output := result.u8_value;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2585_c2_eb77] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2585_c2_eb77_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2626_c11_f5a2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f5a2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f5a2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f5a2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f5a2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f5a2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f5a2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2609_c11_5e28] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2609_c11_5e28_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_5e28_left;
     BIN_OP_EQ_uxn_opcodes_h_l2609_c11_5e28_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_5e28_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_5e28_return_output := BIN_OP_EQ_uxn_opcodes_h_l2609_c11_5e28_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2585_c2_eb77] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2585_c2_eb77_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2601_c11_93e3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2601_c11_93e3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_93e3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2601_c11_93e3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_93e3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_93e3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2601_c11_93e3_return_output;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_eb77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_0ded_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_eb77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_0ded_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_eb77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_0ded_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_eb77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_0ded_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_eb77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_0ded_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_eb77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_0ded_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_eb77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_0ded_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_eb77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_0ded_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_eb77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_0ded_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_eb77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_0ded_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_eb77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_0ded_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_eb77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_0ded_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_eb77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_0ded_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_9992_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c2c0_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_9992_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c2c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_9992_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c2c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_9992_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c2c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_9992_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c2c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_9992_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c2c0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_9992_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c2c0_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_9992_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c2c0_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_9992_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_c2c0_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_ca81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_93e3_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_ca81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_93e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_ca81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_93e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_ca81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_93e3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_ca81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_93e3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_ca81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_93e3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_ca81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_93e3_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_ca81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_93e3_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_ca81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_93e3_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_40dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d1e_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_40dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d1e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_40dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d1e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_40dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d1e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_40dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d1e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_40dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d1e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_40dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d1e_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_40dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d1e_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_870f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_5e28_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_870f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_5e28_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_870f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_5e28_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_870f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_5e28_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_870f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_5e28_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_870f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_5e28_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_870f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_5e28_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_c964_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_e5a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_c964_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_e5a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_c964_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_e5a3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_c964_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_e5a3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_c964_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_e5a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_45c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_9f85_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_45c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_9f85_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_45c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_9f85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_0a86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f5a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_0a86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f5a2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_0a86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f5a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_9992_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2601_l2616_l2605_l2598_DUPLICATE_3d7c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_ca81_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2601_l2616_l2605_l2598_DUPLICATE_3d7c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_40dc_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2601_l2616_l2605_l2598_DUPLICATE_3d7c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_c964_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2601_l2616_l2605_l2598_DUPLICATE_3d7c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_9992_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2601_l2598_l2626_l2622_l2616_l2609_l2605_DUPLICATE_8e60_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_ca81_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2601_l2598_l2626_l2622_l2616_l2609_l2605_DUPLICATE_8e60_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_40dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2601_l2598_l2626_l2622_l2616_l2609_l2605_DUPLICATE_8e60_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_870f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2601_l2598_l2626_l2622_l2616_l2609_l2605_DUPLICATE_8e60_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_c964_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2601_l2598_l2626_l2622_l2616_l2609_l2605_DUPLICATE_8e60_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_45c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2601_l2598_l2626_l2622_l2616_l2609_l2605_DUPLICATE_8e60_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_0a86_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2601_l2598_l2626_l2622_l2616_l2609_l2605_DUPLICATE_8e60_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_9992_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2609_l2601_l2605_l2598_DUPLICATE_1813_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_ca81_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2609_l2601_l2605_l2598_DUPLICATE_1813_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_40dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2609_l2601_l2605_l2598_DUPLICATE_1813_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_870f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2609_l2601_l2605_l2598_DUPLICATE_1813_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2601_l2598_l2626_l2585_l2605_DUPLICATE_a996_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_9992_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2601_l2598_l2626_l2585_l2605_DUPLICATE_a996_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_ca81_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2601_l2598_l2626_l2585_l2605_DUPLICATE_a996_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_40dc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2601_l2598_l2626_l2585_l2605_DUPLICATE_a996_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_0a86_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2601_l2598_l2626_l2585_l2605_DUPLICATE_a996_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2585_c2_eb77_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2585_c2_eb77_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2585_c2_eb77_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2585_c2_eb77_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_0a86_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2626_c7_0a86_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_870f_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_fffd_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l2585_c2_eb77] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_eb77_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_eb77_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2601_c7_ca81] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2601_c7_ca81_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_ca81_cond;
     t16_high_MUX_uxn_opcodes_h_l2601_c7_ca81_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_ca81_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2601_c7_ca81_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_ca81_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output := t16_high_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2616_c7_c964] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2616_c7_c964_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_c964_cond;
     n16_low_MUX_uxn_opcodes_h_l2616_c7_c964_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_c964_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2616_c7_c964_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_c964_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_c964_return_output := n16_low_MUX_uxn_opcodes_h_l2616_c7_c964_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2585_c2_eb77] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_eb77_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_eb77_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2626_c7_0a86] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2626_c7_0a86_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_0a86_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2626_c7_0a86_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_0a86_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2626_c7_0a86_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_0a86_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_0a86_return_output := result_u8_value_MUX_uxn_opcodes_h_l2626_c7_0a86_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2605_c7_40dc] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2605_c7_40dc_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_40dc_cond;
     t16_low_MUX_uxn_opcodes_h_l2605_c7_40dc_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_40dc_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2605_c7_40dc_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_40dc_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output := t16_low_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2626_c7_0a86] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_0a86_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_0a86_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_0a86_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_0a86_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_0a86_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_0a86_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_0a86_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_0a86_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2609_c7_870f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_870f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_870f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_870f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_870f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_870f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_870f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_870f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_870f_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2609_c7_870f] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2609_c7_870f_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_870f_cond;
     n16_high_MUX_uxn_opcodes_h_l2609_c7_870f_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_870f_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2609_c7_870f_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_870f_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_870f_return_output := n16_high_MUX_uxn_opcodes_h_l2609_c7_870f_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2585_c2_eb77] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_eb77_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_eb77_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2616_c7_c964] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_c964_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_c964_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_c964_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_c964_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_c964_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_c964_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_c964_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_c964_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2585_c2_eb77] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_eb77_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_eb77_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2626_c7_0a86] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_0a86_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_0a86_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_0a86_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_0a86_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_0a86_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_0a86_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_0a86_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_0a86_return_output;

     -- Submodule level 2
     VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_40dc_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_870f_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_870f_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_c964_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_45c1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_0a86_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_40dc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_870f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_870f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_c964_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_45c1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_0a86_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_45c1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_0a86_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_9992_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_ca81_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output;
     -- t16_low_MUX[uxn_opcodes_h_l2601_c7_ca81] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2601_c7_ca81_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_ca81_cond;
     t16_low_MUX_uxn_opcodes_h_l2601_c7_ca81_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_ca81_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2601_c7_ca81_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_ca81_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output := t16_low_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2622_c7_45c1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_45c1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_45c1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_45c1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_45c1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_45c1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_45c1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_45c1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_45c1_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2609_c7_870f] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2609_c7_870f_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_870f_cond;
     n16_low_MUX_uxn_opcodes_h_l2609_c7_870f_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_870f_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2609_c7_870f_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_870f_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_870f_return_output := n16_low_MUX_uxn_opcodes_h_l2609_c7_870f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2609_c7_870f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_870f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_870f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_870f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_870f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_870f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_870f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_870f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_870f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2605_c7_40dc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_40dc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_40dc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_40dc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_40dc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_40dc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_40dc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2598_c7_9992] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2598_c7_9992_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_9992_cond;
     t16_high_MUX_uxn_opcodes_h_l2598_c7_9992_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_9992_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2598_c7_9992_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_9992_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_9992_return_output := t16_high_MUX_uxn_opcodes_h_l2598_c7_9992_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2622_c7_45c1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_45c1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_45c1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_45c1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_45c1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_45c1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_45c1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_45c1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_45c1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2622_c7_45c1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2622_c7_45c1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_45c1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2622_c7_45c1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_45c1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2622_c7_45c1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_45c1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_45c1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2622_c7_45c1_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2605_c7_40dc] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2605_c7_40dc_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_40dc_cond;
     n16_high_MUX_uxn_opcodes_h_l2605_c7_40dc_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_40dc_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2605_c7_40dc_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_40dc_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output := n16_high_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_ca81_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_40dc_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_870f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_c964_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_45c1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_ca81_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_40dc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_870f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_c964_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_45c1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_c964_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_45c1_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_9992_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_9992_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2616_c7_c964] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2616_c7_c964_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_c964_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2616_c7_c964_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_c964_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2616_c7_c964_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_c964_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_c964_return_output := result_u8_value_MUX_uxn_opcodes_h_l2616_c7_c964_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2616_c7_c964] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_c964_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_c964_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_c964_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_c964_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_c964_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_c964_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_c964_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_c964_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2598_c7_9992] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2598_c7_9992_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_9992_cond;
     t16_low_MUX_uxn_opcodes_h_l2598_c7_9992_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_9992_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2598_c7_9992_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_9992_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_9992_return_output := t16_low_MUX_uxn_opcodes_h_l2598_c7_9992_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2585_c2_eb77] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2585_c2_eb77_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_eb77_cond;
     t16_high_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output := t16_high_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2605_c7_40dc] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2605_c7_40dc_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_40dc_cond;
     n16_low_MUX_uxn_opcodes_h_l2605_c7_40dc_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_40dc_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2605_c7_40dc_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_40dc_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output := n16_low_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2601_c7_ca81] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2601_c7_ca81_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_ca81_cond;
     n16_high_MUX_uxn_opcodes_h_l2601_c7_ca81_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_ca81_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2601_c7_ca81_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_ca81_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output := n16_high_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2605_c7_40dc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_40dc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_40dc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_40dc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_40dc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_40dc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_40dc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2601_c7_ca81] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_ca81_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_ca81_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_ca81_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_ca81_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_ca81_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_ca81_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2616_c7_c964] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_c964_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_c964_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_c964_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_c964_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_c964_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_c964_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_c964_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_c964_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_9992_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_ca81_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_870f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_c964_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_9992_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_ca81_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_870f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_c964_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_870f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_c964_return_output;
     REG_VAR_t16_high := VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_9992_return_output;
     -- n16_low_MUX[uxn_opcodes_h_l2601_c7_ca81] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2601_c7_ca81_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_ca81_cond;
     n16_low_MUX_uxn_opcodes_h_l2601_c7_ca81_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_ca81_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2601_c7_ca81_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_ca81_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output := n16_low_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2609_c7_870f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_870f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_870f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_870f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_870f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_870f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_870f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_870f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_870f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2609_c7_870f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2609_c7_870f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_870f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2609_c7_870f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_870f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2609_c7_870f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_870f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_870f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2609_c7_870f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2601_c7_ca81] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_ca81_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_ca81_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_ca81_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_ca81_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_ca81_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_ca81_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2598_c7_9992] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_9992_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_9992_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_9992_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_9992_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_9992_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_9992_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_9992_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_9992_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2598_c7_9992] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2598_c7_9992_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_9992_cond;
     n16_high_MUX_uxn_opcodes_h_l2598_c7_9992_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_9992_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2598_c7_9992_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_9992_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_9992_return_output := n16_high_MUX_uxn_opcodes_h_l2598_c7_9992_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2609_c7_870f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_870f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_870f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_870f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_870f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_870f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_870f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_870f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_870f_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2585_c2_eb77] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2585_c2_eb77_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_eb77_cond;
     t16_low_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output := t16_low_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output;

     -- Submodule level 5
     VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_9992_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_9992_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_40dc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_870f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_9992_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_9992_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_40dc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_870f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_40dc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_870f_return_output;
     REG_VAR_t16_low := VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output;
     -- n16_high_MUX[uxn_opcodes_h_l2585_c2_eb77] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2585_c2_eb77_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_eb77_cond;
     n16_high_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output := n16_high_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2598_c7_9992] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2598_c7_9992_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_9992_cond;
     n16_low_MUX_uxn_opcodes_h_l2598_c7_9992_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_9992_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2598_c7_9992_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_9992_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_9992_return_output := n16_low_MUX_uxn_opcodes_h_l2598_c7_9992_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2598_c7_9992] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_9992_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_9992_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_9992_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_9992_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_9992_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_9992_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_9992_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_9992_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2605_c7_40dc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2605_c7_40dc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_40dc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2605_c7_40dc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_40dc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2605_c7_40dc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_40dc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output := result_u8_value_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2605_c7_40dc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_40dc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_40dc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_40dc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_40dc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_40dc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_40dc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2605_c7_40dc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_40dc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_40dc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_40dc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_40dc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_40dc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_40dc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2585_c2_eb77] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_eb77_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_eb77_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output;

     -- Submodule level 6
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_9992_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_ca81_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_9992_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_ca81_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_ca81_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_40dc_return_output;
     -- n16_low_MUX[uxn_opcodes_h_l2585_c2_eb77] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2585_c2_eb77_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_eb77_cond;
     n16_low_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output := n16_low_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2585_c2_eb77] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_eb77_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_eb77_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2601_c7_ca81] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_ca81_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_ca81_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_ca81_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_ca81_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_ca81_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_ca81_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2601_c7_ca81] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2601_c7_ca81_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_ca81_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2601_c7_ca81_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_ca81_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2601_c7_ca81_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_ca81_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output := result_u8_value_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2601_c7_ca81] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_ca81_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_ca81_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_ca81_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_ca81_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_ca81_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_ca81_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output;

     -- Submodule level 7
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_9992_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_9992_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_9992_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_ca81_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2598_c7_9992] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_9992_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_9992_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_9992_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_9992_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_9992_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_9992_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_9992_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_9992_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2598_c7_9992] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2598_c7_9992_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_9992_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2598_c7_9992_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_9992_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2598_c7_9992_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_9992_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_9992_return_output := result_u8_value_MUX_uxn_opcodes_h_l2598_c7_9992_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2598_c7_9992] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_9992_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_9992_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_9992_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_9992_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_9992_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_9992_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_9992_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_9992_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_9992_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_9992_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_9992_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2585_c2_eb77] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_eb77_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_eb77_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2585_c2_eb77] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_eb77_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_eb77_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2585_c2_eb77] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2585_c2_eb77_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_eb77_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_eb77_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_eb77_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output := result_u8_value_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l2581_l2632_DUPLICATE_e477 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l2581_l2632_DUPLICATE_e477_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_eb77_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l2581_l2632_DUPLICATE_e477_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l2581_l2632_DUPLICATE_e477_return_output;
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
