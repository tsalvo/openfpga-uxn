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
-- BIN_OP_EQ[uxn_opcodes_h_l1760_c6_2e58]
signal BIN_OP_EQ_uxn_opcodes_h_l1760_c6_2e58_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1760_c6_2e58_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1760_c6_2e58_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1760_c2_b769]
signal t16_MUX_uxn_opcodes_h_l1760_c2_b769_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1760_c2_b769_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1760_c2_b769]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_b769_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_b769_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1760_c2_b769]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_b769_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_b769_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1760_c2_b769]
signal result_u16_value_MUX_uxn_opcodes_h_l1760_c2_b769_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1760_c2_b769_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1760_c2_b769]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_b769_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_b769_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1760_c2_b769]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_b769_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_b769_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1760_c2_b769]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_b769_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_b769_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1760_c2_b769]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_b769_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_b769_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1760_c2_b769]
signal result_u8_value_MUX_uxn_opcodes_h_l1760_c2_b769_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1760_c2_b769_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1760_c2_b769]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_b769_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_b769_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1760_c2_b769]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_b769_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_b769_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1760_c2_b769]
signal tmp8_high_MUX_uxn_opcodes_h_l1760_c2_b769_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1760_c2_b769_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1760_c2_b769]
signal tmp8_low_MUX_uxn_opcodes_h_l1760_c2_b769_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1760_c2_b769_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1773_c11_3257]
signal BIN_OP_EQ_uxn_opcodes_h_l1773_c11_3257_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1773_c11_3257_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1773_c11_3257_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1773_c7_5bff]
signal t16_MUX_uxn_opcodes_h_l1773_c7_5bff_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1773_c7_5bff_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1773_c7_5bff_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1773_c7_5bff]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_5bff_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_5bff_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_5bff_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1773_c7_5bff]
signal result_u16_value_MUX_uxn_opcodes_h_l1773_c7_5bff_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1773_c7_5bff_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1773_c7_5bff_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1773_c7_5bff]
signal result_u8_value_MUX_uxn_opcodes_h_l1773_c7_5bff_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1773_c7_5bff_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1773_c7_5bff_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1773_c7_5bff]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_5bff_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_5bff_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_5bff_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1773_c7_5bff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_5bff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_5bff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_5bff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1773_c7_5bff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_5bff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_5bff_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_5bff_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output : unsigned(3 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1773_c7_5bff]
signal tmp8_high_MUX_uxn_opcodes_h_l1773_c7_5bff_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1773_c7_5bff_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1773_c7_5bff_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1773_c7_5bff]
signal tmp8_low_MUX_uxn_opcodes_h_l1773_c7_5bff_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1773_c7_5bff_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1773_c7_5bff_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1776_c11_edcd]
signal BIN_OP_EQ_uxn_opcodes_h_l1776_c11_edcd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1776_c11_edcd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1776_c11_edcd_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1776_c7_76da]
signal t16_MUX_uxn_opcodes_h_l1776_c7_76da_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1776_c7_76da_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1776_c7_76da_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1776_c7_76da_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1776_c7_76da]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_76da_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_76da_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_76da_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_76da_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1776_c7_76da]
signal result_u16_value_MUX_uxn_opcodes_h_l1776_c7_76da_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1776_c7_76da_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1776_c7_76da_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1776_c7_76da_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1776_c7_76da]
signal result_u8_value_MUX_uxn_opcodes_h_l1776_c7_76da_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1776_c7_76da_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1776_c7_76da_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1776_c7_76da_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1776_c7_76da]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_76da_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_76da_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_76da_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_76da_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1776_c7_76da]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_76da_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_76da_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_76da_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_76da_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1776_c7_76da]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_76da_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_76da_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_76da_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_76da_return_output : unsigned(3 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1776_c7_76da]
signal tmp8_high_MUX_uxn_opcodes_h_l1776_c7_76da_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1776_c7_76da_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1776_c7_76da_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1776_c7_76da_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1776_c7_76da]
signal tmp8_low_MUX_uxn_opcodes_h_l1776_c7_76da_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1776_c7_76da_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1776_c7_76da_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1776_c7_76da_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1778_c3_728d]
signal CONST_SL_8_uxn_opcodes_h_l1778_c3_728d_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1778_c3_728d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1780_c11_3f97]
signal BIN_OP_EQ_uxn_opcodes_h_l1780_c11_3f97_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1780_c11_3f97_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1780_c11_3f97_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1780_c7_f67c]
signal t16_MUX_uxn_opcodes_h_l1780_c7_f67c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1780_c7_f67c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1780_c7_f67c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1780_c7_f67c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_f67c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_f67c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_f67c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1780_c7_f67c]
signal result_u16_value_MUX_uxn_opcodes_h_l1780_c7_f67c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1780_c7_f67c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1780_c7_f67c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1780_c7_f67c]
signal result_u8_value_MUX_uxn_opcodes_h_l1780_c7_f67c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1780_c7_f67c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1780_c7_f67c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1780_c7_f67c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_f67c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_f67c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_f67c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1780_c7_f67c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_f67c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_f67c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_f67c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1780_c7_f67c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_f67c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_f67c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_f67c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output : unsigned(3 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1780_c7_f67c]
signal tmp8_high_MUX_uxn_opcodes_h_l1780_c7_f67c_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1780_c7_f67c_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1780_c7_f67c_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1780_c7_f67c]
signal tmp8_low_MUX_uxn_opcodes_h_l1780_c7_f67c_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1780_c7_f67c_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1780_c7_f67c_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1781_c3_9d3f]
signal BIN_OP_OR_uxn_opcodes_h_l1781_c3_9d3f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1781_c3_9d3f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1781_c3_9d3f_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1782_c30_3b38]
signal sp_relative_shift_uxn_opcodes_h_l1782_c30_3b38_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1782_c30_3b38_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1782_c30_3b38_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1782_c30_3b38_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1785_c11_5894]
signal BIN_OP_EQ_uxn_opcodes_h_l1785_c11_5894_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1785_c11_5894_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1785_c11_5894_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1785_c7_ba77]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_ba77_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_ba77_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_ba77_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1785_c7_ba77]
signal result_u16_value_MUX_uxn_opcodes_h_l1785_c7_ba77_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1785_c7_ba77_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1785_c7_ba77_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1785_c7_ba77]
signal result_u8_value_MUX_uxn_opcodes_h_l1785_c7_ba77_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1785_c7_ba77_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1785_c7_ba77_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1785_c7_ba77]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_ba77_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_ba77_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_ba77_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1785_c7_ba77]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_ba77_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_ba77_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_ba77_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1785_c7_ba77]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_ba77_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_ba77_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_ba77_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output : unsigned(3 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1785_c7_ba77]
signal tmp8_high_MUX_uxn_opcodes_h_l1785_c7_ba77_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1785_c7_ba77_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1785_c7_ba77_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1785_c7_ba77]
signal tmp8_low_MUX_uxn_opcodes_h_l1785_c7_ba77_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1785_c7_ba77_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1785_c7_ba77_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1787_c22_1f6c]
signal BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_1f6c_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_1f6c_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_1f6c_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1789_c11_aa35]
signal BIN_OP_EQ_uxn_opcodes_h_l1789_c11_aa35_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1789_c11_aa35_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1789_c11_aa35_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1789_c7_8052]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_8052_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_8052_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_8052_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_8052_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1789_c7_8052]
signal result_u8_value_MUX_uxn_opcodes_h_l1789_c7_8052_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1789_c7_8052_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1789_c7_8052_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1789_c7_8052_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1789_c7_8052]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_8052_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_8052_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_8052_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_8052_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1789_c7_8052]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_8052_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_8052_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_8052_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_8052_return_output : unsigned(3 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1789_c7_8052]
signal tmp8_high_MUX_uxn_opcodes_h_l1789_c7_8052_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1789_c7_8052_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1789_c7_8052_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1789_c7_8052_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1789_c7_8052]
signal tmp8_low_MUX_uxn_opcodes_h_l1789_c7_8052_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1789_c7_8052_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1789_c7_8052_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1789_c7_8052_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1795_c11_3566]
signal BIN_OP_EQ_uxn_opcodes_h_l1795_c11_3566_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1795_c11_3566_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1795_c11_3566_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1795_c7_9cea]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_9cea_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_9cea_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_9cea_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_9cea_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1795_c7_9cea]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_9cea_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_9cea_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_9cea_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_9cea_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1795_c7_9cea]
signal result_u8_value_MUX_uxn_opcodes_h_l1795_c7_9cea_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1795_c7_9cea_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1795_c7_9cea_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1795_c7_9cea_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1795_c7_9cea]
signal tmp8_low_MUX_uxn_opcodes_h_l1795_c7_9cea_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1795_c7_9cea_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1795_c7_9cea_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1795_c7_9cea_return_output : unsigned(7 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_c942( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_stack_index_flipped := ref_toks_7;
      base.u8_value := ref_toks_8;
      base.is_pc_updated := ref_toks_9;
      base.is_vram_write := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1760_c6_2e58
BIN_OP_EQ_uxn_opcodes_h_l1760_c6_2e58 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1760_c6_2e58_left,
BIN_OP_EQ_uxn_opcodes_h_l1760_c6_2e58_right,
BIN_OP_EQ_uxn_opcodes_h_l1760_c6_2e58_return_output);

-- t16_MUX_uxn_opcodes_h_l1760_c2_b769
t16_MUX_uxn_opcodes_h_l1760_c2_b769 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1760_c2_b769_cond,
t16_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue,
t16_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse,
t16_MUX_uxn_opcodes_h_l1760_c2_b769_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_b769
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_b769 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_b769_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_b769_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_b769
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_b769 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_b769_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_b769_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1760_c2_b769
result_u16_value_MUX_uxn_opcodes_h_l1760_c2_b769 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1760_c2_b769_cond,
result_u16_value_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1760_c2_b769_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_b769
result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_b769 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_b769_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_b769_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_b769
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_b769 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_b769_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_b769_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_b769
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_b769 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_b769_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_b769_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_b769
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_b769 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_b769_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_b769_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1760_c2_b769
result_u8_value_MUX_uxn_opcodes_h_l1760_c2_b769 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1760_c2_b769_cond,
result_u8_value_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1760_c2_b769_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_b769
result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_b769 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_b769_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_b769_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_b769
result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_b769 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_b769_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_b769_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1760_c2_b769
tmp8_high_MUX_uxn_opcodes_h_l1760_c2_b769 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1760_c2_b769_cond,
tmp8_high_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1760_c2_b769_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1760_c2_b769
tmp8_low_MUX_uxn_opcodes_h_l1760_c2_b769 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1760_c2_b769_cond,
tmp8_low_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1760_c2_b769_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1773_c11_3257
BIN_OP_EQ_uxn_opcodes_h_l1773_c11_3257 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1773_c11_3257_left,
BIN_OP_EQ_uxn_opcodes_h_l1773_c11_3257_right,
BIN_OP_EQ_uxn_opcodes_h_l1773_c11_3257_return_output);

