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
-- BIN_OP_EQ[uxn_opcodes_h_l1760_c6_d8fd]
signal BIN_OP_EQ_uxn_opcodes_h_l1760_c6_d8fd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1760_c6_d8fd_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1760_c6_d8fd_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1760_c2_3b47]
signal t16_MUX_uxn_opcodes_h_l1760_c2_3b47_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1760_c2_3b47]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3b47_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1760_c2_3b47]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3b47_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1760_c2_3b47]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3b47_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1760_c2_3b47]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3b47_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1760_c2_3b47]
signal result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3b47_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1760_c2_3b47]
signal result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3b47_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1760_c2_3b47]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3b47_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1760_c2_3b47]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3b47_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1760_c2_3b47]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3b47_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1760_c2_3b47]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3b47_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output : unsigned(3 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1760_c2_3b47]
signal tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3b47_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1760_c2_3b47]
signal tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3b47_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1773_c11_923f]
signal BIN_OP_EQ_uxn_opcodes_h_l1773_c11_923f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1773_c11_923f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1773_c11_923f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1773_c7_0eff]
signal t16_MUX_uxn_opcodes_h_l1773_c7_0eff_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1773_c7_0eff_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1773_c7_0eff_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1773_c7_0eff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_0eff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_0eff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_0eff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1773_c7_0eff]
signal result_u16_value_MUX_uxn_opcodes_h_l1773_c7_0eff_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1773_c7_0eff_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1773_c7_0eff_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1773_c7_0eff]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_0eff_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_0eff_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_0eff_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1773_c7_0eff]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_0eff_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_0eff_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_0eff_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1773_c7_0eff]
signal result_u8_value_MUX_uxn_opcodes_h_l1773_c7_0eff_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1773_c7_0eff_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1773_c7_0eff_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1773_c7_0eff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_0eff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_0eff_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_0eff_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output : unsigned(3 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1773_c7_0eff]
signal tmp8_low_MUX_uxn_opcodes_h_l1773_c7_0eff_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1773_c7_0eff_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1773_c7_0eff_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1773_c7_0eff]
signal tmp8_high_MUX_uxn_opcodes_h_l1773_c7_0eff_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1773_c7_0eff_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1773_c7_0eff_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1776_c11_f5b1]
signal BIN_OP_EQ_uxn_opcodes_h_l1776_c11_f5b1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1776_c11_f5b1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1776_c11_f5b1_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1776_c7_8cb3]
signal t16_MUX_uxn_opcodes_h_l1776_c7_8cb3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1776_c7_8cb3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1776_c7_8cb3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1776_c7_8cb3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_8cb3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_8cb3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_8cb3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1776_c7_8cb3]
signal result_u16_value_MUX_uxn_opcodes_h_l1776_c7_8cb3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1776_c7_8cb3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1776_c7_8cb3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1776_c7_8cb3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_8cb3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_8cb3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_8cb3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1776_c7_8cb3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_8cb3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_8cb3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_8cb3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1776_c7_8cb3]
signal result_u8_value_MUX_uxn_opcodes_h_l1776_c7_8cb3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1776_c7_8cb3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1776_c7_8cb3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1776_c7_8cb3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_8cb3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_8cb3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_8cb3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output : unsigned(3 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1776_c7_8cb3]
signal tmp8_low_MUX_uxn_opcodes_h_l1776_c7_8cb3_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1776_c7_8cb3_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1776_c7_8cb3_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1776_c7_8cb3]
signal tmp8_high_MUX_uxn_opcodes_h_l1776_c7_8cb3_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1776_c7_8cb3_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1776_c7_8cb3_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1778_c3_0290]
signal CONST_SL_8_uxn_opcodes_h_l1778_c3_0290_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1778_c3_0290_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1780_c11_07f1]
signal BIN_OP_EQ_uxn_opcodes_h_l1780_c11_07f1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1780_c11_07f1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1780_c11_07f1_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1780_c7_bb5b]
signal t16_MUX_uxn_opcodes_h_l1780_c7_bb5b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1780_c7_bb5b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1780_c7_bb5b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1780_c7_bb5b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_bb5b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_bb5b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_bb5b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1780_c7_bb5b]
signal result_u16_value_MUX_uxn_opcodes_h_l1780_c7_bb5b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1780_c7_bb5b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1780_c7_bb5b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1780_c7_bb5b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_bb5b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_bb5b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_bb5b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1780_c7_bb5b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_bb5b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_bb5b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_bb5b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1780_c7_bb5b]
signal result_u8_value_MUX_uxn_opcodes_h_l1780_c7_bb5b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1780_c7_bb5b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1780_c7_bb5b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1780_c7_bb5b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_bb5b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_bb5b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_bb5b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output : unsigned(3 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1780_c7_bb5b]
signal tmp8_low_MUX_uxn_opcodes_h_l1780_c7_bb5b_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1780_c7_bb5b_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1780_c7_bb5b_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1780_c7_bb5b]
signal tmp8_high_MUX_uxn_opcodes_h_l1780_c7_bb5b_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1780_c7_bb5b_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1780_c7_bb5b_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1781_c3_e78e]
signal BIN_OP_OR_uxn_opcodes_h_l1781_c3_e78e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1781_c3_e78e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1781_c3_e78e_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1782_c30_924b]
signal sp_relative_shift_uxn_opcodes_h_l1782_c30_924b_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1782_c30_924b_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1782_c30_924b_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1782_c30_924b_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1785_c11_9e60]
signal BIN_OP_EQ_uxn_opcodes_h_l1785_c11_9e60_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1785_c11_9e60_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1785_c11_9e60_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1785_c7_85ef]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_85ef_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_85ef_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_85ef_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1785_c7_85ef]
signal result_u16_value_MUX_uxn_opcodes_h_l1785_c7_85ef_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1785_c7_85ef_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1785_c7_85ef_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1785_c7_85ef]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_85ef_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_85ef_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_85ef_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1785_c7_85ef]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_85ef_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_85ef_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_85ef_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1785_c7_85ef]
signal result_u8_value_MUX_uxn_opcodes_h_l1785_c7_85ef_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1785_c7_85ef_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1785_c7_85ef_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1785_c7_85ef]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_85ef_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_85ef_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_85ef_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output : unsigned(3 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1785_c7_85ef]
signal tmp8_low_MUX_uxn_opcodes_h_l1785_c7_85ef_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1785_c7_85ef_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1785_c7_85ef_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1785_c7_85ef]
signal tmp8_high_MUX_uxn_opcodes_h_l1785_c7_85ef_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1785_c7_85ef_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1785_c7_85ef_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1787_c22_6b23]
signal BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_6b23_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_6b23_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_6b23_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1789_c11_5a5d]
signal BIN_OP_EQ_uxn_opcodes_h_l1789_c11_5a5d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1789_c11_5a5d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1789_c11_5a5d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1789_c7_499c]
signal result_u8_value_MUX_uxn_opcodes_h_l1789_c7_499c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1789_c7_499c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1789_c7_499c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1789_c7_499c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1789_c7_499c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_499c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_499c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_499c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_499c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1789_c7_499c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_499c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_499c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_499c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_499c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1789_c7_499c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_499c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_499c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_499c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_499c_return_output : unsigned(3 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1789_c7_499c]
signal tmp8_low_MUX_uxn_opcodes_h_l1789_c7_499c_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1789_c7_499c_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1789_c7_499c_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1789_c7_499c_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1789_c7_499c]
signal tmp8_high_MUX_uxn_opcodes_h_l1789_c7_499c_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1789_c7_499c_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1789_c7_499c_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1789_c7_499c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1795_c11_f34e]
signal BIN_OP_EQ_uxn_opcodes_h_l1795_c11_f34e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1795_c11_f34e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1795_c11_f34e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1795_c7_d043]
signal result_u8_value_MUX_uxn_opcodes_h_l1795_c7_d043_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1795_c7_d043_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1795_c7_d043_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1795_c7_d043_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1795_c7_d043]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_d043_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_d043_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_d043_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_d043_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1795_c7_d043]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_d043_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_d043_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_d043_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_d043_return_output : unsigned(3 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1795_c7_d043]
signal tmp8_low_MUX_uxn_opcodes_h_l1795_c7_d043_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1795_c7_d043_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1795_c7_d043_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1795_c7_d043_return_output : unsigned(7 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_6145( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : signed;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_ram_write := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.u16_value := ref_toks_6;
      base.is_stack_index_flipped := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.is_opc_done := ref_toks_9;
      base.stack_address_sp_offset := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1760_c6_d8fd
BIN_OP_EQ_uxn_opcodes_h_l1760_c6_d8fd : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1760_c6_d8fd_left,
BIN_OP_EQ_uxn_opcodes_h_l1760_c6_d8fd_right,
BIN_OP_EQ_uxn_opcodes_h_l1760_c6_d8fd_return_output);

-- t16_MUX_uxn_opcodes_h_l1760_c2_3b47
t16_MUX_uxn_opcodes_h_l1760_c2_3b47 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1760_c2_3b47_cond,
t16_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue,
t16_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse,
t16_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3b47
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3b47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3b47_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3b47
result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3b47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3b47_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3b47
result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3b47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3b47_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3b47
result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3b47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3b47_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3b47
result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3b47 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3b47_cond,
result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3b47
result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3b47 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3b47_cond,
result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3b47
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3b47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3b47_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3b47
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3b47 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3b47_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3b47
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3b47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3b47_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3b47
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3b47 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3b47_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3b47
tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3b47 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3b47_cond,
tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3b47
tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3b47 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3b47_cond,
tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1773_c11_923f
BIN_OP_EQ_uxn_opcodes_h_l1773_c11_923f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1773_c11_923f_left,
BIN_OP_EQ_uxn_opcodes_h_l1773_c11_923f_right,
BIN_OP_EQ_uxn_opcodes_h_l1773_c11_923f_return_output);

