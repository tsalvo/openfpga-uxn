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
-- BIN_OP_EQ[uxn_opcodes_h_l1760_c6_0813]
signal BIN_OP_EQ_uxn_opcodes_h_l1760_c6_0813_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1760_c6_0813_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1760_c6_0813_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1760_c2_7926]
signal tmp8_high_MUX_uxn_opcodes_h_l1760_c2_7926_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1760_c2_7926_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1760_c2_7926]
signal t16_MUX_uxn_opcodes_h_l1760_c2_7926_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1760_c2_7926_return_output : unsigned(15 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1760_c2_7926]
signal tmp8_low_MUX_uxn_opcodes_h_l1760_c2_7926_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1760_c2_7926_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1760_c2_7926]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_7926_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_7926_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1760_c2_7926]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_7926_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_7926_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1760_c2_7926]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_7926_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_7926_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1760_c2_7926]
signal result_u8_value_MUX_uxn_opcodes_h_l1760_c2_7926_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1760_c2_7926_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1760_c2_7926]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_7926_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_7926_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1760_c2_7926]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_7926_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_7926_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1760_c2_7926]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_7926_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_7926_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1760_c2_7926]
signal result_u16_value_MUX_uxn_opcodes_h_l1760_c2_7926_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1760_c2_7926_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1760_c2_7926]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_7926_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_7926_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1760_c2_7926]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_7926_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_7926_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1773_c11_6205]
signal BIN_OP_EQ_uxn_opcodes_h_l1773_c11_6205_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1773_c11_6205_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1773_c11_6205_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1773_c7_5655]
signal tmp8_high_MUX_uxn_opcodes_h_l1773_c7_5655_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1773_c7_5655_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1773_c7_5655_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1773_c7_5655_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1773_c7_5655]
signal t16_MUX_uxn_opcodes_h_l1773_c7_5655_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1773_c7_5655_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1773_c7_5655_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1773_c7_5655_return_output : unsigned(15 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1773_c7_5655]
signal tmp8_low_MUX_uxn_opcodes_h_l1773_c7_5655_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1773_c7_5655_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1773_c7_5655_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1773_c7_5655_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1773_c7_5655]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_5655_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_5655_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_5655_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_5655_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1773_c7_5655]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_5655_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_5655_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_5655_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_5655_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1773_c7_5655]
signal result_u8_value_MUX_uxn_opcodes_h_l1773_c7_5655_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1773_c7_5655_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1773_c7_5655_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1773_c7_5655_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1773_c7_5655]
signal result_u16_value_MUX_uxn_opcodes_h_l1773_c7_5655_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1773_c7_5655_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1773_c7_5655_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1773_c7_5655_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1773_c7_5655]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_5655_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_5655_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_5655_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_5655_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1773_c7_5655]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_5655_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_5655_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_5655_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_5655_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1776_c11_77bc]
signal BIN_OP_EQ_uxn_opcodes_h_l1776_c11_77bc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1776_c11_77bc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1776_c11_77bc_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1776_c7_f9b6]
signal tmp8_high_MUX_uxn_opcodes_h_l1776_c7_f9b6_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1776_c7_f9b6_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1776_c7_f9b6_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1776_c7_f9b6]
signal t16_MUX_uxn_opcodes_h_l1776_c7_f9b6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1776_c7_f9b6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1776_c7_f9b6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output : unsigned(15 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1776_c7_f9b6]
signal tmp8_low_MUX_uxn_opcodes_h_l1776_c7_f9b6_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1776_c7_f9b6_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1776_c7_f9b6_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1776_c7_f9b6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_f9b6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_f9b6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_f9b6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1776_c7_f9b6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_f9b6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_f9b6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_f9b6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1776_c7_f9b6]
signal result_u8_value_MUX_uxn_opcodes_h_l1776_c7_f9b6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1776_c7_f9b6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1776_c7_f9b6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1776_c7_f9b6]
signal result_u16_value_MUX_uxn_opcodes_h_l1776_c7_f9b6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1776_c7_f9b6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1776_c7_f9b6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1776_c7_f9b6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_f9b6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_f9b6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_f9b6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1776_c7_f9b6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_f9b6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_f9b6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_f9b6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output : unsigned(3 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1778_c3_7f95]
signal CONST_SL_8_uxn_opcodes_h_l1778_c3_7f95_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1778_c3_7f95_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1780_c11_1dde]
signal BIN_OP_EQ_uxn_opcodes_h_l1780_c11_1dde_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1780_c11_1dde_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1780_c11_1dde_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1780_c7_3f38]
signal tmp8_high_MUX_uxn_opcodes_h_l1780_c7_3f38_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1780_c7_3f38_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1780_c7_3f38_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1780_c7_3f38]
signal t16_MUX_uxn_opcodes_h_l1780_c7_3f38_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1780_c7_3f38_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1780_c7_3f38_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output : unsigned(15 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1780_c7_3f38]
signal tmp8_low_MUX_uxn_opcodes_h_l1780_c7_3f38_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1780_c7_3f38_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1780_c7_3f38_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1780_c7_3f38]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_3f38_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_3f38_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_3f38_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1780_c7_3f38]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_3f38_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_3f38_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_3f38_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1780_c7_3f38]
signal result_u8_value_MUX_uxn_opcodes_h_l1780_c7_3f38_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1780_c7_3f38_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1780_c7_3f38_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1780_c7_3f38]
signal result_u16_value_MUX_uxn_opcodes_h_l1780_c7_3f38_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1780_c7_3f38_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1780_c7_3f38_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1780_c7_3f38]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_3f38_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_3f38_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_3f38_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1780_c7_3f38]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_3f38_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_3f38_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_3f38_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1781_c3_4bbe]
signal BIN_OP_OR_uxn_opcodes_h_l1781_c3_4bbe_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1781_c3_4bbe_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1781_c3_4bbe_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1782_c30_652d]
signal sp_relative_shift_uxn_opcodes_h_l1782_c30_652d_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1782_c30_652d_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1782_c30_652d_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1782_c30_652d_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1785_c11_13d7]
signal BIN_OP_EQ_uxn_opcodes_h_l1785_c11_13d7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1785_c11_13d7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1785_c11_13d7_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1785_c7_9227]
signal tmp8_high_MUX_uxn_opcodes_h_l1785_c7_9227_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1785_c7_9227_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1785_c7_9227_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1785_c7_9227_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1785_c7_9227]
signal tmp8_low_MUX_uxn_opcodes_h_l1785_c7_9227_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1785_c7_9227_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1785_c7_9227_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1785_c7_9227_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1785_c7_9227]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_9227_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_9227_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_9227_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_9227_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1785_c7_9227]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_9227_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_9227_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_9227_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_9227_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1785_c7_9227]
signal result_u8_value_MUX_uxn_opcodes_h_l1785_c7_9227_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1785_c7_9227_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1785_c7_9227_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1785_c7_9227_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1785_c7_9227]
signal result_u16_value_MUX_uxn_opcodes_h_l1785_c7_9227_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1785_c7_9227_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1785_c7_9227_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1785_c7_9227_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1785_c7_9227]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_9227_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_9227_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_9227_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_9227_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1785_c7_9227]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_9227_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_9227_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_9227_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_9227_return_output : unsigned(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1787_c22_fba5]
signal BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_fba5_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_fba5_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_fba5_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1789_c11_3067]
signal BIN_OP_EQ_uxn_opcodes_h_l1789_c11_3067_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1789_c11_3067_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1789_c11_3067_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1789_c7_a6da]
signal tmp8_high_MUX_uxn_opcodes_h_l1789_c7_a6da_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1789_c7_a6da_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1789_c7_a6da_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1789_c7_a6da_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1789_c7_a6da]
signal tmp8_low_MUX_uxn_opcodes_h_l1789_c7_a6da_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1789_c7_a6da_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1789_c7_a6da_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1789_c7_a6da_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1789_c7_a6da]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_a6da_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_a6da_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_a6da_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_a6da_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1789_c7_a6da]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_a6da_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_a6da_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_a6da_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_a6da_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1789_c7_a6da]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_a6da_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_a6da_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_a6da_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_a6da_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1789_c7_a6da]
signal result_u8_value_MUX_uxn_opcodes_h_l1789_c7_a6da_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1789_c7_a6da_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1789_c7_a6da_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1789_c7_a6da_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1795_c11_1ebb]
signal BIN_OP_EQ_uxn_opcodes_h_l1795_c11_1ebb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1795_c11_1ebb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1795_c11_1ebb_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1795_c7_3892]
signal tmp8_low_MUX_uxn_opcodes_h_l1795_c7_3892_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1795_c7_3892_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1795_c7_3892_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1795_c7_3892_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1795_c7_3892]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_3892_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_3892_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_3892_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_3892_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1795_c7_3892]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_3892_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_3892_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_3892_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_3892_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1795_c7_3892]
signal result_u8_value_MUX_uxn_opcodes_h_l1795_c7_3892_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1795_c7_3892_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1795_c7_3892_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1795_c7_3892_return_output : unsigned(7 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_1899( ref_toks_0 : opcode_result_t;
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
      base.is_stack_index_flipped := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.u16_value := ref_toks_8;
      base.is_ram_write := ref_toks_9;
      base.stack_address_sp_offset := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1760_c6_0813
BIN_OP_EQ_uxn_opcodes_h_l1760_c6_0813 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1760_c6_0813_left,
BIN_OP_EQ_uxn_opcodes_h_l1760_c6_0813_right,
BIN_OP_EQ_uxn_opcodes_h_l1760_c6_0813_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1760_c2_7926
tmp8_high_MUX_uxn_opcodes_h_l1760_c2_7926 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1760_c2_7926_cond,
tmp8_high_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1760_c2_7926_return_output);

-- t16_MUX_uxn_opcodes_h_l1760_c2_7926
t16_MUX_uxn_opcodes_h_l1760_c2_7926 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1760_c2_7926_cond,
t16_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue,
t16_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse,
t16_MUX_uxn_opcodes_h_l1760_c2_7926_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1760_c2_7926
tmp8_low_MUX_uxn_opcodes_h_l1760_c2_7926 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1760_c2_7926_cond,
tmp8_low_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1760_c2_7926_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_7926
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_7926 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_7926_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_7926_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_7926
result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_7926 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_7926_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_7926_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_7926
result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_7926 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_7926_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_7926_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1760_c2_7926
result_u8_value_MUX_uxn_opcodes_h_l1760_c2_7926 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1760_c2_7926_cond,
result_u8_value_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1760_c2_7926_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_7926
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_7926 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_7926_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_7926_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_7926
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_7926 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_7926_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_7926_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_7926
result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_7926 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_7926_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_7926_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1760_c2_7926
result_u16_value_MUX_uxn_opcodes_h_l1760_c2_7926 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1760_c2_7926_cond,
result_u16_value_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1760_c2_7926_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_7926
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_7926 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_7926_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_7926_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_7926
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_7926 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_7926_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_7926_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1773_c11_6205
BIN_OP_EQ_uxn_opcodes_h_l1773_c11_6205 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1773_c11_6205_left,
BIN_OP_EQ_uxn_opcodes_h_l1773_c11_6205_right,
BIN_OP_EQ_uxn_opcodes_h_l1773_c11_6205_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1773_c7_5655
tmp8_high_MUX_uxn_opcodes_h_l1773_c7_5655 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1773_c7_5655_cond,
tmp8_high_MUX_uxn_opcodes_h_l1773_c7_5655_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1773_c7_5655_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1773_c7_5655_return_output);