-- t16_MUX_uxn_opcodes_h_l1773_c7_5bff
t16_MUX_uxn_opcodes_h_l1773_c7_5bff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1773_c7_5bff_cond,
t16_MUX_uxn_opcodes_h_l1773_c7_5bff_iftrue,
t16_MUX_uxn_opcodes_h_l1773_c7_5bff_iffalse,
t16_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_5bff
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_5bff : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_5bff_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_5bff_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_5bff_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1773_c7_5bff
result_u16_value_MUX_uxn_opcodes_h_l1773_c7_5bff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1773_c7_5bff_cond,
result_u16_value_MUX_uxn_opcodes_h_l1773_c7_5bff_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1773_c7_5bff_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1773_c7_5bff
result_u8_value_MUX_uxn_opcodes_h_l1773_c7_5bff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1773_c7_5bff_cond,
result_u8_value_MUX_uxn_opcodes_h_l1773_c7_5bff_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1773_c7_5bff_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_5bff
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_5bff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_5bff_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_5bff_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_5bff_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_5bff
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_5bff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_5bff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_5bff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_5bff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_5bff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_5bff : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_5bff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_5bff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_5bff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1773_c7_5bff
tmp8_high_MUX_uxn_opcodes_h_l1773_c7_5bff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1773_c7_5bff_cond,
tmp8_high_MUX_uxn_opcodes_h_l1773_c7_5bff_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1773_c7_5bff_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1773_c7_5bff
tmp8_low_MUX_uxn_opcodes_h_l1773_c7_5bff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1773_c7_5bff_cond,
tmp8_low_MUX_uxn_opcodes_h_l1773_c7_5bff_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1773_c7_5bff_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1776_c11_edcd
BIN_OP_EQ_uxn_opcodes_h_l1776_c11_edcd : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1776_c11_edcd_left,
BIN_OP_EQ_uxn_opcodes_h_l1776_c11_edcd_right,
BIN_OP_EQ_uxn_opcodes_h_l1776_c11_edcd_return_output);

