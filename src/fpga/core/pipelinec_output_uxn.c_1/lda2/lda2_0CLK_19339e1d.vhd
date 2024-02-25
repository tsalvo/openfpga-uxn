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
-- BIN_OP_EQ[uxn_opcodes_h_l1760_c6_ca5d]
signal BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ca5d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ca5d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ca5d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1760_c2_3721]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3721_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3721_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1760_c2_3721]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3721_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3721_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1760_c2_3721]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3721_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3721_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1760_c2_3721]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3721_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3721_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1760_c2_3721]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3721_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3721_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1760_c2_3721]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3721_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3721_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1760_c2_3721]
signal result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3721_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3721_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1760_c2_3721]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3721_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3721_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1760_c2_3721]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3721_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3721_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1760_c2_3721]
signal result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3721_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3721_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1760_c2_3721]
signal tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3721_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3721_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1760_c2_3721]
signal t16_MUX_uxn_opcodes_h_l1760_c2_3721_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1760_c2_3721_return_output : unsigned(15 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1760_c2_3721]
signal tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3721_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3721_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1773_c11_de09]
signal BIN_OP_EQ_uxn_opcodes_h_l1773_c11_de09_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1773_c11_de09_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1773_c11_de09_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1773_c7_ca69]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_ca69_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_ca69_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_ca69_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1773_c7_ca69]
signal result_u16_value_MUX_uxn_opcodes_h_l1773_c7_ca69_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1773_c7_ca69_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1773_c7_ca69_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1773_c7_ca69]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_ca69_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_ca69_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_ca69_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1773_c7_ca69]
signal result_u8_value_MUX_uxn_opcodes_h_l1773_c7_ca69_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1773_c7_ca69_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1773_c7_ca69_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1773_c7_ca69]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_ca69_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_ca69_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_ca69_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1773_c7_ca69]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_ca69_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_ca69_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_ca69_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1773_c7_ca69]
signal tmp8_low_MUX_uxn_opcodes_h_l1773_c7_ca69_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1773_c7_ca69_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1773_c7_ca69_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1773_c7_ca69]
signal t16_MUX_uxn_opcodes_h_l1773_c7_ca69_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1773_c7_ca69_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1773_c7_ca69_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output : unsigned(15 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1773_c7_ca69]
signal tmp8_high_MUX_uxn_opcodes_h_l1773_c7_ca69_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1773_c7_ca69_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1773_c7_ca69_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1776_c11_5086]
signal BIN_OP_EQ_uxn_opcodes_h_l1776_c11_5086_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1776_c11_5086_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1776_c11_5086_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1776_c7_a7d5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_a7d5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_a7d5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_a7d5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1776_c7_a7d5]
signal result_u16_value_MUX_uxn_opcodes_h_l1776_c7_a7d5_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1776_c7_a7d5_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1776_c7_a7d5_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1776_c7_a7d5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_a7d5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_a7d5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_a7d5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1776_c7_a7d5]
signal result_u8_value_MUX_uxn_opcodes_h_l1776_c7_a7d5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1776_c7_a7d5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1776_c7_a7d5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1776_c7_a7d5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_a7d5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_a7d5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_a7d5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1776_c7_a7d5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_a7d5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_a7d5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_a7d5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1776_c7_a7d5]
signal tmp8_low_MUX_uxn_opcodes_h_l1776_c7_a7d5_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1776_c7_a7d5_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1776_c7_a7d5_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1776_c7_a7d5]
signal t16_MUX_uxn_opcodes_h_l1776_c7_a7d5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1776_c7_a7d5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1776_c7_a7d5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output : unsigned(15 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1776_c7_a7d5]
signal tmp8_high_MUX_uxn_opcodes_h_l1776_c7_a7d5_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1776_c7_a7d5_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1776_c7_a7d5_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1778_c3_5352]
signal CONST_SL_8_uxn_opcodes_h_l1778_c3_5352_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1778_c3_5352_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1780_c11_b71a]
signal BIN_OP_EQ_uxn_opcodes_h_l1780_c11_b71a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1780_c11_b71a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1780_c11_b71a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1780_c7_a536]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_a536_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_a536_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_a536_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_a536_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1780_c7_a536]
signal result_u16_value_MUX_uxn_opcodes_h_l1780_c7_a536_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1780_c7_a536_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1780_c7_a536_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1780_c7_a536_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1780_c7_a536]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_a536_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_a536_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_a536_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_a536_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1780_c7_a536]
signal result_u8_value_MUX_uxn_opcodes_h_l1780_c7_a536_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1780_c7_a536_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1780_c7_a536_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1780_c7_a536_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1780_c7_a536]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_a536_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_a536_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_a536_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_a536_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1780_c7_a536]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_a536_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_a536_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_a536_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_a536_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1780_c7_a536]
signal tmp8_low_MUX_uxn_opcodes_h_l1780_c7_a536_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1780_c7_a536_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1780_c7_a536_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1780_c7_a536_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1780_c7_a536]
signal t16_MUX_uxn_opcodes_h_l1780_c7_a536_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1780_c7_a536_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1780_c7_a536_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1780_c7_a536_return_output : unsigned(15 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1780_c7_a536]
signal tmp8_high_MUX_uxn_opcodes_h_l1780_c7_a536_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1780_c7_a536_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1780_c7_a536_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1780_c7_a536_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1781_c3_62c6]
signal BIN_OP_OR_uxn_opcodes_h_l1781_c3_62c6_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1781_c3_62c6_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1781_c3_62c6_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1782_c30_6b0b]
signal sp_relative_shift_uxn_opcodes_h_l1782_c30_6b0b_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1782_c30_6b0b_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1782_c30_6b0b_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1782_c30_6b0b_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1785_c11_68fc]
signal BIN_OP_EQ_uxn_opcodes_h_l1785_c11_68fc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1785_c11_68fc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1785_c11_68fc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1785_c7_75d7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_75d7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_75d7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_75d7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1785_c7_75d7]
signal result_u16_value_MUX_uxn_opcodes_h_l1785_c7_75d7_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1785_c7_75d7_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1785_c7_75d7_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1785_c7_75d7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_75d7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_75d7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_75d7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1785_c7_75d7]
signal result_u8_value_MUX_uxn_opcodes_h_l1785_c7_75d7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1785_c7_75d7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1785_c7_75d7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1785_c7_75d7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_75d7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_75d7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_75d7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1785_c7_75d7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_75d7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_75d7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_75d7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1785_c7_75d7]
signal tmp8_low_MUX_uxn_opcodes_h_l1785_c7_75d7_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1785_c7_75d7_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1785_c7_75d7_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1785_c7_75d7]
signal tmp8_high_MUX_uxn_opcodes_h_l1785_c7_75d7_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1785_c7_75d7_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1785_c7_75d7_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1787_c22_8602]
signal BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_8602_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_8602_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_8602_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1789_c11_a089]
signal BIN_OP_EQ_uxn_opcodes_h_l1789_c11_a089_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1789_c11_a089_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1789_c11_a089_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1789_c7_9b01]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_9b01_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_9b01_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_9b01_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_9b01_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1789_c7_9b01]
signal result_u8_value_MUX_uxn_opcodes_h_l1789_c7_9b01_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1789_c7_9b01_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1789_c7_9b01_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1789_c7_9b01_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1789_c7_9b01]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_9b01_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_9b01_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_9b01_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_9b01_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1789_c7_9b01]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_9b01_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_9b01_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_9b01_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_9b01_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1789_c7_9b01]
signal tmp8_low_MUX_uxn_opcodes_h_l1789_c7_9b01_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1789_c7_9b01_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1789_c7_9b01_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1789_c7_9b01_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1789_c7_9b01]
signal tmp8_high_MUX_uxn_opcodes_h_l1789_c7_9b01_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1789_c7_9b01_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1789_c7_9b01_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1789_c7_9b01_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1795_c11_5b03]
signal BIN_OP_EQ_uxn_opcodes_h_l1795_c11_5b03_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1795_c11_5b03_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1795_c11_5b03_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1795_c7_407e]
signal result_u8_value_MUX_uxn_opcodes_h_l1795_c7_407e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1795_c7_407e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1795_c7_407e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1795_c7_407e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1795_c7_407e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_407e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_407e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_407e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_407e_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1795_c7_407e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_407e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_407e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_407e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_407e_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1795_c7_407e]
signal tmp8_low_MUX_uxn_opcodes_h_l1795_c7_407e_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1795_c7_407e_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1795_c7_407e_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1795_c7_407e_return_output : unsigned(7 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_d736( ref_toks_0 : opcode_result_t;
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
      base.is_pc_updated := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.u16_value := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.is_vram_write := ref_toks_9;
      base.u8_value := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ca5d
BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ca5d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ca5d_left,
BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ca5d_right,
BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ca5d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3721
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3721 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3721_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3721_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3721
result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3721 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3721_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3721_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3721
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3721 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3721_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3721_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3721
result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3721 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3721_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3721_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3721
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3721 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3721_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3721_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3721
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3721 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3721_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3721_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3721
result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3721 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3721_cond,
result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3721_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3721
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3721 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3721_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3721_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3721
result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3721 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3721_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3721_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3721
result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3721 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3721_cond,
result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3721_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3721
tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3721 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3721_cond,
tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3721_return_output);

-- t16_MUX_uxn_opcodes_h_l1760_c2_3721
t16_MUX_uxn_opcodes_h_l1760_c2_3721 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1760_c2_3721_cond,
t16_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue,
t16_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse,
t16_MUX_uxn_opcodes_h_l1760_c2_3721_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3721
tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3721 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3721_cond,
tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3721_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1773_c11_de09
BIN_OP_EQ_uxn_opcodes_h_l1773_c11_de09 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1773_c11_de09_left,
BIN_OP_EQ_uxn_opcodes_h_l1773_c11_de09_right,
BIN_OP_EQ_uxn_opcodes_h_l1773_c11_de09_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_ca69
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_ca69 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_ca69_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_ca69_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_ca69_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1773_c7_ca69
result_u16_value_MUX_uxn_opcodes_h_l1773_c7_ca69 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1773_c7_ca69_cond,
result_u16_value_MUX_uxn_opcodes_h_l1773_c7_ca69_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1773_c7_ca69_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_ca69
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_ca69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_ca69_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_ca69_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_ca69_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1773_c7_ca69
result_u8_value_MUX_uxn_opcodes_h_l1773_c7_ca69 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1773_c7_ca69_cond,
result_u8_value_MUX_uxn_opcodes_h_l1773_c7_ca69_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1773_c7_ca69_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_ca69
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_ca69 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_ca69_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_ca69_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_ca69_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_ca69
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_ca69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_ca69_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_ca69_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_ca69_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1773_c7_ca69
tmp8_low_MUX_uxn_opcodes_h_l1773_c7_ca69 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1773_c7_ca69_cond,
tmp8_low_MUX_uxn_opcodes_h_l1773_c7_ca69_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1773_c7_ca69_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output);