-- t16_MUX_uxn_opcodes_h_l1773_c7_0eff
t16_MUX_uxn_opcodes_h_l1773_c7_0eff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1773_c7_0eff_cond,
t16_MUX_uxn_opcodes_h_l1773_c7_0eff_iftrue,
t16_MUX_uxn_opcodes_h_l1773_c7_0eff_iffalse,
t16_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_0eff
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_0eff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_0eff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_0eff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_0eff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1773_c7_0eff
result_u16_value_MUX_uxn_opcodes_h_l1773_c7_0eff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1773_c7_0eff_cond,
result_u16_value_MUX_uxn_opcodes_h_l1773_c7_0eff_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1773_c7_0eff_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_0eff
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_0eff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_0eff_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_0eff_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_0eff_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_0eff
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_0eff : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_0eff_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_0eff_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_0eff_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1773_c7_0eff
result_u8_value_MUX_uxn_opcodes_h_l1773_c7_0eff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1773_c7_0eff_cond,
result_u8_value_MUX_uxn_opcodes_h_l1773_c7_0eff_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1773_c7_0eff_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_0eff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_0eff : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_0eff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_0eff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_0eff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1773_c7_0eff
tmp8_low_MUX_uxn_opcodes_h_l1773_c7_0eff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1773_c7_0eff_cond,
tmp8_low_MUX_uxn_opcodes_h_l1773_c7_0eff_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1773_c7_0eff_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1773_c7_0eff
tmp8_high_MUX_uxn_opcodes_h_l1773_c7_0eff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1773_c7_0eff_cond,
tmp8_high_MUX_uxn_opcodes_h_l1773_c7_0eff_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1773_c7_0eff_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1776_c11_f5b1
BIN_OP_EQ_uxn_opcodes_h_l1776_c11_f5b1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1776_c11_f5b1_left,
BIN_OP_EQ_uxn_opcodes_h_l1776_c11_f5b1_right,
BIN_OP_EQ_uxn_opcodes_h_l1776_c11_f5b1_return_output);