-- t16_MUX_uxn_opcodes_h_l1776_c7_76da
t16_MUX_uxn_opcodes_h_l1776_c7_76da : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1776_c7_76da_cond,
t16_MUX_uxn_opcodes_h_l1776_c7_76da_iftrue,
t16_MUX_uxn_opcodes_h_l1776_c7_76da_iffalse,
t16_MUX_uxn_opcodes_h_l1776_c7_76da_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_76da
result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_76da : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_76da_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_76da_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_76da_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_76da_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1776_c7_76da
result_u16_value_MUX_uxn_opcodes_h_l1776_c7_76da : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1776_c7_76da_cond,
result_u16_value_MUX_uxn_opcodes_h_l1776_c7_76da_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1776_c7_76da_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1776_c7_76da_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1776_c7_76da
result_u8_value_MUX_uxn_opcodes_h_l1776_c7_76da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1776_c7_76da_cond,
result_u8_value_MUX_uxn_opcodes_h_l1776_c7_76da_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1776_c7_76da_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1776_c7_76da_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_76da
result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_76da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_76da_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_76da_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_76da_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_76da_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_76da
result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_76da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_76da_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_76da_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_76da_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_76da_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_76da
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_76da : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_76da_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_76da_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_76da_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_76da_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1776_c7_76da
tmp8_high_MUX_uxn_opcodes_h_l1776_c7_76da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1776_c7_76da_cond,
tmp8_high_MUX_uxn_opcodes_h_l1776_c7_76da_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1776_c7_76da_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1776_c7_76da_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1776_c7_76da
tmp8_low_MUX_uxn_opcodes_h_l1776_c7_76da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1776_c7_76da_cond,
tmp8_low_MUX_uxn_opcodes_h_l1776_c7_76da_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1776_c7_76da_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1776_c7_76da_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1778_c3_728d
CONST_SL_8_uxn_opcodes_h_l1778_c3_728d : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1778_c3_728d_x,
CONST_SL_8_uxn_opcodes_h_l1778_c3_728d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1780_c11_3f97
BIN_OP_EQ_uxn_opcodes_h_l1780_c11_3f97 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1780_c11_3f97_left,
BIN_OP_EQ_uxn_opcodes_h_l1780_c11_3f97_right,
BIN_OP_EQ_uxn_opcodes_h_l1780_c11_3f97_return_output);