-- t16_MUX_uxn_opcodes_h_l1773_c7_ca69
t16_MUX_uxn_opcodes_h_l1773_c7_ca69 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1773_c7_ca69_cond,
t16_MUX_uxn_opcodes_h_l1773_c7_ca69_iftrue,
t16_MUX_uxn_opcodes_h_l1773_c7_ca69_iffalse,
t16_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1773_c7_ca69
tmp8_high_MUX_uxn_opcodes_h_l1773_c7_ca69 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1773_c7_ca69_cond,
tmp8_high_MUX_uxn_opcodes_h_l1773_c7_ca69_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1773_c7_ca69_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1776_c11_5086
BIN_OP_EQ_uxn_opcodes_h_l1776_c11_5086 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1776_c11_5086_left,
BIN_OP_EQ_uxn_opcodes_h_l1776_c11_5086_right,
BIN_OP_EQ_uxn_opcodes_h_l1776_c11_5086_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_a7d5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_a7d5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_a7d5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_a7d5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_a7d5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1776_c7_a7d5
result_u16_value_MUX_uxn_opcodes_h_l1776_c7_a7d5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1776_c7_a7d5_cond,
result_u16_value_MUX_uxn_opcodes_h_l1776_c7_a7d5_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1776_c7_a7d5_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_a7d5
result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_a7d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_a7d5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_a7d5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_a7d5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1776_c7_a7d5
result_u8_value_MUX_uxn_opcodes_h_l1776_c7_a7d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1776_c7_a7d5_cond,
result_u8_value_MUX_uxn_opcodes_h_l1776_c7_a7d5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1776_c7_a7d5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_a7d5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_a7d5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_a7d5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_a7d5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_a7d5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_a7d5
result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_a7d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_a7d5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_a7d5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_a7d5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1776_c7_a7d5
tmp8_low_MUX_uxn_opcodes_h_l1776_c7_a7d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1776_c7_a7d5_cond,
tmp8_low_MUX_uxn_opcodes_h_l1776_c7_a7d5_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1776_c7_a7d5_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output);

