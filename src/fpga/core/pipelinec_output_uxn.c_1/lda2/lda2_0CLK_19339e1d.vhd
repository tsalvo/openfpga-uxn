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
-- BIN_OP_EQ[uxn_opcodes_h_l1760_c6_89a6]
signal BIN_OP_EQ_uxn_opcodes_h_l1760_c6_89a6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1760_c6_89a6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1760_c6_89a6_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1760_c2_031a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_031a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_031a_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1760_c2_031a]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_031a_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_031a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1760_c2_031a]
signal result_u8_value_MUX_uxn_opcodes_h_l1760_c2_031a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1760_c2_031a_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1760_c2_031a]
signal result_u16_value_MUX_uxn_opcodes_h_l1760_c2_031a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1760_c2_031a_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1760_c2_031a]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_031a_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_031a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1760_c2_031a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_031a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_031a_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1760_c2_031a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_031a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_031a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1760_c2_031a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_031a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_031a_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1760_c2_031a]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_031a_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_031a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1760_c2_031a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_031a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_031a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1760_c2_031a]
signal t16_MUX_uxn_opcodes_h_l1760_c2_031a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1760_c2_031a_return_output : unsigned(15 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1760_c2_031a]
signal tmp8_low_MUX_uxn_opcodes_h_l1760_c2_031a_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1760_c2_031a_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1760_c2_031a]
signal tmp8_high_MUX_uxn_opcodes_h_l1760_c2_031a_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1760_c2_031a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1773_c11_591e]
signal BIN_OP_EQ_uxn_opcodes_h_l1773_c11_591e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1773_c11_591e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1773_c11_591e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1773_c7_0303]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_0303_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_0303_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_0303_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_0303_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1773_c7_0303]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_0303_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_0303_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_0303_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_0303_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1773_c7_0303]
signal result_u8_value_MUX_uxn_opcodes_h_l1773_c7_0303_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1773_c7_0303_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1773_c7_0303_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1773_c7_0303_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1773_c7_0303]
signal result_u16_value_MUX_uxn_opcodes_h_l1773_c7_0303_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1773_c7_0303_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1773_c7_0303_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1773_c7_0303_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1773_c7_0303]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_0303_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_0303_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_0303_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_0303_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1773_c7_0303]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_0303_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_0303_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_0303_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_0303_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1773_c7_0303]
signal t16_MUX_uxn_opcodes_h_l1773_c7_0303_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1773_c7_0303_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1773_c7_0303_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1773_c7_0303_return_output : unsigned(15 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1773_c7_0303]
signal tmp8_low_MUX_uxn_opcodes_h_l1773_c7_0303_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1773_c7_0303_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1773_c7_0303_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1773_c7_0303_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1773_c7_0303]
signal tmp8_high_MUX_uxn_opcodes_h_l1773_c7_0303_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1773_c7_0303_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1773_c7_0303_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1773_c7_0303_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1776_c11_8829]
signal BIN_OP_EQ_uxn_opcodes_h_l1776_c11_8829_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1776_c11_8829_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1776_c11_8829_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1776_c7_8c0f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_8c0f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_8c0f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_8c0f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1776_c7_8c0f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_8c0f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_8c0f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_8c0f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1776_c7_8c0f]
signal result_u8_value_MUX_uxn_opcodes_h_l1776_c7_8c0f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1776_c7_8c0f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1776_c7_8c0f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1776_c7_8c0f]
signal result_u16_value_MUX_uxn_opcodes_h_l1776_c7_8c0f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1776_c7_8c0f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1776_c7_8c0f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1776_c7_8c0f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_8c0f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_8c0f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_8c0f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1776_c7_8c0f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_8c0f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_8c0f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_8c0f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1776_c7_8c0f]
signal t16_MUX_uxn_opcodes_h_l1776_c7_8c0f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1776_c7_8c0f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1776_c7_8c0f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output : unsigned(15 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1776_c7_8c0f]
signal tmp8_low_MUX_uxn_opcodes_h_l1776_c7_8c0f_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1776_c7_8c0f_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1776_c7_8c0f_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1776_c7_8c0f]
signal tmp8_high_MUX_uxn_opcodes_h_l1776_c7_8c0f_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1776_c7_8c0f_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1776_c7_8c0f_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1778_c3_138e]
signal CONST_SL_8_uxn_opcodes_h_l1778_c3_138e_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1778_c3_138e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1780_c11_4381]
signal BIN_OP_EQ_uxn_opcodes_h_l1780_c11_4381_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1780_c11_4381_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1780_c11_4381_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1780_c7_fa38]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_fa38_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_fa38_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_fa38_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1780_c7_fa38]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_fa38_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_fa38_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_fa38_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1780_c7_fa38]
signal result_u8_value_MUX_uxn_opcodes_h_l1780_c7_fa38_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1780_c7_fa38_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1780_c7_fa38_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1780_c7_fa38]
signal result_u16_value_MUX_uxn_opcodes_h_l1780_c7_fa38_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1780_c7_fa38_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1780_c7_fa38_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1780_c7_fa38]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_fa38_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_fa38_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_fa38_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1780_c7_fa38]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_fa38_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_fa38_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_fa38_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1780_c7_fa38]
signal t16_MUX_uxn_opcodes_h_l1780_c7_fa38_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1780_c7_fa38_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1780_c7_fa38_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output : unsigned(15 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1780_c7_fa38]
signal tmp8_low_MUX_uxn_opcodes_h_l1780_c7_fa38_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1780_c7_fa38_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1780_c7_fa38_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1780_c7_fa38]
signal tmp8_high_MUX_uxn_opcodes_h_l1780_c7_fa38_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1780_c7_fa38_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1780_c7_fa38_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1781_c3_78bc]
signal BIN_OP_OR_uxn_opcodes_h_l1781_c3_78bc_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1781_c3_78bc_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1781_c3_78bc_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1782_c30_8fe8]
signal sp_relative_shift_uxn_opcodes_h_l1782_c30_8fe8_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1782_c30_8fe8_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1782_c30_8fe8_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1782_c30_8fe8_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1785_c11_7f90]
signal BIN_OP_EQ_uxn_opcodes_h_l1785_c11_7f90_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1785_c11_7f90_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1785_c11_7f90_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1785_c7_2af4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_2af4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_2af4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_2af4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1785_c7_2af4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_2af4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_2af4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_2af4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1785_c7_2af4]
signal result_u8_value_MUX_uxn_opcodes_h_l1785_c7_2af4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1785_c7_2af4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1785_c7_2af4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1785_c7_2af4]
signal result_u16_value_MUX_uxn_opcodes_h_l1785_c7_2af4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1785_c7_2af4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1785_c7_2af4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1785_c7_2af4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_2af4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_2af4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_2af4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1785_c7_2af4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_2af4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_2af4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_2af4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1785_c7_2af4]
signal tmp8_low_MUX_uxn_opcodes_h_l1785_c7_2af4_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1785_c7_2af4_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1785_c7_2af4_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1785_c7_2af4]
signal tmp8_high_MUX_uxn_opcodes_h_l1785_c7_2af4_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1785_c7_2af4_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1785_c7_2af4_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1787_c22_4bee]
signal BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_4bee_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_4bee_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_4bee_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1789_c11_b3e1]
signal BIN_OP_EQ_uxn_opcodes_h_l1789_c11_b3e1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1789_c11_b3e1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1789_c11_b3e1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1789_c7_b7fa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_b7fa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_b7fa_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_b7fa_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_b7fa_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1789_c7_b7fa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_b7fa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_b7fa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_b7fa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_b7fa_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1789_c7_b7fa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_b7fa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_b7fa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_b7fa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_b7fa_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1789_c7_b7fa]
signal result_u8_value_MUX_uxn_opcodes_h_l1789_c7_b7fa_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1789_c7_b7fa_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1789_c7_b7fa_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1789_c7_b7fa_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1789_c7_b7fa]
signal tmp8_low_MUX_uxn_opcodes_h_l1789_c7_b7fa_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1789_c7_b7fa_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1789_c7_b7fa_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1789_c7_b7fa_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1789_c7_b7fa]
signal tmp8_high_MUX_uxn_opcodes_h_l1789_c7_b7fa_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1789_c7_b7fa_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1789_c7_b7fa_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1789_c7_b7fa_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1795_c11_599b]
signal BIN_OP_EQ_uxn_opcodes_h_l1795_c11_599b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1795_c11_599b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1795_c11_599b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1795_c7_8b9f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_8b9f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_8b9f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_8b9f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_8b9f_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1795_c7_8b9f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_8b9f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_8b9f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_8b9f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_8b9f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1795_c7_8b9f]
signal result_u8_value_MUX_uxn_opcodes_h_l1795_c7_8b9f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1795_c7_8b9f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1795_c7_8b9f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1795_c7_8b9f_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1795_c7_8b9f]
signal tmp8_low_MUX_uxn_opcodes_h_l1795_c7_8b9f_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1795_c7_8b9f_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1795_c7_8b9f_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1795_c7_8b9f_return_output : unsigned(7 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_500b( ref_toks_0 : opcode_result_t;
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
      base.is_pc_updated := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.u16_value := ref_toks_4;
      base.is_ram_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_stack_write := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_stack_index_flipped := ref_toks_9;
      base.is_opc_done := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1760_c6_89a6
BIN_OP_EQ_uxn_opcodes_h_l1760_c6_89a6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1760_c6_89a6_left,
BIN_OP_EQ_uxn_opcodes_h_l1760_c6_89a6_right,
BIN_OP_EQ_uxn_opcodes_h_l1760_c6_89a6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_031a
result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_031a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_031a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_031a_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_031a
result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_031a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_031a_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_031a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1760_c2_031a
result_u8_value_MUX_uxn_opcodes_h_l1760_c2_031a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1760_c2_031a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1760_c2_031a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1760_c2_031a
result_u16_value_MUX_uxn_opcodes_h_l1760_c2_031a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1760_c2_031a_cond,
result_u16_value_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1760_c2_031a_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_031a
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_031a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_031a_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_031a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_031a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_031a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_031a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_031a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_031a
result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_031a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_031a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_031a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_031a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_031a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_031a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_031a_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_031a
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_031a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_031a_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_031a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_031a
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_031a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_031a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_031a_return_output);

-- t16_MUX_uxn_opcodes_h_l1760_c2_031a
t16_MUX_uxn_opcodes_h_l1760_c2_031a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1760_c2_031a_cond,
t16_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue,
t16_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse,
t16_MUX_uxn_opcodes_h_l1760_c2_031a_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1760_c2_031a
tmp8_low_MUX_uxn_opcodes_h_l1760_c2_031a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1760_c2_031a_cond,
tmp8_low_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1760_c2_031a_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1760_c2_031a
tmp8_high_MUX_uxn_opcodes_h_l1760_c2_031a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1760_c2_031a_cond,
tmp8_high_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1760_c2_031a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1773_c11_591e
BIN_OP_EQ_uxn_opcodes_h_l1773_c11_591e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1773_c11_591e_left,
BIN_OP_EQ_uxn_opcodes_h_l1773_c11_591e_right,
BIN_OP_EQ_uxn_opcodes_h_l1773_c11_591e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_0303
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_0303 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_0303_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_0303_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_0303_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_0303_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_0303
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_0303 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_0303_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_0303_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_0303_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_0303_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1773_c7_0303
result_u8_value_MUX_uxn_opcodes_h_l1773_c7_0303 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1773_c7_0303_cond,
result_u8_value_MUX_uxn_opcodes_h_l1773_c7_0303_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1773_c7_0303_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1773_c7_0303_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1773_c7_0303
result_u16_value_MUX_uxn_opcodes_h_l1773_c7_0303 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1773_c7_0303_cond,
result_u16_value_MUX_uxn_opcodes_h_l1773_c7_0303_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1773_c7_0303_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1773_c7_0303_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_0303
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_0303 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_0303_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_0303_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_0303_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_0303_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_0303
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_0303 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_0303_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_0303_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_0303_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_0303_return_output);

