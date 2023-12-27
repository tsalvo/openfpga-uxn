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
-- BIN_OP_EQ[uxn_opcodes_h_l1760_c6_ff7f]
signal BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ff7f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ff7f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ff7f_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1760_c2_3139]
signal tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3139_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3139_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1760_c2_3139]
signal tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3139_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3139_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1760_c2_3139]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3139_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3139_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1760_c2_3139]
signal result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3139_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3139_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1760_c2_3139]
signal result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3139_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3139_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1760_c2_3139]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3139_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3139_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1760_c2_3139]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3139_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3139_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1760_c2_3139]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3139_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3139_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1760_c2_3139]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3139_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3139_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1760_c2_3139]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3139_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3139_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1760_c2_3139]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3139_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3139_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1760_c2_3139]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3139_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3139_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1760_c2_3139]
signal t16_MUX_uxn_opcodes_h_l1760_c2_3139_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1760_c2_3139_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1773_c11_a790]
signal BIN_OP_EQ_uxn_opcodes_h_l1773_c11_a790_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1773_c11_a790_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1773_c11_a790_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1773_c7_da5e]
signal tmp8_high_MUX_uxn_opcodes_h_l1773_c7_da5e_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1773_c7_da5e_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1773_c7_da5e_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1773_c7_da5e]
signal tmp8_low_MUX_uxn_opcodes_h_l1773_c7_da5e_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1773_c7_da5e_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1773_c7_da5e_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1773_c7_da5e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_da5e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_da5e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_da5e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1773_c7_da5e]
signal result_u8_value_MUX_uxn_opcodes_h_l1773_c7_da5e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1773_c7_da5e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1773_c7_da5e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1773_c7_da5e]
signal result_u16_value_MUX_uxn_opcodes_h_l1773_c7_da5e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1773_c7_da5e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1773_c7_da5e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1773_c7_da5e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_da5e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_da5e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_da5e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1773_c7_da5e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_da5e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_da5e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_da5e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1773_c7_da5e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_da5e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_da5e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_da5e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1773_c7_da5e]
signal t16_MUX_uxn_opcodes_h_l1773_c7_da5e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1773_c7_da5e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1773_c7_da5e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1776_c11_1744]
signal BIN_OP_EQ_uxn_opcodes_h_l1776_c11_1744_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1776_c11_1744_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1776_c11_1744_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1776_c7_0248]
signal tmp8_high_MUX_uxn_opcodes_h_l1776_c7_0248_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1776_c7_0248_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1776_c7_0248_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1776_c7_0248_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1776_c7_0248]
signal tmp8_low_MUX_uxn_opcodes_h_l1776_c7_0248_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1776_c7_0248_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1776_c7_0248_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1776_c7_0248_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1776_c7_0248]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_0248_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_0248_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_0248_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_0248_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1776_c7_0248]
signal result_u8_value_MUX_uxn_opcodes_h_l1776_c7_0248_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1776_c7_0248_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1776_c7_0248_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1776_c7_0248_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1776_c7_0248]
signal result_u16_value_MUX_uxn_opcodes_h_l1776_c7_0248_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1776_c7_0248_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1776_c7_0248_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1776_c7_0248_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1776_c7_0248]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_0248_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_0248_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_0248_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_0248_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1776_c7_0248]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_0248_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_0248_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_0248_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_0248_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1776_c7_0248]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_0248_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_0248_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_0248_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_0248_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1776_c7_0248]
signal t16_MUX_uxn_opcodes_h_l1776_c7_0248_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1776_c7_0248_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1776_c7_0248_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1776_c7_0248_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1778_c3_8d07]
signal CONST_SL_8_uxn_opcodes_h_l1778_c3_8d07_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1778_c3_8d07_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1780_c11_82fc]
signal BIN_OP_EQ_uxn_opcodes_h_l1780_c11_82fc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1780_c11_82fc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1780_c11_82fc_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1780_c7_dddf]
signal tmp8_high_MUX_uxn_opcodes_h_l1780_c7_dddf_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1780_c7_dddf_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1780_c7_dddf_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1780_c7_dddf]
signal tmp8_low_MUX_uxn_opcodes_h_l1780_c7_dddf_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1780_c7_dddf_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1780_c7_dddf_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1780_c7_dddf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_dddf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_dddf_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_dddf_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1780_c7_dddf]
signal result_u8_value_MUX_uxn_opcodes_h_l1780_c7_dddf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1780_c7_dddf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1780_c7_dddf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1780_c7_dddf]
signal result_u16_value_MUX_uxn_opcodes_h_l1780_c7_dddf_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1780_c7_dddf_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1780_c7_dddf_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1780_c7_dddf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_dddf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_dddf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_dddf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1780_c7_dddf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_dddf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_dddf_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_dddf_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1780_c7_dddf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_dddf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_dddf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_dddf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1780_c7_dddf]
signal t16_MUX_uxn_opcodes_h_l1780_c7_dddf_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1780_c7_dddf_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1780_c7_dddf_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1781_c3_5235]
signal BIN_OP_OR_uxn_opcodes_h_l1781_c3_5235_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1781_c3_5235_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1781_c3_5235_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1782_c30_3ca8]
signal sp_relative_shift_uxn_opcodes_h_l1782_c30_3ca8_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1782_c30_3ca8_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1782_c30_3ca8_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1782_c30_3ca8_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1785_c11_fbc8]
signal BIN_OP_EQ_uxn_opcodes_h_l1785_c11_fbc8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1785_c11_fbc8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1785_c11_fbc8_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1785_c7_d806]
signal tmp8_high_MUX_uxn_opcodes_h_l1785_c7_d806_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1785_c7_d806_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1785_c7_d806_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1785_c7_d806_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1785_c7_d806]
signal tmp8_low_MUX_uxn_opcodes_h_l1785_c7_d806_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1785_c7_d806_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1785_c7_d806_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1785_c7_d806_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1785_c7_d806]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_d806_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_d806_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_d806_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_d806_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1785_c7_d806]
signal result_u8_value_MUX_uxn_opcodes_h_l1785_c7_d806_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1785_c7_d806_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1785_c7_d806_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1785_c7_d806_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1785_c7_d806]
signal result_u16_value_MUX_uxn_opcodes_h_l1785_c7_d806_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1785_c7_d806_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1785_c7_d806_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1785_c7_d806_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1785_c7_d806]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_d806_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_d806_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_d806_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_d806_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1785_c7_d806]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_d806_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_d806_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_d806_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_d806_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1785_c7_d806]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_d806_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_d806_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_d806_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_d806_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1787_c22_07f9]
signal BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_07f9_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_07f9_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_07f9_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1789_c11_f0b2]
signal BIN_OP_EQ_uxn_opcodes_h_l1789_c11_f0b2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1789_c11_f0b2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1789_c11_f0b2_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1789_c7_fa79]
signal tmp8_high_MUX_uxn_opcodes_h_l1789_c7_fa79_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1789_c7_fa79_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1789_c7_fa79_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1789_c7_fa79_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1789_c7_fa79]
signal tmp8_low_MUX_uxn_opcodes_h_l1789_c7_fa79_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1789_c7_fa79_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1789_c7_fa79_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1789_c7_fa79_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1789_c7_fa79]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_fa79_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_fa79_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_fa79_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_fa79_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1789_c7_fa79]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_fa79_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_fa79_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_fa79_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_fa79_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1789_c7_fa79]
signal result_u8_value_MUX_uxn_opcodes_h_l1789_c7_fa79_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1789_c7_fa79_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1789_c7_fa79_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1789_c7_fa79_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1789_c7_fa79]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_fa79_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_fa79_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_fa79_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_fa79_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1795_c11_2bd5]
signal BIN_OP_EQ_uxn_opcodes_h_l1795_c11_2bd5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1795_c11_2bd5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1795_c11_2bd5_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1795_c7_4f0e]
signal tmp8_low_MUX_uxn_opcodes_h_l1795_c7_4f0e_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1795_c7_4f0e_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1795_c7_4f0e_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1795_c7_4f0e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1795_c7_4f0e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_4f0e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_4f0e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_4f0e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_4f0e_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1795_c7_4f0e]
signal result_u8_value_MUX_uxn_opcodes_h_l1795_c7_4f0e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1795_c7_4f0e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1795_c7_4f0e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1795_c7_4f0e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1795_c7_4f0e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_4f0e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_4f0e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_4f0e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_4f0e_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_e393( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_ram_write := ref_toks_4;
      base.is_stack_index_flipped := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_vram_write := ref_toks_8;
      base.is_pc_updated := ref_toks_9;
      base.is_opc_done := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ff7f
BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ff7f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ff7f_left,
BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ff7f_right,
BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ff7f_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3139
tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3139 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3139_cond,
tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3139_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3139
tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3139 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3139_cond,
tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3139_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3139
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3139 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3139_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3139_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3139
result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3139 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3139_cond,
result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3139_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3139
result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3139 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3139_cond,
result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3139_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3139
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3139 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3139_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3139_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3139
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3139 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3139_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3139_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3139
result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3139 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3139_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3139_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3139
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3139 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3139_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3139_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3139
result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3139 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3139_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3139_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3139
result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3139 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3139_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3139_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3139
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3139 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3139_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3139_return_output);