-- t16_MUX_uxn_opcodes_h_l1776_c7_a7d5
t16_MUX_uxn_opcodes_h_l1776_c7_a7d5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1776_c7_a7d5_cond,
t16_MUX_uxn_opcodes_h_l1776_c7_a7d5_iftrue,
t16_MUX_uxn_opcodes_h_l1776_c7_a7d5_iffalse,
t16_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1776_c7_a7d5
tmp8_high_MUX_uxn_opcodes_h_l1776_c7_a7d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1776_c7_a7d5_cond,
tmp8_high_MUX_uxn_opcodes_h_l1776_c7_a7d5_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1776_c7_a7d5_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1778_c3_5352
CONST_SL_8_uxn_opcodes_h_l1778_c3_5352 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1778_c3_5352_x,
CONST_SL_8_uxn_opcodes_h_l1778_c3_5352_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1780_c11_b71a
BIN_OP_EQ_uxn_opcodes_h_l1780_c11_b71a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1780_c11_b71a_left,
BIN_OP_EQ_uxn_opcodes_h_l1780_c11_b71a_right,
BIN_OP_EQ_uxn_opcodes_h_l1780_c11_b71a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_a536
result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_a536 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_a536_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_a536_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_a536_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_a536_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1780_c7_a536
result_u16_value_MUX_uxn_opcodes_h_l1780_c7_a536 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1780_c7_a536_cond,
result_u16_value_MUX_uxn_opcodes_h_l1780_c7_a536_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1780_c7_a536_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1780_c7_a536_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_a536
result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_a536 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_a536_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_a536_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_a536_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_a536_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1780_c7_a536
result_u8_value_MUX_uxn_opcodes_h_l1780_c7_a536 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1780_c7_a536_cond,
result_u8_value_MUX_uxn_opcodes_h_l1780_c7_a536_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1780_c7_a536_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1780_c7_a536_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_a536
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_a536 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_a536_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_a536_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_a536_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_a536_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_a536
result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_a536 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_a536_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_a536_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_a536_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_a536_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1780_c7_a536
tmp8_low_MUX_uxn_opcodes_h_l1780_c7_a536 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1780_c7_a536_cond,
tmp8_low_MUX_uxn_opcodes_h_l1780_c7_a536_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1780_c7_a536_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1780_c7_a536_return_output);