-- t16_MUX_uxn_opcodes_h_l1780_c7_f67c
t16_MUX_uxn_opcodes_h_l1780_c7_f67c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1780_c7_f67c_cond,
t16_MUX_uxn_opcodes_h_l1780_c7_f67c_iftrue,
t16_MUX_uxn_opcodes_h_l1780_c7_f67c_iffalse,
t16_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_f67c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_f67c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_f67c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_f67c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_f67c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1780_c7_f67c
result_u16_value_MUX_uxn_opcodes_h_l1780_c7_f67c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1780_c7_f67c_cond,
result_u16_value_MUX_uxn_opcodes_h_l1780_c7_f67c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1780_c7_f67c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1780_c7_f67c
result_u8_value_MUX_uxn_opcodes_h_l1780_c7_f67c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1780_c7_f67c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1780_c7_f67c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1780_c7_f67c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_f67c
result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_f67c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_f67c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_f67c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_f67c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_f67c
result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_f67c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_f67c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_f67c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_f67c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_f67c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_f67c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_f67c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_f67c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_f67c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1780_c7_f67c
tmp8_high_MUX_uxn_opcodes_h_l1780_c7_f67c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1780_c7_f67c_cond,
tmp8_high_MUX_uxn_opcodes_h_l1780_c7_f67c_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1780_c7_f67c_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1780_c7_f67c
tmp8_low_MUX_uxn_opcodes_h_l1780_c7_f67c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1780_c7_f67c_cond,
tmp8_low_MUX_uxn_opcodes_h_l1780_c7_f67c_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1780_c7_f67c_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1781_c3_9d3f
BIN_OP_OR_uxn_opcodes_h_l1781_c3_9d3f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1781_c3_9d3f_left,
BIN_OP_OR_uxn_opcodes_h_l1781_c3_9d3f_right,
BIN_OP_OR_uxn_opcodes_h_l1781_c3_9d3f_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1782_c30_3b38
sp_relative_shift_uxn_opcodes_h_l1782_c30_3b38 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1782_c30_3b38_ins,
sp_relative_shift_uxn_opcodes_h_l1782_c30_3b38_x,
sp_relative_shift_uxn_opcodes_h_l1782_c30_3b38_y,
sp_relative_shift_uxn_opcodes_h_l1782_c30_3b38_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1785_c11_5894
BIN_OP_EQ_uxn_opcodes_h_l1785_c11_5894 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1785_c11_5894_left,
BIN_OP_EQ_uxn_opcodes_h_l1785_c11_5894_right,
BIN_OP_EQ_uxn_opcodes_h_l1785_c11_5894_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_ba77
result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_ba77 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_ba77_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_ba77_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_ba77_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1785_c7_ba77
result_u16_value_MUX_uxn_opcodes_h_l1785_c7_ba77 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1785_c7_ba77_cond,
result_u16_value_MUX_uxn_opcodes_h_l1785_c7_ba77_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1785_c7_ba77_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1785_c7_ba77
result_u8_value_MUX_uxn_opcodes_h_l1785_c7_ba77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1785_c7_ba77_cond,
result_u8_value_MUX_uxn_opcodes_h_l1785_c7_ba77_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1785_c7_ba77_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_ba77
result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_ba77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_ba77_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_ba77_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_ba77_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_ba77
result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_ba77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_ba77_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_ba77_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_ba77_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_ba77
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_ba77 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_ba77_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_ba77_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_ba77_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1785_c7_ba77
tmp8_high_MUX_uxn_opcodes_h_l1785_c7_ba77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1785_c7_ba77_cond,
tmp8_high_MUX_uxn_opcodes_h_l1785_c7_ba77_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1785_c7_ba77_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1785_c7_ba77
tmp8_low_MUX_uxn_opcodes_h_l1785_c7_ba77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1785_c7_ba77_cond,
tmp8_low_MUX_uxn_opcodes_h_l1785_c7_ba77_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1785_c7_ba77_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_1f6c
BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_1f6c : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_1f6c_left,
BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_1f6c_right,
BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_1f6c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1789_c11_aa35
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_aa35 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_aa35_left,
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_aa35_right,
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_aa35_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_8052
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_8052 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_8052_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_8052_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_8052_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_8052_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1789_c7_8052
result_u8_value_MUX_uxn_opcodes_h_l1789_c7_8052 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1789_c7_8052_cond,
result_u8_value_MUX_uxn_opcodes_h_l1789_c7_8052_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1789_c7_8052_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1789_c7_8052_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_8052
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_8052 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_8052_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_8052_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_8052_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_8052_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_8052
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_8052 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_8052_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_8052_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_8052_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_8052_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1789_c7_8052
tmp8_high_MUX_uxn_opcodes_h_l1789_c7_8052 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1789_c7_8052_cond,
tmp8_high_MUX_uxn_opcodes_h_l1789_c7_8052_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1789_c7_8052_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1789_c7_8052_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1789_c7_8052
tmp8_low_MUX_uxn_opcodes_h_l1789_c7_8052 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1789_c7_8052_cond,
tmp8_low_MUX_uxn_opcodes_h_l1789_c7_8052_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1789_c7_8052_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1789_c7_8052_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1795_c11_3566
BIN_OP_EQ_uxn_opcodes_h_l1795_c11_3566 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1795_c11_3566_left,
BIN_OP_EQ_uxn_opcodes_h_l1795_c11_3566_right,
BIN_OP_EQ_uxn_opcodes_h_l1795_c11_3566_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_9cea
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_9cea : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_9cea_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_9cea_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_9cea_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_9cea_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_9cea
result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_9cea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_9cea_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_9cea_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_9cea_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_9cea_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1795_c7_9cea
result_u8_value_MUX_uxn_opcodes_h_l1795_c7_9cea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1795_c7_9cea_cond,
result_u8_value_MUX_uxn_opcodes_h_l1795_c7_9cea_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1795_c7_9cea_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1795_c7_9cea_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1795_c7_9cea
tmp8_low_MUX_uxn_opcodes_h_l1795_c7_9cea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1795_c7_9cea_cond,
tmp8_low_MUX_uxn_opcodes_h_l1795_c7_9cea_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1795_c7_9cea_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1795_c7_9cea_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1760_c6_2e58_return_output,
 t16_MUX_uxn_opcodes_h_l1760_c2_b769_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_b769_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_b769_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1760_c2_b769_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_b769_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_b769_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_b769_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_b769_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1760_c2_b769_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_b769_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_b769_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1760_c2_b769_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1760_c2_b769_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1773_c11_3257_return_output,
 t16_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1776_c11_edcd_return_output,
 t16_MUX_uxn_opcodes_h_l1776_c7_76da_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_76da_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1776_c7_76da_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1776_c7_76da_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_76da_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_76da_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_76da_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1776_c7_76da_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1776_c7_76da_return_output,
 CONST_SL_8_uxn_opcodes_h_l1778_c3_728d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1780_c11_3f97_return_output,
 t16_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1781_c3_9d3f_return_output,
 sp_relative_shift_uxn_opcodes_h_l1782_c30_3b38_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1785_c11_5894_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_1f6c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1789_c11_aa35_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_8052_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1789_c7_8052_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_8052_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_8052_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1789_c7_8052_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1789_c7_8052_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1795_c11_3566_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_9cea_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_9cea_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1795_c7_9cea_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1795_c7_9cea_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_2e58_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_2e58_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_2e58_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1760_c2_b769_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1760_c2_b769_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1765_c3_e874 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_b769_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_b769_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1760_c2_b769_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_b769_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_b769_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_b769_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_b769_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_b769_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_b769_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_b769_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_b769_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1770_c3_9372 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_b769_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_b769_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1760_c2_b769_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_b769_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_b769_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_b769_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_b769_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1760_c2_b769_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_b769_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_b769_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1760_c2_b769_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_b769_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_b769_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_b769_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_b769_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_b769_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_b769_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_3257_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_3257_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_3257_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1773_c7_5bff_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1773_c7_5bff_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1776_c7_76da_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1773_c7_5bff_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_5bff_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_5bff_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_76da_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_5bff_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_5bff_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_5bff_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_76da_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_5bff_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_5bff_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_5bff_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_76da_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_5bff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_5bff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_5bff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_76da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_5bff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_5bff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_5bff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_76da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_5bff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_5bff_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1774_c3_ffc4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_5bff_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_76da_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_5bff_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_5bff_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_5bff_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_76da_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_5bff_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_5bff_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_5bff_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_76da_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_5bff_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_edcd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_edcd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_edcd_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1776_c7_76da_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1776_c7_76da_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1776_c7_76da_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_76da_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_76da_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_76da_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_76da_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_76da_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_76da_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_76da_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_76da_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_76da_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_76da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_76da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_76da_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_76da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_76da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_76da_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_76da_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_76da_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_76da_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_76da_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_76da_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_76da_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_76da_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_76da_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_76da_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1778_c3_728d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1778_c3_728d_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_3f97_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_3f97_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_3f97_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1780_c7_f67c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1780_c7_f67c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1780_c7_f67c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_f67c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_f67c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_f67c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_f67c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_f67c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_f67c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_f67c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_f67c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_f67c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_f67c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_f67c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_f67c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_f67c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_f67c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_f67c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_f67c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_f67c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_f67c_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_f67c_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_f67c_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_f67c_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_f67c_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_f67c_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_f67c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_9d3f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_9d3f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_9d3f_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_3b38_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_3b38_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_3b38_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_3b38_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_5894_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_5894_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_5894_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_ba77_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1786_c3_a67b : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_ba77_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_ba77_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_ba77_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1787_c3_21c3 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_ba77_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_ba77_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_ba77_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_ba77_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_8052_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_ba77_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_ba77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_ba77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_8052_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_ba77_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_ba77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_ba77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_8052_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_ba77_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_ba77_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_ba77_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_8052_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_ba77_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_ba77_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_ba77_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_8052_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_ba77_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_ba77_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_ba77_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_8052_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_ba77_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_1f6c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_1f6c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_1f6c_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_aa35_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_aa35_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_aa35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_8052_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_8052_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_9cea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_8052_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_8052_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_8052_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_9cea_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_8052_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_8052_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_8052_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_8052_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_8052_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1792_c3_eda1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_8052_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_9cea_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_8052_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_8052_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_8052_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_8052_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_8052_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_8052_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_9cea_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_8052_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_3566_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_3566_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_3566_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_9cea_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1797_c3_ee82 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_9cea_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_9cea_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_9cea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_9cea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_9cea_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_9cea_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_9cea_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_9cea_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_9cea_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_9cea_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_9cea_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1760_l1776_l1785_l1773_DUPLICATE_da72_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1776_l1795_l1780_l1760_l1785_l1773_DUPLICATE_004e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1776_l1785_l1773_DUPLICATE_ffb7_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1776_l1789_l1780_l1785_l1773_DUPLICATE_ecc1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1776_l1789_l1795_l1780_l1785_l1773_DUPLICATE_4a32_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1781_l1777_DUPLICATE_f1f8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1776_l1785_l1795_l1780_DUPLICATE_3aaf_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c942_uxn_opcodes_h_l1802_l1755_DUPLICATE_364c_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_3257_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_1f6c_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_3b38_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_edcd_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1770_c3_9372 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1770_c3_9372;
     VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_3b38_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_2e58_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1792_c3_eda1 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_8052_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1792_c3_eda1;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1774_c3_ffc4 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_5bff_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1774_c3_ffc4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_aa35_right := to_unsigned(5, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_3f97_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1765_c3_e874 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1765_c3_e874;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_5894_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1797_c3_ee82 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_9cea_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1797_c3_ee82;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_9cea_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_8052_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1786_c3_a67b := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_ba77_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1786_c3_a67b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_3566_right := to_unsigned(6, 3);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_3b38_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_2e58_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_3257_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_edcd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_3f97_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_5894_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_aa35_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_3566_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_8052_iftrue := VAR_previous_ram_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_9cea_iftrue := VAR_previous_ram_read;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_8052_iftrue := VAR_previous_ram_read;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_9cea_iftrue := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_9d3f_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_1f6c_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1773_c7_5bff_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1780_c7_f67c_iffalse := t16;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_5bff_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_76da_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_f67c_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_ba77_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_8052_iffalse := tmp8_high;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_5bff_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_76da_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_f67c_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_ba77_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_8052_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_9cea_iffalse := tmp8_low;
     -- BIN_OP_EQ[uxn_opcodes_h_l1773_c11_3257] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1773_c11_3257_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_3257_left;
     BIN_OP_EQ_uxn_opcodes_h_l1773_c11_3257_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_3257_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_3257_return_output := BIN_OP_EQ_uxn_opcodes_h_l1773_c11_3257_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1760_c2_b769] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1760_c2_b769_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1776_l1785_l1795_l1780_DUPLICATE_3aaf LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1776_l1785_l1795_l1780_DUPLICATE_3aaf_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1776_l1789_l1795_l1780_l1785_l1773_DUPLICATE_4a32 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1776_l1789_l1795_l1780_l1785_l1773_DUPLICATE_4a32_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1760_l1776_l1785_l1773_DUPLICATE_da72 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1760_l1776_l1785_l1773_DUPLICATE_da72_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1789_c11_aa35] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1789_c11_aa35_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_aa35_left;
     BIN_OP_EQ_uxn_opcodes_h_l1789_c11_aa35_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_aa35_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_aa35_return_output := BIN_OP_EQ_uxn_opcodes_h_l1789_c11_aa35_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1760_c6_2e58] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1760_c6_2e58_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_2e58_left;
     BIN_OP_EQ_uxn_opcodes_h_l1760_c6_2e58_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_2e58_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_2e58_return_output := BIN_OP_EQ_uxn_opcodes_h_l1760_c6_2e58_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1760_c2_b769] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1760_c2_b769_return_output := result.is_vram_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1760_c2_b769] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1760_c2_b769_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1780_c11_3f97] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1780_c11_3f97_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_3f97_left;
     BIN_OP_EQ_uxn_opcodes_h_l1780_c11_3f97_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_3f97_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_3f97_return_output := BIN_OP_EQ_uxn_opcodes_h_l1780_c11_3f97_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1785_c11_5894] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1785_c11_5894_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_5894_left;
     BIN_OP_EQ_uxn_opcodes_h_l1785_c11_5894_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_5894_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_5894_return_output := BIN_OP_EQ_uxn_opcodes_h_l1785_c11_5894_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1776_c11_edcd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1776_c11_edcd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_edcd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1776_c11_edcd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_edcd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_edcd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1776_c11_edcd_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1781_l1777_DUPLICATE_f1f8 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1781_l1777_DUPLICATE_f1f8_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1776_l1789_l1780_l1785_l1773_DUPLICATE_ecc1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1776_l1789_l1780_l1785_l1773_DUPLICATE_ecc1_return_output := result.is_stack_write;

     -- sp_relative_shift[uxn_opcodes_h_l1782_c30_3b38] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1782_c30_3b38_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_3b38_ins;
     sp_relative_shift_uxn_opcodes_h_l1782_c30_3b38_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_3b38_x;
     sp_relative_shift_uxn_opcodes_h_l1782_c30_3b38_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_3b38_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_3b38_return_output := sp_relative_shift_uxn_opcodes_h_l1782_c30_3b38_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1760_c2_b769] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1760_c2_b769_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1776_l1795_l1780_l1760_l1785_l1773_DUPLICATE_004e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1776_l1795_l1780_l1760_l1785_l1773_DUPLICATE_004e_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1795_c11_3566] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1795_c11_3566_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_3566_left;
     BIN_OP_EQ_uxn_opcodes_h_l1795_c11_3566_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_3566_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_3566_return_output := BIN_OP_EQ_uxn_opcodes_h_l1795_c11_3566_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1776_l1785_l1773_DUPLICATE_ffb7 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1776_l1785_l1773_DUPLICATE_ffb7_return_output := result.sp_relative_shift;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1787_c22_1f6c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_1f6c_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_1f6c_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_1f6c_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_1f6c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_1f6c_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_1f6c_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_b769_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_2e58_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_b769_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_2e58_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_b769_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_2e58_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_b769_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_2e58_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_b769_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_2e58_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_b769_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_2e58_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_b769_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_2e58_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_b769_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_2e58_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_b769_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_2e58_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_b769_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_2e58_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1760_c2_b769_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_2e58_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_b769_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_2e58_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_b769_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_2e58_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_5bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_3257_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_5bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_3257_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_5bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_3257_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_5bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_3257_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_5bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_3257_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_5bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_3257_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1773_c7_5bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_3257_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_5bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_3257_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_5bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_3257_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_76da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_edcd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_76da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_edcd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_76da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_edcd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_76da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_edcd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_76da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_edcd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_76da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_edcd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1776_c7_76da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_edcd_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_76da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_edcd_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_76da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_edcd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_f67c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_3f97_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_f67c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_3f97_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_f67c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_3f97_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_f67c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_3f97_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_f67c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_3f97_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_f67c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_3f97_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1780_c7_f67c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_3f97_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_f67c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_3f97_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_f67c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_3f97_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_ba77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_5894_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_ba77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_5894_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_ba77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_5894_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_ba77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_5894_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_ba77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_5894_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_ba77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_5894_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_ba77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_5894_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_ba77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_5894_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_8052_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_aa35_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_8052_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_aa35_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_8052_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_aa35_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_8052_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_aa35_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_8052_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_aa35_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_8052_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_aa35_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_9cea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_3566_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_9cea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_3566_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_9cea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_3566_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_9cea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_3566_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1787_c3_21c3 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_1f6c_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_9d3f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1781_l1777_DUPLICATE_f1f8_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1778_c3_728d_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1781_l1777_DUPLICATE_f1f8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_5bff_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1776_l1785_l1773_DUPLICATE_ffb7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_76da_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1776_l1785_l1773_DUPLICATE_ffb7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_ba77_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1776_l1785_l1773_DUPLICATE_ffb7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1760_l1776_l1785_l1773_DUPLICATE_da72_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_5bff_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1760_l1776_l1785_l1773_DUPLICATE_da72_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_76da_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1760_l1776_l1785_l1773_DUPLICATE_da72_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_ba77_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1760_l1776_l1785_l1773_DUPLICATE_da72_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_5bff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1776_l1789_l1795_l1780_l1785_l1773_DUPLICATE_4a32_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_76da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1776_l1789_l1795_l1780_l1785_l1773_DUPLICATE_4a32_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_f67c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1776_l1789_l1795_l1780_l1785_l1773_DUPLICATE_4a32_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_ba77_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1776_l1789_l1795_l1780_l1785_l1773_DUPLICATE_4a32_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_8052_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1776_l1789_l1795_l1780_l1785_l1773_DUPLICATE_4a32_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_9cea_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1776_l1789_l1795_l1780_l1785_l1773_DUPLICATE_4a32_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_5bff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1776_l1789_l1780_l1785_l1773_DUPLICATE_ecc1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_76da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1776_l1789_l1780_l1785_l1773_DUPLICATE_ecc1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_f67c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1776_l1789_l1780_l1785_l1773_DUPLICATE_ecc1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_ba77_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1776_l1789_l1780_l1785_l1773_DUPLICATE_ecc1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_8052_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1776_l1789_l1780_l1785_l1773_DUPLICATE_ecc1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_76da_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1776_l1785_l1795_l1780_DUPLICATE_3aaf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_f67c_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1776_l1785_l1795_l1780_DUPLICATE_3aaf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_ba77_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1776_l1785_l1795_l1780_DUPLICATE_3aaf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_9cea_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1776_l1785_l1795_l1780_DUPLICATE_3aaf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1776_l1795_l1780_l1760_l1785_l1773_DUPLICATE_004e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_5bff_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1776_l1795_l1780_l1760_l1785_l1773_DUPLICATE_004e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_76da_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1776_l1795_l1780_l1760_l1785_l1773_DUPLICATE_004e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_f67c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1776_l1795_l1780_l1760_l1785_l1773_DUPLICATE_004e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_ba77_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1776_l1795_l1780_l1760_l1785_l1773_DUPLICATE_004e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_9cea_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1776_l1795_l1780_l1760_l1785_l1773_DUPLICATE_004e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1760_c2_b769_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1760_c2_b769_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1760_c2_b769_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1760_c2_b769_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_f67c_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_3b38_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_ba77_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1787_c3_21c3;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1760_c2_b769] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_b769_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_b769_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_b769_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_b769_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1789_c7_8052] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_8052_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_8052_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_8052_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_8052_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_8052_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_8052_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_8052_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_8052_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1789_c7_8052] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1789_c7_8052_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_8052_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1789_c7_8052_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_8052_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1789_c7_8052_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_8052_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_8052_return_output := tmp8_high_MUX_uxn_opcodes_h_l1789_c7_8052_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1781_c3_9d3f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1781_c3_9d3f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_9d3f_left;
     BIN_OP_OR_uxn_opcodes_h_l1781_c3_9d3f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_9d3f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_9d3f_return_output := BIN_OP_OR_uxn_opcodes_h_l1781_c3_9d3f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1785_c7_ba77] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_ba77_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_ba77_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_ba77_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_ba77_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_ba77_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_ba77_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1785_c7_ba77] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1785_c7_ba77_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_ba77_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1785_c7_ba77_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_ba77_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1785_c7_ba77_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_ba77_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output := result_u16_value_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1760_c2_b769] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_b769_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_b769_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_b769_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_b769_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1760_c2_b769] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_b769_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_b769_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_b769_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_b769_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1795_c7_9cea] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1795_c7_9cea_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_9cea_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1795_c7_9cea_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_9cea_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1795_c7_9cea_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_9cea_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_9cea_return_output := result_u8_value_MUX_uxn_opcodes_h_l1795_c7_9cea_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1795_c7_9cea] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_9cea_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_9cea_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_9cea_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_9cea_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_9cea_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_9cea_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_9cea_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_9cea_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1795_c7_9cea] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1795_c7_9cea_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_9cea_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1795_c7_9cea_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_9cea_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1795_c7_9cea_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_9cea_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_9cea_return_output := tmp8_low_MUX_uxn_opcodes_h_l1795_c7_9cea_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1778_c3_728d] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1778_c3_728d_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1778_c3_728d_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1778_c3_728d_return_output := CONST_SL_8_uxn_opcodes_h_l1778_c3_728d_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1760_c2_b769] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_b769_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_b769_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_b769_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_b769_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1795_c7_9cea] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_9cea_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_9cea_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_9cea_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_9cea_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_9cea_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_9cea_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_9cea_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_9cea_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_f67c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_9d3f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1780_c7_f67c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_9d3f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1776_c7_76da_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1778_c3_728d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_8052_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_9cea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_ba77_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_8052_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_f67c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_8052_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_9cea_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_f67c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_8052_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_9cea_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_ba77_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_8052_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_8052_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_9cea_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1789_c7_8052] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_8052_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_8052_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_8052_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_8052_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_8052_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_8052_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_8052_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_8052_return_output;

     -- t16_MUX[uxn_opcodes_h_l1780_c7_f67c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1780_c7_f67c_cond <= VAR_t16_MUX_uxn_opcodes_h_l1780_c7_f67c_cond;
     t16_MUX_uxn_opcodes_h_l1780_c7_f67c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1780_c7_f67c_iftrue;
     t16_MUX_uxn_opcodes_h_l1780_c7_f67c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1780_c7_f67c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output := t16_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1789_c7_8052] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_8052_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_8052_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_8052_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_8052_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_8052_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_8052_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_8052_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_8052_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1785_c7_ba77] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1785_c7_ba77_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_ba77_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1785_c7_ba77_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_ba77_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1785_c7_ba77_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_ba77_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output := tmp8_high_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1789_c7_8052] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1789_c7_8052_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_8052_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1789_c7_8052_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_8052_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1789_c7_8052_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_8052_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_8052_return_output := tmp8_low_MUX_uxn_opcodes_h_l1789_c7_8052_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1780_c7_f67c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_f67c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_f67c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_f67c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_f67c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_f67c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_f67c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1780_c7_f67c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1780_c7_f67c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_f67c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1780_c7_f67c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_f67c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1780_c7_f67c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_f67c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output := result_u16_value_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1789_c7_8052] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1789_c7_8052_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_8052_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1789_c7_8052_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_8052_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1789_c7_8052_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_8052_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_8052_return_output := result_u8_value_MUX_uxn_opcodes_h_l1789_c7_8052_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1785_c7_ba77] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_ba77_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_ba77_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_ba77_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_ba77_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_ba77_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_ba77_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_ba77_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_8052_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_f67c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_76da_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_ba77_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_8052_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_76da_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_ba77_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_8052_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1776_c7_76da_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_f67c_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_ba77_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_8052_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1785_c7_ba77] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1785_c7_ba77_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_ba77_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1785_c7_ba77_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_ba77_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1785_c7_ba77_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_ba77_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output := result_u8_value_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1785_c7_ba77] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1785_c7_ba77_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_ba77_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1785_c7_ba77_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_ba77_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1785_c7_ba77_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_ba77_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output := tmp8_low_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1780_c7_f67c] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1780_c7_f67c_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_f67c_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1780_c7_f67c_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_f67c_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1780_c7_f67c_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_f67c_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output := tmp8_high_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1776_c7_76da] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_76da_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_76da_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_76da_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_76da_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_76da_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_76da_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_76da_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_76da_return_output;

     -- t16_MUX[uxn_opcodes_h_l1776_c7_76da] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1776_c7_76da_cond <= VAR_t16_MUX_uxn_opcodes_h_l1776_c7_76da_cond;
     t16_MUX_uxn_opcodes_h_l1776_c7_76da_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1776_c7_76da_iftrue;
     t16_MUX_uxn_opcodes_h_l1776_c7_76da_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1776_c7_76da_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1776_c7_76da_return_output := t16_MUX_uxn_opcodes_h_l1776_c7_76da_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1780_c7_f67c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_f67c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_f67c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_f67c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_f67c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_f67c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_f67c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1776_c7_76da] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1776_c7_76da_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_76da_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1776_c7_76da_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_76da_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1776_c7_76da_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_76da_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_76da_return_output := result_u16_value_MUX_uxn_opcodes_h_l1776_c7_76da_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1785_c7_ba77] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_ba77_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_ba77_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_ba77_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_ba77_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_ba77_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_ba77_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1785_c7_ba77] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_ba77_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_ba77_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_ba77_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_ba77_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_ba77_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_ba77_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_f67c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_76da_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_5bff_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_76da_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_f67c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_5bff_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_76da_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_f67c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1773_c7_5bff_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1776_c7_76da_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_76da_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_f67c_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_ba77_return_output;
     -- t16_MUX[uxn_opcodes_h_l1773_c7_5bff] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1773_c7_5bff_cond <= VAR_t16_MUX_uxn_opcodes_h_l1773_c7_5bff_cond;
     t16_MUX_uxn_opcodes_h_l1773_c7_5bff_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1773_c7_5bff_iftrue;
     t16_MUX_uxn_opcodes_h_l1773_c7_5bff_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1773_c7_5bff_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output := t16_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1776_c7_76da] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_76da_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_76da_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_76da_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_76da_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_76da_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_76da_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_76da_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_76da_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1780_c7_f67c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1780_c7_f67c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_f67c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1780_c7_f67c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_f67c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1780_c7_f67c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_f67c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1780_c7_f67c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_f67c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_f67c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_f67c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_f67c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_f67c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_f67c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1780_c7_f67c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_f67c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_f67c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_f67c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_f67c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_f67c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_f67c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1776_c7_76da] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1776_c7_76da_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_76da_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1776_c7_76da_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_76da_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1776_c7_76da_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_76da_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_76da_return_output := tmp8_high_MUX_uxn_opcodes_h_l1776_c7_76da_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1773_c7_5bff] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_5bff_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_5bff_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_5bff_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_5bff_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_5bff_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_5bff_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1773_c7_5bff] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1773_c7_5bff_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_5bff_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1773_c7_5bff_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_5bff_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1773_c7_5bff_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_5bff_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output := result_u16_value_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1780_c7_f67c] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1780_c7_f67c_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_f67c_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1780_c7_f67c_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_f67c_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1780_c7_f67c_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_f67c_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output := tmp8_low_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_76da_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_5bff_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_76da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_76da_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_76da_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_5bff_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_76da_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_76da_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_f67c_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1760_c2_b769] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1760_c2_b769_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_b769_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_b769_return_output := result_u16_value_MUX_uxn_opcodes_h_l1760_c2_b769_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1776_c7_76da] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1776_c7_76da_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_76da_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1776_c7_76da_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_76da_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1776_c7_76da_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_76da_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_76da_return_output := result_u8_value_MUX_uxn_opcodes_h_l1776_c7_76da_return_output;

     -- t16_MUX[uxn_opcodes_h_l1760_c2_b769] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1760_c2_b769_cond <= VAR_t16_MUX_uxn_opcodes_h_l1760_c2_b769_cond;
     t16_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue;
     t16_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1760_c2_b769_return_output := t16_MUX_uxn_opcodes_h_l1760_c2_b769_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1760_c2_b769] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_b769_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_b769_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_b769_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_b769_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1773_c7_5bff] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_5bff_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_5bff_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_5bff_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_5bff_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_5bff_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_5bff_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1773_c7_5bff] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1773_c7_5bff_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_5bff_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1773_c7_5bff_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_5bff_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1773_c7_5bff_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_5bff_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output := tmp8_high_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1776_c7_76da] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1776_c7_76da_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_76da_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1776_c7_76da_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_76da_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1776_c7_76da_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_76da_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_76da_return_output := tmp8_low_MUX_uxn_opcodes_h_l1776_c7_76da_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1776_c7_76da] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_76da_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_76da_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_76da_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_76da_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_76da_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_76da_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_76da_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_76da_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1776_c7_76da] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_76da_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_76da_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_76da_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_76da_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_76da_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_76da_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_76da_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_76da_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_5bff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_76da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_5bff_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_76da_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_5bff_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_76da_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1760_c2_b769_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_5bff_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_76da_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1773_c7_5bff] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1773_c7_5bff_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_5bff_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1773_c7_5bff_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_5bff_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1773_c7_5bff_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_5bff_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output := result_u8_value_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1760_c2_b769] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1760_c2_b769_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_b769_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_b769_return_output := tmp8_high_MUX_uxn_opcodes_h_l1760_c2_b769_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1773_c7_5bff] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1773_c7_5bff_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_5bff_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1773_c7_5bff_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_5bff_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1773_c7_5bff_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_5bff_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output := tmp8_low_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1773_c7_5bff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_5bff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_5bff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_5bff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_5bff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_5bff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_5bff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1760_c2_b769] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_b769_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_b769_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_b769_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_b769_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1773_c7_5bff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_5bff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_5bff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_5bff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_5bff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_5bff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_5bff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output;
     REG_VAR_tmp8_high := VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_b769_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_5bff_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1760_c2_b769] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_b769_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_b769_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_b769_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_b769_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1760_c2_b769] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_b769_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_b769_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_b769_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_b769_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1760_c2_b769] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1760_c2_b769_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_b769_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_b769_return_output := result_u8_value_MUX_uxn_opcodes_h_l1760_c2_b769_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1760_c2_b769] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1760_c2_b769_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_b769_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_b769_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_b769_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_b769_return_output := tmp8_low_MUX_uxn_opcodes_h_l1760_c2_b769_return_output;

     -- Submodule level 8
     REG_VAR_tmp8_low := VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_b769_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c942_uxn_opcodes_h_l1802_l1755_DUPLICATE_364c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c942_uxn_opcodes_h_l1802_l1755_DUPLICATE_364c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c942(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_b769_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_b769_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_b769_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_b769_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_b769_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_b769_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_b769_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_b769_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_b769_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_b769_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c942_uxn_opcodes_h_l1802_l1755_DUPLICATE_364c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c942_uxn_opcodes_h_l1802_l1755_DUPLICATE_364c_return_output;
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