-- t16_MUX_uxn_opcodes_h_l1773_c7_0303
t16_MUX_uxn_opcodes_h_l1773_c7_0303 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1773_c7_0303_cond,
t16_MUX_uxn_opcodes_h_l1773_c7_0303_iftrue,
t16_MUX_uxn_opcodes_h_l1773_c7_0303_iffalse,
t16_MUX_uxn_opcodes_h_l1773_c7_0303_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1773_c7_0303
tmp8_low_MUX_uxn_opcodes_h_l1773_c7_0303 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1773_c7_0303_cond,
tmp8_low_MUX_uxn_opcodes_h_l1773_c7_0303_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1773_c7_0303_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1773_c7_0303_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1773_c7_0303
tmp8_high_MUX_uxn_opcodes_h_l1773_c7_0303 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1773_c7_0303_cond,
tmp8_high_MUX_uxn_opcodes_h_l1773_c7_0303_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1773_c7_0303_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1773_c7_0303_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1776_c11_8829
BIN_OP_EQ_uxn_opcodes_h_l1776_c11_8829 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1776_c11_8829_left,
BIN_OP_EQ_uxn_opcodes_h_l1776_c11_8829_right,
BIN_OP_EQ_uxn_opcodes_h_l1776_c11_8829_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_8c0f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_8c0f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_8c0f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_8c0f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_8c0f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_8c0f
result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_8c0f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_8c0f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_8c0f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_8c0f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1776_c7_8c0f
result_u8_value_MUX_uxn_opcodes_h_l1776_c7_8c0f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1776_c7_8c0f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1776_c7_8c0f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1776_c7_8c0f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1776_c7_8c0f
result_u16_value_MUX_uxn_opcodes_h_l1776_c7_8c0f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1776_c7_8c0f_cond,
result_u16_value_MUX_uxn_opcodes_h_l1776_c7_8c0f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1776_c7_8c0f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_8c0f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_8c0f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_8c0f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_8c0f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_8c0f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_8c0f
result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_8c0f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_8c0f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_8c0f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_8c0f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output);