-- t16_MUX_uxn_opcodes_h_l1780_c7_a536
t16_MUX_uxn_opcodes_h_l1780_c7_a536 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1780_c7_a536_cond,
t16_MUX_uxn_opcodes_h_l1780_c7_a536_iftrue,
t16_MUX_uxn_opcodes_h_l1780_c7_a536_iffalse,
t16_MUX_uxn_opcodes_h_l1780_c7_a536_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1780_c7_a536
tmp8_high_MUX_uxn_opcodes_h_l1780_c7_a536 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1780_c7_a536_cond,
tmp8_high_MUX_uxn_opcodes_h_l1780_c7_a536_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1780_c7_a536_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1780_c7_a536_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1781_c3_62c6
BIN_OP_OR_uxn_opcodes_h_l1781_c3_62c6 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1781_c3_62c6_left,
BIN_OP_OR_uxn_opcodes_h_l1781_c3_62c6_right,
BIN_OP_OR_uxn_opcodes_h_l1781_c3_62c6_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1782_c30_6b0b
sp_relative_shift_uxn_opcodes_h_l1782_c30_6b0b : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1782_c30_6b0b_ins,
sp_relative_shift_uxn_opcodes_h_l1782_c30_6b0b_x,
sp_relative_shift_uxn_opcodes_h_l1782_c30_6b0b_y,
sp_relative_shift_uxn_opcodes_h_l1782_c30_6b0b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1785_c11_68fc
BIN_OP_EQ_uxn_opcodes_h_l1785_c11_68fc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1785_c11_68fc_left,
BIN_OP_EQ_uxn_opcodes_h_l1785_c11_68fc_right,
BIN_OP_EQ_uxn_opcodes_h_l1785_c11_68fc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_75d7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_75d7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_75d7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_75d7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_75d7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1785_c7_75d7
result_u16_value_MUX_uxn_opcodes_h_l1785_c7_75d7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1785_c7_75d7_cond,
result_u16_value_MUX_uxn_opcodes_h_l1785_c7_75d7_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1785_c7_75d7_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_75d7
result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_75d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_75d7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_75d7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_75d7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1785_c7_75d7
result_u8_value_MUX_uxn_opcodes_h_l1785_c7_75d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1785_c7_75d7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1785_c7_75d7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1785_c7_75d7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_75d7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_75d7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_75d7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_75d7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_75d7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_75d7
result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_75d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_75d7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_75d7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_75d7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1785_c7_75d7
tmp8_low_MUX_uxn_opcodes_h_l1785_c7_75d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1785_c7_75d7_cond,
tmp8_low_MUX_uxn_opcodes_h_l1785_c7_75d7_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1785_c7_75d7_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1785_c7_75d7
tmp8_high_MUX_uxn_opcodes_h_l1785_c7_75d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1785_c7_75d7_cond,
tmp8_high_MUX_uxn_opcodes_h_l1785_c7_75d7_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1785_c7_75d7_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_8602
BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_8602 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_8602_left,
BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_8602_right,
BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_8602_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1789_c11_a089
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_a089 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_a089_left,
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_a089_right,
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_a089_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_9b01
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_9b01 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_9b01_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_9b01_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_9b01_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_9b01_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1789_c7_9b01
result_u8_value_MUX_uxn_opcodes_h_l1789_c7_9b01 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1789_c7_9b01_cond,
result_u8_value_MUX_uxn_opcodes_h_l1789_c7_9b01_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1789_c7_9b01_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1789_c7_9b01_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_9b01
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_9b01 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_9b01_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_9b01_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_9b01_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_9b01_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_9b01
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_9b01 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_9b01_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_9b01_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_9b01_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_9b01_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1789_c7_9b01
tmp8_low_MUX_uxn_opcodes_h_l1789_c7_9b01 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1789_c7_9b01_cond,
tmp8_low_MUX_uxn_opcodes_h_l1789_c7_9b01_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1789_c7_9b01_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1789_c7_9b01_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1789_c7_9b01
tmp8_high_MUX_uxn_opcodes_h_l1789_c7_9b01 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1789_c7_9b01_cond,
tmp8_high_MUX_uxn_opcodes_h_l1789_c7_9b01_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1789_c7_9b01_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1789_c7_9b01_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1795_c11_5b03
BIN_OP_EQ_uxn_opcodes_h_l1795_c11_5b03 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1795_c11_5b03_left,
BIN_OP_EQ_uxn_opcodes_h_l1795_c11_5b03_right,
BIN_OP_EQ_uxn_opcodes_h_l1795_c11_5b03_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1795_c7_407e
result_u8_value_MUX_uxn_opcodes_h_l1795_c7_407e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1795_c7_407e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1795_c7_407e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1795_c7_407e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1795_c7_407e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_407e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_407e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_407e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_407e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_407e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_407e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_407e
result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_407e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_407e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_407e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_407e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_407e_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1795_c7_407e
tmp8_low_MUX_uxn_opcodes_h_l1795_c7_407e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1795_c7_407e_cond,
tmp8_low_MUX_uxn_opcodes_h_l1795_c7_407e_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1795_c7_407e_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1795_c7_407e_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ca5d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3721_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3721_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3721_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3721_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3721_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3721_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3721_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3721_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3721_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3721_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3721_return_output,
 t16_MUX_uxn_opcodes_h_l1760_c2_3721_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3721_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1773_c11_de09_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output,
 t16_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1776_c11_5086_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output,
 t16_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output,
 CONST_SL_8_uxn_opcodes_h_l1778_c3_5352_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1780_c11_b71a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_a536_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1780_c7_a536_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_a536_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1780_c7_a536_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_a536_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_a536_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1780_c7_a536_return_output,
 t16_MUX_uxn_opcodes_h_l1780_c7_a536_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1780_c7_a536_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1781_c3_62c6_return_output,
 sp_relative_shift_uxn_opcodes_h_l1782_c30_6b0b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1785_c11_68fc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_8602_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1789_c11_a089_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_9b01_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1789_c7_9b01_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_9b01_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_9b01_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1789_c7_9b01_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1789_c7_9b01_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1795_c11_5b03_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1795_c7_407e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_407e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_407e_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1795_c7_407e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ca5d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ca5d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ca5d_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1765_c3_ba2e : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3721_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3721_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1760_c2_3721_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3721_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3721_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1760_c2_3721_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3721_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3721_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3721_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3721_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1770_c3_3d79 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3721_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3721_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3721_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3721_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3721_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3721_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1760_c2_3721_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3721_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3721_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1760_c2_3721_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3721_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3721_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3721_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3721_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3721_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3721_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1760_c2_3721_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1760_c2_3721_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3721_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3721_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_de09_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_de09_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_de09_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_ca69_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_ca69_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_ca69_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_ca69_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_ca69_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_ca69_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_ca69_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_ca69_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_ca69_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_ca69_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_ca69_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_ca69_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_ca69_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1774_c3_7e72 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_ca69_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_ca69_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_ca69_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_ca69_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_ca69_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_ca69_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_ca69_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_ca69_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1773_c7_ca69_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1773_c7_ca69_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1773_c7_ca69_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_ca69_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_ca69_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_ca69_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_5086_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_5086_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_5086_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_a7d5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_a7d5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_a536_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_a7d5_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_a7d5_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_a7d5_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_a536_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_a7d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_a7d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_a7d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_a536_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_a7d5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_a7d5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_a7d5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_a536_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_a7d5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_a7d5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_a7d5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_a536_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_a7d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_a7d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_a7d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_a536_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_a7d5_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_a7d5_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_a7d5_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_a536_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_a7d5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1776_c7_a7d5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1776_c7_a7d5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1780_c7_a536_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1776_c7_a7d5_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_a7d5_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_a7d5_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_a536_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_a7d5_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1778_c3_5352_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1778_c3_5352_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_b71a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_b71a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_b71a_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_a536_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_a536_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_a536_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_a536_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_a536_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_a536_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_a536_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_a536_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_a536_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_a536_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_a536_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_a536_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_a536_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_a536_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_a536_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_a536_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_a536_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_a536_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_a536_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_a536_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_a536_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1780_c7_a536_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1780_c7_a536_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1780_c7_a536_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_a536_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_a536_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_a536_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_62c6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_62c6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_62c6_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_6b0b_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_6b0b_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_6b0b_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_6b0b_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_68fc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_68fc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_68fc_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_75d7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1786_c3_d949 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_75d7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_75d7_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_75d7_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1787_c3_0282 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_75d7_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_75d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_75d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_75d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_9b01_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_75d7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_75d7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_75d7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_9b01_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_75d7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_75d7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_75d7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_9b01_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_75d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_75d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_75d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_9b01_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_75d7_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_75d7_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_75d7_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_9b01_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_75d7_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_75d7_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_75d7_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_9b01_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_75d7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_8602_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_8602_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_8602_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_a089_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_a089_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_a089_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_9b01_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_9b01_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_9b01_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_9b01_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_9b01_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_407e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_9b01_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_9b01_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1792_c3_dd74 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_9b01_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_407e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_9b01_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_9b01_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_9b01_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_407e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_9b01_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_9b01_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_9b01_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_407e_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_9b01_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_9b01_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_9b01_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_9b01_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_5b03_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_5b03_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_5b03_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_407e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_407e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_407e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_407e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1797_c3_a0ef : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_407e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_407e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_407e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_407e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_407e_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_407e_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_407e_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_407e_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1760_l1773_l1785_l1776_DUPLICATE_2c8c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1780_l1776_l1773_l1760_l1795_l1785_DUPLICATE_a5b2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1773_l1785_l1776_DUPLICATE_c728_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1780_l1776_l1773_l1789_l1785_DUPLICATE_2a36_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1780_l1776_l1773_l1795_l1789_l1785_DUPLICATE_edad_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1781_l1777_DUPLICATE_7711_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1780_l1795_l1785_l1776_DUPLICATE_2dc1_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d736_uxn_opcodes_h_l1802_l1755_DUPLICATE_b3d0_return_output : opcode_result_t;
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
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1786_c3_d949 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_75d7_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1786_c3_d949;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_5b03_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_68fc_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_6b0b_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_5086_right := to_unsigned(2, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_407e_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_9b01_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ca5d_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1770_c3_3d79 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1770_c3_3d79;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1797_c3_a0ef := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_407e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1797_c3_a0ef;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1774_c3_7e72 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_ca69_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1774_c3_7e72;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1792_c3_dd74 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_9b01_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1792_c3_dd74;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_8602_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_b71a_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_de09_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_a089_right := to_unsigned(5, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1765_c3_ba2e := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1765_c3_ba2e;
     VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_6b0b_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_6b0b_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ca5d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_de09_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_5086_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_b71a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_68fc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_a089_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_5b03_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_9b01_iftrue := VAR_previous_ram_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_407e_iftrue := VAR_previous_ram_read;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_9b01_iftrue := VAR_previous_ram_read;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_407e_iftrue := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_62c6_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_8602_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1773_c7_ca69_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1780_c7_a536_iffalse := t16;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_ca69_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_a7d5_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_a536_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_75d7_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_9b01_iffalse := tmp8_high;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_ca69_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_a7d5_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_a536_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_75d7_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_9b01_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_407e_iffalse := tmp8_low;
     -- BIN_OP_EQ[uxn_opcodes_h_l1795_c11_5b03] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1795_c11_5b03_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_5b03_left;
     BIN_OP_EQ_uxn_opcodes_h_l1795_c11_5b03_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_5b03_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_5b03_return_output := BIN_OP_EQ_uxn_opcodes_h_l1795_c11_5b03_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1776_c11_5086] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1776_c11_5086_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_5086_left;
     BIN_OP_EQ_uxn_opcodes_h_l1776_c11_5086_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_5086_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_5086_return_output := BIN_OP_EQ_uxn_opcodes_h_l1776_c11_5086_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1760_c6_ca5d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ca5d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ca5d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ca5d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ca5d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ca5d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ca5d_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1780_l1776_l1773_l1760_l1795_l1785_DUPLICATE_a5b2 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1780_l1776_l1773_l1760_l1795_l1785_DUPLICATE_a5b2_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1789_c11_a089] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1789_c11_a089_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_a089_left;
     BIN_OP_EQ_uxn_opcodes_h_l1789_c11_a089_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_a089_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_a089_return_output := BIN_OP_EQ_uxn_opcodes_h_l1789_c11_a089_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1781_l1777_DUPLICATE_7711 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1781_l1777_DUPLICATE_7711_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1780_l1776_l1773_l1795_l1789_l1785_DUPLICATE_edad LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1780_l1776_l1773_l1795_l1789_l1785_DUPLICATE_edad_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1785_c11_68fc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1785_c11_68fc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_68fc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1785_c11_68fc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_68fc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_68fc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1785_c11_68fc_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1787_c22_8602] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_8602_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_8602_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_8602_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_8602_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_8602_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_8602_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1780_c11_b71a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1780_c11_b71a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_b71a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1780_c11_b71a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_b71a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_b71a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1780_c11_b71a_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1760_c2_3721] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1760_c2_3721_return_output := result.is_pc_updated;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1760_c2_3721] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1760_c2_3721_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1760_l1773_l1785_l1776_DUPLICATE_2c8c LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1760_l1773_l1785_l1776_DUPLICATE_2c8c_return_output := result.u16_value;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1760_c2_3721] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1760_c2_3721_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1780_l1776_l1773_l1789_l1785_DUPLICATE_2a36 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1780_l1776_l1773_l1789_l1785_DUPLICATE_2a36_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1773_c11_de09] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1773_c11_de09_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_de09_left;
     BIN_OP_EQ_uxn_opcodes_h_l1773_c11_de09_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_de09_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_de09_return_output := BIN_OP_EQ_uxn_opcodes_h_l1773_c11_de09_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1760_c2_3721] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1760_c2_3721_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1780_l1795_l1785_l1776_DUPLICATE_2dc1 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1780_l1795_l1785_l1776_DUPLICATE_2dc1_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1773_l1785_l1776_DUPLICATE_c728 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1773_l1785_l1776_DUPLICATE_c728_return_output := result.sp_relative_shift;

     -- sp_relative_shift[uxn_opcodes_h_l1782_c30_6b0b] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1782_c30_6b0b_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_6b0b_ins;
     sp_relative_shift_uxn_opcodes_h_l1782_c30_6b0b_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_6b0b_x;
     sp_relative_shift_uxn_opcodes_h_l1782_c30_6b0b_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_6b0b_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_6b0b_return_output := sp_relative_shift_uxn_opcodes_h_l1782_c30_6b0b_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3721_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ca5d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3721_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ca5d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3721_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ca5d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3721_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ca5d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3721_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ca5d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3721_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ca5d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3721_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ca5d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3721_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ca5d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3721_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ca5d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3721_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ca5d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1760_c2_3721_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ca5d_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3721_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ca5d_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3721_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_ca5d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_ca69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_de09_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_ca69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_de09_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_ca69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_de09_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_ca69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_de09_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_ca69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_de09_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_ca69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_de09_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1773_c7_ca69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_de09_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_ca69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_de09_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_ca69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_de09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_a7d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_5086_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_a7d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_5086_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_a7d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_5086_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_a7d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_5086_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_a7d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_5086_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_a7d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_5086_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1776_c7_a7d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_5086_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_a7d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_5086_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_a7d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_5086_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_a536_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_b71a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_a536_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_b71a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_a536_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_b71a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_a536_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_b71a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_a536_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_b71a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_a536_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_b71a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1780_c7_a536_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_b71a_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_a536_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_b71a_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_a536_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_b71a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_75d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_68fc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_75d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_68fc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_75d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_68fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_75d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_68fc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_75d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_68fc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_75d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_68fc_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_75d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_68fc_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_75d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_68fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_9b01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_a089_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_9b01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_a089_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_9b01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_a089_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_9b01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_a089_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_9b01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_a089_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_9b01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_a089_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_407e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_5b03_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_407e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_5b03_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_407e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_5b03_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_407e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_5b03_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1787_c3_0282 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_8602_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_62c6_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1781_l1777_DUPLICATE_7711_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1778_c3_5352_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1781_l1777_DUPLICATE_7711_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_ca69_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1773_l1785_l1776_DUPLICATE_c728_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_a7d5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1773_l1785_l1776_DUPLICATE_c728_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_75d7_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1773_l1785_l1776_DUPLICATE_c728_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1760_l1773_l1785_l1776_DUPLICATE_2c8c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_ca69_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1760_l1773_l1785_l1776_DUPLICATE_2c8c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_a7d5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1760_l1773_l1785_l1776_DUPLICATE_2c8c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_75d7_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1760_l1773_l1785_l1776_DUPLICATE_2c8c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_ca69_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1780_l1776_l1773_l1795_l1789_l1785_DUPLICATE_edad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_a7d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1780_l1776_l1773_l1795_l1789_l1785_DUPLICATE_edad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_a536_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1780_l1776_l1773_l1795_l1789_l1785_DUPLICATE_edad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_75d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1780_l1776_l1773_l1795_l1789_l1785_DUPLICATE_edad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_9b01_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1780_l1776_l1773_l1795_l1789_l1785_DUPLICATE_edad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_407e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1780_l1776_l1773_l1795_l1789_l1785_DUPLICATE_edad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_ca69_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1780_l1776_l1773_l1789_l1785_DUPLICATE_2a36_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_a7d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1780_l1776_l1773_l1789_l1785_DUPLICATE_2a36_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_a536_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1780_l1776_l1773_l1789_l1785_DUPLICATE_2a36_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_75d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1780_l1776_l1773_l1789_l1785_DUPLICATE_2a36_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_9b01_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1780_l1776_l1773_l1789_l1785_DUPLICATE_2a36_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_a7d5_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1780_l1795_l1785_l1776_DUPLICATE_2dc1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_a536_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1780_l1795_l1785_l1776_DUPLICATE_2dc1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_75d7_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1780_l1795_l1785_l1776_DUPLICATE_2dc1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_407e_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1780_l1795_l1785_l1776_DUPLICATE_2dc1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1780_l1776_l1773_l1760_l1795_l1785_DUPLICATE_a5b2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_ca69_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1780_l1776_l1773_l1760_l1795_l1785_DUPLICATE_a5b2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_a7d5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1780_l1776_l1773_l1760_l1795_l1785_DUPLICATE_a5b2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_a536_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1780_l1776_l1773_l1760_l1795_l1785_DUPLICATE_a5b2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_75d7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1780_l1776_l1773_l1760_l1795_l1785_DUPLICATE_a5b2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_407e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1780_l1776_l1773_l1760_l1795_l1785_DUPLICATE_a5b2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1760_c2_3721_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1760_c2_3721_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1760_c2_3721_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1760_c2_3721_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_a536_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_6b0b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_75d7_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1787_c3_0282;
     -- tmp8_low_MUX[uxn_opcodes_h_l1795_c7_407e] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1795_c7_407e_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_407e_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1795_c7_407e_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_407e_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1795_c7_407e_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_407e_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_407e_return_output := tmp8_low_MUX_uxn_opcodes_h_l1795_c7_407e_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1760_c2_3721] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3721_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3721_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3721_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3721_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1789_c7_9b01] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_9b01_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_9b01_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_9b01_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_9b01_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_9b01_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_9b01_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_9b01_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_9b01_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1760_c2_3721] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3721_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3721_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3721_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3721_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1789_c7_9b01] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1789_c7_9b01_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_9b01_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1789_c7_9b01_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_9b01_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1789_c7_9b01_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_9b01_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_9b01_return_output := tmp8_high_MUX_uxn_opcodes_h_l1789_c7_9b01_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1795_c7_407e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_407e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_407e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_407e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_407e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_407e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_407e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_407e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_407e_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1778_c3_5352] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1778_c3_5352_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1778_c3_5352_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1778_c3_5352_return_output := CONST_SL_8_uxn_opcodes_h_l1778_c3_5352_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1760_c2_3721] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3721_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3721_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3721_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3721_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1795_c7_407e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1795_c7_407e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_407e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1795_c7_407e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_407e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1795_c7_407e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_407e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_407e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1795_c7_407e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1781_c3_62c6] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1781_c3_62c6_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_62c6_left;
     BIN_OP_OR_uxn_opcodes_h_l1781_c3_62c6_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_62c6_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_62c6_return_output := BIN_OP_OR_uxn_opcodes_h_l1781_c3_62c6_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1760_c2_3721] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3721_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3721_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3721_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3721_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1795_c7_407e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_407e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_407e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_407e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_407e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_407e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_407e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_407e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_407e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1785_c7_75d7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_75d7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_75d7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_75d7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_75d7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_75d7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_75d7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1785_c7_75d7] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1785_c7_75d7_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_75d7_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1785_c7_75d7_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_75d7_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1785_c7_75d7_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_75d7_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output := result_u16_value_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_a536_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_62c6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1780_c7_a536_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_62c6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1776_c7_a7d5_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1778_c3_5352_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_9b01_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_407e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_75d7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_9b01_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_a536_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_9b01_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_407e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_a536_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_9b01_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_407e_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_75d7_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_9b01_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_9b01_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_407e_return_output;
     -- tmp8_low_MUX[uxn_opcodes_h_l1789_c7_9b01] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1789_c7_9b01_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_9b01_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1789_c7_9b01_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_9b01_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1789_c7_9b01_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_9b01_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_9b01_return_output := tmp8_low_MUX_uxn_opcodes_h_l1789_c7_9b01_return_output;

     -- t16_MUX[uxn_opcodes_h_l1780_c7_a536] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1780_c7_a536_cond <= VAR_t16_MUX_uxn_opcodes_h_l1780_c7_a536_cond;
     t16_MUX_uxn_opcodes_h_l1780_c7_a536_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1780_c7_a536_iftrue;
     t16_MUX_uxn_opcodes_h_l1780_c7_a536_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1780_c7_a536_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1780_c7_a536_return_output := t16_MUX_uxn_opcodes_h_l1780_c7_a536_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1789_c7_9b01] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_9b01_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_9b01_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_9b01_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_9b01_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_9b01_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_9b01_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_9b01_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_9b01_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1789_c7_9b01] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1789_c7_9b01_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_9b01_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1789_c7_9b01_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_9b01_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1789_c7_9b01_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_9b01_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_9b01_return_output := result_u8_value_MUX_uxn_opcodes_h_l1789_c7_9b01_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1780_c7_a536] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_a536_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_a536_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_a536_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_a536_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_a536_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_a536_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_a536_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_a536_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1785_c7_75d7] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1785_c7_75d7_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_75d7_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1785_c7_75d7_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_75d7_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1785_c7_75d7_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_75d7_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output := tmp8_high_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1785_c7_75d7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_75d7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_75d7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_75d7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_75d7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_75d7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_75d7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1789_c7_9b01] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_9b01_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_9b01_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_9b01_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_9b01_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_9b01_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_9b01_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_9b01_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_9b01_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1780_c7_a536] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1780_c7_a536_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_a536_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1780_c7_a536_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_a536_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1780_c7_a536_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_a536_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_a536_return_output := result_u16_value_MUX_uxn_opcodes_h_l1780_c7_a536_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_75d7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_9b01_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_a536_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_a7d5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_a536_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_75d7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_9b01_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_a7d5_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_a536_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_75d7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_9b01_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1776_c7_a7d5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1780_c7_a536_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_a536_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_75d7_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_9b01_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1776_c7_a7d5] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1776_c7_a7d5_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_a7d5_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1776_c7_a7d5_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_a7d5_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1776_c7_a7d5_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_a7d5_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output := result_u16_value_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1776_c7_a7d5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_a7d5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_a7d5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_a7d5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_a7d5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_a7d5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_a7d5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output;

     -- t16_MUX[uxn_opcodes_h_l1776_c7_a7d5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1776_c7_a7d5_cond <= VAR_t16_MUX_uxn_opcodes_h_l1776_c7_a7d5_cond;
     t16_MUX_uxn_opcodes_h_l1776_c7_a7d5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1776_c7_a7d5_iftrue;
     t16_MUX_uxn_opcodes_h_l1776_c7_a7d5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1776_c7_a7d5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output := t16_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1785_c7_75d7] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1785_c7_75d7_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_75d7_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1785_c7_75d7_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_75d7_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1785_c7_75d7_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_75d7_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output := tmp8_low_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1780_c7_a536] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_a536_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_a536_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_a536_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_a536_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_a536_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_a536_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_a536_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_a536_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1785_c7_75d7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_75d7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_75d7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_75d7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_75d7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_75d7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_75d7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1785_c7_75d7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1785_c7_75d7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_75d7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1785_c7_75d7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_75d7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1785_c7_75d7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_75d7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1785_c7_75d7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_75d7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_75d7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_75d7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_75d7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_75d7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_75d7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1780_c7_a536] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1780_c7_a536_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_a536_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1780_c7_a536_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_a536_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1780_c7_a536_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_a536_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_a536_return_output := tmp8_high_MUX_uxn_opcodes_h_l1780_c7_a536_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_a536_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_a7d5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_a536_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_ca69_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_a536_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_ca69_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_a536_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1773_c7_ca69_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_a7d5_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_a536_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_a536_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_75d7_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1780_c7_a536] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_a536_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_a536_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_a536_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_a536_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_a536_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_a536_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_a536_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_a536_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1780_c7_a536] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1780_c7_a536_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_a536_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1780_c7_a536_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_a536_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1780_c7_a536_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_a536_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_a536_return_output := tmp8_low_MUX_uxn_opcodes_h_l1780_c7_a536_return_output;

     -- t16_MUX[uxn_opcodes_h_l1773_c7_ca69] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1773_c7_ca69_cond <= VAR_t16_MUX_uxn_opcodes_h_l1773_c7_ca69_cond;
     t16_MUX_uxn_opcodes_h_l1773_c7_ca69_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1773_c7_ca69_iftrue;
     t16_MUX_uxn_opcodes_h_l1773_c7_ca69_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1773_c7_ca69_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output := t16_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1780_c7_a536] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_a536_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_a536_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_a536_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_a536_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_a536_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_a536_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_a536_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_a536_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1776_c7_a7d5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_a7d5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_a7d5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_a7d5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_a7d5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_a7d5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_a7d5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1773_c7_ca69] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1773_c7_ca69_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_ca69_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1773_c7_ca69_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_ca69_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1773_c7_ca69_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_ca69_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output := result_u16_value_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1773_c7_ca69] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_ca69_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_ca69_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_ca69_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_ca69_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_ca69_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_ca69_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1776_c7_a7d5] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1776_c7_a7d5_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_a7d5_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1776_c7_a7d5_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_a7d5_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1776_c7_a7d5_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_a7d5_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output := tmp8_high_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1780_c7_a536] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1780_c7_a536_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_a536_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1780_c7_a536_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_a536_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1780_c7_a536_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_a536_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_a536_return_output := result_u8_value_MUX_uxn_opcodes_h_l1780_c7_a536_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_a7d5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_a536_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_ca69_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_a7d5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_a536_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_a7d5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_a536_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_ca69_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_a7d5_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_a536_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1776_c7_a7d5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_a7d5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_a7d5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_a7d5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_a7d5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_a7d5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_a7d5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1760_c2_3721] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3721_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3721_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3721_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3721_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1776_c7_a7d5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_a7d5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_a7d5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_a7d5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_a7d5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_a7d5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_a7d5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1776_c7_a7d5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1776_c7_a7d5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_a7d5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1776_c7_a7d5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_a7d5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1776_c7_a7d5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_a7d5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output := result_u8_value_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output;

     -- t16_MUX[uxn_opcodes_h_l1760_c2_3721] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1760_c2_3721_cond <= VAR_t16_MUX_uxn_opcodes_h_l1760_c2_3721_cond;
     t16_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue;
     t16_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1760_c2_3721_return_output := t16_MUX_uxn_opcodes_h_l1760_c2_3721_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1773_c7_ca69] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1773_c7_ca69_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_ca69_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1773_c7_ca69_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_ca69_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1773_c7_ca69_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_ca69_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output := tmp8_high_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1776_c7_a7d5] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1776_c7_a7d5_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_a7d5_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1776_c7_a7d5_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_a7d5_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1776_c7_a7d5_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_a7d5_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output := tmp8_low_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1773_c7_ca69] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_ca69_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_ca69_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_ca69_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_ca69_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_ca69_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_ca69_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1760_c2_3721] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3721_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3721_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3721_return_output := result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3721_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_ca69_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_ca69_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_ca69_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1760_c2_3721_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_ca69_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_a7d5_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1773_c7_ca69] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_ca69_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_ca69_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_ca69_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_ca69_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_ca69_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_ca69_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1773_c7_ca69] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1773_c7_ca69_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_ca69_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1773_c7_ca69_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_ca69_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1773_c7_ca69_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_ca69_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output := tmp8_low_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1760_c2_3721] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3721_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3721_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3721_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3721_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1773_c7_ca69] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1773_c7_ca69_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_ca69_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1773_c7_ca69_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_ca69_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1773_c7_ca69_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_ca69_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output := result_u8_value_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1760_c2_3721] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3721_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3721_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3721_return_output := tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3721_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1773_c7_ca69] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_ca69_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_ca69_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_ca69_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_ca69_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_ca69_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_ca69_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output;
     REG_VAR_tmp8_high := VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_3721_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_ca69_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1760_c2_3721] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3721_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3721_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3721_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3721_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1760_c2_3721] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3721_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3721_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3721_return_output := tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3721_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1760_c2_3721] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3721_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3721_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3721_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3721_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1760_c2_3721] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3721_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3721_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3721_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3721_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3721_return_output := result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3721_return_output;

     -- Submodule level 8
     REG_VAR_tmp8_low := VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_3721_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d736_uxn_opcodes_h_l1802_l1755_DUPLICATE_b3d0 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d736_uxn_opcodes_h_l1802_l1755_DUPLICATE_b3d0_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d736(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_3721_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_3721_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_3721_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_3721_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_3721_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_3721_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_3721_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_3721_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_3721_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_3721_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d736_uxn_opcodes_h_l1802_l1755_DUPLICATE_b3d0_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d736_uxn_opcodes_h_l1802_l1755_DUPLICATE_b3d0_return_output;
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
