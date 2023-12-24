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
-- Submodules: 71
entity lda2_0CLK_19339e1d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lda2_0CLK_19339e1d;
architecture arch of lda2_0CLK_19339e1d is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal tmp8_high : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8_low : unsigned(7 downto 0) := to_unsigned(0, 8);
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_tmp8_high : unsigned(7 downto 0);
signal REG_COMB_tmp8_low : unsigned(7 downto 0);
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1760_c6_268b]
signal BIN_OP_EQ_uxn_opcodes_h_l1760_c6_268b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1760_c6_268b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1760_c6_268b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1760_c2_09e1]
signal result_u8_value_MUX_uxn_opcodes_h_l1760_c2_09e1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1760_c2_09e1]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_09e1_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1760_c2_09e1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_09e1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1760_c2_09e1]
signal result_u16_value_MUX_uxn_opcodes_h_l1760_c2_09e1_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1760_c2_09e1]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_09e1_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1760_c2_09e1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_09e1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1760_c2_09e1]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_09e1_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1760_c2_09e1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_09e1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1760_c2_09e1]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_09e1_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1760_c2_09e1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_09e1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1760_c2_09e1]
signal tmp8_high_MUX_uxn_opcodes_h_l1760_c2_09e1_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1760_c2_09e1]
signal tmp8_low_MUX_uxn_opcodes_h_l1760_c2_09e1_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1760_c2_09e1]
signal t16_MUX_uxn_opcodes_h_l1760_c2_09e1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1773_c11_647f]
signal BIN_OP_EQ_uxn_opcodes_h_l1773_c11_647f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1773_c11_647f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1773_c11_647f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1773_c7_bfad]
signal result_u8_value_MUX_uxn_opcodes_h_l1773_c7_bfad_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1773_c7_bfad_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1773_c7_bfad_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1773_c7_bfad]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_bfad_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_bfad_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_bfad_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1773_c7_bfad]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_bfad_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_bfad_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_bfad_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1773_c7_bfad]
signal result_u16_value_MUX_uxn_opcodes_h_l1773_c7_bfad_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1773_c7_bfad_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1773_c7_bfad_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1773_c7_bfad]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_bfad_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_bfad_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_bfad_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1773_c7_bfad]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_bfad_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_bfad_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_bfad_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1773_c7_bfad]
signal tmp8_high_MUX_uxn_opcodes_h_l1773_c7_bfad_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1773_c7_bfad_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1773_c7_bfad_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1773_c7_bfad]
signal tmp8_low_MUX_uxn_opcodes_h_l1773_c7_bfad_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1773_c7_bfad_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1773_c7_bfad_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1773_c7_bfad]
signal t16_MUX_uxn_opcodes_h_l1773_c7_bfad_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1773_c7_bfad_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1773_c7_bfad_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1776_c11_bc19]
signal BIN_OP_EQ_uxn_opcodes_h_l1776_c11_bc19_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1776_c11_bc19_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1776_c11_bc19_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1776_c7_e708]
signal result_u8_value_MUX_uxn_opcodes_h_l1776_c7_e708_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1776_c7_e708_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1776_c7_e708_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1776_c7_e708_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1776_c7_e708]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_e708_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_e708_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_e708_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_e708_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1776_c7_e708]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_e708_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_e708_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_e708_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_e708_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1776_c7_e708]
signal result_u16_value_MUX_uxn_opcodes_h_l1776_c7_e708_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1776_c7_e708_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1776_c7_e708_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1776_c7_e708_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1776_c7_e708]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_e708_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_e708_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_e708_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_e708_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1776_c7_e708]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_e708_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_e708_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_e708_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_e708_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1776_c7_e708]
signal tmp8_high_MUX_uxn_opcodes_h_l1776_c7_e708_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1776_c7_e708_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1776_c7_e708_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1776_c7_e708_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1776_c7_e708]
signal tmp8_low_MUX_uxn_opcodes_h_l1776_c7_e708_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1776_c7_e708_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1776_c7_e708_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1776_c7_e708_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1776_c7_e708]
signal t16_MUX_uxn_opcodes_h_l1776_c7_e708_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1776_c7_e708_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1776_c7_e708_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1776_c7_e708_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1778_c3_9d42]
signal CONST_SL_8_uxn_opcodes_h_l1778_c3_9d42_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1778_c3_9d42_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1780_c11_d11c]
signal BIN_OP_EQ_uxn_opcodes_h_l1780_c11_d11c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1780_c11_d11c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1780_c11_d11c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1780_c7_bc02]
signal result_u8_value_MUX_uxn_opcodes_h_l1780_c7_bc02_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1780_c7_bc02_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1780_c7_bc02_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1780_c7_bc02]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_bc02_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_bc02_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_bc02_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1780_c7_bc02]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_bc02_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_bc02_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_bc02_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1780_c7_bc02]
signal result_u16_value_MUX_uxn_opcodes_h_l1780_c7_bc02_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1780_c7_bc02_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1780_c7_bc02_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1780_c7_bc02]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_bc02_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_bc02_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_bc02_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1780_c7_bc02]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_bc02_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_bc02_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_bc02_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1780_c7_bc02]
signal tmp8_high_MUX_uxn_opcodes_h_l1780_c7_bc02_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1780_c7_bc02_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1780_c7_bc02_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1780_c7_bc02]
signal tmp8_low_MUX_uxn_opcodes_h_l1780_c7_bc02_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1780_c7_bc02_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1780_c7_bc02_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1780_c7_bc02]
signal t16_MUX_uxn_opcodes_h_l1780_c7_bc02_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1780_c7_bc02_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1780_c7_bc02_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1781_c3_83dc]
signal BIN_OP_OR_uxn_opcodes_h_l1781_c3_83dc_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1781_c3_83dc_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1781_c3_83dc_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1782_c30_d7c8]
signal sp_relative_shift_uxn_opcodes_h_l1782_c30_d7c8_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1782_c30_d7c8_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1782_c30_d7c8_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1782_c30_d7c8_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1785_c11_0e64]
signal BIN_OP_EQ_uxn_opcodes_h_l1785_c11_0e64_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1785_c11_0e64_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1785_c11_0e64_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1785_c7_c933]
signal result_u8_value_MUX_uxn_opcodes_h_l1785_c7_c933_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1785_c7_c933_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1785_c7_c933_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1785_c7_c933_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1785_c7_c933]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_c933_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_c933_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_c933_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_c933_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1785_c7_c933]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_c933_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_c933_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_c933_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_c933_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1785_c7_c933]
signal result_u16_value_MUX_uxn_opcodes_h_l1785_c7_c933_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1785_c7_c933_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1785_c7_c933_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1785_c7_c933_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1785_c7_c933]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_c933_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_c933_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_c933_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_c933_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1785_c7_c933]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_c933_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_c933_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_c933_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_c933_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1785_c7_c933]
signal tmp8_high_MUX_uxn_opcodes_h_l1785_c7_c933_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1785_c7_c933_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1785_c7_c933_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1785_c7_c933_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1785_c7_c933]
signal tmp8_low_MUX_uxn_opcodes_h_l1785_c7_c933_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1785_c7_c933_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1785_c7_c933_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1785_c7_c933_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1787_c22_8072]
signal BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_8072_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_8072_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_8072_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1789_c11_cce4]
signal BIN_OP_EQ_uxn_opcodes_h_l1789_c11_cce4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1789_c11_cce4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1789_c11_cce4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1789_c7_cb8a]
signal result_u8_value_MUX_uxn_opcodes_h_l1789_c7_cb8a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1789_c7_cb8a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1789_c7_cb8a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1789_c7_cb8a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1789_c7_cb8a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_cb8a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_cb8a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_cb8a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_cb8a_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1789_c7_cb8a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_cb8a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_cb8a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_cb8a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_cb8a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1789_c7_cb8a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_cb8a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_cb8a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_cb8a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_cb8a_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1789_c7_cb8a]
signal tmp8_high_MUX_uxn_opcodes_h_l1789_c7_cb8a_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1789_c7_cb8a_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1789_c7_cb8a_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1789_c7_cb8a_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1789_c7_cb8a]
signal tmp8_low_MUX_uxn_opcodes_h_l1789_c7_cb8a_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1789_c7_cb8a_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1789_c7_cb8a_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1789_c7_cb8a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1795_c11_ab48]
signal BIN_OP_EQ_uxn_opcodes_h_l1795_c11_ab48_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1795_c11_ab48_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1795_c11_ab48_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1795_c7_c1c3]
signal result_u8_value_MUX_uxn_opcodes_h_l1795_c7_c1c3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1795_c7_c1c3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1795_c7_c1c3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1795_c7_c1c3_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1795_c7_c1c3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_c1c3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_c1c3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_c1c3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_c1c3_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1795_c7_c1c3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_c1c3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_c1c3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_c1c3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_c1c3_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1795_c7_c1c3]
signal tmp8_low_MUX_uxn_opcodes_h_l1795_c7_c1c3_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1795_c7_c1c3_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1795_c7_c1c3_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1795_c7_c1c3_return_output : unsigned(7 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_e482( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.u16_value := ref_toks_4;
      base.is_vram_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.is_opc_done := ref_toks_8;
      base.is_ram_write := ref_toks_9;
      base.is_stack_write := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1760_c6_268b
BIN_OP_EQ_uxn_opcodes_h_l1760_c6_268b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1760_c6_268b_left,
BIN_OP_EQ_uxn_opcodes_h_l1760_c6_268b_right,
BIN_OP_EQ_uxn_opcodes_h_l1760_c6_268b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1760_c2_09e1
result_u8_value_MUX_uxn_opcodes_h_l1760_c2_09e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1760_c2_09e1_cond,
result_u8_value_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_09e1
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_09e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_09e1_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_09e1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_09e1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_09e1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1760_c2_09e1
result_u16_value_MUX_uxn_opcodes_h_l1760_c2_09e1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1760_c2_09e1_cond,
result_u16_value_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_09e1
result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_09e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_09e1_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_09e1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_09e1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_09e1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_09e1
result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_09e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_09e1_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_09e1
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_09e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_09e1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_09e1
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_09e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_09e1_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_09e1
result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_09e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_09e1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1760_c2_09e1
tmp8_high_MUX_uxn_opcodes_h_l1760_c2_09e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1760_c2_09e1_cond,
tmp8_high_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1760_c2_09e1
tmp8_low_MUX_uxn_opcodes_h_l1760_c2_09e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1760_c2_09e1_cond,
tmp8_low_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output);

-- t16_MUX_uxn_opcodes_h_l1760_c2_09e1
t16_MUX_uxn_opcodes_h_l1760_c2_09e1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1760_c2_09e1_cond,
t16_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue,
t16_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse,
t16_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1773_c11_647f
BIN_OP_EQ_uxn_opcodes_h_l1773_c11_647f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1773_c11_647f_left,
BIN_OP_EQ_uxn_opcodes_h_l1773_c11_647f_right,
BIN_OP_EQ_uxn_opcodes_h_l1773_c11_647f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1773_c7_bfad
result_u8_value_MUX_uxn_opcodes_h_l1773_c7_bfad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1773_c7_bfad_cond,
result_u8_value_MUX_uxn_opcodes_h_l1773_c7_bfad_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1773_c7_bfad_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_bfad
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_bfad : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_bfad_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_bfad_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_bfad_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_bfad
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_bfad : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_bfad_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_bfad_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_bfad_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1773_c7_bfad
result_u16_value_MUX_uxn_opcodes_h_l1773_c7_bfad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1773_c7_bfad_cond,
result_u16_value_MUX_uxn_opcodes_h_l1773_c7_bfad_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1773_c7_bfad_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_bfad
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_bfad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_bfad_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_bfad_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_bfad_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_bfad
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_bfad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_bfad_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_bfad_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_bfad_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1773_c7_bfad
tmp8_high_MUX_uxn_opcodes_h_l1773_c7_bfad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1773_c7_bfad_cond,
tmp8_high_MUX_uxn_opcodes_h_l1773_c7_bfad_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1773_c7_bfad_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1773_c7_bfad
tmp8_low_MUX_uxn_opcodes_h_l1773_c7_bfad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1773_c7_bfad_cond,
tmp8_low_MUX_uxn_opcodes_h_l1773_c7_bfad_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1773_c7_bfad_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output);