-- t16_MUX_uxn_opcodes_h_l1760_c2_3139
t16_MUX_uxn_opcodes_h_l1760_c2_3139 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1760_c2_3139_cond,
t16_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue,
t16_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse,
t16_MUX_uxn_opcodes_h_l1760_c2_3139_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1773_c11_a790
BIN_OP_EQ_uxn_opcodes_h_l1773_c11_a790 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1773_c11_a790_left,
BIN_OP_EQ_uxn_opcodes_h_l1773_c11_a790_right,
BIN_OP_EQ_uxn_opcodes_h_l1773_c11_a790_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1773_c7_da5e
tmp8_high_MUX_uxn_opcodes_h_l1773_c7_da5e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1773_c7_da5e_cond,
tmp8_high_MUX_uxn_opcodes_h_l1773_c7_da5e_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1773_c7_da5e_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1773_c7_da5e
tmp8_low_MUX_uxn_opcodes_h_l1773_c7_da5e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1773_c7_da5e_cond,
tmp8_low_MUX_uxn_opcodes_h_l1773_c7_da5e_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1773_c7_da5e_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_da5e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_da5e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_da5e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_da5e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_da5e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1773_c7_da5e
result_u8_value_MUX_uxn_opcodes_h_l1773_c7_da5e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1773_c7_da5e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1773_c7_da5e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1773_c7_da5e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1773_c7_da5e
result_u16_value_MUX_uxn_opcodes_h_l1773_c7_da5e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1773_c7_da5e_cond,
result_u16_value_MUX_uxn_opcodes_h_l1773_c7_da5e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1773_c7_da5e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_da5e
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_da5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_da5e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_da5e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_da5e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_da5e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_da5e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_da5e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_da5e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_da5e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_da5e
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_da5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_da5e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_da5e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_da5e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output);