-- t16_MUX_uxn_opcodes_h_l1776_c7_8c0f
t16_MUX_uxn_opcodes_h_l1776_c7_8c0f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1776_c7_8c0f_cond,
t16_MUX_uxn_opcodes_h_l1776_c7_8c0f_iftrue,
t16_MUX_uxn_opcodes_h_l1776_c7_8c0f_iffalse,
t16_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1776_c7_8c0f
tmp8_low_MUX_uxn_opcodes_h_l1776_c7_8c0f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1776_c7_8c0f_cond,
tmp8_low_MUX_uxn_opcodes_h_l1776_c7_8c0f_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1776_c7_8c0f_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1776_c7_8c0f
tmp8_high_MUX_uxn_opcodes_h_l1776_c7_8c0f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1776_c7_8c0f_cond,
tmp8_high_MUX_uxn_opcodes_h_l1776_c7_8c0f_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1776_c7_8c0f_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1778_c3_138e
CONST_SL_8_uxn_opcodes_h_l1778_c3_138e : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1778_c3_138e_x,
CONST_SL_8_uxn_opcodes_h_l1778_c3_138e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1780_c11_4381
BIN_OP_EQ_uxn_opcodes_h_l1780_c11_4381 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1780_c11_4381_left,
BIN_OP_EQ_uxn_opcodes_h_l1780_c11_4381_right,
BIN_OP_EQ_uxn_opcodes_h_l1780_c11_4381_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_fa38
result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_fa38 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_fa38_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_fa38_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_fa38_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_fa38
result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_fa38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_fa38_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_fa38_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_fa38_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1780_c7_fa38
result_u8_value_MUX_uxn_opcodes_h_l1780_c7_fa38 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1780_c7_fa38_cond,
result_u8_value_MUX_uxn_opcodes_h_l1780_c7_fa38_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1780_c7_fa38_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1780_c7_fa38
result_u16_value_MUX_uxn_opcodes_h_l1780_c7_fa38 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1780_c7_fa38_cond,
result_u16_value_MUX_uxn_opcodes_h_l1780_c7_fa38_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1780_c7_fa38_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_fa38
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_fa38 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_fa38_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_fa38_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_fa38_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_fa38
result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_fa38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_fa38_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_fa38_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_fa38_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output);