-- t16_MUX_uxn_opcodes_h_l1773_c7_bfad
t16_MUX_uxn_opcodes_h_l1773_c7_bfad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1773_c7_bfad_cond,
t16_MUX_uxn_opcodes_h_l1773_c7_bfad_iftrue,
t16_MUX_uxn_opcodes_h_l1773_c7_bfad_iffalse,
t16_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1776_c11_bc19
BIN_OP_EQ_uxn_opcodes_h_l1776_c11_bc19 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1776_c11_bc19_left,
BIN_OP_EQ_uxn_opcodes_h_l1776_c11_bc19_right,
BIN_OP_EQ_uxn_opcodes_h_l1776_c11_bc19_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1776_c7_e708
result_u8_value_MUX_uxn_opcodes_h_l1776_c7_e708 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1776_c7_e708_cond,
result_u8_value_MUX_uxn_opcodes_h_l1776_c7_e708_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1776_c7_e708_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1776_c7_e708_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_e708
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_e708 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_e708_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_e708_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_e708_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_e708_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_e708
result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_e708 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_e708_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_e708_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_e708_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_e708_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1776_c7_e708
result_u16_value_MUX_uxn_opcodes_h_l1776_c7_e708 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1776_c7_e708_cond,
result_u16_value_MUX_uxn_opcodes_h_l1776_c7_e708_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1776_c7_e708_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1776_c7_e708_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_e708
result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_e708 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_e708_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_e708_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_e708_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_e708_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_e708
result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_e708 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_e708_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_e708_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_e708_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_e708_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1776_c7_e708
tmp8_high_MUX_uxn_opcodes_h_l1776_c7_e708 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1776_c7_e708_cond,
tmp8_high_MUX_uxn_opcodes_h_l1776_c7_e708_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1776_c7_e708_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1776_c7_e708_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1776_c7_e708
tmp8_low_MUX_uxn_opcodes_h_l1776_c7_e708 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1776_c7_e708_cond,
tmp8_low_MUX_uxn_opcodes_h_l1776_c7_e708_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1776_c7_e708_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1776_c7_e708_return_output);