-- t16_MUX_uxn_opcodes_h_l1773_c7_5655
t16_MUX_uxn_opcodes_h_l1773_c7_5655 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1773_c7_5655_cond,
t16_MUX_uxn_opcodes_h_l1773_c7_5655_iftrue,
t16_MUX_uxn_opcodes_h_l1773_c7_5655_iffalse,
t16_MUX_uxn_opcodes_h_l1773_c7_5655_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1773_c7_5655
tmp8_low_MUX_uxn_opcodes_h_l1773_c7_5655 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1773_c7_5655_cond,
tmp8_low_MUX_uxn_opcodes_h_l1773_c7_5655_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1773_c7_5655_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1773_c7_5655_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_5655
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_5655 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_5655_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_5655_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_5655_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_5655_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_5655
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_5655 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_5655_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_5655_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_5655_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_5655_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1773_c7_5655
result_u8_value_MUX_uxn_opcodes_h_l1773_c7_5655 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1773_c7_5655_cond,
result_u8_value_MUX_uxn_opcodes_h_l1773_c7_5655_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1773_c7_5655_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1773_c7_5655_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1773_c7_5655
result_u16_value_MUX_uxn_opcodes_h_l1773_c7_5655 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1773_c7_5655_cond,
result_u16_value_MUX_uxn_opcodes_h_l1773_c7_5655_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1773_c7_5655_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1773_c7_5655_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_5655
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_5655 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_5655_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_5655_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_5655_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_5655_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_5655
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_5655 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_5655_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_5655_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_5655_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_5655_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1776_c11_77bc
BIN_OP_EQ_uxn_opcodes_h_l1776_c11_77bc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1776_c11_77bc_left,
BIN_OP_EQ_uxn_opcodes_h_l1776_c11_77bc_right,
BIN_OP_EQ_uxn_opcodes_h_l1776_c11_77bc_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1776_c7_f9b6
tmp8_high_MUX_uxn_opcodes_h_l1776_c7_f9b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1776_c7_f9b6_cond,
tmp8_high_MUX_uxn_opcodes_h_l1776_c7_f9b6_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1776_c7_f9b6_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output);