-- t16_MUX_uxn_opcodes_h_l1780_c7_fa38
t16_MUX_uxn_opcodes_h_l1780_c7_fa38 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1780_c7_fa38_cond,
t16_MUX_uxn_opcodes_h_l1780_c7_fa38_iftrue,
t16_MUX_uxn_opcodes_h_l1780_c7_fa38_iffalse,
t16_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1780_c7_fa38
tmp8_low_MUX_uxn_opcodes_h_l1780_c7_fa38 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1780_c7_fa38_cond,
tmp8_low_MUX_uxn_opcodes_h_l1780_c7_fa38_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1780_c7_fa38_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1780_c7_fa38
tmp8_high_MUX_uxn_opcodes_h_l1780_c7_fa38 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1780_c7_fa38_cond,
tmp8_high_MUX_uxn_opcodes_h_l1780_c7_fa38_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1780_c7_fa38_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1781_c3_78bc
BIN_OP_OR_uxn_opcodes_h_l1781_c3_78bc : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1781_c3_78bc_left,
BIN_OP_OR_uxn_opcodes_h_l1781_c3_78bc_right,
BIN_OP_OR_uxn_opcodes_h_l1781_c3_78bc_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1782_c30_8fe8
sp_relative_shift_uxn_opcodes_h_l1782_c30_8fe8 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1782_c30_8fe8_ins,
sp_relative_shift_uxn_opcodes_h_l1782_c30_8fe8_x,
sp_relative_shift_uxn_opcodes_h_l1782_c30_8fe8_y,
sp_relative_shift_uxn_opcodes_h_l1782_c30_8fe8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1785_c11_7f90
BIN_OP_EQ_uxn_opcodes_h_l1785_c11_7f90 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1785_c11_7f90_left,
BIN_OP_EQ_uxn_opcodes_h_l1785_c11_7f90_right,
BIN_OP_EQ_uxn_opcodes_h_l1785_c11_7f90_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_2af4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_2af4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_2af4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_2af4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_2af4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_2af4
result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_2af4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_2af4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_2af4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_2af4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1785_c7_2af4
result_u8_value_MUX_uxn_opcodes_h_l1785_c7_2af4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1785_c7_2af4_cond,
result_u8_value_MUX_uxn_opcodes_h_l1785_c7_2af4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1785_c7_2af4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1785_c7_2af4
result_u16_value_MUX_uxn_opcodes_h_l1785_c7_2af4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1785_c7_2af4_cond,
result_u16_value_MUX_uxn_opcodes_h_l1785_c7_2af4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1785_c7_2af4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_2af4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_2af4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_2af4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_2af4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_2af4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_2af4
result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_2af4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_2af4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_2af4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_2af4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1785_c7_2af4
tmp8_low_MUX_uxn_opcodes_h_l1785_c7_2af4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1785_c7_2af4_cond,
tmp8_low_MUX_uxn_opcodes_h_l1785_c7_2af4_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1785_c7_2af4_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1785_c7_2af4
tmp8_high_MUX_uxn_opcodes_h_l1785_c7_2af4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1785_c7_2af4_cond,
tmp8_high_MUX_uxn_opcodes_h_l1785_c7_2af4_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1785_c7_2af4_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_4bee
BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_4bee : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_4bee_left,
BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_4bee_right,
BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_4bee_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1789_c11_b3e1
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_b3e1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_b3e1_left,
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_b3e1_right,
BIN_OP_EQ_uxn_opcodes_h_l1789_c11_b3e1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_b7fa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_b7fa : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_b7fa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_b7fa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_b7fa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_b7fa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_b7fa
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_b7fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_b7fa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_b7fa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_b7fa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_b7fa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_b7fa
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_b7fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_b7fa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_b7fa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_b7fa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_b7fa_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1789_c7_b7fa
result_u8_value_MUX_uxn_opcodes_h_l1789_c7_b7fa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1789_c7_b7fa_cond,
result_u8_value_MUX_uxn_opcodes_h_l1789_c7_b7fa_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1789_c7_b7fa_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1789_c7_b7fa_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1789_c7_b7fa
tmp8_low_MUX_uxn_opcodes_h_l1789_c7_b7fa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1789_c7_b7fa_cond,
tmp8_low_MUX_uxn_opcodes_h_l1789_c7_b7fa_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1789_c7_b7fa_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1789_c7_b7fa_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1789_c7_b7fa
tmp8_high_MUX_uxn_opcodes_h_l1789_c7_b7fa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1789_c7_b7fa_cond,
tmp8_high_MUX_uxn_opcodes_h_l1789_c7_b7fa_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1789_c7_b7fa_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1789_c7_b7fa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1795_c11_599b
BIN_OP_EQ_uxn_opcodes_h_l1795_c11_599b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1795_c11_599b_left,
BIN_OP_EQ_uxn_opcodes_h_l1795_c11_599b_right,
BIN_OP_EQ_uxn_opcodes_h_l1795_c11_599b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_8b9f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_8b9f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_8b9f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_8b9f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_8b9f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_8b9f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_8b9f
result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_8b9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_8b9f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_8b9f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_8b9f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_8b9f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1795_c7_8b9f
result_u8_value_MUX_uxn_opcodes_h_l1795_c7_8b9f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1795_c7_8b9f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1795_c7_8b9f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1795_c7_8b9f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1795_c7_8b9f_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1795_c7_8b9f
tmp8_low_MUX_uxn_opcodes_h_l1795_c7_8b9f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1795_c7_8b9f_cond,
tmp8_low_MUX_uxn_opcodes_h_l1795_c7_8b9f_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1795_c7_8b9f_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1795_c7_8b9f_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1760_c6_89a6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_031a_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_031a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1760_c2_031a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1760_c2_031a_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_031a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_031a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_031a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_031a_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_031a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_031a_return_output,
 t16_MUX_uxn_opcodes_h_l1760_c2_031a_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1760_c2_031a_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1760_c2_031a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1773_c11_591e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_0303_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_0303_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1773_c7_0303_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1773_c7_0303_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_0303_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_0303_return_output,
 t16_MUX_uxn_opcodes_h_l1773_c7_0303_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1773_c7_0303_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1773_c7_0303_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1776_c11_8829_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output,
 t16_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output,
 CONST_SL_8_uxn_opcodes_h_l1778_c3_138e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1780_c11_4381_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output,
 t16_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1781_c3_78bc_return_output,
 sp_relative_shift_uxn_opcodes_h_l1782_c30_8fe8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1785_c11_7f90_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_4bee_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1789_c11_b3e1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_b7fa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_b7fa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_b7fa_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1789_c7_b7fa_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1789_c7_b7fa_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1789_c7_b7fa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1795_c11_599b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_8b9f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_8b9f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1795_c7_8b9f_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1795_c7_8b9f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_89a6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_89a6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_89a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1760_c2_031a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_031a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_031a_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1760_c2_031a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_031a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_031a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_0303_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_031a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_031a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_0303_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_031a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_031a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1760_c2_031a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_031a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_031a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1765_c3_e961 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_0303_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_031a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_031a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_0303_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_031a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_031a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1770_c3_e539 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_0303_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_031a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_031a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1760_c2_031a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_031a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_031a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_0303_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_031a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_031a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1773_c7_0303_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1760_c2_031a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1760_c2_031a_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_0303_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_031a_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_031a_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_0303_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_031a_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_031a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_591e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_591e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_591e_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_0303_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_0303_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_0303_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_0303_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_0303_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_0303_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_0303_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_0303_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_0303_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_0303_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_0303_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_0303_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_0303_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1774_c3_5093 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_0303_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_0303_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_0303_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_0303_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_0303_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1773_c7_0303_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1773_c7_0303_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1773_c7_0303_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_0303_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_0303_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_0303_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_0303_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_0303_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_0303_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_8829_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_8829_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_8829_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_8c0f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_8c0f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_8c0f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_8c0f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_8c0f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_8c0f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_8c0f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_8c0f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_8c0f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_8c0f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_8c0f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_8c0f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_8c0f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_8c0f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_8c0f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_8c0f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_8c0f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_8c0f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1776_c7_8c0f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1776_c7_8c0f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1776_c7_8c0f_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_8c0f_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_8c0f_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_8c0f_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_8c0f_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_8c0f_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_8c0f_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1778_c3_138e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1778_c3_138e_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_4381_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_4381_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_4381_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_fa38_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_fa38_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_fa38_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_fa38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_fa38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_fa38_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_fa38_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_fa38_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_fa38_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_fa38_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_fa38_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_fa38_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_fa38_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_fa38_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_fa38_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_fa38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_fa38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_fa38_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1780_c7_fa38_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1780_c7_fa38_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1780_c7_fa38_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_fa38_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_fa38_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_fa38_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_fa38_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_fa38_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_fa38_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_78bc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_78bc_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_78bc_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_8fe8_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_8fe8_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_8fe8_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_8fe8_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_7f90_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_7f90_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_7f90_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_2af4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1786_c3_1503 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_2af4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_2af4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_2af4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_2af4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_b7fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_2af4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_2af4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_2af4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_b7fa_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_2af4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_2af4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1787_c3_6574 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_2af4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_2af4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_2af4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_2af4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_b7fa_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_2af4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_2af4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_2af4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_b7fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_2af4_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_2af4_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_2af4_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_b7fa_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_2af4_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_2af4_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_2af4_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_b7fa_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_2af4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_4bee_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_4bee_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_4bee_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_b3e1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_b3e1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_b3e1_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_b7fa_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1792_c3_562d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_b7fa_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_8b9f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_b7fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_b7fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_b7fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_b7fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_b7fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_b7fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_8b9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_b7fa_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_b7fa_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_b7fa_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_8b9f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_b7fa_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_b7fa_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_b7fa_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_8b9f_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_b7fa_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_b7fa_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_b7fa_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_b7fa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_599b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_599b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_599b_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_8b9f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1797_c3_f72c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_8b9f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_8b9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_8b9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_8b9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_8b9f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_8b9f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_8b9f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_8b9f_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_8b9f_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_8b9f_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_8b9f_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1795_l1773_l1776_l1780_l1760_l1785_DUPLICATE_1d5e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1776_l1785_l1773_l1760_DUPLICATE_7541_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1776_l1785_l1773_DUPLICATE_7365_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1773_l1776_l1789_l1780_l1785_DUPLICATE_9e63_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1795_l1773_l1776_l1789_l1780_l1785_DUPLICATE_5667_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1777_l1781_DUPLICATE_aa06_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1776_l1785_l1795_l1780_DUPLICATE_fdf1_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_500b_uxn_opcodes_h_l1755_l1802_DUPLICATE_0168_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1770_c3_e539 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1770_c3_e539;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_b3e1_right := to_unsigned(5, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1774_c3_5093 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_0303_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1774_c3_5093;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_8b9f_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_7f90_right := to_unsigned(4, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1765_c3_e961 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1765_c3_e961;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_b7fa_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_8fe8_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_8fe8_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_599b_right := to_unsigned(6, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_4bee_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_8829_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_4381_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1792_c3_562d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_b7fa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1792_c3_562d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_591e_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1797_c3_f72c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_8b9f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1797_c3_f72c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_89a6_right := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1786_c3_1503 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_2af4_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1786_c3_1503;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_8fe8_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_89a6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_591e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_8829_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_4381_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_7f90_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_b3e1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_599b_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_b7fa_iftrue := VAR_previous_ram_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_8b9f_iftrue := VAR_previous_ram_read;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_b7fa_iftrue := VAR_previous_ram_read;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_8b9f_iftrue := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_78bc_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_4bee_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1773_c7_0303_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1780_c7_fa38_iffalse := t16;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_0303_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_8c0f_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_fa38_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_2af4_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_b7fa_iffalse := tmp8_high;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_0303_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_8c0f_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_fa38_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_2af4_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_b7fa_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_8b9f_iffalse := tmp8_low;
     -- BIN_OP_EQ[uxn_opcodes_h_l1785_c11_7f90] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1785_c11_7f90_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_7f90_left;
     BIN_OP_EQ_uxn_opcodes_h_l1785_c11_7f90_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_7f90_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_7f90_return_output := BIN_OP_EQ_uxn_opcodes_h_l1785_c11_7f90_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1773_l1776_l1789_l1780_l1785_DUPLICATE_9e63 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1773_l1776_l1789_l1780_l1785_DUPLICATE_9e63_return_output := result.is_stack_write;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1760_c2_031a] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1760_c2_031a_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1795_l1773_l1776_l1789_l1780_l1785_DUPLICATE_5667 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1795_l1773_l1776_l1789_l1780_l1785_DUPLICATE_5667_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1777_l1781_DUPLICATE_aa06 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1777_l1781_DUPLICATE_aa06_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1795_c11_599b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1795_c11_599b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_599b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1795_c11_599b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_599b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_599b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1795_c11_599b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1773_c11_591e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1773_c11_591e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_591e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1773_c11_591e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_591e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_591e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1773_c11_591e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1780_c11_4381] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1780_c11_4381_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_4381_left;
     BIN_OP_EQ_uxn_opcodes_h_l1780_c11_4381_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_4381_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_4381_return_output := BIN_OP_EQ_uxn_opcodes_h_l1780_c11_4381_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1782_c30_8fe8] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1782_c30_8fe8_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_8fe8_ins;
     sp_relative_shift_uxn_opcodes_h_l1782_c30_8fe8_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_8fe8_x;
     sp_relative_shift_uxn_opcodes_h_l1782_c30_8fe8_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_8fe8_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_8fe8_return_output := sp_relative_shift_uxn_opcodes_h_l1782_c30_8fe8_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1760_c2_031a] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1760_c2_031a_return_output := result.is_pc_updated;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1776_l1785_l1773_DUPLICATE_7365 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1776_l1785_l1773_DUPLICATE_7365_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1776_l1785_l1795_l1780_DUPLICATE_fdf1 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1776_l1785_l1795_l1780_DUPLICATE_fdf1_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1760_c6_89a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1760_c6_89a6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_89a6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1760_c6_89a6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_89a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_89a6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1760_c6_89a6_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1787_c22_4bee] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_4bee_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_4bee_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_4bee_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_4bee_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_4bee_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_4bee_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1789_c11_b3e1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1789_c11_b3e1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_b3e1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1789_c11_b3e1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_b3e1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_b3e1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1789_c11_b3e1_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1760_c2_031a] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1760_c2_031a_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1776_c11_8829] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1776_c11_8829_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_8829_left;
     BIN_OP_EQ_uxn_opcodes_h_l1776_c11_8829_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_8829_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_8829_return_output := BIN_OP_EQ_uxn_opcodes_h_l1776_c11_8829_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1760_c2_031a] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1760_c2_031a_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1776_l1785_l1773_l1760_DUPLICATE_7541 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1776_l1785_l1773_l1760_DUPLICATE_7541_return_output := result.u16_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1795_l1773_l1776_l1780_l1760_l1785_DUPLICATE_1d5e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1795_l1773_l1776_l1780_l1760_l1785_DUPLICATE_1d5e_return_output := result.u8_value;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_031a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_89a6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_031a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_89a6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_031a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_89a6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_031a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_89a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_031a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_89a6_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_031a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_89a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_031a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_89a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_031a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_89a6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_031a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_89a6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_031a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_89a6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1760_c2_031a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_89a6_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_031a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_89a6_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_031a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c6_89a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_0303_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_591e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_0303_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_591e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_0303_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_591e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_0303_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_591e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_0303_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_591e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_0303_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_591e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1773_c7_0303_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_591e_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_0303_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_591e_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_0303_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1773_c11_591e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_8c0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_8829_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_8c0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_8829_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_8c0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_8829_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_8c0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_8829_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_8c0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_8829_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_8c0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_8829_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1776_c7_8c0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_8829_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_8c0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_8829_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_8c0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_8829_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_fa38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_4381_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_fa38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_4381_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_fa38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_4381_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_fa38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_4381_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_fa38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_4381_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_fa38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_4381_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1780_c7_fa38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_4381_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_fa38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_4381_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_fa38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1780_c11_4381_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_2af4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_7f90_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_2af4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_7f90_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_2af4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_7f90_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_2af4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_7f90_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_2af4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_7f90_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_2af4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_7f90_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_2af4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_7f90_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_2af4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1785_c11_7f90_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_b7fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_b3e1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_b7fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_b3e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_b7fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_b3e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_b7fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_b3e1_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_b7fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_b3e1_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_b7fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1789_c11_b3e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_8b9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_599b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_8b9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_599b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_8b9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_599b_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_8b9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1795_c11_599b_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1787_c3_6574 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1787_c22_4bee_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_78bc_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1777_l1781_DUPLICATE_aa06_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1778_c3_138e_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1777_l1781_DUPLICATE_aa06_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_0303_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1776_l1785_l1773_DUPLICATE_7365_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_8c0f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1776_l1785_l1773_DUPLICATE_7365_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_2af4_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1776_l1785_l1773_DUPLICATE_7365_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1776_l1785_l1773_l1760_DUPLICATE_7541_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_0303_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1776_l1785_l1773_l1760_DUPLICATE_7541_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_8c0f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1776_l1785_l1773_l1760_DUPLICATE_7541_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_2af4_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1776_l1785_l1773_l1760_DUPLICATE_7541_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_0303_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1795_l1773_l1776_l1789_l1780_l1785_DUPLICATE_5667_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_8c0f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1795_l1773_l1776_l1789_l1780_l1785_DUPLICATE_5667_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_fa38_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1795_l1773_l1776_l1789_l1780_l1785_DUPLICATE_5667_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_2af4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1795_l1773_l1776_l1789_l1780_l1785_DUPLICATE_5667_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_b7fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1795_l1773_l1776_l1789_l1780_l1785_DUPLICATE_5667_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_8b9f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1795_l1773_l1776_l1789_l1780_l1785_DUPLICATE_5667_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_0303_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1773_l1776_l1789_l1780_l1785_DUPLICATE_9e63_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_8c0f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1773_l1776_l1789_l1780_l1785_DUPLICATE_9e63_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_fa38_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1773_l1776_l1789_l1780_l1785_DUPLICATE_9e63_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_2af4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1773_l1776_l1789_l1780_l1785_DUPLICATE_9e63_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_b7fa_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1773_l1776_l1789_l1780_l1785_DUPLICATE_9e63_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_8c0f_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1776_l1785_l1795_l1780_DUPLICATE_fdf1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_fa38_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1776_l1785_l1795_l1780_DUPLICATE_fdf1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_2af4_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1776_l1785_l1795_l1780_DUPLICATE_fdf1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_8b9f_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1776_l1785_l1795_l1780_DUPLICATE_fdf1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1795_l1773_l1776_l1780_l1760_l1785_DUPLICATE_1d5e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_0303_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1795_l1773_l1776_l1780_l1760_l1785_DUPLICATE_1d5e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_8c0f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1795_l1773_l1776_l1780_l1760_l1785_DUPLICATE_1d5e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_fa38_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1795_l1773_l1776_l1780_l1760_l1785_DUPLICATE_1d5e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_2af4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1795_l1773_l1776_l1780_l1760_l1785_DUPLICATE_1d5e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_8b9f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1795_l1773_l1776_l1780_l1760_l1785_DUPLICATE_1d5e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1760_c2_031a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1760_c2_031a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1760_c2_031a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1760_c2_031a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_fa38_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1782_c30_8fe8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_2af4_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1787_c3_6574;
     -- result_u16_value_MUX[uxn_opcodes_h_l1785_c7_2af4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1785_c7_2af4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_2af4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1785_c7_2af4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_2af4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1785_c7_2af4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_2af4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output := result_u16_value_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1795_c7_8b9f] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1795_c7_8b9f_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_8b9f_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1795_c7_8b9f_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_8b9f_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1795_c7_8b9f_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_8b9f_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_8b9f_return_output := tmp8_low_MUX_uxn_opcodes_h_l1795_c7_8b9f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1795_c7_8b9f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_8b9f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_8b9f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_8b9f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_8b9f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_8b9f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_8b9f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_8b9f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_8b9f_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1760_c2_031a] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_031a_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_031a_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_031a_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_031a_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1781_c3_78bc] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1781_c3_78bc_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_78bc_left;
     BIN_OP_OR_uxn_opcodes_h_l1781_c3_78bc_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_78bc_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_78bc_return_output := BIN_OP_OR_uxn_opcodes_h_l1781_c3_78bc_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1760_c2_031a] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_031a_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_031a_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_031a_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_031a_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1760_c2_031a] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_031a_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_031a_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_031a_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_031a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1760_c2_031a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_031a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_031a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_031a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_031a_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1778_c3_138e] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1778_c3_138e_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1778_c3_138e_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1778_c3_138e_return_output := CONST_SL_8_uxn_opcodes_h_l1778_c3_138e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1795_c7_8b9f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_8b9f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_8b9f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_8b9f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_8b9f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_8b9f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_8b9f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_8b9f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_8b9f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1795_c7_8b9f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1795_c7_8b9f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_8b9f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1795_c7_8b9f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_8b9f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1795_c7_8b9f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_8b9f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_8b9f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1795_c7_8b9f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1789_c7_b7fa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_b7fa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_b7fa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_b7fa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_b7fa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_b7fa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_b7fa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_b7fa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_b7fa_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1789_c7_b7fa] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1789_c7_b7fa_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_b7fa_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1789_c7_b7fa_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_b7fa_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1789_c7_b7fa_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_b7fa_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_b7fa_return_output := tmp8_high_MUX_uxn_opcodes_h_l1789_c7_b7fa_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1785_c7_2af4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_2af4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_2af4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_2af4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_2af4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_2af4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_2af4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_fa38_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_78bc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1780_c7_fa38_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1781_c3_78bc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1776_c7_8c0f_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1778_c3_138e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_b7fa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1795_c7_8b9f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_2af4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1789_c7_b7fa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_fa38_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_b7fa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1795_c7_8b9f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_fa38_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_b7fa_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1795_c7_8b9f_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_2af4_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1789_c7_b7fa_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_b7fa_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1795_c7_8b9f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1789_c7_b7fa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_b7fa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_b7fa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_b7fa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_b7fa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_b7fa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_b7fa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_b7fa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_b7fa_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1789_c7_b7fa] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1789_c7_b7fa_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_b7fa_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1789_c7_b7fa_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_b7fa_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1789_c7_b7fa_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_b7fa_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_b7fa_return_output := result_u8_value_MUX_uxn_opcodes_h_l1789_c7_b7fa_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1780_c7_fa38] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1780_c7_fa38_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_fa38_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1780_c7_fa38_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_fa38_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1780_c7_fa38_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_fa38_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output := result_u16_value_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1785_c7_2af4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_2af4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_2af4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_2af4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_2af4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_2af4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_2af4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1780_c7_fa38] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_fa38_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_fa38_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_fa38_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_fa38_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_fa38_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_fa38_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1789_c7_b7fa] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1789_c7_b7fa_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_b7fa_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1789_c7_b7fa_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_b7fa_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1789_c7_b7fa_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_b7fa_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_b7fa_return_output := tmp8_low_MUX_uxn_opcodes_h_l1789_c7_b7fa_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1789_c7_b7fa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_b7fa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_b7fa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_b7fa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_b7fa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_b7fa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_b7fa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_b7fa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_b7fa_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1785_c7_2af4] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1785_c7_2af4_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_2af4_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1785_c7_2af4_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_2af4_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1785_c7_2af4_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_2af4_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output := tmp8_high_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output;

     -- t16_MUX[uxn_opcodes_h_l1780_c7_fa38] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1780_c7_fa38_cond <= VAR_t16_MUX_uxn_opcodes_h_l1780_c7_fa38_cond;
     t16_MUX_uxn_opcodes_h_l1780_c7_fa38_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1780_c7_fa38_iftrue;
     t16_MUX_uxn_opcodes_h_l1780_c7_fa38_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1780_c7_fa38_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output := t16_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_2af4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1789_c7_b7fa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_fa38_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_8c0f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_2af4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1789_c7_b7fa_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_8c0f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_2af4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1789_c7_b7fa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1776_c7_8c0f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_fa38_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_2af4_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1789_c7_b7fa_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1776_c7_8c0f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_8c0f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_8c0f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_8c0f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_8c0f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_8c0f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_8c0f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1780_c7_fa38] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_fa38_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_fa38_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_fa38_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_fa38_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_fa38_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_fa38_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1780_c7_fa38] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1780_c7_fa38_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_fa38_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1780_c7_fa38_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_fa38_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1780_c7_fa38_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_fa38_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output := tmp8_high_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1776_c7_8c0f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1776_c7_8c0f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_8c0f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1776_c7_8c0f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_8c0f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1776_c7_8c0f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_8c0f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output := result_u16_value_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output;

     -- t16_MUX[uxn_opcodes_h_l1776_c7_8c0f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1776_c7_8c0f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1776_c7_8c0f_cond;
     t16_MUX_uxn_opcodes_h_l1776_c7_8c0f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1776_c7_8c0f_iftrue;
     t16_MUX_uxn_opcodes_h_l1776_c7_8c0f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1776_c7_8c0f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output := t16_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1785_c7_2af4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_2af4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_2af4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_2af4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_2af4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_2af4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_2af4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1785_c7_2af4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1785_c7_2af4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_2af4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1785_c7_2af4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_2af4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1785_c7_2af4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_2af4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output := result_u8_value_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1785_c7_2af4] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1785_c7_2af4_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_2af4_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1785_c7_2af4_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_2af4_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1785_c7_2af4_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_2af4_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output := tmp8_low_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1785_c7_2af4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_2af4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_2af4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_2af4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_2af4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_2af4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_2af4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_fa38_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_8c0f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_0303_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_fa38_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_0303_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_fa38_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1773_c7_0303_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_8c0f_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_fa38_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1785_c7_2af4_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1773_c7_0303] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_0303_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_0303_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_0303_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_0303_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_0303_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_0303_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_0303_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_0303_return_output;

     -- t16_MUX[uxn_opcodes_h_l1773_c7_0303] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1773_c7_0303_cond <= VAR_t16_MUX_uxn_opcodes_h_l1773_c7_0303_cond;
     t16_MUX_uxn_opcodes_h_l1773_c7_0303_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1773_c7_0303_iftrue;
     t16_MUX_uxn_opcodes_h_l1773_c7_0303_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1773_c7_0303_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1773_c7_0303_return_output := t16_MUX_uxn_opcodes_h_l1773_c7_0303_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1776_c7_8c0f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_8c0f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_8c0f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_8c0f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_8c0f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_8c0f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_8c0f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1780_c7_fa38] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_fa38_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_fa38_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_fa38_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_fa38_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_fa38_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_fa38_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1773_c7_0303] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1773_c7_0303_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_0303_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1773_c7_0303_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_0303_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1773_c7_0303_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_0303_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_0303_return_output := result_u16_value_MUX_uxn_opcodes_h_l1773_c7_0303_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1780_c7_fa38] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1780_c7_fa38_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_fa38_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1780_c7_fa38_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_fa38_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1780_c7_fa38_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_fa38_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output := result_u8_value_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1776_c7_8c0f] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1776_c7_8c0f_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_8c0f_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1776_c7_8c0f_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_8c0f_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1776_c7_8c0f_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_8c0f_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output := tmp8_high_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1780_c7_fa38] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_fa38_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_fa38_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_fa38_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_fa38_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_fa38_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_fa38_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1780_c7_fa38] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1780_c7_fa38_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_fa38_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1780_c7_fa38_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_fa38_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1780_c7_fa38_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_fa38_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output := tmp8_low_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_8c0f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_0303_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1773_c7_0303_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_8c0f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1773_c7_0303_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_8c0f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1773_c7_0303_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_0303_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_8c0f_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1780_c7_fa38_return_output;
     -- tmp8_high_MUX[uxn_opcodes_h_l1773_c7_0303] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1773_c7_0303_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_0303_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1773_c7_0303_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_0303_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1773_c7_0303_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_0303_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_0303_return_output := tmp8_high_MUX_uxn_opcodes_h_l1773_c7_0303_return_output;

     -- t16_MUX[uxn_opcodes_h_l1760_c2_031a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1760_c2_031a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1760_c2_031a_cond;
     t16_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue;
     t16_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1760_c2_031a_return_output := t16_MUX_uxn_opcodes_h_l1760_c2_031a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1760_c2_031a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_031a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_031a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_031a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_031a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1773_c7_0303] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_0303_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_0303_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_0303_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_0303_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_0303_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_0303_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_0303_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_0303_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1776_c7_8c0f] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1776_c7_8c0f_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_8c0f_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1776_c7_8c0f_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_8c0f_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1776_c7_8c0f_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_8c0f_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output := tmp8_low_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1760_c2_031a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1760_c2_031a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_031a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_031a_return_output := result_u16_value_MUX_uxn_opcodes_h_l1760_c2_031a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1776_c7_8c0f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_8c0f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_8c0f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_8c0f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_8c0f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_8c0f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_8c0f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1776_c7_8c0f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1776_c7_8c0f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_8c0f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1776_c7_8c0f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_8c0f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1776_c7_8c0f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_8c0f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1776_c7_8c0f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_8c0f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_8c0f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_8c0f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_8c0f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_8c0f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_8c0f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_0303_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1773_c7_0303_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_0303_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_0303_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1760_c2_031a_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1773_c7_0303_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_0303_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1776_c7_8c0f_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1773_c7_0303] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_0303_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_0303_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_0303_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_0303_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_0303_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_0303_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_0303_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_0303_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1760_c2_031a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_031a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_031a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_031a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_031a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1773_c7_0303] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_0303_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_0303_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_0303_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_0303_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_0303_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_0303_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_0303_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_0303_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1773_c7_0303] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1773_c7_0303_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_0303_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1773_c7_0303_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_0303_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1773_c7_0303_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_0303_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_0303_return_output := tmp8_low_MUX_uxn_opcodes_h_l1773_c7_0303_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1773_c7_0303] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1773_c7_0303_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_0303_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1773_c7_0303_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_0303_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1773_c7_0303_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_0303_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_0303_return_output := result_u8_value_MUX_uxn_opcodes_h_l1773_c7_0303_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1760_c2_031a] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1760_c2_031a_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_031a_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_031a_return_output := tmp8_high_MUX_uxn_opcodes_h_l1760_c2_031a_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1773_c7_0303_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1773_c7_0303_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1773_c7_0303_return_output;
     REG_VAR_tmp8_high := VAR_tmp8_high_MUX_uxn_opcodes_h_l1760_c2_031a_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1773_c7_0303_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1760_c2_031a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_031a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_031a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_031a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_031a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1760_c2_031a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_031a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_031a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_031a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_031a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1760_c2_031a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1760_c2_031a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_031a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_031a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1760_c2_031a_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1760_c2_031a] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1760_c2_031a_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_031a_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_031a_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_031a_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_031a_return_output := tmp8_low_MUX_uxn_opcodes_h_l1760_c2_031a_return_output;

     -- Submodule level 8
     REG_VAR_tmp8_low := VAR_tmp8_low_MUX_uxn_opcodes_h_l1760_c2_031a_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_500b_uxn_opcodes_h_l1755_l1802_DUPLICATE_0168 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_500b_uxn_opcodes_h_l1755_l1802_DUPLICATE_0168_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_500b(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1760_c2_031a_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1760_c2_031a_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1760_c2_031a_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1760_c2_031a_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c2_031a_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c2_031a_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c2_031a_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c2_031a_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1760_c2_031a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c2_031a_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_500b_uxn_opcodes_h_l1755_l1802_DUPLICATE_0168_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_500b_uxn_opcodes_h_l1755_l1802_DUPLICATE_0168_return_output;
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