-- t16_MUX_uxn_opcodes_h_l1776_c7_e708
t16_MUX_uxn_opcodes_h_l1776_c7_e708 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1776_c7_e708_cond,
t16_MUX_uxn_opcodes_h_l1776_c7_e708_iftrue,
t16_MUX_uxn_opcodes_h_l1776_c7_e708_iffalse,
t16_MUX_uxn_opcodes_h_l1776_c7_e708_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1778_c3_9d42
CONST_SL_8_uxn_opcodes_h_l1778_c3_9d42 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1778_c3_9d42_x,
CONST_SL_8_uxn_opcodes_h_l1778_c3_9d42_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1780_c11_d11c
BIN_OP_EQ_uxn_opcodes_h_l1780_c11_d11c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1780_c11_d11c_left,
BIN_OP_EQ_uxn_opcodes_h_l1780_c11_d11c_right,
BIN_OP_EQ_uxn_opcodes_h_l1780_c11_d11c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1780_c7_bc02
result_u8_value_MUX_uxn_opcodes_h_l1780_c7_bc02 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1780_c7_bc02_cond,
result_u8_value_MUX_uxn_opcodes_h_l1780_c7_bc02_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1780_c7_bc02_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_bc02
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_bc02 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_bc02_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_bc02_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_bc02_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_bc02
result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_bc02 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_bc02_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_bc02_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_bc02_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1780_c7_bc02
result_u16_value_MUX_uxn_opcodes_h_l1780_c7_bc02 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1780_c7_bc02_cond,
result_u16_value_MUX_uxn_opcodes_h_l1780_c7_bc02_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1780_c7_bc02_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_bc02
result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_bc02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_bc02_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_bc02_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_bc02_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_bc02
result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_bc02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_bc02_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_bc02_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_bc02_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1780_c7_bc02
tmp8_high_MUX_uxn_opcodes_h_l1780_c7_bc02 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1780_c7_bc02_cond,
tmp8_high_MUX_uxn_opcodes_h_l1780_c7_bc02_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1780_c7_bc02_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1780_c7_bc02
tmp8_low_MUX_uxn_opcodes_h_l1780_c7_bc02 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1780_c7_bc02_cond,
tmp8_low_MUX_uxn_opcodes_h_l1780_c7_bc02_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1780_c7_bc02_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output);