-- t16_MUX_uxn_opcodes_h_l1776_c7_f9b6
t16_MUX_uxn_opcodes_h_l1776_c7_f9b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1776_c7_f9b6_cond,
t16_MUX_uxn_opcodes_h_l1776_c7_f9b6_iftrue,
t16_MUX_uxn_opcodes_h_l1776_c7_f9b6_iffalse,
t16_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1776_c7_f9b6
tmp8_low_MUX_uxn_opcodes_h_l1776_c7_f9b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1776_c7_f9b6_cond,
tmp8_low_MUX_uxn_opcodes_h_l1776_c7_f9b6_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1776_c7_f9b6_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_f9b6
result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_f9b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_f9b6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_f9b6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_f9b6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_f9b6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_f9b6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_f9b6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_f9b6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_f9b6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1776_c7_f9b6
result_u8_value_MUX_uxn_opcodes_h_l1776_c7_f9b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1776_c7_f9b6_cond,
result_u8_value_MUX_uxn_opcodes_h_l1776_c7_f9b6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1776_c7_f9b6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1776_c7_f9b6
result_u16_value_MUX_uxn_opcodes_h_l1776_c7_f9b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1776_c7_f9b6_cond,
result_u16_value_MUX_uxn_opcodes_h_l1776_c7_f9b6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1776_c7_f9b6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_f9b6
result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_f9b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_f9b6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_f9b6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_f9b6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_f9b6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_f9b6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_f9b6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_f9b6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_f9b6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1778_c3_7f95
CONST_SL_8_uxn_opcodes_h_l1778_c3_7f95 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1778_c3_7f95_x,
CONST_SL_8_uxn_opcodes_h_l1778_c3_7f95_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1780_c11_1dde
BIN_OP_EQ_uxn_opcodes_h_l1780_c11_1dde : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1780_c11_1dde_left,
BIN_OP_EQ_uxn_opcodes_h_l1780_c11_1dde_right,
BIN_OP_EQ_uxn_opcodes_h_l1780_c11_1dde_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1780_c7_3f38
tmp8_high_MUX_uxn_opcodes_h_l1780_c7_3f38 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1780_c7_3f38_cond,
tmp8_high_MUX_uxn_opcodes_h_l1780_c7_3f38_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1780_c7_3f38_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output);

