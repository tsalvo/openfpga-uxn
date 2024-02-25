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
-- BIN_OP_EQ[uxn_opcodes_h_l2585_c6_5ebf]
signal BIN_OP_EQ_uxn_opcodes_h_l2585_c6_5ebf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2585_c6_5ebf_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2585_c6_5ebf_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2585_c2_876f]
signal n16_high_MUX_uxn_opcodes_h_l2585_c2_876f_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2585_c2_876f_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2585_c2_876f]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_876f_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_876f_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2585_c2_876f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_876f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_876f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2585_c2_876f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_876f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_876f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2585_c2_876f]
signal result_u8_value_MUX_uxn_opcodes_h_l2585_c2_876f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2585_c2_876f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2585_c2_876f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_876f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_876f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2585_c2_876f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_876f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_876f_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2585_c2_876f]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_876f_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_876f_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2585_c2_876f]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_876f_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_876f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2585_c2_876f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_876f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_876f_return_output : unsigned(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2585_c2_876f]
signal n16_low_MUX_uxn_opcodes_h_l2585_c2_876f_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2585_c2_876f_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2585_c2_876f]
signal t16_high_MUX_uxn_opcodes_h_l2585_c2_876f_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2585_c2_876f_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2585_c2_876f]
signal t16_low_MUX_uxn_opcodes_h_l2585_c2_876f_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2585_c2_876f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2598_c11_b467]
signal BIN_OP_EQ_uxn_opcodes_h_l2598_c11_b467_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2598_c11_b467_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2598_c11_b467_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2598_c7_85f5]
signal n16_high_MUX_uxn_opcodes_h_l2598_c7_85f5_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2598_c7_85f5_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2598_c7_85f5_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2598_c7_85f5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_85f5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_85f5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_85f5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2598_c7_85f5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_85f5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_85f5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_85f5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2598_c7_85f5]
signal result_u8_value_MUX_uxn_opcodes_h_l2598_c7_85f5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2598_c7_85f5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2598_c7_85f5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2598_c7_85f5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_85f5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_85f5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_85f5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2598_c7_85f5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_85f5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_85f5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_85f5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output : unsigned(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2598_c7_85f5]
signal n16_low_MUX_uxn_opcodes_h_l2598_c7_85f5_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2598_c7_85f5_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2598_c7_85f5_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2598_c7_85f5]
signal t16_high_MUX_uxn_opcodes_h_l2598_c7_85f5_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2598_c7_85f5_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2598_c7_85f5_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2598_c7_85f5]
signal t16_low_MUX_uxn_opcodes_h_l2598_c7_85f5_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2598_c7_85f5_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2598_c7_85f5_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2601_c11_9340]
signal BIN_OP_EQ_uxn_opcodes_h_l2601_c11_9340_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2601_c11_9340_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2601_c11_9340_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2601_c7_b084]
signal n16_high_MUX_uxn_opcodes_h_l2601_c7_b084_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2601_c7_b084_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2601_c7_b084_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2601_c7_b084_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2601_c7_b084]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_b084_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_b084_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_b084_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_b084_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2601_c7_b084]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_b084_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_b084_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_b084_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_b084_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2601_c7_b084]
signal result_u8_value_MUX_uxn_opcodes_h_l2601_c7_b084_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2601_c7_b084_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2601_c7_b084_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2601_c7_b084_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2601_c7_b084]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_b084_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_b084_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_b084_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_b084_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2601_c7_b084]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_b084_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_b084_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_b084_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_b084_return_output : unsigned(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2601_c7_b084]
signal n16_low_MUX_uxn_opcodes_h_l2601_c7_b084_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2601_c7_b084_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2601_c7_b084_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2601_c7_b084_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2601_c7_b084]
signal t16_high_MUX_uxn_opcodes_h_l2601_c7_b084_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2601_c7_b084_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2601_c7_b084_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2601_c7_b084_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2601_c7_b084]
signal t16_low_MUX_uxn_opcodes_h_l2601_c7_b084_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2601_c7_b084_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2601_c7_b084_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2601_c7_b084_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2605_c11_1d14]
signal BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d14_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d14_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d14_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2605_c7_ceeb]
signal n16_high_MUX_uxn_opcodes_h_l2605_c7_ceeb_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2605_c7_ceeb_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2605_c7_ceeb_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2605_c7_ceeb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_ceeb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_ceeb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_ceeb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2605_c7_ceeb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_ceeb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_ceeb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_ceeb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2605_c7_ceeb]
signal result_u8_value_MUX_uxn_opcodes_h_l2605_c7_ceeb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2605_c7_ceeb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2605_c7_ceeb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2605_c7_ceeb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_ceeb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_ceeb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_ceeb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2605_c7_ceeb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_ceeb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_ceeb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_ceeb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output : unsigned(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2605_c7_ceeb]
signal n16_low_MUX_uxn_opcodes_h_l2605_c7_ceeb_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2605_c7_ceeb_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2605_c7_ceeb_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2605_c7_ceeb]
signal t16_low_MUX_uxn_opcodes_h_l2605_c7_ceeb_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2605_c7_ceeb_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2605_c7_ceeb_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2609_c11_c840]
signal BIN_OP_EQ_uxn_opcodes_h_l2609_c11_c840_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2609_c11_c840_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2609_c11_c840_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2609_c7_6cea]
signal n16_high_MUX_uxn_opcodes_h_l2609_c7_6cea_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2609_c7_6cea_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2609_c7_6cea_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2609_c7_6cea_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2609_c7_6cea]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_6cea_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_6cea_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_6cea_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_6cea_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2609_c7_6cea]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_6cea_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_6cea_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_6cea_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_6cea_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2609_c7_6cea]
signal result_u8_value_MUX_uxn_opcodes_h_l2609_c7_6cea_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2609_c7_6cea_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2609_c7_6cea_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2609_c7_6cea_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2609_c7_6cea]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_6cea_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_6cea_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_6cea_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_6cea_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2609_c7_6cea]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_6cea_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_6cea_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_6cea_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_6cea_return_output : unsigned(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2609_c7_6cea]
signal n16_low_MUX_uxn_opcodes_h_l2609_c7_6cea_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2609_c7_6cea_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2609_c7_6cea_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2609_c7_6cea_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2611_c30_bd38]
signal sp_relative_shift_uxn_opcodes_h_l2611_c30_bd38_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2611_c30_bd38_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2611_c30_bd38_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2611_c30_bd38_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2616_c11_0be6]
signal BIN_OP_EQ_uxn_opcodes_h_l2616_c11_0be6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2616_c11_0be6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2616_c11_0be6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2616_c7_fc2e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_fc2e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_fc2e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_fc2e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_fc2e_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2616_c7_fc2e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_fc2e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_fc2e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_fc2e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_fc2e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2616_c7_fc2e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_fc2e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_fc2e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_fc2e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_fc2e_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2616_c7_fc2e]
signal result_u8_value_MUX_uxn_opcodes_h_l2616_c7_fc2e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2616_c7_fc2e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2616_c7_fc2e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2616_c7_fc2e_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2616_c7_fc2e]
signal n16_low_MUX_uxn_opcodes_h_l2616_c7_fc2e_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2616_c7_fc2e_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2616_c7_fc2e_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2616_c7_fc2e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2622_c11_5ff8]
signal BIN_OP_EQ_uxn_opcodes_h_l2622_c11_5ff8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2622_c11_5ff8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2622_c11_5ff8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2622_c7_d859]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_d859_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_d859_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_d859_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_d859_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2622_c7_d859]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_d859_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_d859_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_d859_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_d859_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2622_c7_d859]
signal result_u8_value_MUX_uxn_opcodes_h_l2622_c7_d859_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2622_c7_d859_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2622_c7_d859_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2622_c7_d859_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2626_c11_5b07]
signal BIN_OP_EQ_uxn_opcodes_h_l2626_c11_5b07_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2626_c11_5b07_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2626_c11_5b07_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2626_c7_0243]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_0243_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_0243_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_0243_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_0243_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2626_c7_0243]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_0243_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_0243_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_0243_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_0243_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2626_c7_0243]
signal result_u8_value_MUX_uxn_opcodes_h_l2626_c7_0243_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2626_c7_0243_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2626_c7_0243_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2626_c7_0243_return_output : unsigned(7 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_71f0( ref_toks_0 : opcode_result_t;
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
      base.is_stack_index_flipped := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2585_c6_5ebf
BIN_OP_EQ_uxn_opcodes_h_l2585_c6_5ebf : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2585_c6_5ebf_left,
BIN_OP_EQ_uxn_opcodes_h_l2585_c6_5ebf_right,
BIN_OP_EQ_uxn_opcodes_h_l2585_c6_5ebf_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2585_c2_876f
n16_high_MUX_uxn_opcodes_h_l2585_c2_876f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2585_c2_876f_cond,
n16_high_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue,
n16_high_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse,
n16_high_MUX_uxn_opcodes_h_l2585_c2_876f_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_876f
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_876f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_876f_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_876f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_876f
result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_876f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_876f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_876f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_876f
result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_876f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_876f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_876f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2585_c2_876f
result_u8_value_MUX_uxn_opcodes_h_l2585_c2_876f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2585_c2_876f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2585_c2_876f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_876f
result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_876f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_876f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_876f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_876f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_876f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_876f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_876f_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_876f
result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_876f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_876f_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_876f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_876f
result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_876f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_876f_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_876f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_876f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_876f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_876f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_876f_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2585_c2_876f
n16_low_MUX_uxn_opcodes_h_l2585_c2_876f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2585_c2_876f_cond,
n16_low_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue,
n16_low_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse,
n16_low_MUX_uxn_opcodes_h_l2585_c2_876f_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2585_c2_876f
t16_high_MUX_uxn_opcodes_h_l2585_c2_876f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2585_c2_876f_cond,
t16_high_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue,
t16_high_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse,
t16_high_MUX_uxn_opcodes_h_l2585_c2_876f_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2585_c2_876f
t16_low_MUX_uxn_opcodes_h_l2585_c2_876f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2585_c2_876f_cond,
t16_low_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue,
t16_low_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse,
t16_low_MUX_uxn_opcodes_h_l2585_c2_876f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2598_c11_b467
BIN_OP_EQ_uxn_opcodes_h_l2598_c11_b467 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2598_c11_b467_left,
BIN_OP_EQ_uxn_opcodes_h_l2598_c11_b467_right,
BIN_OP_EQ_uxn_opcodes_h_l2598_c11_b467_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2598_c7_85f5
n16_high_MUX_uxn_opcodes_h_l2598_c7_85f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2598_c7_85f5_cond,
n16_high_MUX_uxn_opcodes_h_l2598_c7_85f5_iftrue,
n16_high_MUX_uxn_opcodes_h_l2598_c7_85f5_iffalse,
n16_high_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_85f5
result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_85f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_85f5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_85f5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_85f5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_85f5
result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_85f5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_85f5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_85f5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_85f5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2598_c7_85f5
result_u8_value_MUX_uxn_opcodes_h_l2598_c7_85f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2598_c7_85f5_cond,
result_u8_value_MUX_uxn_opcodes_h_l2598_c7_85f5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2598_c7_85f5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_85f5
result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_85f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_85f5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_85f5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_85f5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_85f5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_85f5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_85f5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_85f5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_85f5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2598_c7_85f5
n16_low_MUX_uxn_opcodes_h_l2598_c7_85f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2598_c7_85f5_cond,
n16_low_MUX_uxn_opcodes_h_l2598_c7_85f5_iftrue,
n16_low_MUX_uxn_opcodes_h_l2598_c7_85f5_iffalse,
n16_low_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2598_c7_85f5
t16_high_MUX_uxn_opcodes_h_l2598_c7_85f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2598_c7_85f5_cond,
t16_high_MUX_uxn_opcodes_h_l2598_c7_85f5_iftrue,
t16_high_MUX_uxn_opcodes_h_l2598_c7_85f5_iffalse,
t16_high_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2598_c7_85f5
t16_low_MUX_uxn_opcodes_h_l2598_c7_85f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2598_c7_85f5_cond,
t16_low_MUX_uxn_opcodes_h_l2598_c7_85f5_iftrue,
t16_low_MUX_uxn_opcodes_h_l2598_c7_85f5_iffalse,
t16_low_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2601_c11_9340
BIN_OP_EQ_uxn_opcodes_h_l2601_c11_9340 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2601_c11_9340_left,
BIN_OP_EQ_uxn_opcodes_h_l2601_c11_9340_right,
BIN_OP_EQ_uxn_opcodes_h_l2601_c11_9340_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2601_c7_b084
n16_high_MUX_uxn_opcodes_h_l2601_c7_b084 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2601_c7_b084_cond,
n16_high_MUX_uxn_opcodes_h_l2601_c7_b084_iftrue,
n16_high_MUX_uxn_opcodes_h_l2601_c7_b084_iffalse,
n16_high_MUX_uxn_opcodes_h_l2601_c7_b084_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_b084
result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_b084 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_b084_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_b084_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_b084_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_b084_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_b084
result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_b084 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_b084_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_b084_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_b084_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_b084_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2601_c7_b084
result_u8_value_MUX_uxn_opcodes_h_l2601_c7_b084 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2601_c7_b084_cond,
result_u8_value_MUX_uxn_opcodes_h_l2601_c7_b084_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2601_c7_b084_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2601_c7_b084_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_b084
result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_b084 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_b084_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_b084_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_b084_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_b084_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_b084
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_b084 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_b084_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_b084_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_b084_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_b084_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2601_c7_b084
n16_low_MUX_uxn_opcodes_h_l2601_c7_b084 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2601_c7_b084_cond,
n16_low_MUX_uxn_opcodes_h_l2601_c7_b084_iftrue,
n16_low_MUX_uxn_opcodes_h_l2601_c7_b084_iffalse,
n16_low_MUX_uxn_opcodes_h_l2601_c7_b084_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2601_c7_b084
t16_high_MUX_uxn_opcodes_h_l2601_c7_b084 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2601_c7_b084_cond,
t16_high_MUX_uxn_opcodes_h_l2601_c7_b084_iftrue,
t16_high_MUX_uxn_opcodes_h_l2601_c7_b084_iffalse,
t16_high_MUX_uxn_opcodes_h_l2601_c7_b084_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2601_c7_b084
t16_low_MUX_uxn_opcodes_h_l2601_c7_b084 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2601_c7_b084_cond,
t16_low_MUX_uxn_opcodes_h_l2601_c7_b084_iftrue,
t16_low_MUX_uxn_opcodes_h_l2601_c7_b084_iffalse,
t16_low_MUX_uxn_opcodes_h_l2601_c7_b084_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d14
BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d14 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d14_left,
BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d14_right,
BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d14_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2605_c7_ceeb
n16_high_MUX_uxn_opcodes_h_l2605_c7_ceeb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2605_c7_ceeb_cond,
n16_high_MUX_uxn_opcodes_h_l2605_c7_ceeb_iftrue,
n16_high_MUX_uxn_opcodes_h_l2605_c7_ceeb_iffalse,
n16_high_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_ceeb
result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_ceeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_ceeb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_ceeb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_ceeb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_ceeb
result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_ceeb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_ceeb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_ceeb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_ceeb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2605_c7_ceeb
result_u8_value_MUX_uxn_opcodes_h_l2605_c7_ceeb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2605_c7_ceeb_cond,
result_u8_value_MUX_uxn_opcodes_h_l2605_c7_ceeb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2605_c7_ceeb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_ceeb
result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_ceeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_ceeb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_ceeb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_ceeb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_ceeb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_ceeb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_ceeb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_ceeb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_ceeb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2605_c7_ceeb
n16_low_MUX_uxn_opcodes_h_l2605_c7_ceeb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2605_c7_ceeb_cond,
n16_low_MUX_uxn_opcodes_h_l2605_c7_ceeb_iftrue,
n16_low_MUX_uxn_opcodes_h_l2605_c7_ceeb_iffalse,
n16_low_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2605_c7_ceeb
t16_low_MUX_uxn_opcodes_h_l2605_c7_ceeb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2605_c7_ceeb_cond,
t16_low_MUX_uxn_opcodes_h_l2605_c7_ceeb_iftrue,
t16_low_MUX_uxn_opcodes_h_l2605_c7_ceeb_iffalse,
t16_low_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2609_c11_c840
BIN_OP_EQ_uxn_opcodes_h_l2609_c11_c840 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2609_c11_c840_left,
BIN_OP_EQ_uxn_opcodes_h_l2609_c11_c840_right,
BIN_OP_EQ_uxn_opcodes_h_l2609_c11_c840_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2609_c7_6cea
n16_high_MUX_uxn_opcodes_h_l2609_c7_6cea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2609_c7_6cea_cond,
n16_high_MUX_uxn_opcodes_h_l2609_c7_6cea_iftrue,
n16_high_MUX_uxn_opcodes_h_l2609_c7_6cea_iffalse,
n16_high_MUX_uxn_opcodes_h_l2609_c7_6cea_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_6cea
result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_6cea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_6cea_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_6cea_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_6cea_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_6cea_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_6cea
result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_6cea : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_6cea_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_6cea_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_6cea_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_6cea_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2609_c7_6cea
result_u8_value_MUX_uxn_opcodes_h_l2609_c7_6cea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2609_c7_6cea_cond,
result_u8_value_MUX_uxn_opcodes_h_l2609_c7_6cea_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2609_c7_6cea_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2609_c7_6cea_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_6cea
result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_6cea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_6cea_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_6cea_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_6cea_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_6cea_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_6cea
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_6cea : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_6cea_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_6cea_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_6cea_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_6cea_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2609_c7_6cea
n16_low_MUX_uxn_opcodes_h_l2609_c7_6cea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2609_c7_6cea_cond,
n16_low_MUX_uxn_opcodes_h_l2609_c7_6cea_iftrue,
n16_low_MUX_uxn_opcodes_h_l2609_c7_6cea_iffalse,
n16_low_MUX_uxn_opcodes_h_l2609_c7_6cea_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2611_c30_bd38
sp_relative_shift_uxn_opcodes_h_l2611_c30_bd38 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2611_c30_bd38_ins,
sp_relative_shift_uxn_opcodes_h_l2611_c30_bd38_x,
sp_relative_shift_uxn_opcodes_h_l2611_c30_bd38_y,
sp_relative_shift_uxn_opcodes_h_l2611_c30_bd38_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2616_c11_0be6
BIN_OP_EQ_uxn_opcodes_h_l2616_c11_0be6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2616_c11_0be6_left,
BIN_OP_EQ_uxn_opcodes_h_l2616_c11_0be6_right,
BIN_OP_EQ_uxn_opcodes_h_l2616_c11_0be6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_fc2e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_fc2e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_fc2e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_fc2e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_fc2e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_fc2e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_fc2e
result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_fc2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_fc2e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_fc2e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_fc2e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_fc2e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_fc2e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_fc2e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_fc2e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_fc2e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_fc2e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_fc2e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2616_c7_fc2e
result_u8_value_MUX_uxn_opcodes_h_l2616_c7_fc2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2616_c7_fc2e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2616_c7_fc2e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2616_c7_fc2e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2616_c7_fc2e_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2616_c7_fc2e
n16_low_MUX_uxn_opcodes_h_l2616_c7_fc2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2616_c7_fc2e_cond,
n16_low_MUX_uxn_opcodes_h_l2616_c7_fc2e_iftrue,
n16_low_MUX_uxn_opcodes_h_l2616_c7_fc2e_iffalse,
n16_low_MUX_uxn_opcodes_h_l2616_c7_fc2e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2622_c11_5ff8
BIN_OP_EQ_uxn_opcodes_h_l2622_c11_5ff8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2622_c11_5ff8_left,
BIN_OP_EQ_uxn_opcodes_h_l2622_c11_5ff8_right,
BIN_OP_EQ_uxn_opcodes_h_l2622_c11_5ff8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_d859
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_d859 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_d859_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_d859_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_d859_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_d859_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_d859
result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_d859 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_d859_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_d859_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_d859_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_d859_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2622_c7_d859
result_u8_value_MUX_uxn_opcodes_h_l2622_c7_d859 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2622_c7_d859_cond,
result_u8_value_MUX_uxn_opcodes_h_l2622_c7_d859_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2622_c7_d859_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2622_c7_d859_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2626_c11_5b07
BIN_OP_EQ_uxn_opcodes_h_l2626_c11_5b07 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2626_c11_5b07_left,
BIN_OP_EQ_uxn_opcodes_h_l2626_c11_5b07_right,
BIN_OP_EQ_uxn_opcodes_h_l2626_c11_5b07_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_0243
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_0243 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_0243_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_0243_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_0243_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_0243_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_0243
result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_0243 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_0243_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_0243_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_0243_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_0243_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2626_c7_0243
result_u8_value_MUX_uxn_opcodes_h_l2626_c7_0243 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2626_c7_0243_cond,
result_u8_value_MUX_uxn_opcodes_h_l2626_c7_0243_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2626_c7_0243_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2626_c7_0243_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2585_c6_5ebf_return_output,
 n16_high_MUX_uxn_opcodes_h_l2585_c2_876f_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_876f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_876f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_876f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2585_c2_876f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_876f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_876f_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_876f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_876f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_876f_return_output,
 n16_low_MUX_uxn_opcodes_h_l2585_c2_876f_return_output,
 t16_high_MUX_uxn_opcodes_h_l2585_c2_876f_return_output,
 t16_low_MUX_uxn_opcodes_h_l2585_c2_876f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2598_c11_b467_return_output,
 n16_high_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output,
 n16_low_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output,
 t16_high_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output,
 t16_low_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2601_c11_9340_return_output,
 n16_high_MUX_uxn_opcodes_h_l2601_c7_b084_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_b084_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_b084_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2601_c7_b084_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_b084_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_b084_return_output,
 n16_low_MUX_uxn_opcodes_h_l2601_c7_b084_return_output,
 t16_high_MUX_uxn_opcodes_h_l2601_c7_b084_return_output,
 t16_low_MUX_uxn_opcodes_h_l2601_c7_b084_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d14_return_output,
 n16_high_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output,
 n16_low_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output,
 t16_low_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2609_c11_c840_return_output,
 n16_high_MUX_uxn_opcodes_h_l2609_c7_6cea_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_6cea_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_6cea_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2609_c7_6cea_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_6cea_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_6cea_return_output,
 n16_low_MUX_uxn_opcodes_h_l2609_c7_6cea_return_output,
 sp_relative_shift_uxn_opcodes_h_l2611_c30_bd38_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2616_c11_0be6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_fc2e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_fc2e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_fc2e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2616_c7_fc2e_return_output,
 n16_low_MUX_uxn_opcodes_h_l2616_c7_fc2e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2622_c11_5ff8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_d859_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_d859_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2622_c7_d859_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2626_c11_5b07_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_0243_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_0243_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2626_c7_0243_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_5ebf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_5ebf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_5ebf_return_output : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_876f_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_876f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2585_c2_876f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_876f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_876f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2585_c2_876f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_876f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_876f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_876f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_876f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_876f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_876f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_876f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_876f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2590_c3_5b66 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_876f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_876f_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2585_c2_876f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_876f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_876f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2585_c2_876f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_876f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_876f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2595_c3_9e5e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_876f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_876f_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_876f_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_876f_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_876f_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_876f_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_876f_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_876f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_b467_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_b467_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_b467_return_output : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_85f5_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_85f5_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_b084_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_85f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_85f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_85f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_b084_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_85f5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_85f5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_85f5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_b084_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_85f5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_85f5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_85f5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_b084_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_85f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_85f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_85f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_b084_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_85f5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_85f5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2599_c3_cdf2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_85f5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_b084_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_85f5_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_85f5_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_85f5_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_b084_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_85f5_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_85f5_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_85f5_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_b084_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_85f5_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_85f5_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_85f5_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_b084_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_85f5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_9340_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_9340_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_9340_return_output : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_b084_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_b084_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_b084_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_b084_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_b084_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_b084_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_b084_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_b084_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_b084_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_b084_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_b084_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_b084_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_b084_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_b084_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_b084_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_b084_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2603_c3_be60 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_b084_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_b084_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_b084_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_b084_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_b084_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_b084_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_b084_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_b084_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_b084_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_b084_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_b084_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d14_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d14_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d14_return_output : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_ceeb_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_ceeb_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_6cea_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_ceeb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_ceeb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_ceeb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_6cea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_ceeb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_ceeb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_ceeb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_6cea_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_ceeb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_ceeb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_ceeb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_6cea_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_ceeb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_ceeb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_ceeb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_6cea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_ceeb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_ceeb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2607_c3_67e0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_ceeb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_6cea_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_ceeb_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_ceeb_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_ceeb_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_6cea_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_ceeb_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_ceeb_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_ceeb_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_ceeb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_c840_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_c840_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_c840_return_output : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_6cea_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_6cea_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_6cea_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_6cea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_6cea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_6cea_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_6cea_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_6cea_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_fc2e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_6cea_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_6cea_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_6cea_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_fc2e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_6cea_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_6cea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_6cea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_fc2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_6cea_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_6cea_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2613_c3_91e3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_6cea_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_fc2e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_6cea_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_6cea_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_6cea_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_fc2e_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_6cea_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_bd38_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_bd38_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_bd38_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_bd38_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_0be6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_0be6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_0be6_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_fc2e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2619_c3_b5c7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_fc2e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_d859_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_fc2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_fc2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_fc2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_d859_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_fc2e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_fc2e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2618_c3_c47f : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_fc2e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_fc2e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_fc2e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_fc2e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_d859_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_fc2e_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_fc2e_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_fc2e_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_fc2e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_5ff8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_5ff8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_5ff8_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_d859_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2623_c3_e695 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_d859_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_0243_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_d859_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_d859_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_d859_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_0243_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_d859_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_d859_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_d859_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_0243_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_d859_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_5b07_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_5b07_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_5b07_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_0243_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2627_c3_f98d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_0243_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2626_c7_0243_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_0243_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_0243_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_0243_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_0243_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_0243_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_0243_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_0243_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2601_l2598_l2626_l2585_l2605_DUPLICATE_4982_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2609_l2601_l2605_l2598_DUPLICATE_0fee_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2601_l2616_l2605_l2598_DUPLICATE_c4f6_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2601_l2598_l2626_l2622_l2616_l2609_l2605_DUPLICATE_71ae_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l2581_l2632_DUPLICATE_3553_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_9340_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2603_c3_be60 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_b084_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2603_c3_be60;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_0be6_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_5b07_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_5ebf_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_bd38_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2595_c3_9e5e := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2595_c3_9e5e;
     VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_bd38_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2619_c3_b5c7 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_fc2e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2619_c3_b5c7;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d14_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2590_c3_5b66 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2590_c3_5b66;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2618_c3_c47f := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_fc2e_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2618_c3_c47f;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_0243_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2627_c3_f98d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_0243_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2627_c3_f98d;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2607_c3_67e0 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_ceeb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2607_c3_67e0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_b467_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_c840_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_5ff8_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2599_c3_cdf2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_85f5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2599_c3_cdf2;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2613_c3_91e3 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_6cea_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2613_c3_91e3;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2623_c3_e695 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_d859_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2623_c3_e695;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_6cea_iftrue := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_bd38_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_85f5_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_b084_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_ceeb_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_6cea_iffalse := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_d859_iftrue := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_85f5_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_b084_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_ceeb_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_6cea_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_fc2e_iffalse := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_0243_iftrue := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_5ebf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_b467_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_9340_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d14_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_c840_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_0be6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_5ff8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_5b07_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_6cea_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_fc2e_iftrue := VAR_previous_stack_read;
     VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_b084_iftrue := VAR_previous_stack_read;
     VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_ceeb_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_6cea_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_85f5_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_b084_iffalse := t16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_fc2e_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_85f5_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_b084_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_ceeb_iffalse := t16_low;
     -- BIN_OP_EQ[uxn_opcodes_h_l2626_c11_5b07] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2626_c11_5b07_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_5b07_left;
     BIN_OP_EQ_uxn_opcodes_h_l2626_c11_5b07_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_5b07_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_5b07_return_output := BIN_OP_EQ_uxn_opcodes_h_l2626_c11_5b07_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2601_l2598_l2626_l2622_l2616_l2609_l2605_DUPLICATE_71ae LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2601_l2598_l2626_l2622_l2616_l2609_l2605_DUPLICATE_71ae_return_output := result.is_opc_done;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2626_c7_0243] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2626_c7_0243_return_output := result.stack_address_sp_offset;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2585_c2_876f] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2585_c2_876f_return_output := result.is_ram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2601_l2616_l2605_l2598_DUPLICATE_c4f6 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2601_l2616_l2605_l2598_DUPLICATE_c4f6_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2598_c11_b467] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2598_c11_b467_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_b467_left;
     BIN_OP_EQ_uxn_opcodes_h_l2598_c11_b467_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_b467_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_b467_return_output := BIN_OP_EQ_uxn_opcodes_h_l2598_c11_b467_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2585_c2_876f] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2585_c2_876f_return_output := result.is_pc_updated;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2585_c2_876f] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2585_c2_876f_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2609_c11_c840] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2609_c11_c840_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_c840_left;
     BIN_OP_EQ_uxn_opcodes_h_l2609_c11_c840_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_c840_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_c840_return_output := BIN_OP_EQ_uxn_opcodes_h_l2609_c11_c840_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2616_c11_0be6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2616_c11_0be6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_0be6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2616_c11_0be6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_0be6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_0be6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2616_c11_0be6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2622_c11_5ff8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2622_c11_5ff8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_5ff8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2622_c11_5ff8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_5ff8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_5ff8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2622_c11_5ff8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2585_c6_5ebf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2585_c6_5ebf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_5ebf_left;
     BIN_OP_EQ_uxn_opcodes_h_l2585_c6_5ebf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_5ebf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_5ebf_return_output := BIN_OP_EQ_uxn_opcodes_h_l2585_c6_5ebf_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2611_c30_bd38] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2611_c30_bd38_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_bd38_ins;
     sp_relative_shift_uxn_opcodes_h_l2611_c30_bd38_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_bd38_x;
     sp_relative_shift_uxn_opcodes_h_l2611_c30_bd38_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_bd38_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_bd38_return_output := sp_relative_shift_uxn_opcodes_h_l2611_c30_bd38_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2601_l2598_l2626_l2585_l2605_DUPLICATE_4982 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2601_l2598_l2626_l2585_l2605_DUPLICATE_4982_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2605_c11_1d14] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d14_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d14_left;
     BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d14_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d14_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d14_return_output := BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d14_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2601_c11_9340] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2601_c11_9340_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_9340_left;
     BIN_OP_EQ_uxn_opcodes_h_l2601_c11_9340_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_9340_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_9340_return_output := BIN_OP_EQ_uxn_opcodes_h_l2601_c11_9340_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2609_l2601_l2605_l2598_DUPLICATE_0fee LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2609_l2601_l2605_l2598_DUPLICATE_0fee_return_output := result.is_stack_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2585_c2_876f] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2585_c2_876f_return_output := result.is_stack_index_flipped;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_876f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_5ebf_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_876f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_5ebf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_876f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_5ebf_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_876f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_5ebf_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_876f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_5ebf_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_876f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_5ebf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_876f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_5ebf_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_876f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_5ebf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_876f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_5ebf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_876f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_5ebf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_876f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_5ebf_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_876f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_5ebf_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_876f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c6_5ebf_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_85f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_b467_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_85f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_b467_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_85f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_b467_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_85f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_b467_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_85f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_b467_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_85f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_b467_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_85f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_b467_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_85f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_b467_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_85f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2598_c11_b467_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_b084_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_9340_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_b084_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_9340_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_b084_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_9340_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_b084_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_9340_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_b084_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_9340_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_b084_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_9340_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_b084_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_9340_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_b084_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_9340_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_b084_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2601_c11_9340_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_ceeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d14_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_ceeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d14_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_ceeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d14_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_ceeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d14_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_ceeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d14_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_ceeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d14_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_ceeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d14_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_ceeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2605_c11_1d14_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_6cea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_c840_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_6cea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_c840_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_6cea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_c840_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_6cea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_c840_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_6cea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_c840_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_6cea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_c840_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_6cea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_c840_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_fc2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_0be6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_fc2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_0be6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_fc2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_0be6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_fc2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_0be6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_fc2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2616_c11_0be6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_d859_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_5ff8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_d859_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_5ff8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_d859_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_5ff8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_0243_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_5b07_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_0243_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_5b07_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_0243_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_5b07_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_85f5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2601_l2616_l2605_l2598_DUPLICATE_c4f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_b084_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2601_l2616_l2605_l2598_DUPLICATE_c4f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_ceeb_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2601_l2616_l2605_l2598_DUPLICATE_c4f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_fc2e_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2601_l2616_l2605_l2598_DUPLICATE_c4f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_85f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2601_l2598_l2626_l2622_l2616_l2609_l2605_DUPLICATE_71ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_b084_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2601_l2598_l2626_l2622_l2616_l2609_l2605_DUPLICATE_71ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_ceeb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2601_l2598_l2626_l2622_l2616_l2609_l2605_DUPLICATE_71ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_6cea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2601_l2598_l2626_l2622_l2616_l2609_l2605_DUPLICATE_71ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_fc2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2601_l2598_l2626_l2622_l2616_l2609_l2605_DUPLICATE_71ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_d859_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2601_l2598_l2626_l2622_l2616_l2609_l2605_DUPLICATE_71ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_0243_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2601_l2598_l2626_l2622_l2616_l2609_l2605_DUPLICATE_71ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_85f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2609_l2601_l2605_l2598_DUPLICATE_0fee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_b084_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2609_l2601_l2605_l2598_DUPLICATE_0fee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_ceeb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2609_l2601_l2605_l2598_DUPLICATE_0fee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_6cea_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2609_l2601_l2605_l2598_DUPLICATE_0fee_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2601_l2598_l2626_l2585_l2605_DUPLICATE_4982_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_85f5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2601_l2598_l2626_l2585_l2605_DUPLICATE_4982_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_b084_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2601_l2598_l2626_l2585_l2605_DUPLICATE_4982_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_ceeb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2601_l2598_l2626_l2585_l2605_DUPLICATE_4982_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_0243_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2601_l2598_l2626_l2585_l2605_DUPLICATE_4982_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2585_c2_876f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2585_c2_876f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2585_c2_876f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2585_c2_876f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_0243_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2626_c7_0243_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_6cea_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2611_c30_bd38_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l2585_c2_876f] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_876f_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_876f_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_876f_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_876f_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2601_c7_b084] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2601_c7_b084_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_b084_cond;
     t16_high_MUX_uxn_opcodes_h_l2601_c7_b084_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_b084_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2601_c7_b084_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_b084_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_b084_return_output := t16_high_MUX_uxn_opcodes_h_l2601_c7_b084_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2626_c7_0243] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_0243_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_0243_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_0243_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_0243_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_0243_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_0243_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_0243_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_0243_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2609_c7_6cea] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2609_c7_6cea_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_6cea_cond;
     n16_high_MUX_uxn_opcodes_h_l2609_c7_6cea_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_6cea_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2609_c7_6cea_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_6cea_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_6cea_return_output := n16_high_MUX_uxn_opcodes_h_l2609_c7_6cea_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2605_c7_ceeb] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2605_c7_ceeb_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_ceeb_cond;
     t16_low_MUX_uxn_opcodes_h_l2605_c7_ceeb_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_ceeb_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2605_c7_ceeb_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_ceeb_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output := t16_low_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2626_c7_0243] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2626_c7_0243_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_0243_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2626_c7_0243_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_0243_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2626_c7_0243_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_0243_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_0243_return_output := result_u8_value_MUX_uxn_opcodes_h_l2626_c7_0243_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2585_c2_876f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_876f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_876f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_876f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_876f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2609_c7_6cea] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_6cea_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_6cea_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_6cea_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_6cea_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_6cea_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_6cea_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_6cea_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_6cea_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2616_c7_fc2e] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2616_c7_fc2e_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_fc2e_cond;
     n16_low_MUX_uxn_opcodes_h_l2616_c7_fc2e_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_fc2e_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2616_c7_fc2e_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_fc2e_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_fc2e_return_output := n16_low_MUX_uxn_opcodes_h_l2616_c7_fc2e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2626_c7_0243] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_0243_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_0243_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_0243_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_0243_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_0243_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_0243_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_0243_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_0243_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2585_c2_876f] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_876f_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_876f_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_876f_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_876f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2616_c7_fc2e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_fc2e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_fc2e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_fc2e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_fc2e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_fc2e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_fc2e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_fc2e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_fc2e_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2585_c2_876f] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_876f_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_876f_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_876f_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_876f_return_output;

     -- Submodule level 2
     VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_ceeb_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2609_c7_6cea_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_6cea_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2616_c7_fc2e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_d859_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_0243_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_ceeb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_6cea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_6cea_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2616_c7_fc2e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_d859_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_0243_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_d859_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_0243_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_85f5_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2601_c7_b084_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_b084_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output;
     -- n16_high_MUX[uxn_opcodes_h_l2605_c7_ceeb] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2605_c7_ceeb_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_ceeb_cond;
     n16_high_MUX_uxn_opcodes_h_l2605_c7_ceeb_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_ceeb_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2605_c7_ceeb_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_ceeb_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output := n16_high_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2609_c7_6cea] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_6cea_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_6cea_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_6cea_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_6cea_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_6cea_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_6cea_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_6cea_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_6cea_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2622_c7_d859] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_d859_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_d859_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_d859_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_d859_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_d859_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_d859_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_d859_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_d859_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2622_c7_d859] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_d859_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_d859_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_d859_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_d859_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_d859_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_d859_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_d859_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_d859_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2601_c7_b084] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2601_c7_b084_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_b084_cond;
     t16_low_MUX_uxn_opcodes_h_l2601_c7_b084_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_b084_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2601_c7_b084_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_b084_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_b084_return_output := t16_low_MUX_uxn_opcodes_h_l2601_c7_b084_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2609_c7_6cea] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2609_c7_6cea_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_6cea_cond;
     n16_low_MUX_uxn_opcodes_h_l2609_c7_6cea_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_6cea_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2609_c7_6cea_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_6cea_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_6cea_return_output := n16_low_MUX_uxn_opcodes_h_l2609_c7_6cea_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2598_c7_85f5] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2598_c7_85f5_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_85f5_cond;
     t16_high_MUX_uxn_opcodes_h_l2598_c7_85f5_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_85f5_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2598_c7_85f5_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_85f5_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output := t16_high_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2622_c7_d859] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2622_c7_d859_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_d859_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2622_c7_d859_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_d859_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2622_c7_d859_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_d859_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_d859_return_output := result_u8_value_MUX_uxn_opcodes_h_l2622_c7_d859_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2605_c7_ceeb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_ceeb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_ceeb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_ceeb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_ceeb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_ceeb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_ceeb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_b084_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_ceeb_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2609_c7_6cea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_fc2e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_d859_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_b084_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_ceeb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_6cea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_fc2e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_d859_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_fc2e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_d859_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_85f5_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2601_c7_b084_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2601_c7_b084] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_b084_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_b084_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_b084_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_b084_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_b084_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_b084_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_b084_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_b084_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2601_c7_b084] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2601_c7_b084_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_b084_cond;
     n16_high_MUX_uxn_opcodes_h_l2601_c7_b084_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_b084_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2601_c7_b084_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_b084_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_b084_return_output := n16_high_MUX_uxn_opcodes_h_l2601_c7_b084_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2598_c7_85f5] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2598_c7_85f5_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_85f5_cond;
     t16_low_MUX_uxn_opcodes_h_l2598_c7_85f5_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_85f5_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2598_c7_85f5_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_85f5_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output := t16_low_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2616_c7_fc2e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_fc2e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_fc2e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_fc2e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_fc2e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_fc2e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_fc2e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_fc2e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_fc2e_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2585_c2_876f] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2585_c2_876f_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_876f_cond;
     t16_high_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_876f_return_output := t16_high_MUX_uxn_opcodes_h_l2585_c2_876f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2605_c7_ceeb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_ceeb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_ceeb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_ceeb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_ceeb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_ceeb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_ceeb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2605_c7_ceeb] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2605_c7_ceeb_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_ceeb_cond;
     n16_low_MUX_uxn_opcodes_h_l2605_c7_ceeb_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_ceeb_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2605_c7_ceeb_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_ceeb_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output := n16_low_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2616_c7_fc2e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2616_c7_fc2e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_fc2e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2616_c7_fc2e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_fc2e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2616_c7_fc2e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_fc2e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_fc2e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2616_c7_fc2e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2616_c7_fc2e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_fc2e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_fc2e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_fc2e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_fc2e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_fc2e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_fc2e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_fc2e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_fc2e_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_85f5_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2601_c7_b084_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_b084_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_6cea_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2616_c7_fc2e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_85f5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2601_c7_b084_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_b084_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_6cea_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2616_c7_fc2e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_6cea_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2616_c7_fc2e_return_output;
     REG_VAR_t16_high := VAR_t16_high_MUX_uxn_opcodes_h_l2585_c2_876f_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2609_c7_6cea] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_6cea_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_6cea_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_6cea_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_6cea_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_6cea_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_6cea_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_6cea_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_6cea_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2598_c7_85f5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_85f5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_85f5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_85f5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_85f5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_85f5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_85f5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2601_c7_b084] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2601_c7_b084_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_b084_cond;
     n16_low_MUX_uxn_opcodes_h_l2601_c7_b084_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_b084_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2601_c7_b084_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_b084_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_b084_return_output := n16_low_MUX_uxn_opcodes_h_l2601_c7_b084_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2601_c7_b084] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_b084_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_b084_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_b084_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_b084_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_b084_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_b084_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_b084_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_b084_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2609_c7_6cea] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_6cea_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_6cea_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_6cea_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_6cea_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_6cea_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_6cea_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_6cea_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_6cea_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2585_c2_876f] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2585_c2_876f_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_876f_cond;
     t16_low_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_876f_return_output := t16_low_MUX_uxn_opcodes_h_l2585_c2_876f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2609_c7_6cea] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2609_c7_6cea_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_6cea_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2609_c7_6cea_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_6cea_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2609_c7_6cea_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_6cea_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_6cea_return_output := result_u8_value_MUX_uxn_opcodes_h_l2609_c7_6cea_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2598_c7_85f5] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2598_c7_85f5_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_85f5_cond;
     n16_high_MUX_uxn_opcodes_h_l2598_c7_85f5_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_85f5_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2598_c7_85f5_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_85f5_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output := n16_high_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output;

     -- Submodule level 5
     VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_85f5_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2601_c7_b084_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_ceeb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_6cea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_85f5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2601_c7_b084_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_ceeb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_6cea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_ceeb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2609_c7_6cea_return_output;
     REG_VAR_t16_low := VAR_t16_low_MUX_uxn_opcodes_h_l2585_c2_876f_return_output;
     -- n16_low_MUX[uxn_opcodes_h_l2598_c7_85f5] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2598_c7_85f5_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_85f5_cond;
     n16_low_MUX_uxn_opcodes_h_l2598_c7_85f5_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_85f5_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2598_c7_85f5_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_85f5_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output := n16_low_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2605_c7_ceeb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2605_c7_ceeb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_ceeb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2605_c7_ceeb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_ceeb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2605_c7_ceeb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_ceeb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output := result_u8_value_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2598_c7_85f5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_85f5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_85f5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_85f5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_85f5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_85f5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_85f5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2605_c7_ceeb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_ceeb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_ceeb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_ceeb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_ceeb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_ceeb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_ceeb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2605_c7_ceeb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_ceeb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_ceeb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_ceeb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_ceeb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_ceeb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_ceeb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2585_c2_876f] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2585_c2_876f_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_876f_cond;
     n16_high_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_876f_return_output := n16_high_MUX_uxn_opcodes_h_l2585_c2_876f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2585_c2_876f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_876f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_876f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_876f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_876f_return_output;

     -- Submodule level 6
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l2585_c2_876f_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_b084_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_b084_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_b084_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2605_c7_ceeb_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2585_c2_876f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_876f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_876f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_876f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_876f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2601_c7_b084] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_b084_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_b084_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_b084_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_b084_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_b084_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_b084_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_b084_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_b084_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2585_c2_876f] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2585_c2_876f_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_876f_cond;
     n16_low_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_876f_return_output := n16_low_MUX_uxn_opcodes_h_l2585_c2_876f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2601_c7_b084] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2601_c7_b084_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_b084_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2601_c7_b084_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_b084_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2601_c7_b084_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_b084_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_b084_return_output := result_u8_value_MUX_uxn_opcodes_h_l2601_c7_b084_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2601_c7_b084] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_b084_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_b084_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_b084_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_b084_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_b084_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_b084_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_b084_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_b084_return_output;

     -- Submodule level 7
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l2585_c2_876f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_85f5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2601_c7_b084_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_85f5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2601_c7_b084_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_85f5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2601_c7_b084_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2598_c7_85f5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2598_c7_85f5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_85f5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2598_c7_85f5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_85f5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2598_c7_85f5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_85f5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output := result_u8_value_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2598_c7_85f5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_85f5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_85f5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_85f5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_85f5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_85f5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_85f5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2598_c7_85f5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_85f5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_85f5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_85f5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_85f5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_85f5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_85f5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2598_c7_85f5_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2585_c2_876f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2585_c2_876f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_876f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_876f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2585_c2_876f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2585_c2_876f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_876f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_876f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_876f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_876f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2585_c2_876f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_876f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_876f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_876f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_876f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_876f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_876f_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l2581_l2632_DUPLICATE_3553 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l2581_l2632_DUPLICATE_3553_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_71f0(
     result,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2585_c2_876f_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2585_c2_876f_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2585_c2_876f_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2585_c2_876f_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c2_876f_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2585_c2_876f_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2585_c2_876f_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c2_876f_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2585_c2_876f_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l2581_l2632_DUPLICATE_3553_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l2581_l2632_DUPLICATE_3553_return_output;
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