-- t16_MUX_uxn_opcodes_h_l1780_c7_bc02
t16_MUX_uxn_opcodes_h_l1780_c7_bc02 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1780_c7_bc02_cond,
t16_MUX_uxn_opcodes_h_l1780_c7_bc02_iftrue,
t16_MUX_uxn_opcodes_h_l1780_c7_bc02_iffalse,
t16_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1781_c3_83dc
BIN_OP_OR_uxn_opcodes_h_l1781_c3_83dc : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1781_c3_83dc_left,
BIN_OP_OR_uxn_opcodes_h_l1781_c3_83dc_right,
BIN_OP_OR_uxn_opcodes_h_l1781_c3_83dc_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1782_c30_d7c8
sp_relative_shift_uxn_opcodes_h_l1782_c30_d7c8 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1782_c30_d7c8_ins,
sp_relative_shift_uxn_opcodes_h_l1782_c30_d7c8_x,
sp_relative_shift_uxn_opcodes_h_l1782_c30_d7c8_y,
sp_relative_shift_uxn_opcodes_h_l1782_c30_d7c8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1785_c11_0e64
BIN_OP_EQ_uxn_opcodes_h_l1785_c11_0e64 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1785_c11_0e64_left,
BIN_OP_EQ_uxn_opcodes_h_l1785_c11_0e64_right,
BIN_OP_EQ_uxn_opcodes_h_l1785_c11_0e64_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1785_c7_c933
result_u8_value_MUX_uxn_opcodes_h_l1785_c7_c933 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1785_c7_c933_cond,
result_u8_value_MUX_uxn_opcodes_h_l1785_c7_c933_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1785_c7_c933_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1785_c7_c933_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_c933
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_c933 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_c933_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_c933_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_c933_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_c933_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_c933
result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_c933 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_c933_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_c933_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_c933_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_c933_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1785_c7_c933
result_u16_value_MUX_uxn_opcodes_h_l1785_c7_c933 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1785_c7_c933_cond,
result_u16_value_MUX_uxn_opcodes_h_l1785_c7_c933_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1785_c7_c933_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1785_c7_c933_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_c933
result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_c933 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_c933_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_c933_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_c933_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_c933_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_c933
result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_c933 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_c933_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_c933_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_c933_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_c933_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1785_c7_c933
tmp8_high_MUX_uxn_opcodes_h_l1785_c7_c933 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1785_c7_c933_cond,
tmp8_high_MUX_uxn_opcodes_h_l1785_c7_c933_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1785_c7_c933_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1785_c7_c933_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1785_c7_c933
tmp8_low_MUX_uxn_opcodes_h_l1785_c7_c933 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1785_c7_c933_cond,
tmp8_low_MUX_uxn_opcodes_h_l1785_c7_c933_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1785_c7_c933_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1785_c7_c933_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_8072
BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_8072 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_8072_left,
BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_8072_right,
BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_8072_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1789_c11_cce4
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_cce4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_cce4_left,
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_cce4_right,
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_cce4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1789_c7_cb8a
result_u8_value_MUX_uxn_opcodes_h_l1789_c7_cb8a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1789_c7_cb8a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1789_c7_cb8a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1789_c7_cb8a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1789_c7_cb8a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_cb8a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_cb8a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_cb8a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_cb8a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_cb8a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_cb8a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_cb8a
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_cb8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_cb8a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_cb8a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_cb8a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_cb8a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_cb8a
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_cb8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_cb8a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_cb8a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_cb8a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_cb8a_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1789_c7_cb8a
tmp8_high_MUX_uxn_opcodes_h_l1789_c7_cb8a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1789_c7_cb8a_cond,
tmp8_high_MUX_uxn_opcodes_h_l1789_c7_cb8a_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1789_c7_cb8a_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1789_c7_cb8a_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1789_c7_cb8a
tmp8_low_MUX_uxn_opcodes_h_l1789_c7_cb8a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1789_c7_cb8a_cond,
tmp8_low_MUX_uxn_opcodes_h_l1789_c7_cb8a_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1789_c7_cb8a_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1789_c7_cb8a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1795_c11_ab48
BIN_OP_EQ_uxn_opcodes_h_l1795_c11_ab48 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1795_c11_ab48_left,
BIN_OP_EQ_uxn_opcodes_h_l1795_c11_ab48_right,
BIN_OP_EQ_uxn_opcodes_h_l1795_c11_ab48_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1795_c7_c1c3
result_u8_value_MUX_uxn_opcodes_h_l1795_c7_c1c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1795_c7_c1c3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1795_c7_c1c3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1795_c7_c1c3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1795_c7_c1c3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_c1c3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_c1c3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_c1c3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_c1c3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_c1c3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_c1c3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_c1c3
result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_c1c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_c1c3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_c1c3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_c1c3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_c1c3_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1795_c7_c1c3
tmp8_low_MUX_uxn_opcodes_h_l1795_c7_c1c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1795_c7_c1c3_cond,
tmp8_low_MUX_uxn_opcodes_h_l1795_c7_c1c3_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1795_c7_c1c3_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1795_c7_c1c3_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 tmp8_high,
 tmp8_low,
 t16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1760_c6_268b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output,
 t16_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1773_c11_647f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output,
 t16_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1776_c11_bc19_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1776_c7_e708_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_e708_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_e708_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1776_c7_e708_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_e708_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_e708_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1776_c7_e708_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1776_c7_e708_return_output,
 t16_MUX_uxn_opcodes_h_l1776_c7_e708_return_output,
 CONST_SL_8_uxn_opcodes_h_l1778_c3_9d42_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1780_c11_d11c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output,
 t16_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1781_c3_83dc_return_output,
 sp_relative_shift_uxn_opcodes_h_l1782_c30_d7c8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1785_c11_0e64_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1785_c7_c933_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_c933_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_c933_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1785_c7_c933_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_c933_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_c933_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1785_c7_c933_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1785_c7_c933_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_8072_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1789_c11_cce4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1789_c7_cb8a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_cb8a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_cb8a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_cb8a_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1789_c7_cb8a_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1789_c7_cb8a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1795_c11_ab48_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1795_c7_c1c3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_c1c3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_c1c3_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1795_c7_c1c3_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_268b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_268b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_268b_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_09e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1760_c2_09e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_09e1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1770_c3_dc03 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_09e1_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_09e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1760_c2_09e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_09e1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1765_c3_eed1 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_09e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1760_c2_09e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_09e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_09e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1760_c2_09e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_09e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_09e1_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_09e1_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_09e1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1760_c2_09e1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_647f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_647f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_647f_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_bfad_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_bfad_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_e708_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_bfad_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_bfad_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1774_c3_7951 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_bfad_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_e708_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_bfad_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_bfad_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_bfad_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_e708_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_bfad_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_bfad_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_bfad_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_e708_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_bfad_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_bfad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_bfad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_e708_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_bfad_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_bfad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_bfad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_e708_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_bfad_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_bfad_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_bfad_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_e708_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_bfad_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_bfad_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_bfad_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_e708_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_bfad_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1773_c7_bfad_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1773_c7_bfad_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1776_c7_e708_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1773_c7_bfad_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_bc19_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_bc19_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_bc19_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_e708_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_e708_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_e708_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_e708_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_e708_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_e708_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_e708_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_e708_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_e708_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_e708_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_e708_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_e708_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_e708_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_e708_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_e708_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_e708_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_e708_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_e708_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_e708_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_e708_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_e708_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_e708_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_e708_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_e708_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1776_c7_e708_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1776_c7_e708_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1776_c7_e708_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1778_c3_9d42_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1778_c3_9d42_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_d11c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_d11c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_d11c_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_bc02_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_bc02_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_c933_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_bc02_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_bc02_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_bc02_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_c933_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_bc02_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_bc02_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_bc02_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_c933_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_bc02_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_bc02_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_bc02_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_c933_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_bc02_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_bc02_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_bc02_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_c933_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_bc02_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_bc02_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_bc02_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_c933_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_bc02_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_bc02_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_bc02_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_c933_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_bc02_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_bc02_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_bc02_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_c933_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_bc02_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1780_c7_bc02_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1780_c7_bc02_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1780_c7_bc02_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_83dc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_83dc_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_83dc_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_d7c8_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_d7c8_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_d7c8_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_d7c8_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_0e64_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_0e64_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_0e64_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_c933_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_c933_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_cb8a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_c933_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_c933_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_c933_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_cb8a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_c933_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_c933_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1786_c3_ee21 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_c933_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_c933_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_c933_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1787_c3_76d9 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_c933_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_c933_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_c933_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_c933_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_cb8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_c933_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_c933_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_c933_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_cb8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_c933_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_c933_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_c933_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_cb8a_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_c933_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_c933_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_c933_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_cb8a_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_c933_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_8072_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_8072_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_8072_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_cce4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_cce4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_cce4_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_cb8a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_cb8a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_c1c3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_cb8a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_cb8a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1792_c3_525a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_cb8a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_c1c3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_cb8a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_cb8a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_cb8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_c1c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_cb8a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_cb8a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_cb8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_cb8a_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_cb8a_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_cb8a_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_cb8a_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_cb8a_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_cb8a_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_c1c3_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_cb8a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_ab48_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_ab48_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_ab48_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_c1c3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_c1c3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_c1c3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_c1c3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1797_c3_2bc7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_c1c3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_c1c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_c1c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_c1c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_c1c3_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_c1c3_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_c1c3_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_c1c3_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1776_l1773_l1760_l1795_l1785_l1780_DUPLICATE_5aac_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1773_l1785_l1776_l1760_DUPLICATE_99a5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1773_l1785_l1776_DUPLICATE_86b5_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1776_l1773_l1795_l1789_l1785_l1780_DUPLICATE_6f75_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1776_l1773_l1789_l1785_l1780_DUPLICATE_3be2_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1777_l1781_DUPLICATE_5a8e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1795_l1785_l1776_l1780_DUPLICATE_cfa1_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e482_uxn_opcodes_h_l1755_l1802_DUPLICATE_005b_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_tmp8_high : unsigned(7 downto 0);