-- t16_MUX_uxn_opcodes_h_l1776_c7_8cb3
t16_MUX_uxn_opcodes_h_l1776_c7_8cb3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1776_c7_8cb3_cond,
t16_MUX_uxn_opcodes_h_l1776_c7_8cb3_iftrue,
t16_MUX_uxn_opcodes_h_l1776_c7_8cb3_iffalse,
t16_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_8cb3
result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_8cb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_8cb3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_8cb3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_8cb3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1776_c7_8cb3
result_u16_value_MUX_uxn_opcodes_h_l1776_c7_8cb3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1776_c7_8cb3_cond,
result_u16_value_MUX_uxn_opcodes_h_l1776_c7_8cb3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1776_c7_8cb3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_8cb3
result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_8cb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_8cb3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_8cb3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_8cb3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_8cb3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_8cb3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_8cb3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_8cb3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_8cb3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1776_c7_8cb3
result_u8_value_MUX_uxn_opcodes_h_l1776_c7_8cb3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1776_c7_8cb3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1776_c7_8cb3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1776_c7_8cb3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_8cb3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_8cb3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_8cb3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_8cb3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_8cb3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1776_c7_8cb3
tmp8_low_MUX_uxn_opcodes_h_l1776_c7_8cb3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1776_c7_8cb3_cond,
tmp8_low_MUX_uxn_opcodes_h_l1776_c7_8cb3_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1776_c7_8cb3_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1776_c7_8cb3
tmp8_high_MUX_uxn_opcodes_h_l1776_c7_8cb3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1776_c7_8cb3_cond,
tmp8_high_MUX_uxn_opcodes_h_l1776_c7_8cb3_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1776_c7_8cb3_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1778_c3_0290
CONST_SL_8_uxn_opcodes_h_l1778_c3_0290 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1778_c3_0290_x,
CONST_SL_8_uxn_opcodes_h_l1778_c3_0290_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1780_c11_07f1
BIN_OP_EQ_uxn_opcodes_h_l1780_c11_07f1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1780_c11_07f1_left,
BIN_OP_EQ_uxn_opcodes_h_l1780_c11_07f1_right,
BIN_OP_EQ_uxn_opcodes_h_l1780_c11_07f1_return_output);