-- t16_MUX_uxn_opcodes_h_l1773_c7_da5e
t16_MUX_uxn_opcodes_h_l1773_c7_da5e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1773_c7_da5e_cond,
t16_MUX_uxn_opcodes_h_l1773_c7_da5e_iftrue,
t16_MUX_uxn_opcodes_h_l1773_c7_da5e_iffalse,
t16_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1776_c11_1744
BIN_OP_EQ_uxn_opcodes_h_l1776_c11_1744 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1776_c11_1744_left,
BIN_OP_EQ_uxn_opcodes_h_l1776_c11_1744_right,
BIN_OP_EQ_uxn_opcodes_h_l1776_c11_1744_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1776_c7_0248
tmp8_high_MUX_uxn_opcodes_h_l1776_c7_0248 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1776_c7_0248_cond,
tmp8_high_MUX_uxn_opcodes_h_l1776_c7_0248_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1776_c7_0248_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1776_c7_0248_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1776_c7_0248
tmp8_low_MUX_uxn_opcodes_h_l1776_c7_0248 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1776_c7_0248_cond,
tmp8_low_MUX_uxn_opcodes_h_l1776_c7_0248_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1776_c7_0248_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1776_c7_0248_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_0248
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_0248 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_0248_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_0248_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_0248_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_0248_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1776_c7_0248
result_u8_value_MUX_uxn_opcodes_h_l1776_c7_0248 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1776_c7_0248_cond,
result_u8_value_MUX_uxn_opcodes_h_l1776_c7_0248_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1776_c7_0248_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1776_c7_0248_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1776_c7_0248
result_u16_value_MUX_uxn_opcodes_h_l1776_c7_0248 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1776_c7_0248_cond,
result_u16_value_MUX_uxn_opcodes_h_l1776_c7_0248_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1776_c7_0248_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1776_c7_0248_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_0248
result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_0248 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_0248_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_0248_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_0248_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_0248_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_0248
result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_0248 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_0248_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_0248_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_0248_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_0248_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_0248
result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_0248 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_0248_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_0248_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_0248_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_0248_return_output);

-- t16_MUX_uxn_opcodes_h_l1776_c7_0248
t16_MUX_uxn_opcodes_h_l1776_c7_0248 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1776_c7_0248_cond,
t16_MUX_uxn_opcodes_h_l1776_c7_0248_iftrue,
t16_MUX_uxn_opcodes_h_l1776_c7_0248_iffalse,
t16_MUX_uxn_opcodes_h_l1776_c7_0248_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1778_c3_8d07
CONST_SL_8_uxn_opcodes_h_l1778_c3_8d07 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1778_c3_8d07_x,
CONST_SL_8_uxn_opcodes_h_l1778_c3_8d07_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1780_c11_82fc
BIN_OP_EQ_uxn_opcodes_h_l1780_c11_82fc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1780_c11_82fc_left,
BIN_OP_EQ_uxn_opcodes_h_l1780_c11_82fc_right,
BIN_OP_EQ_uxn_opcodes_h_l1780_c11_82fc_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1780_c7_dddf
tmp8_high_MUX_uxn_opcodes_h_l1780_c7_dddf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1780_c7_dddf_cond,
tmp8_high_MUX_uxn_opcodes_h_l1780_c7_dddf_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1780_c7_dddf_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1780_c7_dddf
tmp8_low_MUX_uxn_opcodes_h_l1780_c7_dddf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1780_c7_dddf_cond,
tmp8_low_MUX_uxn_opcodes_h_l1780_c7_dddf_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1780_c7_dddf_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_dddf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_dddf : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_dddf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_dddf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_dddf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1780_c7_dddf
result_u8_value_MUX_uxn_opcodes_h_l1780_c7_dddf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1780_c7_dddf_cond,
result_u8_value_MUX_uxn_opcodes_h_l1780_c7_dddf_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1780_c7_dddf_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1780_c7_dddf
result_u16_value_MUX_uxn_opcodes_h_l1780_c7_dddf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1780_c7_dddf_cond,
result_u16_value_MUX_uxn_opcodes_h_l1780_c7_dddf_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1780_c7_dddf_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_dddf
result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_dddf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_dddf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_dddf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_dddf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_dddf
result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_dddf : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_dddf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_dddf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_dddf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_dddf
result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_dddf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_dddf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_dddf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_dddf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output);