variable REG_VAR_tmp8_low : unsigned(7 downto 0);
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_tmp8_high := tmp8_high;
  REG_VAR_tmp8_low := tmp8_low;
  REG_VAR_t16 := t16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_bc19_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1792_c3_525a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_cb8a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1792_c3_525a;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_cb8a_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1770_c3_dc03 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1770_c3_dc03;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1786_c3_ee21 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_c933_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1786_c3_ee21;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_0e64_right := to_unsigned(4, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_8072_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_ab48_right := to_unsigned(6, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1765_c3_eed1 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1765_c3_eed1;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1797_c3_2bc7 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_c1c3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1797_c3_2bc7;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_d7c8_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_d7c8_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_c1c3_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_d11c_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_268b_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_cce4_right := to_unsigned(5, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1774_c3_7951 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_bfad_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1774_c3_7951;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_647f_right := to_unsigned(1, 1);

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
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_d7c8_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_268b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_647f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_bc19_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_d11c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_0e64_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_cce4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_ab48_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_cb8a_iftrue := VAR_previous_ram_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_c1c3_iftrue := VAR_previous_ram_read;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_cb8a_iftrue := VAR_previous_ram_read;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_c1c3_iftrue := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_83dc_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_8072_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1773_c7_bfad_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1780_c7_bc02_iffalse := t16;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_bfad_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_e708_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_bc02_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_c933_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_cb8a_iffalse := tmp8_high;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_bfad_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_e708_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_bc02_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_c933_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_cb8a_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_c1c3_iffalse := tmp8_low;
     -- BIN_OP_EQ[uxn_opcodes_h_l1795_c11_ab48] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1795_c11_ab48_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_ab48_left;
     BIN_OP_EQ_uxn_opcodes_h_l1795_c11_ab48_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_ab48_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_ab48_return_output := BIN_OP_EQ_uxn_opcodes_h_l1795_c11_ab48_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1780_c11_d11c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1780_c11_d11c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_d11c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1780_c11_d11c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_d11c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_d11c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1780_c11_d11c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1776_l1773_l1795_l1789_l1785_l1780_DUPLICATE_6f75 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1776_l1773_l1795_l1789_l1785_l1780_DUPLICATE_6f75_return_output := result.is_opc_done;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1760_c2_09e1] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1760_c2_09e1_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1785_c11_0e64] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1785_c11_0e64_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_0e64_left;
     BIN_OP_EQ_uxn_opcodes_h_l1785_c11_0e64_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_0e64_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_0e64_return_output := BIN_OP_EQ_uxn_opcodes_h_l1785_c11_0e64_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1777_l1781_DUPLICATE_5a8e LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1777_l1781_DUPLICATE_5a8e_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1760_c2_09e1] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1760_c2_09e1_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1773_l1785_l1776_l1760_DUPLICATE_99a5 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1773_l1785_l1776_l1760_DUPLICATE_99a5_return_output := result.u16_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1773_l1785_l1776_DUPLICATE_86b5 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1773_l1785_l1776_DUPLICATE_86b5_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1773_c11_647f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1773_c11_647f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_647f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1773_c11_647f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_647f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_647f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1773_c11_647f_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1787_c22_8072] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_8072_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_8072_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_8072_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_8072_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_8072_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_8072_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1760_c6_268b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1760_c6_268b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_268b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1760_c6_268b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_268b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_268b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1760_c6_268b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1776_c11_bc19] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1776_c11_bc19_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_bc19_left;
     BIN_OP_EQ_uxn_opcodes_h_l1776_c11_bc19_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_bc19_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_bc19_return_output := BIN_OP_EQ_uxn_opcodes_h_l1776_c11_bc19_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1760_c2_09e1] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1760_c2_09e1_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1776_l1773_l1789_l1785_l1780_DUPLICATE_3be2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1776_l1773_l1789_l1785_l1780_DUPLICATE_3be2_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1789_c11_cce4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1789_c11_cce4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_cce4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1789_c11_cce4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_cce4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_cce4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1789_c11_cce4_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1782_c30_d7c8] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1782_c30_d7c8_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_d7c8_ins;
     sp_relative_shift_uxn_opcodes_h_l1782_c30_d7c8_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_d7c8_x;
     sp_relative_shift_uxn_opcodes_h_l1782_c30_d7c8_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_d7c8_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_d7c8_return_output := sp_relative_shift_uxn_opcodes_h_l1782_c30_d7c8_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1760_c2_09e1] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1760_c2_09e1_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1795_l1785_l1776_l1780_DUPLICATE_cfa1 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1795_l1785_l1776_l1780_DUPLICATE_cfa1_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1776_l1773_l1760_l1795_l1785_l1780_DUPLICATE_5aac LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1776_l1773_l1760_l1795_l1785_l1780_DUPLICATE_5aac_return_output := result.u8_value;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_09e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_268b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_09e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_268b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_09e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_268b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_09e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_268b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_09e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_268b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_09e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_268b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_09e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_268b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_09e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_268b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_09e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_268b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_09e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_268b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1760_c2_09e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_268b_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_09e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_268b_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_09e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_268b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_bfad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_647f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_bfad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_647f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_bfad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_647f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_bfad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_647f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_bfad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_647f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_bfad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_647f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1773_c7_bfad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_647f_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_bfad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_647f_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_bfad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_647f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_e708_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_bc19_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_e708_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_bc19_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_e708_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_bc19_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_e708_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_bc19_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_e708_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_bc19_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_e708_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_bc19_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1776_c7_e708_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_bc19_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_e708_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_bc19_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_e708_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_bc19_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_bc02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_d11c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_bc02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_d11c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_bc02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_d11c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_bc02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_d11c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_bc02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_d11c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_bc02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_d11c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1780_c7_bc02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_d11c_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_bc02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_d11c_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_bc02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_d11c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_c933_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_0e64_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_c933_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_0e64_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_c933_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_0e64_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_c933_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_0e64_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_c933_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_0e64_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_c933_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_0e64_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_c933_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_0e64_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_c933_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_0e64_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_cb8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_cce4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_cb8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_cce4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_cb8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_cce4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_cb8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_cce4_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_cb8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_cce4_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_cb8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_cce4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_c1c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_ab48_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_c1c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_ab48_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_c1c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_ab48_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_c1c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_ab48_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1787_c3_76d9 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_8072_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_83dc_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1777_l1781_DUPLICATE_5a8e_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1778_c3_9d42_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1777_l1781_DUPLICATE_5a8e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_bfad_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1773_l1785_l1776_DUPLICATE_86b5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_e708_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1773_l1785_l1776_DUPLICATE_86b5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_c933_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1773_l1785_l1776_DUPLICATE_86b5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1773_l1785_l1776_l1760_DUPLICATE_99a5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_bfad_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1773_l1785_l1776_l1760_DUPLICATE_99a5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_e708_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1773_l1785_l1776_l1760_DUPLICATE_99a5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_c933_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1773_l1785_l1776_l1760_DUPLICATE_99a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_bfad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1776_l1773_l1795_l1789_l1785_l1780_DUPLICATE_6f75_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_e708_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1776_l1773_l1795_l1789_l1785_l1780_DUPLICATE_6f75_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_bc02_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1776_l1773_l1795_l1789_l1785_l1780_DUPLICATE_6f75_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_c933_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1776_l1773_l1795_l1789_l1785_l1780_DUPLICATE_6f75_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_cb8a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1776_l1773_l1795_l1789_l1785_l1780_DUPLICATE_6f75_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_c1c3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1776_l1773_l1795_l1789_l1785_l1780_DUPLICATE_6f75_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_bfad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1776_l1773_l1789_l1785_l1780_DUPLICATE_3be2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_e708_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1776_l1773_l1789_l1785_l1780_DUPLICATE_3be2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_bc02_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1776_l1773_l1789_l1785_l1780_DUPLICATE_3be2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_c933_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1776_l1773_l1789_l1785_l1780_DUPLICATE_3be2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_cb8a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1776_l1773_l1789_l1785_l1780_DUPLICATE_3be2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_e708_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1795_l1785_l1776_l1780_DUPLICATE_cfa1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_bc02_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1795_l1785_l1776_l1780_DUPLICATE_cfa1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_c933_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1795_l1785_l1776_l1780_DUPLICATE_cfa1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_c1c3_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1795_l1785_l1776_l1780_DUPLICATE_cfa1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1776_l1773_l1760_l1795_l1785_l1780_DUPLICATE_5aac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_bfad_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1776_l1773_l1760_l1795_l1785_l1780_DUPLICATE_5aac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_e708_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1776_l1773_l1760_l1795_l1785_l1780_DUPLICATE_5aac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_bc02_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1776_l1773_l1760_l1795_l1785_l1780_DUPLICATE_5aac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_c933_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1776_l1773_l1760_l1795_l1785_l1780_DUPLICATE_5aac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_c1c3_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1776_l1773_l1760_l1795_l1785_l1780_DUPLICATE_5aac_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1760_c2_09e1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1760_c2_09e1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1760_c2_09e1_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1760_c2_09e1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_bc02_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_d7c8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_c933_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1787_c3_76d9;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1795_c7_c1c3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_c1c3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_c1c3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_c1c3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_c1c3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_c1c3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_c1c3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_c1c3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_c1c3_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1781_c3_83dc] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1781_c3_83dc_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_83dc_left;
     BIN_OP_OR_uxn_opcodes_h_l1781_c3_83dc_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_83dc_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_83dc_return_output := BIN_OP_OR_uxn_opcodes_h_l1781_c3_83dc_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1760_c2_09e1] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_09e1_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_09e1_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1760_c2_09e1] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_09e1_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_09e1_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1795_c7_c1c3] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1795_c7_c1c3_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_c1c3_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1795_c7_c1c3_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_c1c3_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1795_c7_c1c3_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_c1c3_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_c1c3_return_output := tmp8_low_MUX_uxn_opcodes_h_l1795_c7_c1c3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1795_c7_c1c3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1795_c7_c1c3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_c1c3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1795_c7_c1c3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_c1c3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1795_c7_c1c3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_c1c3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_c1c3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1795_c7_c1c3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1789_c7_cb8a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_cb8a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_cb8a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_cb8a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_cb8a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_cb8a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_cb8a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_cb8a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_cb8a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1785_c7_c933] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1785_c7_c933_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_c933_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1785_c7_c933_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_c933_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1785_c7_c933_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_c933_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_c933_return_output := result_u16_value_MUX_uxn_opcodes_h_l1785_c7_c933_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1795_c7_c1c3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_c1c3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_c1c3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_c1c3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_c1c3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_c1c3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_c1c3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_c1c3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_c1c3_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1760_c2_09e1] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_09e1_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_09e1_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1760_c2_09e1] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_09e1_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_09e1_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1785_c7_c933] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_c933_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_c933_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_c933_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_c933_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_c933_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_c933_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_c933_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_c933_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1778_c3_9d42] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1778_c3_9d42_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1778_c3_9d42_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1778_c3_9d42_return_output := CONST_SL_8_uxn_opcodes_h_l1778_c3_9d42_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1789_c7_cb8a] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1789_c7_cb8a_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_cb8a_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1789_c7_cb8a_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_cb8a_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1789_c7_cb8a_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_cb8a_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_cb8a_return_output := tmp8_high_MUX_uxn_opcodes_h_l1789_c7_cb8a_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_bc02_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_83dc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1780_c7_bc02_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_83dc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1776_c7_e708_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1778_c3_9d42_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_cb8a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_c1c3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_c933_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_cb8a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_bc02_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_c933_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_cb8a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_c1c3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_bc02_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_c933_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_cb8a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_c1c3_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_c933_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_cb8a_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_cb8a_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_c1c3_return_output;
     -- tmp8_low_MUX[uxn_opcodes_h_l1789_c7_cb8a] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1789_c7_cb8a_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_cb8a_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1789_c7_cb8a_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_cb8a_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1789_c7_cb8a_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_cb8a_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_cb8a_return_output := tmp8_low_MUX_uxn_opcodes_h_l1789_c7_cb8a_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1785_c7_c933] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1785_c7_c933_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_c933_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1785_c7_c933_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_c933_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1785_c7_c933_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_c933_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_c933_return_output := tmp8_high_MUX_uxn_opcodes_h_l1785_c7_c933_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1785_c7_c933] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_c933_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_c933_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_c933_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_c933_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_c933_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_c933_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_c933_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_c933_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1789_c7_cb8a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_cb8a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_cb8a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_cb8a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_cb8a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_cb8a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_cb8a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_cb8a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_cb8a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1780_c7_bc02] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1780_c7_bc02_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_bc02_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1780_c7_bc02_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_bc02_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1780_c7_bc02_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_bc02_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output := result_u16_value_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1780_c7_bc02] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_bc02_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_bc02_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_bc02_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_bc02_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_bc02_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_bc02_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output;

     -- t16_MUX[uxn_opcodes_h_l1780_c7_bc02] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1780_c7_bc02_cond <= VAR_t16_MUX_uxn_opcodes_h_l1780_c7_bc02_cond;
     t16_MUX_uxn_opcodes_h_l1780_c7_bc02_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1780_c7_bc02_iftrue;
     t16_MUX_uxn_opcodes_h_l1780_c7_bc02_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1780_c7_bc02_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output := t16_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1789_c7_cb8a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1789_c7_cb8a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_cb8a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1789_c7_cb8a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_cb8a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1789_c7_cb8a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_cb8a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_cb8a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1789_c7_cb8a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1789_c7_cb8a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_cb8a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_cb8a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_cb8a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_cb8a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_cb8a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_cb8a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_cb8a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_cb8a_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_c933_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_cb8a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_bc02_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_c933_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_e708_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_c933_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_cb8a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_e708_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_c933_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_cb8a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1776_c7_e708_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_bc02_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_c933_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_c933_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_cb8a_return_output;
     -- tmp8_high_MUX[uxn_opcodes_h_l1780_c7_bc02] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1780_c7_bc02_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_bc02_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1780_c7_bc02_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_bc02_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1780_c7_bc02_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_bc02_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output := tmp8_high_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1780_c7_bc02] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_bc02_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_bc02_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_bc02_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_bc02_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_bc02_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_bc02_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output;

     -- t16_MUX[uxn_opcodes_h_l1776_c7_e708] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1776_c7_e708_cond <= VAR_t16_MUX_uxn_opcodes_h_l1776_c7_e708_cond;
     t16_MUX_uxn_opcodes_h_l1776_c7_e708_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1776_c7_e708_iftrue;
     t16_MUX_uxn_opcodes_h_l1776_c7_e708_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1776_c7_e708_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1776_c7_e708_return_output := t16_MUX_uxn_opcodes_h_l1776_c7_e708_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1785_c7_c933] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_c933_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_c933_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_c933_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_c933_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_c933_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_c933_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_c933_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_c933_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1785_c7_c933] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_c933_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_c933_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_c933_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_c933_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_c933_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_c933_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_c933_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_c933_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1785_c7_c933] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1785_c7_c933_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_c933_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1785_c7_c933_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_c933_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1785_c7_c933_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_c933_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_c933_return_output := tmp8_low_MUX_uxn_opcodes_h_l1785_c7_c933_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1776_c7_e708] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1776_c7_e708_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_e708_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1776_c7_e708_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_e708_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1776_c7_e708_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_e708_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_e708_return_output := result_u16_value_MUX_uxn_opcodes_h_l1776_c7_e708_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1776_c7_e708] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_e708_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_e708_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_e708_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_e708_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_e708_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_e708_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_e708_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_e708_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1785_c7_c933] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1785_c7_c933_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_c933_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1785_c7_c933_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_c933_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1785_c7_c933_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_c933_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_c933_return_output := result_u8_value_MUX_uxn_opcodes_h_l1785_c7_c933_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_bc02_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_c933_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_e708_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_bfad_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_e708_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_bc02_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_c933_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_bfad_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_e708_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_bc02_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_c933_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1773_c7_bfad_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1776_c7_e708_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_e708_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_bc02_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_c933_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1773_c7_bfad] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1773_c7_bfad_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_bfad_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1773_c7_bfad_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_bfad_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1773_c7_bfad_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_bfad_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output := result_u16_value_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1780_c7_bc02] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_bc02_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_bc02_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_bc02_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_bc02_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_bc02_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_bc02_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1776_c7_e708] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1776_c7_e708_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_e708_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1776_c7_e708_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_e708_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1776_c7_e708_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_e708_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_e708_return_output := tmp8_high_MUX_uxn_opcodes_h_l1776_c7_e708_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1780_c7_bc02] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1780_c7_bc02_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_bc02_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1780_c7_bc02_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_bc02_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1780_c7_bc02_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_bc02_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output := result_u8_value_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1780_c7_bc02] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_bc02_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_bc02_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_bc02_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_bc02_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_bc02_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_bc02_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1776_c7_e708] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_e708_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_e708_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_e708_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_e708_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_e708_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_e708_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_e708_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_e708_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1773_c7_bfad] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_bfad_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_bfad_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_bfad_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_bfad_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_bfad_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_bfad_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1780_c7_bc02] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1780_c7_bc02_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_bc02_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1780_c7_bc02_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_bc02_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1780_c7_bc02_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_bc02_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output := tmp8_low_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output;

     -- t16_MUX[uxn_opcodes_h_l1773_c7_bfad] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1773_c7_bfad_cond <= VAR_t16_MUX_uxn_opcodes_h_l1773_c7_bfad_cond;
     t16_MUX_uxn_opcodes_h_l1773_c7_bfad_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1773_c7_bfad_iftrue;
     t16_MUX_uxn_opcodes_h_l1773_c7_bfad_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1773_c7_bfad_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output := t16_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_e708_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_bfad_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_e708_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_e708_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_e708_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_bfad_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_e708_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_e708_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_bc02_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1760_c2_09e1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_09e1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_09e1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1776_c7_e708] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_e708_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_e708_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_e708_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_e708_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_e708_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_e708_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_e708_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_e708_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1776_c7_e708] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1776_c7_e708_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_e708_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1776_c7_e708_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_e708_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1776_c7_e708_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_e708_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_e708_return_output := result_u8_value_MUX_uxn_opcodes_h_l1776_c7_e708_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1776_c7_e708] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_e708_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_e708_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_e708_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_e708_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_e708_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_e708_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_e708_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_e708_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1773_c7_bfad] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1773_c7_bfad_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_bfad_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1773_c7_bfad_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_bfad_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1773_c7_bfad_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_bfad_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output := tmp8_high_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output;

     -- t16_MUX[uxn_opcodes_h_l1760_c2_09e1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1760_c2_09e1_cond <= VAR_t16_MUX_uxn_opcodes_h_l1760_c2_09e1_cond;
     t16_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue;
     t16_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output := t16_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1776_c7_e708] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1776_c7_e708_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_e708_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1776_c7_e708_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_e708_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1776_c7_e708_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_e708_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_e708_return_output := tmp8_low_MUX_uxn_opcodes_h_l1776_c7_e708_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1760_c2_09e1] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1760_c2_09e1_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_09e1_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output := result_u16_value_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1773_c7_bfad] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_bfad_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_bfad_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_bfad_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_bfad_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_bfad_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_bfad_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_bfad_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_e708_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_bfad_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_e708_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_bfad_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_e708_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_bfad_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_e708_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1773_c7_bfad] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_bfad_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_bfad_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_bfad_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_bfad_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_bfad_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_bfad_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1760_c2_09e1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_09e1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_09e1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1773_c7_bfad] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_bfad_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_bfad_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_bfad_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_bfad_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_bfad_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_bfad_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1760_c2_09e1] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1760_c2_09e1_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_09e1_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output := tmp8_high_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1773_c7_bfad] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1773_c7_bfad_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_bfad_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1773_c7_bfad_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_bfad_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1773_c7_bfad_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_bfad_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output := result_u8_value_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1773_c7_bfad] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1773_c7_bfad_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_bfad_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1773_c7_bfad_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_bfad_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1773_c7_bfad_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_bfad_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output := tmp8_low_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output;
     REG_VAR_tmp8_high := VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_bfad_return_output;
     -- tmp8_low_MUX[uxn_opcodes_h_l1760_c2_09e1] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1760_c2_09e1_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_09e1_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output := tmp8_low_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1760_c2_09e1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_09e1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_09e1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1760_c2_09e1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_09e1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_09e1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1760_c2_09e1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1760_c2_09e1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_09e1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_09e1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_09e1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output := result_u8_value_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output;

     -- Submodule level 8
     REG_VAR_tmp8_low := VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e482_uxn_opcodes_h_l1755_l1802_DUPLICATE_005b LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e482_uxn_opcodes_h_l1755_l1802_DUPLICATE_005b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e482(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_09e1_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e482_uxn_opcodes_h_l1755_l1802_DUPLICATE_005b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e482_uxn_opcodes_h_l1755_l1802_DUPLICATE_005b_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_tmp8_high <= REG_VAR_tmp8_high;
REG_COMB_tmp8_low <= REG_VAR_tmp8_low;
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     tmp8_high <= REG_COMB_tmp8_high;
     tmp8_low <= REG_COMB_tmp8_low;
     t16 <= REG_COMB_t16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