-- t16_MUX_uxn_opcodes_h_l1780_c7_3f38
t16_MUX_uxn_opcodes_h_l1780_c7_3f38 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1780_c7_3f38_cond,
t16_MUX_uxn_opcodes_h_l1780_c7_3f38_iftrue,
t16_MUX_uxn_opcodes_h_l1780_c7_3f38_iffalse,
t16_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1780_c7_3f38
tmp8_low_MUX_uxn_opcodes_h_l1780_c7_3f38 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1780_c7_3f38_cond,
tmp8_low_MUX_uxn_opcodes_h_l1780_c7_3f38_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1780_c7_3f38_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_3f38
result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_3f38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_3f38_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_3f38_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_3f38_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_3f38
result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_3f38 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_3f38_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_3f38_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_3f38_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1780_c7_3f38
result_u8_value_MUX_uxn_opcodes_h_l1780_c7_3f38 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1780_c7_3f38_cond,
result_u8_value_MUX_uxn_opcodes_h_l1780_c7_3f38_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1780_c7_3f38_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1780_c7_3f38
result_u16_value_MUX_uxn_opcodes_h_l1780_c7_3f38 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1780_c7_3f38_cond,
result_u16_value_MUX_uxn_opcodes_h_l1780_c7_3f38_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1780_c7_3f38_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_3f38
result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_3f38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_3f38_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_3f38_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_3f38_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_3f38
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_3f38 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_3f38_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_3f38_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_3f38_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1781_c3_4bbe
BIN_OP_OR_uxn_opcodes_h_l1781_c3_4bbe : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1781_c3_4bbe_left,
BIN_OP_OR_uxn_opcodes_h_l1781_c3_4bbe_right,
BIN_OP_OR_uxn_opcodes_h_l1781_c3_4bbe_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1782_c30_652d
sp_relative_shift_uxn_opcodes_h_l1782_c30_652d : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1782_c30_652d_ins,
sp_relative_shift_uxn_opcodes_h_l1782_c30_652d_x,
sp_relative_shift_uxn_opcodes_h_l1782_c30_652d_y,
sp_relative_shift_uxn_opcodes_h_l1782_c30_652d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1785_c11_13d7
BIN_OP_EQ_uxn_opcodes_h_l1785_c11_13d7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1785_c11_13d7_left,
BIN_OP_EQ_uxn_opcodes_h_l1785_c11_13d7_right,
BIN_OP_EQ_uxn_opcodes_h_l1785_c11_13d7_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1785_c7_9227
tmp8_high_MUX_uxn_opcodes_h_l1785_c7_9227 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1785_c7_9227_cond,
tmp8_high_MUX_uxn_opcodes_h_l1785_c7_9227_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1785_c7_9227_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1785_c7_9227_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1785_c7_9227
tmp8_low_MUX_uxn_opcodes_h_l1785_c7_9227 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1785_c7_9227_cond,
tmp8_low_MUX_uxn_opcodes_h_l1785_c7_9227_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1785_c7_9227_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1785_c7_9227_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_9227
result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_9227 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_9227_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_9227_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_9227_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_9227_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_9227
result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_9227 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_9227_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_9227_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_9227_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_9227_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1785_c7_9227
result_u8_value_MUX_uxn_opcodes_h_l1785_c7_9227 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1785_c7_9227_cond,
result_u8_value_MUX_uxn_opcodes_h_l1785_c7_9227_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1785_c7_9227_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1785_c7_9227_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1785_c7_9227
result_u16_value_MUX_uxn_opcodes_h_l1785_c7_9227 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1785_c7_9227_cond,
result_u16_value_MUX_uxn_opcodes_h_l1785_c7_9227_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1785_c7_9227_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1785_c7_9227_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_9227
result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_9227 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_9227_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_9227_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_9227_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_9227_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_9227
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_9227 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_9227_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_9227_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_9227_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_9227_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_fba5
BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_fba5 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_fba5_left,
BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_fba5_right,
BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_fba5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1789_c11_3067
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_3067 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_3067_left,
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_3067_right,
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_3067_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1789_c7_a6da
tmp8_high_MUX_uxn_opcodes_h_l1789_c7_a6da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1789_c7_a6da_cond,
tmp8_high_MUX_uxn_opcodes_h_l1789_c7_a6da_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1789_c7_a6da_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1789_c7_a6da_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1789_c7_a6da
tmp8_low_MUX_uxn_opcodes_h_l1789_c7_a6da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1789_c7_a6da_cond,
tmp8_low_MUX_uxn_opcodes_h_l1789_c7_a6da_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1789_c7_a6da_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1789_c7_a6da_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_a6da
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_a6da : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_a6da_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_a6da_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_a6da_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_a6da_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_a6da
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_a6da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_a6da_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_a6da_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_a6da_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_a6da_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_a6da
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_a6da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_a6da_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_a6da_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_a6da_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_a6da_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1789_c7_a6da
result_u8_value_MUX_uxn_opcodes_h_l1789_c7_a6da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1789_c7_a6da_cond,
result_u8_value_MUX_uxn_opcodes_h_l1789_c7_a6da_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1789_c7_a6da_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1789_c7_a6da_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1795_c11_1ebb
BIN_OP_EQ_uxn_opcodes_h_l1795_c11_1ebb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1795_c11_1ebb_left,
BIN_OP_EQ_uxn_opcodes_h_l1795_c11_1ebb_right,
BIN_OP_EQ_uxn_opcodes_h_l1795_c11_1ebb_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1795_c7_3892
tmp8_low_MUX_uxn_opcodes_h_l1795_c7_3892 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1795_c7_3892_cond,
tmp8_low_MUX_uxn_opcodes_h_l1795_c7_3892_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1795_c7_3892_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1795_c7_3892_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_3892
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_3892 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_3892_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_3892_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_3892_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_3892_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_3892
result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_3892 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_3892_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_3892_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_3892_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_3892_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1795_c7_3892
result_u8_value_MUX_uxn_opcodes_h_l1795_c7_3892 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1795_c7_3892_cond,
result_u8_value_MUX_uxn_opcodes_h_l1795_c7_3892_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1795_c7_3892_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1795_c7_3892_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1760_c6_0813_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1760_c2_7926_return_output,
 t16_MUX_uxn_opcodes_h_l1760_c2_7926_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1760_c2_7926_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_7926_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_7926_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_7926_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1760_c2_7926_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_7926_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_7926_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_7926_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1760_c2_7926_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_7926_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_7926_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1773_c11_6205_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1773_c7_5655_return_output,
 t16_MUX_uxn_opcodes_h_l1773_c7_5655_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1773_c7_5655_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_5655_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_5655_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1773_c7_5655_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1773_c7_5655_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_5655_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_5655_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1776_c11_77bc_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output,
 t16_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output,
 CONST_SL_8_uxn_opcodes_h_l1778_c3_7f95_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1780_c11_1dde_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output,
 t16_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1781_c3_4bbe_return_output,
 sp_relative_shift_uxn_opcodes_h_l1782_c30_652d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1785_c11_13d7_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1785_c7_9227_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1785_c7_9227_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_9227_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_9227_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1785_c7_9227_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1785_c7_9227_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_9227_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_9227_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_fba5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1789_c11_3067_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1789_c7_a6da_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1789_c7_a6da_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_a6da_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_a6da_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_a6da_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1789_c7_a6da_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1795_c11_1ebb_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1795_c7_3892_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_3892_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_3892_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1795_c7_3892_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_0813_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_0813_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_0813_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_5655_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_7926_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_7926_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1773_c7_5655_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1760_c2_7926_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1760_c2_7926_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_5655_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_7926_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_7926_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1760_c2_7926_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_7926_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_7926_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1760_c2_7926_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_7926_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_7926_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_5655_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_7926_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_7926_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_5655_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_7926_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_7926_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_5655_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_7926_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_7926_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1765_c3_107a : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_5655_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_7926_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_7926_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1760_c2_7926_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_7926_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_7926_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_5655_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_7926_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_7926_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1760_c2_7926_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_7926_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_7926_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1770_c3_8ef4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_5655_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_7926_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_7926_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_6205_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_6205_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_6205_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_5655_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_5655_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_5655_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1773_c7_5655_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1773_c7_5655_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1773_c7_5655_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_5655_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_5655_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_5655_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_5655_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_5655_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_5655_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_5655_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_5655_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_5655_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_5655_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_5655_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_5655_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_5655_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_5655_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_5655_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_5655_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_5655_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_5655_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_5655_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1774_c3_9fca : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_5655_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_5655_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_77bc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_77bc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_77bc_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_f9b6_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_f9b6_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_f9b6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1776_c7_f9b6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1776_c7_f9b6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1776_c7_f9b6_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_f9b6_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_f9b6_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_f9b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_f9b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_f9b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_f9b6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_f9b6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_f9b6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_f9b6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_f9b6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_f9b6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_f9b6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_f9b6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_f9b6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_f9b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_f9b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_f9b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_f9b6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_f9b6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_f9b6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_f9b6_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1778_c3_7f95_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1778_c3_7f95_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_1dde_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_1dde_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_1dde_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_3f38_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_3f38_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_9227_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_3f38_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1780_c7_3f38_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1780_c7_3f38_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1780_c7_3f38_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_3f38_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_3f38_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_9227_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_3f38_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_3f38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_3f38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_9227_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_3f38_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_3f38_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_3f38_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_9227_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_3f38_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_3f38_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_3f38_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_9227_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_3f38_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_3f38_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_3f38_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_9227_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_3f38_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_3f38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_3f38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_9227_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_3f38_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_3f38_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_3f38_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_9227_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_3f38_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_4bbe_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_4bbe_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_4bbe_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_652d_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_652d_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_652d_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_652d_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_13d7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_13d7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_13d7_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_9227_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_9227_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_a6da_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_9227_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_9227_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_9227_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_a6da_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_9227_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_9227_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_9227_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_a6da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_9227_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_9227_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1786_c3_b451 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_9227_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_9227_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_9227_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_9227_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_a6da_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_9227_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_9227_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1787_c3_52f0 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_9227_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_9227_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_9227_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_9227_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_a6da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_9227_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_9227_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_9227_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_a6da_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_9227_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_fba5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_fba5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_fba5_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_3067_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_3067_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_3067_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_a6da_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_a6da_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_a6da_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_a6da_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_a6da_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_3892_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_a6da_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_a6da_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1792_c3_d04e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_a6da_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_3892_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_a6da_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_a6da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_a6da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_3892_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_a6da_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_a6da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_a6da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_a6da_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_a6da_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_a6da_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_3892_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_a6da_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_1ebb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_1ebb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_1ebb_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_3892_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_3892_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_3892_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_3892_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1797_c3_b21e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_3892_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_3892_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_3892_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_3892_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_3892_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_3892_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_3892_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_3892_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1773_l1760_l1795_l1785_l1780_l1776_DUPLICATE_b79a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1773_l1785_l1776_l1760_DUPLICATE_a4eb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1773_l1789_l1785_l1780_l1776_DUPLICATE_56b0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1773_l1785_l1776_DUPLICATE_afb5_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1773_l1795_l1789_l1785_l1780_l1776_DUPLICATE_7601_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1777_l1781_DUPLICATE_fd22_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1785_l1776_l1780_l1795_DUPLICATE_dd11_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1899_uxn_opcodes_h_l1802_l1755_DUPLICATE_2c72_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_a6da_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_3892_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_13d7_right := to_unsigned(4, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1770_c3_8ef4 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1770_c3_8ef4;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1792_c3_d04e := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_a6da_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1792_c3_d04e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1797_c3_b21e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_3892_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1797_c3_b21e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_3067_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_0813_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_fba5_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1786_c3_b451 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_9227_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1786_c3_b451;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_1ebb_right := to_unsigned(6, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_652d_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_652d_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1774_c3_9fca := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_5655_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1774_c3_9fca;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_6205_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_77bc_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_1dde_right := to_unsigned(3, 2);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1765_c3_107a := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1765_c3_107a;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_652d_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_0813_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_6205_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_77bc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_1dde_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_13d7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_3067_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_1ebb_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_a6da_iftrue := VAR_previous_ram_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_3892_iftrue := VAR_previous_ram_read;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_a6da_iftrue := VAR_previous_ram_read;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_3892_iftrue := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_4bbe_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_fba5_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1773_c7_5655_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1780_c7_3f38_iffalse := t16;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_5655_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_f9b6_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_3f38_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_9227_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_a6da_iffalse := tmp8_high;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_5655_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_f9b6_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_3f38_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_9227_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_a6da_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_3892_iffalse := tmp8_low;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1773_l1795_l1789_l1785_l1780_l1776_DUPLICATE_7601 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1773_l1795_l1789_l1785_l1780_l1776_DUPLICATE_7601_return_output := result.is_opc_done;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1760_c2_7926] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1760_c2_7926_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1789_c11_3067] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1789_c11_3067_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_3067_left;
     BIN_OP_EQ_uxn_opcodes_h_l1789_c11_3067_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_3067_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_3067_return_output := BIN_OP_EQ_uxn_opcodes_h_l1789_c11_3067_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1782_c30_652d] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1782_c30_652d_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_652d_ins;
     sp_relative_shift_uxn_opcodes_h_l1782_c30_652d_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_652d_x;
     sp_relative_shift_uxn_opcodes_h_l1782_c30_652d_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_652d_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_652d_return_output := sp_relative_shift_uxn_opcodes_h_l1782_c30_652d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1776_c11_77bc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1776_c11_77bc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_77bc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1776_c11_77bc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_77bc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_77bc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1776_c11_77bc_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1773_l1789_l1785_l1780_l1776_DUPLICATE_56b0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1773_l1789_l1785_l1780_l1776_DUPLICATE_56b0_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1780_c11_1dde] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1780_c11_1dde_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_1dde_left;
     BIN_OP_EQ_uxn_opcodes_h_l1780_c11_1dde_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_1dde_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_1dde_return_output := BIN_OP_EQ_uxn_opcodes_h_l1780_c11_1dde_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1773_l1785_l1776_l1760_DUPLICATE_a4eb LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1773_l1785_l1776_l1760_DUPLICATE_a4eb_return_output := result.u16_value;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1787_c22_fba5] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_fba5_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_fba5_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_fba5_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_fba5_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_fba5_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_fba5_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1760_c2_7926] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1760_c2_7926_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1785_l1776_l1780_l1795_DUPLICATE_dd11 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1785_l1776_l1780_l1795_DUPLICATE_dd11_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1773_l1760_l1795_l1785_l1780_l1776_DUPLICATE_b79a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1773_l1760_l1795_l1785_l1780_l1776_DUPLICATE_b79a_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1785_c11_13d7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1785_c11_13d7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_13d7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1785_c11_13d7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_13d7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_13d7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1785_c11_13d7_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1773_l1785_l1776_DUPLICATE_afb5 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1773_l1785_l1776_DUPLICATE_afb5_return_output := result.sp_relative_shift;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1760_c2_7926] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1760_c2_7926_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1795_c11_1ebb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1795_c11_1ebb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_1ebb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1795_c11_1ebb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_1ebb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_1ebb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1795_c11_1ebb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1773_c11_6205] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1773_c11_6205_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_6205_left;
     BIN_OP_EQ_uxn_opcodes_h_l1773_c11_6205_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_6205_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_6205_return_output := BIN_OP_EQ_uxn_opcodes_h_l1773_c11_6205_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1760_c6_0813] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1760_c6_0813_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_0813_left;
     BIN_OP_EQ_uxn_opcodes_h_l1760_c6_0813_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_0813_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_0813_return_output := BIN_OP_EQ_uxn_opcodes_h_l1760_c6_0813_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1777_l1781_DUPLICATE_fd22 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1777_l1781_DUPLICATE_fd22_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1760_c2_7926] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1760_c2_7926_return_output := result.is_stack_index_flipped;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_7926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_0813_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_7926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_0813_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_7926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_0813_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_7926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_0813_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_7926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_0813_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_7926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_0813_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_7926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_0813_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_7926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_0813_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_7926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_0813_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_7926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_0813_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1760_c2_7926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_0813_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_7926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_0813_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_7926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_0813_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_5655_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_6205_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_5655_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_6205_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_5655_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_6205_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_5655_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_6205_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_5655_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_6205_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_5655_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_6205_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1773_c7_5655_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_6205_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_5655_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_6205_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_5655_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_6205_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_f9b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_77bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_f9b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_77bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_f9b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_77bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_f9b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_77bc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_f9b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_77bc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_f9b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_77bc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1776_c7_f9b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_77bc_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_f9b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_77bc_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_f9b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_77bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_3f38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_1dde_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_3f38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_1dde_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_3f38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_1dde_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_3f38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_1dde_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_3f38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_1dde_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_3f38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_1dde_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1780_c7_3f38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_1dde_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_3f38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_1dde_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_3f38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_1dde_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_9227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_13d7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_9227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_13d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_9227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_13d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_9227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_13d7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_9227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_13d7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_9227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_13d7_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_9227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_13d7_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_9227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_13d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_a6da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_3067_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_a6da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_3067_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_a6da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_3067_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_a6da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_3067_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_a6da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_3067_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_a6da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_3067_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_3892_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_1ebb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_3892_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_1ebb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_3892_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_1ebb_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_3892_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_1ebb_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1787_c3_52f0 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_fba5_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_4bbe_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1777_l1781_DUPLICATE_fd22_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1778_c3_7f95_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1777_l1781_DUPLICATE_fd22_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_5655_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1773_l1785_l1776_DUPLICATE_afb5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_f9b6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1773_l1785_l1776_DUPLICATE_afb5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_9227_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1773_l1785_l1776_DUPLICATE_afb5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1773_l1785_l1776_l1760_DUPLICATE_a4eb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_5655_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1773_l1785_l1776_l1760_DUPLICATE_a4eb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_f9b6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1773_l1785_l1776_l1760_DUPLICATE_a4eb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_9227_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1773_l1785_l1776_l1760_DUPLICATE_a4eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_5655_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1773_l1795_l1789_l1785_l1780_l1776_DUPLICATE_7601_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_f9b6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1773_l1795_l1789_l1785_l1780_l1776_DUPLICATE_7601_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_3f38_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1773_l1795_l1789_l1785_l1780_l1776_DUPLICATE_7601_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_9227_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1773_l1795_l1789_l1785_l1780_l1776_DUPLICATE_7601_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_a6da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1773_l1795_l1789_l1785_l1780_l1776_DUPLICATE_7601_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_3892_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1773_l1795_l1789_l1785_l1780_l1776_DUPLICATE_7601_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_5655_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1773_l1789_l1785_l1780_l1776_DUPLICATE_56b0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_f9b6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1773_l1789_l1785_l1780_l1776_DUPLICATE_56b0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_3f38_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1773_l1789_l1785_l1780_l1776_DUPLICATE_56b0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_9227_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1773_l1789_l1785_l1780_l1776_DUPLICATE_56b0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_a6da_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1773_l1789_l1785_l1780_l1776_DUPLICATE_56b0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_f9b6_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1785_l1776_l1780_l1795_DUPLICATE_dd11_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_3f38_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1785_l1776_l1780_l1795_DUPLICATE_dd11_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_9227_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1785_l1776_l1780_l1795_DUPLICATE_dd11_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_3892_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1785_l1776_l1780_l1795_DUPLICATE_dd11_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1773_l1760_l1795_l1785_l1780_l1776_DUPLICATE_b79a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_5655_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1773_l1760_l1795_l1785_l1780_l1776_DUPLICATE_b79a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_f9b6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1773_l1760_l1795_l1785_l1780_l1776_DUPLICATE_b79a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_3f38_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1773_l1760_l1795_l1785_l1780_l1776_DUPLICATE_b79a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_9227_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1773_l1760_l1795_l1785_l1780_l1776_DUPLICATE_b79a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_3892_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1773_l1760_l1795_l1785_l1780_l1776_DUPLICATE_b79a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1760_c2_7926_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1760_c2_7926_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1760_c2_7926_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1760_c2_7926_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_3f38_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_652d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_9227_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1787_c3_52f0;
     -- result_u16_value_MUX[uxn_opcodes_h_l1785_c7_9227] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1785_c7_9227_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_9227_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1785_c7_9227_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_9227_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1785_c7_9227_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_9227_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_9227_return_output := result_u16_value_MUX_uxn_opcodes_h_l1785_c7_9227_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1760_c2_7926] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_7926_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_7926_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_7926_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_7926_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1789_c7_a6da] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1789_c7_a6da_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_a6da_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1789_c7_a6da_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_a6da_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1789_c7_a6da_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_a6da_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_a6da_return_output := tmp8_high_MUX_uxn_opcodes_h_l1789_c7_a6da_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1789_c7_a6da] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_a6da_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_a6da_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_a6da_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_a6da_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_a6da_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_a6da_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_a6da_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_a6da_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1760_c2_7926] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_7926_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_7926_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_7926_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_7926_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1795_c7_3892] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1795_c7_3892_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_3892_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1795_c7_3892_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_3892_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1795_c7_3892_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_3892_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_3892_return_output := tmp8_low_MUX_uxn_opcodes_h_l1795_c7_3892_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1795_c7_3892] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1795_c7_3892_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_3892_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1795_c7_3892_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_3892_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1795_c7_3892_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_3892_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_3892_return_output := result_u8_value_MUX_uxn_opcodes_h_l1795_c7_3892_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1795_c7_3892] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_3892_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_3892_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_3892_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_3892_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_3892_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_3892_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_3892_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_3892_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1760_c2_7926] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_7926_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_7926_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_7926_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_7926_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1760_c2_7926] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_7926_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_7926_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_7926_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_7926_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1795_c7_3892] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_3892_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_3892_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_3892_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_3892_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_3892_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_3892_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_3892_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_3892_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1781_c3_4bbe] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1781_c3_4bbe_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_4bbe_left;
     BIN_OP_OR_uxn_opcodes_h_l1781_c3_4bbe_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_4bbe_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_4bbe_return_output := BIN_OP_OR_uxn_opcodes_h_l1781_c3_4bbe_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1785_c7_9227] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_9227_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_9227_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_9227_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_9227_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_9227_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_9227_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_9227_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_9227_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1778_c3_7f95] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1778_c3_7f95_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1778_c3_7f95_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1778_c3_7f95_return_output := CONST_SL_8_uxn_opcodes_h_l1778_c3_7f95_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_3f38_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_4bbe_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1780_c7_3f38_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_4bbe_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1776_c7_f9b6_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1778_c3_7f95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_a6da_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_3892_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_9227_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_a6da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_3f38_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_9227_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_a6da_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_3892_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_3f38_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_9227_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_a6da_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_3892_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_9227_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_a6da_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_a6da_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_3892_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1789_c7_a6da] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1789_c7_a6da_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_a6da_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1789_c7_a6da_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_a6da_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1789_c7_a6da_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_a6da_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_a6da_return_output := result_u8_value_MUX_uxn_opcodes_h_l1789_c7_a6da_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1789_c7_a6da] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_a6da_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_a6da_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_a6da_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_a6da_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_a6da_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_a6da_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_a6da_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_a6da_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1780_c7_3f38] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_3f38_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_3f38_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_3f38_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_3f38_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_3f38_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_3f38_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1785_c7_9227] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1785_c7_9227_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_9227_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1785_c7_9227_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_9227_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1785_c7_9227_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_9227_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_9227_return_output := tmp8_high_MUX_uxn_opcodes_h_l1785_c7_9227_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1789_c7_a6da] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1789_c7_a6da_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_a6da_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1789_c7_a6da_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_a6da_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1789_c7_a6da_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_a6da_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_a6da_return_output := tmp8_low_MUX_uxn_opcodes_h_l1789_c7_a6da_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1789_c7_a6da] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_a6da_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_a6da_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_a6da_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_a6da_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_a6da_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_a6da_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_a6da_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_a6da_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1785_c7_9227] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_9227_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_9227_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_9227_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_9227_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_9227_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_9227_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_9227_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_9227_return_output;

     -- t16_MUX[uxn_opcodes_h_l1780_c7_3f38] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1780_c7_3f38_cond <= VAR_t16_MUX_uxn_opcodes_h_l1780_c7_3f38_cond;
     t16_MUX_uxn_opcodes_h_l1780_c7_3f38_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1780_c7_3f38_iftrue;
     t16_MUX_uxn_opcodes_h_l1780_c7_3f38_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1780_c7_3f38_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output := t16_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1780_c7_3f38] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1780_c7_3f38_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_3f38_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1780_c7_3f38_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_3f38_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1780_c7_3f38_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_3f38_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output := result_u16_value_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_9227_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_a6da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_3f38_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_9227_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_f9b6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_9227_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_a6da_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_f9b6_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_9227_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_a6da_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1776_c7_f9b6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_3f38_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_9227_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_9227_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_a6da_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1780_c7_3f38] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_3f38_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_3f38_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_3f38_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_3f38_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_3f38_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_3f38_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1776_c7_f9b6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1776_c7_f9b6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_f9b6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1776_c7_f9b6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_f9b6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1776_c7_f9b6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_f9b6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output := result_u16_value_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1785_c7_9227] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1785_c7_9227_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_9227_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1785_c7_9227_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_9227_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1785_c7_9227_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_9227_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_9227_return_output := result_u8_value_MUX_uxn_opcodes_h_l1785_c7_9227_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1785_c7_9227] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_9227_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_9227_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_9227_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_9227_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_9227_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_9227_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_9227_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_9227_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1785_c7_9227] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1785_c7_9227_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_9227_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1785_c7_9227_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_9227_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1785_c7_9227_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_9227_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_9227_return_output := tmp8_low_MUX_uxn_opcodes_h_l1785_c7_9227_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1780_c7_3f38] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1780_c7_3f38_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_3f38_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1780_c7_3f38_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_3f38_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1780_c7_3f38_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_3f38_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output := tmp8_high_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output;

     -- t16_MUX[uxn_opcodes_h_l1776_c7_f9b6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1776_c7_f9b6_cond <= VAR_t16_MUX_uxn_opcodes_h_l1776_c7_f9b6_cond;
     t16_MUX_uxn_opcodes_h_l1776_c7_f9b6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1776_c7_f9b6_iftrue;
     t16_MUX_uxn_opcodes_h_l1776_c7_f9b6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1776_c7_f9b6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output := t16_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1785_c7_9227] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_9227_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_9227_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_9227_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_9227_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_9227_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_9227_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_9227_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_9227_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1776_c7_f9b6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_f9b6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_f9b6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_f9b6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_f9b6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_f9b6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_f9b6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_3f38_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_9227_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_f9b6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_5655_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_3f38_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_9227_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_5655_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_3f38_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_9227_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1773_c7_5655_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_f9b6_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_3f38_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_9227_return_output;
     -- tmp8_high_MUX[uxn_opcodes_h_l1776_c7_f9b6] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1776_c7_f9b6_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_f9b6_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1776_c7_f9b6_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_f9b6_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1776_c7_f9b6_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_f9b6_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output := tmp8_high_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output;

     -- t16_MUX[uxn_opcodes_h_l1773_c7_5655] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1773_c7_5655_cond <= VAR_t16_MUX_uxn_opcodes_h_l1773_c7_5655_cond;
     t16_MUX_uxn_opcodes_h_l1773_c7_5655_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1773_c7_5655_iftrue;
     t16_MUX_uxn_opcodes_h_l1773_c7_5655_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1773_c7_5655_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1773_c7_5655_return_output := t16_MUX_uxn_opcodes_h_l1773_c7_5655_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1780_c7_3f38] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_3f38_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_3f38_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_3f38_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_3f38_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_3f38_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_3f38_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1780_c7_3f38] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1780_c7_3f38_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_3f38_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1780_c7_3f38_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_3f38_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1780_c7_3f38_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_3f38_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output := tmp8_low_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1773_c7_5655] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1773_c7_5655_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_5655_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1773_c7_5655_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_5655_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1773_c7_5655_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_5655_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_5655_return_output := result_u16_value_MUX_uxn_opcodes_h_l1773_c7_5655_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1776_c7_f9b6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_f9b6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_f9b6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_f9b6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_f9b6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_f9b6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_f9b6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1780_c7_3f38] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1780_c7_3f38_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_3f38_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1780_c7_3f38_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_3f38_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1780_c7_3f38_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_3f38_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output := result_u8_value_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1773_c7_5655] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_5655_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_5655_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_5655_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_5655_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_5655_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_5655_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_5655_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_5655_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1780_c7_3f38] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_3f38_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_3f38_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_3f38_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_3f38_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_3f38_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_3f38_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_f9b6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_5655_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_5655_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_f9b6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_5655_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_f9b6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1773_c7_5655_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_5655_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_f9b6_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_3f38_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1776_c7_f9b6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1776_c7_f9b6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_f9b6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1776_c7_f9b6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_f9b6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1776_c7_f9b6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_f9b6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output := result_u8_value_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1776_c7_f9b6] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1776_c7_f9b6_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_f9b6_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1776_c7_f9b6_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_f9b6_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1776_c7_f9b6_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_f9b6_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output := tmp8_low_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1760_c2_7926] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1760_c2_7926_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_7926_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_7926_return_output := result_u16_value_MUX_uxn_opcodes_h_l1760_c2_7926_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1773_c7_5655] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1773_c7_5655_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_5655_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1773_c7_5655_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_5655_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1773_c7_5655_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_5655_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_5655_return_output := tmp8_high_MUX_uxn_opcodes_h_l1773_c7_5655_return_output;

     -- t16_MUX[uxn_opcodes_h_l1760_c2_7926] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1760_c2_7926_cond <= VAR_t16_MUX_uxn_opcodes_h_l1760_c2_7926_cond;
     t16_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue;
     t16_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1760_c2_7926_return_output := t16_MUX_uxn_opcodes_h_l1760_c2_7926_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1773_c7_5655] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_5655_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_5655_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_5655_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_5655_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_5655_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_5655_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_5655_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_5655_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1776_c7_f9b6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_f9b6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_f9b6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_f9b6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_f9b6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_f9b6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_f9b6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1776_c7_f9b6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_f9b6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_f9b6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_f9b6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_f9b6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_f9b6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_f9b6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1760_c2_7926] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_7926_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_7926_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_7926_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_7926_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_5655_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_5655_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_5655_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_5655_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1760_c2_7926_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_5655_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_5655_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_f9b6_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1773_c7_5655] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1773_c7_5655_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_5655_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1773_c7_5655_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_5655_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1773_c7_5655_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_5655_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_5655_return_output := result_u8_value_MUX_uxn_opcodes_h_l1773_c7_5655_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1773_c7_5655] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1773_c7_5655_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_5655_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1773_c7_5655_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_5655_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1773_c7_5655_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_5655_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_5655_return_output := tmp8_low_MUX_uxn_opcodes_h_l1773_c7_5655_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1760_c2_7926] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1760_c2_7926_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_7926_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_7926_return_output := tmp8_high_MUX_uxn_opcodes_h_l1760_c2_7926_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1760_c2_7926] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_7926_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_7926_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_7926_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_7926_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1773_c7_5655] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_5655_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_5655_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_5655_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_5655_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_5655_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_5655_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_5655_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_5655_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1773_c7_5655] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_5655_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_5655_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_5655_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_5655_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_5655_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_5655_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_5655_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_5655_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_5655_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_5655_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_5655_return_output;
     REG_VAR_tmp8_high := VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_7926_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_5655_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1760_c2_7926] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1760_c2_7926_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_7926_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_7926_return_output := result_u8_value_MUX_uxn_opcodes_h_l1760_c2_7926_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1760_c2_7926] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_7926_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_7926_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_7926_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_7926_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1760_c2_7926] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_7926_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_7926_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_7926_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_7926_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1760_c2_7926] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1760_c2_7926_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_7926_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_7926_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_7926_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_7926_return_output := tmp8_low_MUX_uxn_opcodes_h_l1760_c2_7926_return_output;

     -- Submodule level 8
     REG_VAR_tmp8_low := VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_7926_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1899_uxn_opcodes_h_l1802_l1755_DUPLICATE_2c72 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1899_uxn_opcodes_h_l1802_l1755_DUPLICATE_2c72_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1899(
     result,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_7926_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_7926_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_7926_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_7926_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_7926_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_7926_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_7926_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_7926_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_7926_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_7926_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1899_uxn_opcodes_h_l1802_l1755_DUPLICATE_2c72_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1899_uxn_opcodes_h_l1802_l1755_DUPLICATE_2c72_return_output;
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