-- t16_MUX_uxn_opcodes_h_l1780_c7_bb5b
t16_MUX_uxn_opcodes_h_l1780_c7_bb5b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1780_c7_bb5b_cond,
t16_MUX_uxn_opcodes_h_l1780_c7_bb5b_iftrue,
t16_MUX_uxn_opcodes_h_l1780_c7_bb5b_iffalse,
t16_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_bb5b
result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_bb5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_bb5b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_bb5b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_bb5b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1780_c7_bb5b
result_u16_value_MUX_uxn_opcodes_h_l1780_c7_bb5b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1780_c7_bb5b_cond,
result_u16_value_MUX_uxn_opcodes_h_l1780_c7_bb5b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1780_c7_bb5b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_bb5b
result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_bb5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_bb5b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_bb5b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_bb5b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_bb5b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_bb5b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_bb5b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_bb5b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_bb5b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1780_c7_bb5b
result_u8_value_MUX_uxn_opcodes_h_l1780_c7_bb5b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1780_c7_bb5b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1780_c7_bb5b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1780_c7_bb5b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_bb5b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_bb5b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_bb5b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_bb5b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_bb5b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1780_c7_bb5b
tmp8_low_MUX_uxn_opcodes_h_l1780_c7_bb5b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1780_c7_bb5b_cond,
tmp8_low_MUX_uxn_opcodes_h_l1780_c7_bb5b_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1780_c7_bb5b_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1780_c7_bb5b
tmp8_high_MUX_uxn_opcodes_h_l1780_c7_bb5b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1780_c7_bb5b_cond,
tmp8_high_MUX_uxn_opcodes_h_l1780_c7_bb5b_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1780_c7_bb5b_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1781_c3_e78e
BIN_OP_OR_uxn_opcodes_h_l1781_c3_e78e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1781_c3_e78e_left,
BIN_OP_OR_uxn_opcodes_h_l1781_c3_e78e_right,
BIN_OP_OR_uxn_opcodes_h_l1781_c3_e78e_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1782_c30_924b
sp_relative_shift_uxn_opcodes_h_l1782_c30_924b : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1782_c30_924b_ins,
sp_relative_shift_uxn_opcodes_h_l1782_c30_924b_x,
sp_relative_shift_uxn_opcodes_h_l1782_c30_924b_y,
sp_relative_shift_uxn_opcodes_h_l1782_c30_924b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1785_c11_9e60
BIN_OP_EQ_uxn_opcodes_h_l1785_c11_9e60 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1785_c11_9e60_left,
BIN_OP_EQ_uxn_opcodes_h_l1785_c11_9e60_right,
BIN_OP_EQ_uxn_opcodes_h_l1785_c11_9e60_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_85ef
result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_85ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_85ef_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_85ef_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_85ef_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1785_c7_85ef
result_u16_value_MUX_uxn_opcodes_h_l1785_c7_85ef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1785_c7_85ef_cond,
result_u16_value_MUX_uxn_opcodes_h_l1785_c7_85ef_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1785_c7_85ef_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_85ef
result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_85ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_85ef_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_85ef_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_85ef_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_85ef
result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_85ef : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_85ef_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_85ef_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_85ef_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1785_c7_85ef
result_u8_value_MUX_uxn_opcodes_h_l1785_c7_85ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1785_c7_85ef_cond,
result_u8_value_MUX_uxn_opcodes_h_l1785_c7_85ef_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1785_c7_85ef_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_85ef
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_85ef : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_85ef_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_85ef_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_85ef_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1785_c7_85ef
tmp8_low_MUX_uxn_opcodes_h_l1785_c7_85ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1785_c7_85ef_cond,
tmp8_low_MUX_uxn_opcodes_h_l1785_c7_85ef_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1785_c7_85ef_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1785_c7_85ef
tmp8_high_MUX_uxn_opcodes_h_l1785_c7_85ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1785_c7_85ef_cond,
tmp8_high_MUX_uxn_opcodes_h_l1785_c7_85ef_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1785_c7_85ef_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_6b23
BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_6b23 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_6b23_left,
BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_6b23_right,
BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_6b23_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1789_c11_5a5d
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_5a5d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_5a5d_left,
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_5a5d_right,
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_5a5d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1789_c7_499c
result_u8_value_MUX_uxn_opcodes_h_l1789_c7_499c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1789_c7_499c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1789_c7_499c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1789_c7_499c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1789_c7_499c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_499c
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_499c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_499c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_499c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_499c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_499c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_499c
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_499c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_499c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_499c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_499c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_499c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_499c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_499c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_499c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_499c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_499c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_499c_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1789_c7_499c
tmp8_low_MUX_uxn_opcodes_h_l1789_c7_499c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1789_c7_499c_cond,
tmp8_low_MUX_uxn_opcodes_h_l1789_c7_499c_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1789_c7_499c_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1789_c7_499c_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1789_c7_499c
tmp8_high_MUX_uxn_opcodes_h_l1789_c7_499c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1789_c7_499c_cond,
tmp8_high_MUX_uxn_opcodes_h_l1789_c7_499c_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1789_c7_499c_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1789_c7_499c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1795_c11_f34e
BIN_OP_EQ_uxn_opcodes_h_l1795_c11_f34e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1795_c11_f34e_left,
BIN_OP_EQ_uxn_opcodes_h_l1795_c11_f34e_right,
BIN_OP_EQ_uxn_opcodes_h_l1795_c11_f34e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1795_c7_d043
result_u8_value_MUX_uxn_opcodes_h_l1795_c7_d043 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1795_c7_d043_cond,
result_u8_value_MUX_uxn_opcodes_h_l1795_c7_d043_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1795_c7_d043_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1795_c7_d043_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_d043
result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_d043 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_d043_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_d043_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_d043_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_d043_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_d043
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_d043 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_d043_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_d043_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_d043_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_d043_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1795_c7_d043
tmp8_low_MUX_uxn_opcodes_h_l1795_c7_d043 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1795_c7_d043_cond,
tmp8_low_MUX_uxn_opcodes_h_l1795_c7_d043_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1795_c7_d043_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1795_c7_d043_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1760_c6_d8fd_return_output,
 t16_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1773_c11_923f_return_output,
 t16_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1776_c11_f5b1_return_output,
 t16_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output,
 CONST_SL_8_uxn_opcodes_h_l1778_c3_0290_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1780_c11_07f1_return_output,
 t16_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1781_c3_e78e_return_output,
 sp_relative_shift_uxn_opcodes_h_l1782_c30_924b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1785_c11_9e60_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_6b23_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1789_c11_5a5d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1789_c7_499c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_499c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_499c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_499c_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1789_c7_499c_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1789_c7_499c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1795_c11_f34e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1795_c7_d043_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_d043_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_d043_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1795_c7_d043_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_d8fd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_d8fd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_d8fd_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1760_c2_3b47_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1760_c2_3b47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3b47_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3b47_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1760_c2_3b47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3b47_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1760_c2_3b47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3b47_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3b47_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3b47_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1760_c2_3b47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3b47_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1765_c3_bc68 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3b47_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3b47_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1770_c3_29a4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3b47_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3b47_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3b47_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_923f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_923f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_923f_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1773_c7_0eff_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1773_c7_0eff_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1773_c7_0eff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_0eff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_0eff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_0eff_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_0eff_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_0eff_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_0eff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_0eff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_0eff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_0eff_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_0eff_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_0eff_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_0eff_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_0eff_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_0eff_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_0eff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_0eff_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1774_c3_eaab : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_0eff_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_0eff_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_0eff_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_0eff_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_0eff_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_0eff_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_0eff_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_0eff_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_f5b1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_f5b1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_f5b1_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1776_c7_8cb3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1776_c7_8cb3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1776_c7_8cb3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_8cb3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_8cb3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_8cb3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_8cb3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_8cb3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_8cb3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_8cb3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_8cb3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_8cb3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_8cb3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_8cb3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_8cb3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_8cb3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_8cb3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_8cb3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_8cb3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_8cb3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_8cb3_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_8cb3_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_8cb3_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_8cb3_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_8cb3_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_8cb3_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_8cb3_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1778_c3_0290_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1778_c3_0290_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_07f1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_07f1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_07f1_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1780_c7_bb5b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1780_c7_bb5b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1780_c7_bb5b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_bb5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_bb5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_bb5b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_bb5b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_bb5b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_bb5b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_bb5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_bb5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_bb5b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_bb5b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_bb5b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_bb5b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_bb5b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_bb5b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_bb5b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_bb5b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_bb5b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_bb5b_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_bb5b_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_bb5b_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_bb5b_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_bb5b_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_bb5b_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_bb5b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_e78e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_e78e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_e78e_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_924b_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_924b_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_924b_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_924b_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_9e60_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_9e60_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_9e60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_85ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_85ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_499c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_85ef_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_85ef_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1787_c3_b429 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_85ef_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_85ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_85ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_85ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_499c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_85ef_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_85ef_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1786_c3_7d3c : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_85ef_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_85ef_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_85ef_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_85ef_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_499c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_85ef_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_85ef_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_85ef_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_499c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_85ef_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_85ef_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_85ef_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_499c_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_85ef_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_85ef_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_85ef_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_499c_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_85ef_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_6b23_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_6b23_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_6b23_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_5a5d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_5a5d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_5a5d_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_499c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_499c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_d043_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_499c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_499c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_499c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_499c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_499c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_499c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_d043_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_499c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_499c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1792_c3_5eaa : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_499c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_d043_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_499c_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_499c_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_499c_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_d043_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_499c_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_499c_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_499c_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_499c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_f34e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_f34e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_f34e_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_d043_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_d043_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_d043_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_d043_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_d043_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_d043_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_d043_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1797_c3_418a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_d043_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_d043_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_d043_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_d043_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_d043_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1785_l1780_l1776_l1773_l1795_l1760_DUPLICATE_8e64_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1773_l1785_l1776_l1760_DUPLICATE_9797_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1789_l1785_l1780_l1776_l1773_l1795_DUPLICATE_83d7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1789_l1785_l1780_l1776_l1773_DUPLICATE_3db4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1773_l1785_l1776_DUPLICATE_ce69_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1781_l1777_DUPLICATE_eca1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1785_l1776_l1780_l1795_DUPLICATE_8575_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6145_uxn_opcodes_h_l1802_l1755_DUPLICATE_af2c_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_5a5d_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_9e60_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1770_c3_29a4 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1770_c3_29a4;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_924b_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_924b_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1765_c3_bc68 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1765_c3_bc68;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_d043_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_d8fd_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1797_c3_418a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_d043_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1797_c3_418a;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_923f_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_07f1_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_499c_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1774_c3_eaab := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_0eff_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1774_c3_eaab;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_f34e_right := to_unsigned(6, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_6b23_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_f5b1_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1792_c3_5eaa := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_499c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1792_c3_5eaa;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1786_c3_7d3c := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_85ef_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1786_c3_7d3c;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_924b_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_d8fd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_923f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_f5b1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_07f1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_9e60_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_5a5d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_f34e_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_499c_iftrue := VAR_previous_ram_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_d043_iftrue := VAR_previous_ram_read;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_499c_iftrue := VAR_previous_ram_read;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_d043_iftrue := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_e78e_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_6b23_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1773_c7_0eff_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1780_c7_bb5b_iffalse := t16;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_0eff_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_8cb3_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_bb5b_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_85ef_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_499c_iffalse := tmp8_high;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_0eff_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_8cb3_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_bb5b_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_85ef_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_499c_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_d043_iffalse := tmp8_low;
     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1785_l1780_l1776_l1773_l1795_l1760_DUPLICATE_8e64 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1785_l1780_l1776_l1773_l1795_l1760_DUPLICATE_8e64_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1795_c11_f34e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1795_c11_f34e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_f34e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1795_c11_f34e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_f34e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_f34e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1795_c11_f34e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1789_l1785_l1780_l1776_l1773_DUPLICATE_3db4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1789_l1785_l1780_l1776_l1773_DUPLICATE_3db4_return_output := result.is_stack_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1760_c2_3b47] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1760_c2_3b47_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1780_c11_07f1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1780_c11_07f1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_07f1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1780_c11_07f1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_07f1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_07f1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1780_c11_07f1_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1787_c22_6b23] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_6b23_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_6b23_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_6b23_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_6b23_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_6b23_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_6b23_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1785_c11_9e60] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1785_c11_9e60_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_9e60_left;
     BIN_OP_EQ_uxn_opcodes_h_l1785_c11_9e60_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_9e60_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_9e60_return_output := BIN_OP_EQ_uxn_opcodes_h_l1785_c11_9e60_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1773_l1785_l1776_l1760_DUPLICATE_9797 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1773_l1785_l1776_l1760_DUPLICATE_9797_return_output := result.u16_value;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1785_l1776_l1780_l1795_DUPLICATE_8575 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1785_l1776_l1780_l1795_DUPLICATE_8575_return_output := result.stack_address_sp_offset;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1760_c2_3b47] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1760_c2_3b47_return_output := result.is_ram_write;

     -- sp_relative_shift[uxn_opcodes_h_l1782_c30_924b] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1782_c30_924b_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_924b_ins;
     sp_relative_shift_uxn_opcodes_h_l1782_c30_924b_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_924b_x;
     sp_relative_shift_uxn_opcodes_h_l1782_c30_924b_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_924b_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_924b_return_output := sp_relative_shift_uxn_opcodes_h_l1782_c30_924b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1789_l1785_l1780_l1776_l1773_l1795_DUPLICATE_83d7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1789_l1785_l1780_l1776_l1773_l1795_DUPLICATE_83d7_return_output := result.is_opc_done;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1773_l1785_l1776_DUPLICATE_ce69 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1773_l1785_l1776_DUPLICATE_ce69_return_output := result.sp_relative_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1781_l1777_DUPLICATE_eca1 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1781_l1777_DUPLICATE_eca1_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1789_c11_5a5d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1789_c11_5a5d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_5a5d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1789_c11_5a5d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_5a5d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_5a5d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1789_c11_5a5d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1773_c11_923f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1773_c11_923f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_923f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1773_c11_923f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_923f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_923f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1773_c11_923f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1776_c11_f5b1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1776_c11_f5b1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_f5b1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1776_c11_f5b1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_f5b1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_f5b1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1776_c11_f5b1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1760_c6_d8fd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1760_c6_d8fd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_d8fd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1760_c6_d8fd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_d8fd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_d8fd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1760_c6_d8fd_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1760_c2_3b47] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1760_c2_3b47_return_output := result.is_pc_updated;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1760_c2_3b47] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1760_c2_3b47_return_output := result.is_stack_index_flipped;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3b47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_d8fd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3b47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_d8fd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3b47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_d8fd_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3b47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_d8fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3b47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_d8fd_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3b47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_d8fd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3b47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_d8fd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3b47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_d8fd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3b47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_d8fd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3b47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_d8fd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1760_c2_3b47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_d8fd_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3b47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_d8fd_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3b47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_d8fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_0eff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_923f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_0eff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_923f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_0eff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_923f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_0eff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_923f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_0eff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_923f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_0eff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_923f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1773_c7_0eff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_923f_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_0eff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_923f_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_0eff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_923f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_8cb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_f5b1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_8cb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_f5b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_8cb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_f5b1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_8cb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_f5b1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_8cb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_f5b1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_8cb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_f5b1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1776_c7_8cb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_f5b1_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_8cb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_f5b1_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_8cb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_f5b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_bb5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_07f1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_bb5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_07f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_bb5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_07f1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_bb5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_07f1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_bb5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_07f1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_bb5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_07f1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1780_c7_bb5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_07f1_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_bb5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_07f1_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_bb5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_07f1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_85ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_9e60_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_85ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_9e60_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_85ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_9e60_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_85ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_9e60_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_85ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_9e60_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_85ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_9e60_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_85ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_9e60_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_85ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_9e60_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_499c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_5a5d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_499c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_5a5d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_499c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_5a5d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_499c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_5a5d_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_499c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_5a5d_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_499c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_5a5d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_d043_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_f34e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_d043_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_f34e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_d043_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_f34e_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_d043_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_f34e_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1787_c3_b429 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_6b23_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_e78e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1781_l1777_DUPLICATE_eca1_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1778_c3_0290_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1781_l1777_DUPLICATE_eca1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_0eff_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1773_l1785_l1776_DUPLICATE_ce69_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_8cb3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1773_l1785_l1776_DUPLICATE_ce69_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_85ef_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1773_l1785_l1776_DUPLICATE_ce69_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1773_l1785_l1776_l1760_DUPLICATE_9797_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_0eff_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1773_l1785_l1776_l1760_DUPLICATE_9797_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_8cb3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1773_l1785_l1776_l1760_DUPLICATE_9797_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_85ef_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1773_l1785_l1776_l1760_DUPLICATE_9797_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_0eff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1789_l1785_l1780_l1776_l1773_l1795_DUPLICATE_83d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_8cb3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1789_l1785_l1780_l1776_l1773_l1795_DUPLICATE_83d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_bb5b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1789_l1785_l1780_l1776_l1773_l1795_DUPLICATE_83d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_85ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1789_l1785_l1780_l1776_l1773_l1795_DUPLICATE_83d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_499c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1789_l1785_l1780_l1776_l1773_l1795_DUPLICATE_83d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_d043_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1789_l1785_l1780_l1776_l1773_l1795_DUPLICATE_83d7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_0eff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1789_l1785_l1780_l1776_l1773_DUPLICATE_3db4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_8cb3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1789_l1785_l1780_l1776_l1773_DUPLICATE_3db4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_bb5b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1789_l1785_l1780_l1776_l1773_DUPLICATE_3db4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_85ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1789_l1785_l1780_l1776_l1773_DUPLICATE_3db4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_499c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1789_l1785_l1780_l1776_l1773_DUPLICATE_3db4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_8cb3_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1785_l1776_l1780_l1795_DUPLICATE_8575_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_bb5b_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1785_l1776_l1780_l1795_DUPLICATE_8575_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_85ef_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1785_l1776_l1780_l1795_DUPLICATE_8575_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_d043_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1785_l1776_l1780_l1795_DUPLICATE_8575_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1785_l1780_l1776_l1773_l1795_l1760_DUPLICATE_8e64_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_0eff_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1785_l1780_l1776_l1773_l1795_l1760_DUPLICATE_8e64_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_8cb3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1785_l1780_l1776_l1773_l1795_l1760_DUPLICATE_8e64_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_bb5b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1785_l1780_l1776_l1773_l1795_l1760_DUPLICATE_8e64_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_85ef_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1785_l1780_l1776_l1773_l1795_l1760_DUPLICATE_8e64_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_d043_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1785_l1780_l1776_l1773_l1795_l1760_DUPLICATE_8e64_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1760_c2_3b47_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1760_c2_3b47_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1760_c2_3b47_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1760_c2_3b47_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_bb5b_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_924b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_85ef_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1787_c3_b429;
     -- tmp8_high_MUX[uxn_opcodes_h_l1789_c7_499c] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1789_c7_499c_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_499c_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1789_c7_499c_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_499c_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1789_c7_499c_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_499c_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_499c_return_output := tmp8_high_MUX_uxn_opcodes_h_l1789_c7_499c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1785_c7_85ef] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1785_c7_85ef_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_85ef_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1785_c7_85ef_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_85ef_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1785_c7_85ef_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_85ef_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output := result_u16_value_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1760_c2_3b47] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3b47_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3b47_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1778_c3_0290] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1778_c3_0290_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1778_c3_0290_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1778_c3_0290_return_output := CONST_SL_8_uxn_opcodes_h_l1778_c3_0290_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1795_c7_d043] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1795_c7_d043_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_d043_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1795_c7_d043_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_d043_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1795_c7_d043_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_d043_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_d043_return_output := result_u8_value_MUX_uxn_opcodes_h_l1795_c7_d043_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1795_c7_d043] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_d043_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_d043_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_d043_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_d043_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_d043_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_d043_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_d043_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_d043_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1795_c7_d043] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1795_c7_d043_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_d043_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1795_c7_d043_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_d043_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1795_c7_d043_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_d043_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_d043_return_output := tmp8_low_MUX_uxn_opcodes_h_l1795_c7_d043_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1789_c7_499c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_499c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_499c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_499c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_499c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_499c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_499c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_499c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_499c_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1760_c2_3b47] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3b47_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3b47_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1781_c3_e78e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1781_c3_e78e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_e78e_left;
     BIN_OP_OR_uxn_opcodes_h_l1781_c3_e78e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_e78e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_e78e_return_output := BIN_OP_OR_uxn_opcodes_h_l1781_c3_e78e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1785_c7_85ef] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_85ef_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_85ef_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_85ef_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_85ef_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_85ef_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_85ef_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1795_c7_d043] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_d043_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_d043_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_d043_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_d043_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_d043_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_d043_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_d043_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_d043_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1760_c2_3b47] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3b47_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3b47_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1760_c2_3b47] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3b47_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3b47_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_bb5b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_e78e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1780_c7_bb5b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_e78e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1776_c7_8cb3_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1778_c3_0290_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_499c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_d043_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_85ef_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_499c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_bb5b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_499c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_d043_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_bb5b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_499c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_d043_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_85ef_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_499c_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_499c_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_d043_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1789_c7_499c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1789_c7_499c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_499c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1789_c7_499c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_499c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1789_c7_499c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_499c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_499c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1789_c7_499c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1780_c7_bb5b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1780_c7_bb5b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_bb5b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1780_c7_bb5b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_bb5b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1780_c7_bb5b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_bb5b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output := result_u16_value_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output;

     -- t16_MUX[uxn_opcodes_h_l1780_c7_bb5b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1780_c7_bb5b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1780_c7_bb5b_cond;
     t16_MUX_uxn_opcodes_h_l1780_c7_bb5b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1780_c7_bb5b_iftrue;
     t16_MUX_uxn_opcodes_h_l1780_c7_bb5b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1780_c7_bb5b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output := t16_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1785_c7_85ef] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_85ef_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_85ef_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_85ef_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_85ef_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_85ef_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_85ef_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1780_c7_bb5b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_bb5b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_bb5b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_bb5b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_bb5b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_bb5b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_bb5b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1789_c7_499c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_499c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_499c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_499c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_499c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_499c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_499c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_499c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_499c_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1789_c7_499c] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1789_c7_499c_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_499c_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1789_c7_499c_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_499c_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1789_c7_499c_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_499c_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_499c_return_output := tmp8_low_MUX_uxn_opcodes_h_l1789_c7_499c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1789_c7_499c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_499c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_499c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_499c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_499c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_499c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_499c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_499c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_499c_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1785_c7_85ef] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1785_c7_85ef_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_85ef_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1785_c7_85ef_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_85ef_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1785_c7_85ef_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_85ef_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output := tmp8_high_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_85ef_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_499c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_bb5b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_8cb3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_85ef_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_499c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_8cb3_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_85ef_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_499c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1776_c7_8cb3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_bb5b_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_85ef_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_499c_return_output;
     -- tmp8_low_MUX[uxn_opcodes_h_l1785_c7_85ef] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1785_c7_85ef_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_85ef_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1785_c7_85ef_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_85ef_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1785_c7_85ef_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_85ef_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output := tmp8_low_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1785_c7_85ef] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_85ef_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_85ef_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_85ef_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_85ef_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_85ef_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_85ef_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1785_c7_85ef] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1785_c7_85ef_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_85ef_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1785_c7_85ef_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_85ef_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1785_c7_85ef_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_85ef_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output := result_u8_value_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1780_c7_bb5b] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1780_c7_bb5b_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_bb5b_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1780_c7_bb5b_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_bb5b_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1780_c7_bb5b_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_bb5b_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output := tmp8_high_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1780_c7_bb5b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_bb5b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_bb5b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_bb5b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_bb5b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_bb5b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_bb5b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1785_c7_85ef] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_85ef_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_85ef_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_85ef_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_85ef_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_85ef_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_85ef_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1776_c7_8cb3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1776_c7_8cb3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_8cb3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1776_c7_8cb3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_8cb3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1776_c7_8cb3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_8cb3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output := result_u16_value_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output;

     -- t16_MUX[uxn_opcodes_h_l1776_c7_8cb3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1776_c7_8cb3_cond <= VAR_t16_MUX_uxn_opcodes_h_l1776_c7_8cb3_cond;
     t16_MUX_uxn_opcodes_h_l1776_c7_8cb3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1776_c7_8cb3_iftrue;
     t16_MUX_uxn_opcodes_h_l1776_c7_8cb3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1776_c7_8cb3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output := t16_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1776_c7_8cb3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_8cb3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_8cb3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_8cb3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_8cb3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_8cb3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_8cb3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_bb5b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_8cb3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_0eff_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_bb5b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_0eff_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_bb5b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1773_c7_0eff_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_8cb3_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_bb5b_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_85ef_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1773_c7_0eff] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_0eff_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_0eff_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_0eff_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_0eff_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_0eff_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_0eff_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output;

     -- t16_MUX[uxn_opcodes_h_l1773_c7_0eff] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1773_c7_0eff_cond <= VAR_t16_MUX_uxn_opcodes_h_l1773_c7_0eff_cond;
     t16_MUX_uxn_opcodes_h_l1773_c7_0eff_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1773_c7_0eff_iftrue;
     t16_MUX_uxn_opcodes_h_l1773_c7_0eff_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1773_c7_0eff_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output := t16_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1780_c7_bb5b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_bb5b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_bb5b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_bb5b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_bb5b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_bb5b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_bb5b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1776_c7_8cb3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_8cb3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_8cb3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_8cb3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_8cb3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_8cb3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_8cb3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1776_c7_8cb3] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1776_c7_8cb3_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_8cb3_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1776_c7_8cb3_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_8cb3_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1776_c7_8cb3_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_8cb3_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output := tmp8_high_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1780_c7_bb5b] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1780_c7_bb5b_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_bb5b_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1780_c7_bb5b_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_bb5b_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1780_c7_bb5b_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_bb5b_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output := tmp8_low_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1780_c7_bb5b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_bb5b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_bb5b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_bb5b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_bb5b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_bb5b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_bb5b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1773_c7_0eff] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1773_c7_0eff_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_0eff_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1773_c7_0eff_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_0eff_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1773_c7_0eff_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_0eff_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output := result_u16_value_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1780_c7_bb5b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1780_c7_bb5b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_bb5b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1780_c7_bb5b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_bb5b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1780_c7_bb5b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_bb5b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_8cb3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_0eff_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_8cb3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_8cb3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_0eff_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_8cb3_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_bb5b_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1760_c2_3b47] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3b47_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3b47_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output := result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output;

     -- t16_MUX[uxn_opcodes_h_l1760_c2_3b47] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1760_c2_3b47_cond <= VAR_t16_MUX_uxn_opcodes_h_l1760_c2_3b47_cond;
     t16_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue;
     t16_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output := t16_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1773_c7_0eff] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_0eff_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_0eff_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_0eff_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_0eff_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_0eff_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_0eff_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1776_c7_8cb3] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1776_c7_8cb3_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_8cb3_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1776_c7_8cb3_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_8cb3_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1776_c7_8cb3_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_8cb3_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output := tmp8_low_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1776_c7_8cb3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_8cb3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_8cb3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_8cb3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_8cb3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_8cb3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_8cb3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1760_c2_3b47] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3b47_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3b47_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1776_c7_8cb3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_8cb3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_8cb3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_8cb3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_8cb3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_8cb3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_8cb3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1776_c7_8cb3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1776_c7_8cb3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_8cb3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1776_c7_8cb3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_8cb3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1776_c7_8cb3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_8cb3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1773_c7_0eff] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1773_c7_0eff_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_0eff_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1773_c7_0eff_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_0eff_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1773_c7_0eff_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_0eff_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output := tmp8_high_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_0eff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_0eff_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_0eff_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_0eff_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_8cb3_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1760_c2_3b47] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3b47_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3b47_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1773_c7_0eff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_0eff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_0eff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_0eff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_0eff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_0eff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_0eff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1773_c7_0eff] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1773_c7_0eff_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_0eff_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1773_c7_0eff_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_0eff_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1773_c7_0eff_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_0eff_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output := result_u8_value_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1760_c2_3b47] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3b47_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3b47_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output := tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1773_c7_0eff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_0eff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_0eff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_0eff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_0eff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_0eff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_0eff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1773_c7_0eff] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1773_c7_0eff_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_0eff_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1773_c7_0eff_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_0eff_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1773_c7_0eff_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_0eff_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output := tmp8_low_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output;
     REG_VAR_tmp8_high := VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_0eff_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1760_c2_3b47] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3b47_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3b47_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output := result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1760_c2_3b47] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3b47_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3b47_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output := tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1760_c2_3b47] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3b47_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3b47_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1760_c2_3b47] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3b47_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3b47_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3b47_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3b47_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output;

     -- Submodule level 8
     REG_VAR_tmp8_low := VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_6145_uxn_opcodes_h_l1802_l1755_DUPLICATE_af2c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6145_uxn_opcodes_h_l1802_l1755_DUPLICATE_af2c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_6145(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3b47_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6145_uxn_opcodes_h_l1802_l1755_DUPLICATE_af2c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6145_uxn_opcodes_h_l1802_l1755_DUPLICATE_af2c_return_output;
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