-- t16_MUX_uxn_opcodes_h_l1780_c7_dddf
t16_MUX_uxn_opcodes_h_l1780_c7_dddf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1780_c7_dddf_cond,
t16_MUX_uxn_opcodes_h_l1780_c7_dddf_iftrue,
t16_MUX_uxn_opcodes_h_l1780_c7_dddf_iffalse,
t16_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1781_c3_5235
BIN_OP_OR_uxn_opcodes_h_l1781_c3_5235 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1781_c3_5235_left,
BIN_OP_OR_uxn_opcodes_h_l1781_c3_5235_right,
BIN_OP_OR_uxn_opcodes_h_l1781_c3_5235_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1782_c30_3ca8
sp_relative_shift_uxn_opcodes_h_l1782_c30_3ca8 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1782_c30_3ca8_ins,
sp_relative_shift_uxn_opcodes_h_l1782_c30_3ca8_x,
sp_relative_shift_uxn_opcodes_h_l1782_c30_3ca8_y,
sp_relative_shift_uxn_opcodes_h_l1782_c30_3ca8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1785_c11_fbc8
BIN_OP_EQ_uxn_opcodes_h_l1785_c11_fbc8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1785_c11_fbc8_left,
BIN_OP_EQ_uxn_opcodes_h_l1785_c11_fbc8_right,
BIN_OP_EQ_uxn_opcodes_h_l1785_c11_fbc8_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1785_c7_d806
tmp8_high_MUX_uxn_opcodes_h_l1785_c7_d806 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1785_c7_d806_cond,
tmp8_high_MUX_uxn_opcodes_h_l1785_c7_d806_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1785_c7_d806_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1785_c7_d806_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1785_c7_d806
tmp8_low_MUX_uxn_opcodes_h_l1785_c7_d806 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1785_c7_d806_cond,
tmp8_low_MUX_uxn_opcodes_h_l1785_c7_d806_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1785_c7_d806_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1785_c7_d806_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_d806
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_d806 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_d806_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_d806_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_d806_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_d806_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1785_c7_d806
result_u8_value_MUX_uxn_opcodes_h_l1785_c7_d806 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1785_c7_d806_cond,
result_u8_value_MUX_uxn_opcodes_h_l1785_c7_d806_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1785_c7_d806_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1785_c7_d806_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1785_c7_d806
result_u16_value_MUX_uxn_opcodes_h_l1785_c7_d806 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1785_c7_d806_cond,
result_u16_value_MUX_uxn_opcodes_h_l1785_c7_d806_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1785_c7_d806_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1785_c7_d806_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_d806
result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_d806 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_d806_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_d806_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_d806_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_d806_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_d806
result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_d806 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_d806_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_d806_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_d806_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_d806_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_d806
result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_d806 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_d806_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_d806_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_d806_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_d806_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_07f9
BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_07f9 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_07f9_left,
BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_07f9_right,
BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_07f9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1789_c11_f0b2
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_f0b2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_f0b2_left,
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_f0b2_right,
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_f0b2_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1789_c7_fa79
tmp8_high_MUX_uxn_opcodes_h_l1789_c7_fa79 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1789_c7_fa79_cond,
tmp8_high_MUX_uxn_opcodes_h_l1789_c7_fa79_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1789_c7_fa79_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1789_c7_fa79_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1789_c7_fa79
tmp8_low_MUX_uxn_opcodes_h_l1789_c7_fa79 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1789_c7_fa79_cond,
tmp8_low_MUX_uxn_opcodes_h_l1789_c7_fa79_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1789_c7_fa79_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1789_c7_fa79_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_fa79
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_fa79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_fa79_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_fa79_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_fa79_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_fa79_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_fa79
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_fa79 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_fa79_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_fa79_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_fa79_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_fa79_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1789_c7_fa79
result_u8_value_MUX_uxn_opcodes_h_l1789_c7_fa79 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1789_c7_fa79_cond,
result_u8_value_MUX_uxn_opcodes_h_l1789_c7_fa79_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1789_c7_fa79_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1789_c7_fa79_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_fa79
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_fa79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_fa79_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_fa79_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_fa79_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_fa79_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1795_c11_2bd5
BIN_OP_EQ_uxn_opcodes_h_l1795_c11_2bd5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1795_c11_2bd5_left,
BIN_OP_EQ_uxn_opcodes_h_l1795_c11_2bd5_right,
BIN_OP_EQ_uxn_opcodes_h_l1795_c11_2bd5_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1795_c7_4f0e
tmp8_low_MUX_uxn_opcodes_h_l1795_c7_4f0e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1795_c7_4f0e_cond,
tmp8_low_MUX_uxn_opcodes_h_l1795_c7_4f0e_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1795_c7_4f0e_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1795_c7_4f0e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_4f0e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_4f0e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_4f0e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_4f0e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_4f0e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_4f0e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1795_c7_4f0e
result_u8_value_MUX_uxn_opcodes_h_l1795_c7_4f0e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1795_c7_4f0e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1795_c7_4f0e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1795_c7_4f0e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1795_c7_4f0e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_4f0e
result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_4f0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_4f0e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_4f0e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_4f0e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_4f0e_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ff7f_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3139_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3139_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3139_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3139_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3139_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3139_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3139_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3139_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3139_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3139_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3139_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3139_return_output,
 t16_MUX_uxn_opcodes_h_l1760_c2_3139_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1773_c11_a790_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output,
 t16_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1776_c11_1744_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1776_c7_0248_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1776_c7_0248_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_0248_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1776_c7_0248_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1776_c7_0248_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_0248_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_0248_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_0248_return_output,
 t16_MUX_uxn_opcodes_h_l1776_c7_0248_return_output,
 CONST_SL_8_uxn_opcodes_h_l1778_c3_8d07_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1780_c11_82fc_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output,
 t16_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1781_c3_5235_return_output,
 sp_relative_shift_uxn_opcodes_h_l1782_c30_3ca8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1785_c11_fbc8_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1785_c7_d806_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1785_c7_d806_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_d806_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1785_c7_d806_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1785_c7_d806_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_d806_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_d806_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_d806_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_07f9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1789_c11_f0b2_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1789_c7_fa79_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1789_c7_fa79_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_fa79_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_fa79_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1789_c7_fa79_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_fa79_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1795_c11_2bd5_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1795_c7_4f0e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_4f0e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1795_c7_4f0e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_4f0e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ff7f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ff7f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ff7f_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3139_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3139_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3139_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3139_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1770_c3_6f76 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3139_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3139_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3139_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3139_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3139_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3139_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1760_c2_3139_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3139_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3139_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1760_c2_3139_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3139_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3139_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3139_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3139_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1765_c3_38c7 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3139_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3139_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1760_c2_3139_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3139_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3139_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1760_c2_3139_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3139_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3139_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3139_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3139_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1760_c2_3139_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1760_c2_3139_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_a790_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_a790_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_a790_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_da5e_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_da5e_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_0248_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_da5e_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_da5e_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_da5e_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_0248_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_da5e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_da5e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1774_c3_4dca : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_da5e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_0248_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_da5e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_da5e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_da5e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_0248_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_da5e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_da5e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_da5e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_0248_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_da5e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_da5e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_da5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_0248_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_da5e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_da5e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_da5e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_0248_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_da5e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_da5e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_da5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_0248_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_da5e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1773_c7_da5e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1773_c7_da5e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1776_c7_0248_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1773_c7_da5e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_1744_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_1744_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_1744_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_0248_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_0248_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_0248_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_0248_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_0248_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_0248_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_0248_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_0248_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_0248_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_0248_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_0248_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_0248_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_0248_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_0248_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_0248_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_0248_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_0248_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_0248_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_0248_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_0248_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_0248_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_0248_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_0248_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_0248_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1776_c7_0248_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1776_c7_0248_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1776_c7_0248_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1778_c3_8d07_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1778_c3_8d07_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_82fc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_82fc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_82fc_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_dddf_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_dddf_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_d806_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_dddf_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_dddf_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_dddf_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_d806_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_dddf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_dddf_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_dddf_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_d806_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_dddf_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_dddf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_dddf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_d806_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_dddf_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_dddf_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_dddf_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_d806_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_dddf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_dddf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_dddf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_d806_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_dddf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_dddf_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_dddf_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_d806_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_dddf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_dddf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_dddf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_d806_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_dddf_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1780_c7_dddf_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1780_c7_dddf_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1780_c7_dddf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_5235_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_5235_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_5235_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_3ca8_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_3ca8_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_3ca8_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_3ca8_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_fbc8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_fbc8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_fbc8_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_d806_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_d806_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_fa79_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_d806_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_d806_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_d806_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_fa79_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_d806_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_d806_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_d806_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_fa79_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_d806_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_d806_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_d806_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_fa79_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_d806_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_d806_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1787_c3_fc4d : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_d806_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_d806_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_d806_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_d806_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_fa79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_d806_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_d806_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1786_c3_534e : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_d806_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_d806_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_d806_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_d806_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_fa79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_d806_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_07f9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_07f9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_07f9_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_f0b2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_f0b2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_f0b2_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_fa79_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_fa79_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_fa79_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_fa79_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_fa79_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_4f0e_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_fa79_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_fa79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_fa79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_fa79_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_fa79_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1792_c3_60a7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_fa79_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_4f0e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_fa79_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_fa79_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_fa79_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_4f0e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_fa79_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_fa79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_fa79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_4f0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_fa79_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_2bd5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_2bd5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_2bd5_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_4f0e_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_4f0e_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_4f0e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_4f0e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1797_c3_fa6f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_4f0e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_4f0e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_4f0e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_4f0e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_4f0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_4f0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_4f0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_4f0e_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1785_l1780_l1776_l1773_l1760_l1795_DUPLICATE_0c7d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1773_l1785_l1776_l1760_DUPLICATE_3af4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1789_l1785_l1780_l1776_l1773_DUPLICATE_d9ec_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1773_l1785_l1776_DUPLICATE_aba2_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1789_l1785_l1780_l1776_l1773_l1795_DUPLICATE_4048_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1781_l1777_DUPLICATE_b289_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1785_l1776_l1780_l1795_DUPLICATE_4dd5_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e393_uxn_opcodes_h_l1802_l1755_DUPLICATE_9ce2_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_4f0e_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1786_c3_534e := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_d806_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1786_c3_534e;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_a790_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ff7f_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_fa79_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_1744_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_07f9_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_fbc8_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_3ca8_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1774_c3_4dca := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_da5e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1774_c3_4dca;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_3ca8_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1770_c3_6f76 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1770_c3_6f76;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1797_c3_fa6f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_4f0e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1797_c3_fa6f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_f0b2_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_2bd5_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1792_c3_60a7 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_fa79_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1792_c3_60a7;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1765_c3_38c7 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1765_c3_38c7;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_82fc_right := to_unsigned(3, 2);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_3ca8_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ff7f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_a790_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_1744_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_82fc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_fbc8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_f0b2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_2bd5_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_fa79_iftrue := VAR_previous_ram_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_4f0e_iftrue := VAR_previous_ram_read;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_fa79_iftrue := VAR_previous_ram_read;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_4f0e_iftrue := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_5235_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_07f9_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1773_c7_da5e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1780_c7_dddf_iffalse := t16;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_da5e_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_0248_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_dddf_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_d806_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_fa79_iffalse := tmp8_high;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_da5e_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_0248_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_dddf_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_d806_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_fa79_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_4f0e_iffalse := tmp8_low;
     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1760_c2_3139] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1760_c2_3139_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1773_l1785_l1776_DUPLICATE_aba2 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1773_l1785_l1776_DUPLICATE_aba2_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1785_l1776_l1780_l1795_DUPLICATE_4dd5 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1785_l1776_l1780_l1795_DUPLICATE_4dd5_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1780_c11_82fc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1780_c11_82fc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_82fc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1780_c11_82fc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_82fc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_82fc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1780_c11_82fc_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1760_c2_3139] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1760_c2_3139_return_output := result.is_pc_updated;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1787_c22_07f9] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_07f9_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_07f9_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_07f9_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_07f9_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_07f9_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_07f9_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1785_l1780_l1776_l1773_l1760_l1795_DUPLICATE_0c7d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1785_l1780_l1776_l1773_l1760_l1795_DUPLICATE_0c7d_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1795_c11_2bd5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1795_c11_2bd5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_2bd5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1795_c11_2bd5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_2bd5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_2bd5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1795_c11_2bd5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1776_c11_1744] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1776_c11_1744_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_1744_left;
     BIN_OP_EQ_uxn_opcodes_h_l1776_c11_1744_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_1744_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_1744_return_output := BIN_OP_EQ_uxn_opcodes_h_l1776_c11_1744_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1760_c6_ff7f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ff7f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ff7f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ff7f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ff7f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ff7f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ff7f_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1782_c30_3ca8] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1782_c30_3ca8_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_3ca8_ins;
     sp_relative_shift_uxn_opcodes_h_l1782_c30_3ca8_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_3ca8_x;
     sp_relative_shift_uxn_opcodes_h_l1782_c30_3ca8_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_3ca8_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_3ca8_return_output := sp_relative_shift_uxn_opcodes_h_l1782_c30_3ca8_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1773_l1785_l1776_l1760_DUPLICATE_3af4 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1773_l1785_l1776_l1760_DUPLICATE_3af4_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1789_l1785_l1780_l1776_l1773_l1795_DUPLICATE_4048 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1789_l1785_l1780_l1776_l1773_l1795_DUPLICATE_4048_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1773_c11_a790] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1773_c11_a790_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_a790_left;
     BIN_OP_EQ_uxn_opcodes_h_l1773_c11_a790_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_a790_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_a790_return_output := BIN_OP_EQ_uxn_opcodes_h_l1773_c11_a790_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1781_l1777_DUPLICATE_b289 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1781_l1777_DUPLICATE_b289_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1789_c11_f0b2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1789_c11_f0b2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_f0b2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1789_c11_f0b2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_f0b2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_f0b2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1789_c11_f0b2_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1760_c2_3139] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1760_c2_3139_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1789_l1785_l1780_l1776_l1773_DUPLICATE_d9ec LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1789_l1785_l1780_l1776_l1773_DUPLICATE_d9ec_return_output := result.is_stack_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1760_c2_3139] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1760_c2_3139_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1785_c11_fbc8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1785_c11_fbc8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_fbc8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1785_c11_fbc8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_fbc8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_fbc8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1785_c11_fbc8_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3139_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ff7f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3139_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ff7f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3139_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ff7f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3139_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ff7f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3139_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ff7f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3139_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ff7f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3139_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ff7f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3139_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ff7f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3139_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ff7f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3139_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ff7f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1760_c2_3139_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ff7f_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3139_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ff7f_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3139_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ff7f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_da5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_a790_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_da5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_a790_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_da5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_a790_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_da5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_a790_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_da5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_a790_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_da5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_a790_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1773_c7_da5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_a790_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_da5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_a790_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_da5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_a790_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_0248_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_1744_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_0248_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_1744_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_0248_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_1744_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_0248_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_1744_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_0248_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_1744_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_0248_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_1744_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1776_c7_0248_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_1744_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_0248_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_1744_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_0248_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_1744_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_dddf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_82fc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_dddf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_82fc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_dddf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_82fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_dddf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_82fc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_dddf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_82fc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_dddf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_82fc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1780_c7_dddf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_82fc_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_dddf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_82fc_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_dddf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_82fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_d806_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_fbc8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_d806_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_fbc8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_d806_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_fbc8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_d806_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_fbc8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_d806_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_fbc8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_d806_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_fbc8_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_d806_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_fbc8_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_d806_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_fbc8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_fa79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_f0b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_fa79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_f0b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_fa79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_f0b2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_fa79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_f0b2_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_fa79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_f0b2_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_fa79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_f0b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_4f0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_2bd5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_4f0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_2bd5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_4f0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_2bd5_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_4f0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_2bd5_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1787_c3_fc4d := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_07f9_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_5235_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1781_l1777_DUPLICATE_b289_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1778_c3_8d07_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1781_l1777_DUPLICATE_b289_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_da5e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1773_l1785_l1776_DUPLICATE_aba2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_0248_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1773_l1785_l1776_DUPLICATE_aba2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_d806_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1773_l1785_l1776_DUPLICATE_aba2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1773_l1785_l1776_l1760_DUPLICATE_3af4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_da5e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1773_l1785_l1776_l1760_DUPLICATE_3af4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_0248_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1773_l1785_l1776_l1760_DUPLICATE_3af4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_d806_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1773_l1785_l1776_l1760_DUPLICATE_3af4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_da5e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1789_l1785_l1780_l1776_l1773_l1795_DUPLICATE_4048_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_0248_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1789_l1785_l1780_l1776_l1773_l1795_DUPLICATE_4048_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_dddf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1789_l1785_l1780_l1776_l1773_l1795_DUPLICATE_4048_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_d806_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1789_l1785_l1780_l1776_l1773_l1795_DUPLICATE_4048_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_fa79_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1789_l1785_l1780_l1776_l1773_l1795_DUPLICATE_4048_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_4f0e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1789_l1785_l1780_l1776_l1773_l1795_DUPLICATE_4048_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_da5e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1789_l1785_l1780_l1776_l1773_DUPLICATE_d9ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_0248_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1789_l1785_l1780_l1776_l1773_DUPLICATE_d9ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_dddf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1789_l1785_l1780_l1776_l1773_DUPLICATE_d9ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_d806_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1789_l1785_l1780_l1776_l1773_DUPLICATE_d9ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_fa79_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1789_l1785_l1780_l1776_l1773_DUPLICATE_d9ec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_0248_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1785_l1776_l1780_l1795_DUPLICATE_4dd5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_dddf_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1785_l1776_l1780_l1795_DUPLICATE_4dd5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_d806_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1785_l1776_l1780_l1795_DUPLICATE_4dd5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_4f0e_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1785_l1776_l1780_l1795_DUPLICATE_4dd5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1785_l1780_l1776_l1773_l1760_l1795_DUPLICATE_0c7d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_da5e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1785_l1780_l1776_l1773_l1760_l1795_DUPLICATE_0c7d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_0248_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1785_l1780_l1776_l1773_l1760_l1795_DUPLICATE_0c7d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_dddf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1785_l1780_l1776_l1773_l1760_l1795_DUPLICATE_0c7d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_d806_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1785_l1780_l1776_l1773_l1760_l1795_DUPLICATE_0c7d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_4f0e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1785_l1780_l1776_l1773_l1760_l1795_DUPLICATE_0c7d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1760_c2_3139_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1760_c2_3139_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1760_c2_3139_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1760_c2_3139_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_dddf_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_3ca8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_d806_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1787_c3_fc4d;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1795_c7_4f0e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_4f0e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_4f0e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_4f0e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_4f0e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_4f0e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_4f0e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_4f0e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_4f0e_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1785_c7_d806] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1785_c7_d806_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_d806_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1785_c7_d806_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_d806_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1785_c7_d806_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_d806_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_d806_return_output := result_u16_value_MUX_uxn_opcodes_h_l1785_c7_d806_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1789_c7_fa79] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_fa79_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_fa79_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_fa79_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_fa79_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_fa79_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_fa79_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_fa79_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_fa79_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1785_c7_d806] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_d806_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_d806_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_d806_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_d806_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_d806_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_d806_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_d806_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_d806_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1789_c7_fa79] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1789_c7_fa79_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_fa79_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1789_c7_fa79_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_fa79_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1789_c7_fa79_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_fa79_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_fa79_return_output := tmp8_high_MUX_uxn_opcodes_h_l1789_c7_fa79_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1760_c2_3139] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3139_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3139_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3139_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3139_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1760_c2_3139] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3139_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3139_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3139_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3139_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1760_c2_3139] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3139_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3139_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3139_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3139_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1781_c3_5235] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1781_c3_5235_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_5235_left;
     BIN_OP_OR_uxn_opcodes_h_l1781_c3_5235_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_5235_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_5235_return_output := BIN_OP_OR_uxn_opcodes_h_l1781_c3_5235_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1795_c7_4f0e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1795_c7_4f0e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_4f0e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1795_c7_4f0e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_4f0e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1795_c7_4f0e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_4f0e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_4f0e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1795_c7_4f0e_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1795_c7_4f0e] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1795_c7_4f0e_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_4f0e_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1795_c7_4f0e_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_4f0e_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1795_c7_4f0e_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_4f0e_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_4f0e_return_output := tmp8_low_MUX_uxn_opcodes_h_l1795_c7_4f0e_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1778_c3_8d07] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1778_c3_8d07_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1778_c3_8d07_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1778_c3_8d07_return_output := CONST_SL_8_uxn_opcodes_h_l1778_c3_8d07_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1795_c7_4f0e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_4f0e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_4f0e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_4f0e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_4f0e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_4f0e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_4f0e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_4f0e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_4f0e_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1760_c2_3139] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3139_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3139_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3139_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3139_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_dddf_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_5235_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1780_c7_dddf_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_5235_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1776_c7_0248_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1778_c3_8d07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_fa79_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_4f0e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_d806_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_fa79_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_dddf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_d806_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_fa79_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_4f0e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_dddf_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_d806_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_fa79_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_4f0e_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_d806_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_fa79_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_fa79_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_4f0e_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1780_c7_dddf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_dddf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_dddf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_dddf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_dddf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_dddf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_dddf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1785_c7_d806] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_d806_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_d806_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_d806_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_d806_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_d806_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_d806_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_d806_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_d806_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1789_c7_fa79] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1789_c7_fa79_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_fa79_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1789_c7_fa79_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_fa79_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1789_c7_fa79_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_fa79_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_fa79_return_output := result_u8_value_MUX_uxn_opcodes_h_l1789_c7_fa79_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1785_c7_d806] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1785_c7_d806_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_d806_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1785_c7_d806_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_d806_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1785_c7_d806_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_d806_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_d806_return_output := tmp8_high_MUX_uxn_opcodes_h_l1785_c7_d806_return_output;

     -- t16_MUX[uxn_opcodes_h_l1780_c7_dddf] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1780_c7_dddf_cond <= VAR_t16_MUX_uxn_opcodes_h_l1780_c7_dddf_cond;
     t16_MUX_uxn_opcodes_h_l1780_c7_dddf_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1780_c7_dddf_iftrue;
     t16_MUX_uxn_opcodes_h_l1780_c7_dddf_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1780_c7_dddf_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output := t16_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1780_c7_dddf] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1780_c7_dddf_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_dddf_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1780_c7_dddf_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_dddf_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1780_c7_dddf_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_dddf_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output := result_u16_value_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1789_c7_fa79] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_fa79_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_fa79_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_fa79_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_fa79_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_fa79_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_fa79_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_fa79_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_fa79_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1789_c7_fa79] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_fa79_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_fa79_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_fa79_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_fa79_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_fa79_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_fa79_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_fa79_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_fa79_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1789_c7_fa79] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1789_c7_fa79_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_fa79_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1789_c7_fa79_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_fa79_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1789_c7_fa79_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_fa79_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_fa79_return_output := tmp8_low_MUX_uxn_opcodes_h_l1789_c7_fa79_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_d806_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_fa79_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_dddf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_d806_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_0248_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_d806_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_fa79_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_0248_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_d806_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_fa79_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1776_c7_0248_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_dddf_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_d806_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_d806_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_fa79_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1785_c7_d806] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_d806_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_d806_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_d806_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_d806_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_d806_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_d806_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_d806_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_d806_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1785_c7_d806] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1785_c7_d806_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_d806_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1785_c7_d806_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_d806_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1785_c7_d806_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_d806_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_d806_return_output := tmp8_low_MUX_uxn_opcodes_h_l1785_c7_d806_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1780_c7_dddf] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1780_c7_dddf_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_dddf_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1780_c7_dddf_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_dddf_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1780_c7_dddf_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_dddf_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output := tmp8_high_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1780_c7_dddf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_dddf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_dddf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_dddf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_dddf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_dddf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_dddf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1776_c7_0248] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1776_c7_0248_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_0248_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1776_c7_0248_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_0248_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1776_c7_0248_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_0248_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_0248_return_output := result_u16_value_MUX_uxn_opcodes_h_l1776_c7_0248_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1785_c7_d806] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_d806_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_d806_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_d806_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_d806_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_d806_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_d806_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_d806_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_d806_return_output;

     -- t16_MUX[uxn_opcodes_h_l1776_c7_0248] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1776_c7_0248_cond <= VAR_t16_MUX_uxn_opcodes_h_l1776_c7_0248_cond;
     t16_MUX_uxn_opcodes_h_l1776_c7_0248_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1776_c7_0248_iftrue;
     t16_MUX_uxn_opcodes_h_l1776_c7_0248_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1776_c7_0248_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1776_c7_0248_return_output := t16_MUX_uxn_opcodes_h_l1776_c7_0248_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1776_c7_0248] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_0248_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_0248_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_0248_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_0248_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_0248_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_0248_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_0248_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_0248_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1785_c7_d806] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1785_c7_d806_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_d806_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1785_c7_d806_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_d806_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1785_c7_d806_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_d806_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_d806_return_output := result_u8_value_MUX_uxn_opcodes_h_l1785_c7_d806_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_dddf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_d806_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_0248_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_da5e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_0248_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_dddf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_d806_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_da5e_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_0248_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_dddf_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_d806_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1773_c7_da5e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1776_c7_0248_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_0248_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_dddf_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_d806_return_output;
     -- t16_MUX[uxn_opcodes_h_l1773_c7_da5e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1773_c7_da5e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1773_c7_da5e_cond;
     t16_MUX_uxn_opcodes_h_l1773_c7_da5e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1773_c7_da5e_iftrue;
     t16_MUX_uxn_opcodes_h_l1773_c7_da5e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1773_c7_da5e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output := t16_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1780_c7_dddf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1780_c7_dddf_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_dddf_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1780_c7_dddf_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_dddf_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1780_c7_dddf_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_dddf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output := result_u8_value_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1776_c7_0248] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_0248_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_0248_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_0248_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_0248_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_0248_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_0248_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_0248_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_0248_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1773_c7_da5e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1773_c7_da5e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_da5e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1773_c7_da5e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_da5e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1773_c7_da5e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_da5e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output := result_u16_value_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1780_c7_dddf] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1780_c7_dddf_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_dddf_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1780_c7_dddf_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_dddf_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1780_c7_dddf_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_dddf_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output := tmp8_low_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1776_c7_0248] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1776_c7_0248_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_0248_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1776_c7_0248_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_0248_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1776_c7_0248_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_0248_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_0248_return_output := tmp8_high_MUX_uxn_opcodes_h_l1776_c7_0248_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1780_c7_dddf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_dddf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_dddf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_dddf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_dddf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_dddf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_dddf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1780_c7_dddf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_dddf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_dddf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_dddf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_dddf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_dddf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_dddf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1773_c7_da5e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_da5e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_da5e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_da5e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_da5e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_da5e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_da5e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_0248_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_da5e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_0248_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_0248_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_0248_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_da5e_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_0248_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_0248_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_dddf_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1776_c7_0248] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_0248_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_0248_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_0248_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_0248_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_0248_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_0248_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_0248_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_0248_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1760_c2_3139] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3139_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3139_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3139_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3139_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1773_c7_da5e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_da5e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_da5e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_da5e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_da5e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_da5e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_da5e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1776_c7_0248] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1776_c7_0248_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_0248_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1776_c7_0248_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_0248_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1776_c7_0248_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_0248_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_0248_return_output := result_u8_value_MUX_uxn_opcodes_h_l1776_c7_0248_return_output;

     -- t16_MUX[uxn_opcodes_h_l1760_c2_3139] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1760_c2_3139_cond <= VAR_t16_MUX_uxn_opcodes_h_l1760_c2_3139_cond;
     t16_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue;
     t16_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1760_c2_3139_return_output := t16_MUX_uxn_opcodes_h_l1760_c2_3139_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1776_c7_0248] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_0248_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_0248_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_0248_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_0248_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_0248_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_0248_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_0248_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_0248_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1773_c7_da5e] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1773_c7_da5e_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_da5e_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1773_c7_da5e_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_da5e_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1773_c7_da5e_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_da5e_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output := tmp8_high_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1776_c7_0248] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1776_c7_0248_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_0248_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1776_c7_0248_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_0248_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1776_c7_0248_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_0248_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_0248_return_output := tmp8_low_MUX_uxn_opcodes_h_l1776_c7_0248_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1760_c2_3139] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3139_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3139_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3139_return_output := result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3139_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_da5e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_0248_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_da5e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_0248_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_da5e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_0248_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1760_c2_3139_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_da5e_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_0248_return_output;
     -- tmp8_high_MUX[uxn_opcodes_h_l1760_c2_3139] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3139_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3139_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3139_return_output := tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3139_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1773_c7_da5e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_da5e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_da5e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_da5e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_da5e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_da5e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_da5e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1773_c7_da5e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_da5e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_da5e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_da5e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_da5e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_da5e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_da5e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1773_c7_da5e] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1773_c7_da5e_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_da5e_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1773_c7_da5e_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_da5e_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1773_c7_da5e_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_da5e_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output := tmp8_low_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1773_c7_da5e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1773_c7_da5e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_da5e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1773_c7_da5e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_da5e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1773_c7_da5e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_da5e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1760_c2_3139] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3139_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3139_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3139_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3139_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output;
     REG_VAR_tmp8_high := VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3139_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_da5e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1760_c2_3139] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3139_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3139_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3139_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3139_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1760_c2_3139] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3139_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3139_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3139_return_output := tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3139_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1760_c2_3139] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3139_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3139_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3139_return_output := result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3139_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1760_c2_3139] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3139_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3139_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3139_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3139_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3139_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3139_return_output;

     -- Submodule level 8
     REG_VAR_tmp8_low := VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3139_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e393_uxn_opcodes_h_l1802_l1755_DUPLICATE_9ce2 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e393_uxn_opcodes_h_l1802_l1755_DUPLICATE_9ce2_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e393(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3139_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3139_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3139_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3139_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3139_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3139_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3139_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3139_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3139_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3139_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e393_uxn_opcodes_h_l1802_l1755_DUPLICATE_9ce2_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e393_uxn_opcodes_h_l1802_l1755_DUPLICATE_9ce2_return_output;
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
