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
-- BIN_OP_EQ[uxn_opcodes_h_l1783_c6_0a21]
signal BIN_OP_EQ_uxn_opcodes_h_l1783_c6_0a21_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1783_c6_0a21_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1783_c6_0a21_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1783_c2_cc54]
signal tmp8_high_MUX_uxn_opcodes_h_l1783_c2_cc54_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1783_c2_cc54]
signal t16_MUX_uxn_opcodes_h_l1783_c2_cc54_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output : unsigned(15 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1783_c2_cc54]
signal tmp8_low_MUX_uxn_opcodes_h_l1783_c2_cc54_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1783_c2_cc54]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1783_c2_cc54_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1783_c2_cc54]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1783_c2_cc54_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1783_c2_cc54]
signal result_u16_value_MUX_uxn_opcodes_h_l1783_c2_cc54_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1783_c2_cc54]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1783_c2_cc54_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1783_c2_cc54]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1783_c2_cc54_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1783_c2_cc54]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c2_cc54_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1783_c2_cc54]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1783_c2_cc54_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1783_c2_cc54]
signal result_u8_value_MUX_uxn_opcodes_h_l1783_c2_cc54_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1783_c2_cc54]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c2_cc54_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1783_c2_cc54]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1783_c2_cc54_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1796_c11_ad06]
signal BIN_OP_EQ_uxn_opcodes_h_l1796_c11_ad06_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1796_c11_ad06_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1796_c11_ad06_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1796_c7_fe78]
signal tmp8_high_MUX_uxn_opcodes_h_l1796_c7_fe78_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1796_c7_fe78_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1796_c7_fe78_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1796_c7_fe78]
signal t16_MUX_uxn_opcodes_h_l1796_c7_fe78_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1796_c7_fe78_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1796_c7_fe78_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output : unsigned(15 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1796_c7_fe78]
signal tmp8_low_MUX_uxn_opcodes_h_l1796_c7_fe78_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1796_c7_fe78_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1796_c7_fe78_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1796_c7_fe78]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_fe78_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_fe78_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_fe78_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1796_c7_fe78]
signal result_u16_value_MUX_uxn_opcodes_h_l1796_c7_fe78_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1796_c7_fe78_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1796_c7_fe78_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1796_c7_fe78]
signal result_u8_value_MUX_uxn_opcodes_h_l1796_c7_fe78_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1796_c7_fe78_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1796_c7_fe78_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1796_c7_fe78]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c7_fe78_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c7_fe78_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c7_fe78_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1796_c7_fe78]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_fe78_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_fe78_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_fe78_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1796_c7_fe78]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1796_c7_fe78_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1796_c7_fe78_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1796_c7_fe78_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1799_c11_7ef2]
signal BIN_OP_EQ_uxn_opcodes_h_l1799_c11_7ef2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1799_c11_7ef2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1799_c11_7ef2_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1799_c7_ac21]
signal tmp8_high_MUX_uxn_opcodes_h_l1799_c7_ac21_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1799_c7_ac21_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1799_c7_ac21_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1799_c7_ac21]
signal t16_MUX_uxn_opcodes_h_l1799_c7_ac21_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1799_c7_ac21_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1799_c7_ac21_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output : unsigned(15 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1799_c7_ac21]
signal tmp8_low_MUX_uxn_opcodes_h_l1799_c7_ac21_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1799_c7_ac21_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1799_c7_ac21_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1799_c7_ac21]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1799_c7_ac21_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1799_c7_ac21_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1799_c7_ac21_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1799_c7_ac21]
signal result_u16_value_MUX_uxn_opcodes_h_l1799_c7_ac21_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1799_c7_ac21_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1799_c7_ac21_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1799_c7_ac21]
signal result_u8_value_MUX_uxn_opcodes_h_l1799_c7_ac21_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1799_c7_ac21_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1799_c7_ac21_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1799_c7_ac21]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1799_c7_ac21_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1799_c7_ac21_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1799_c7_ac21_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1799_c7_ac21]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1799_c7_ac21_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1799_c7_ac21_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1799_c7_ac21_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1799_c7_ac21]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1799_c7_ac21_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1799_c7_ac21_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1799_c7_ac21_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1801_c3_4f58]
signal CONST_SL_8_uxn_opcodes_h_l1801_c3_4f58_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1801_c3_4f58_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1803_c11_ab77]
signal BIN_OP_EQ_uxn_opcodes_h_l1803_c11_ab77_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1803_c11_ab77_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1803_c11_ab77_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1803_c7_a8e0]
signal tmp8_high_MUX_uxn_opcodes_h_l1803_c7_a8e0_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1803_c7_a8e0_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1803_c7_a8e0_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1803_c7_a8e0]
signal t16_MUX_uxn_opcodes_h_l1803_c7_a8e0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1803_c7_a8e0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1803_c7_a8e0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output : unsigned(15 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1803_c7_a8e0]
signal tmp8_low_MUX_uxn_opcodes_h_l1803_c7_a8e0_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1803_c7_a8e0_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1803_c7_a8e0_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1803_c7_a8e0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_a8e0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_a8e0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_a8e0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1803_c7_a8e0]
signal result_u16_value_MUX_uxn_opcodes_h_l1803_c7_a8e0_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1803_c7_a8e0_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1803_c7_a8e0_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1803_c7_a8e0]
signal result_u8_value_MUX_uxn_opcodes_h_l1803_c7_a8e0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1803_c7_a8e0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1803_c7_a8e0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1803_c7_a8e0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_a8e0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_a8e0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_a8e0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1803_c7_a8e0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_a8e0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_a8e0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_a8e0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1803_c7_a8e0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_a8e0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_a8e0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_a8e0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1804_c3_1b47]
signal BIN_OP_OR_uxn_opcodes_h_l1804_c3_1b47_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1804_c3_1b47_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1804_c3_1b47_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1805_c30_7bf7]
signal sp_relative_shift_uxn_opcodes_h_l1805_c30_7bf7_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1805_c30_7bf7_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1805_c30_7bf7_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1805_c30_7bf7_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1808_c11_ed6d]
signal BIN_OP_EQ_uxn_opcodes_h_l1808_c11_ed6d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1808_c11_ed6d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1808_c11_ed6d_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1808_c7_f9b1]
signal tmp8_high_MUX_uxn_opcodes_h_l1808_c7_f9b1_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1808_c7_f9b1_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1808_c7_f9b1_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1808_c7_f9b1]
signal tmp8_low_MUX_uxn_opcodes_h_l1808_c7_f9b1_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1808_c7_f9b1_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1808_c7_f9b1_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1808_c7_f9b1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1808_c7_f9b1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1808_c7_f9b1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1808_c7_f9b1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1808_c7_f9b1]
signal result_u16_value_MUX_uxn_opcodes_h_l1808_c7_f9b1_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1808_c7_f9b1_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1808_c7_f9b1_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1808_c7_f9b1]
signal result_u8_value_MUX_uxn_opcodes_h_l1808_c7_f9b1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1808_c7_f9b1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1808_c7_f9b1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1808_c7_f9b1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1808_c7_f9b1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1808_c7_f9b1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1808_c7_f9b1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1808_c7_f9b1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1808_c7_f9b1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1808_c7_f9b1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1808_c7_f9b1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1808_c7_f9b1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1808_c7_f9b1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1808_c7_f9b1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1808_c7_f9b1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1810_c22_21d2]
signal BIN_OP_PLUS_uxn_opcodes_h_l1810_c22_21d2_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1810_c22_21d2_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1810_c22_21d2_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1812_c11_6702]
signal BIN_OP_EQ_uxn_opcodes_h_l1812_c11_6702_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1812_c11_6702_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1812_c11_6702_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1812_c7_ba7e]
signal tmp8_high_MUX_uxn_opcodes_h_l1812_c7_ba7e_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1812_c7_ba7e_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1812_c7_ba7e_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1812_c7_ba7e_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1812_c7_ba7e]
signal tmp8_low_MUX_uxn_opcodes_h_l1812_c7_ba7e_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1812_c7_ba7e_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1812_c7_ba7e_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1812_c7_ba7e_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1812_c7_ba7e]
signal result_u8_value_MUX_uxn_opcodes_h_l1812_c7_ba7e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1812_c7_ba7e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1812_c7_ba7e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1812_c7_ba7e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1812_c7_ba7e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ba7e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ba7e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ba7e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ba7e_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1812_c7_ba7e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_ba7e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_ba7e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_ba7e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_ba7e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1812_c7_ba7e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ba7e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ba7e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ba7e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ba7e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1818_c11_f99e]
signal BIN_OP_EQ_uxn_opcodes_h_l1818_c11_f99e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1818_c11_f99e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1818_c11_f99e_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1818_c7_7b6d]
signal tmp8_low_MUX_uxn_opcodes_h_l1818_c7_7b6d_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1818_c7_7b6d_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1818_c7_7b6d_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1818_c7_7b6d_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1818_c7_7b6d]
signal result_u8_value_MUX_uxn_opcodes_h_l1818_c7_7b6d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1818_c7_7b6d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1818_c7_7b6d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1818_c7_7b6d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1818_c7_7b6d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_7b6d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_7b6d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_7b6d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_7b6d_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1818_c7_7b6d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_7b6d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_7b6d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_7b6d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_7b6d_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_1a75( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_ram_write := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.u8_value := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;
      base.is_pc_updated := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1783_c6_0a21
BIN_OP_EQ_uxn_opcodes_h_l1783_c6_0a21 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1783_c6_0a21_left,
BIN_OP_EQ_uxn_opcodes_h_l1783_c6_0a21_right,
BIN_OP_EQ_uxn_opcodes_h_l1783_c6_0a21_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1783_c2_cc54
tmp8_high_MUX_uxn_opcodes_h_l1783_c2_cc54 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1783_c2_cc54_cond,
tmp8_high_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output);

-- t16_MUX_uxn_opcodes_h_l1783_c2_cc54
t16_MUX_uxn_opcodes_h_l1783_c2_cc54 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1783_c2_cc54_cond,
t16_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue,
t16_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse,
t16_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1783_c2_cc54
tmp8_low_MUX_uxn_opcodes_h_l1783_c2_cc54 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1783_c2_cc54_cond,
tmp8_low_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1783_c2_cc54
result_is_opc_done_MUX_uxn_opcodes_h_l1783_c2_cc54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1783_c2_cc54_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1783_c2_cc54
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1783_c2_cc54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1783_c2_cc54_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1783_c2_cc54
result_u16_value_MUX_uxn_opcodes_h_l1783_c2_cc54 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1783_c2_cc54_cond,
result_u16_value_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1783_c2_cc54
result_is_ram_write_MUX_uxn_opcodes_h_l1783_c2_cc54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1783_c2_cc54_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1783_c2_cc54
result_is_stack_write_MUX_uxn_opcodes_h_l1783_c2_cc54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1783_c2_cc54_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c2_cc54
result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c2_cc54 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c2_cc54_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1783_c2_cc54
result_is_vram_write_MUX_uxn_opcodes_h_l1783_c2_cc54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1783_c2_cc54_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1783_c2_cc54
result_u8_value_MUX_uxn_opcodes_h_l1783_c2_cc54 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1783_c2_cc54_cond,
result_u8_value_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c2_cc54
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c2_cc54 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c2_cc54_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1783_c2_cc54
result_is_pc_updated_MUX_uxn_opcodes_h_l1783_c2_cc54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1783_c2_cc54_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1796_c11_ad06
BIN_OP_EQ_uxn_opcodes_h_l1796_c11_ad06 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1796_c11_ad06_left,
BIN_OP_EQ_uxn_opcodes_h_l1796_c11_ad06_right,
BIN_OP_EQ_uxn_opcodes_h_l1796_c11_ad06_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1796_c7_fe78
tmp8_high_MUX_uxn_opcodes_h_l1796_c7_fe78 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1796_c7_fe78_cond,
tmp8_high_MUX_uxn_opcodes_h_l1796_c7_fe78_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1796_c7_fe78_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output);

-- t16_MUX_uxn_opcodes_h_l1796_c7_fe78
t16_MUX_uxn_opcodes_h_l1796_c7_fe78 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1796_c7_fe78_cond,
t16_MUX_uxn_opcodes_h_l1796_c7_fe78_iftrue,
t16_MUX_uxn_opcodes_h_l1796_c7_fe78_iffalse,
t16_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1796_c7_fe78
tmp8_low_MUX_uxn_opcodes_h_l1796_c7_fe78 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1796_c7_fe78_cond,
tmp8_low_MUX_uxn_opcodes_h_l1796_c7_fe78_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1796_c7_fe78_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_fe78
result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_fe78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_fe78_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_fe78_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_fe78_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1796_c7_fe78
result_u16_value_MUX_uxn_opcodes_h_l1796_c7_fe78 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1796_c7_fe78_cond,
result_u16_value_MUX_uxn_opcodes_h_l1796_c7_fe78_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1796_c7_fe78_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1796_c7_fe78
result_u8_value_MUX_uxn_opcodes_h_l1796_c7_fe78 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1796_c7_fe78_cond,
result_u8_value_MUX_uxn_opcodes_h_l1796_c7_fe78_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1796_c7_fe78_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c7_fe78
result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c7_fe78 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c7_fe78_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c7_fe78_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c7_fe78_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_fe78
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_fe78 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_fe78_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_fe78_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_fe78_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1796_c7_fe78
result_is_stack_write_MUX_uxn_opcodes_h_l1796_c7_fe78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1796_c7_fe78_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1796_c7_fe78_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1796_c7_fe78_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1799_c11_7ef2
BIN_OP_EQ_uxn_opcodes_h_l1799_c11_7ef2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1799_c11_7ef2_left,
BIN_OP_EQ_uxn_opcodes_h_l1799_c11_7ef2_right,
BIN_OP_EQ_uxn_opcodes_h_l1799_c11_7ef2_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1799_c7_ac21
tmp8_high_MUX_uxn_opcodes_h_l1799_c7_ac21 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1799_c7_ac21_cond,
tmp8_high_MUX_uxn_opcodes_h_l1799_c7_ac21_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1799_c7_ac21_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output);

-- t16_MUX_uxn_opcodes_h_l1799_c7_ac21
t16_MUX_uxn_opcodes_h_l1799_c7_ac21 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1799_c7_ac21_cond,
t16_MUX_uxn_opcodes_h_l1799_c7_ac21_iftrue,
t16_MUX_uxn_opcodes_h_l1799_c7_ac21_iffalse,
t16_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1799_c7_ac21
tmp8_low_MUX_uxn_opcodes_h_l1799_c7_ac21 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1799_c7_ac21_cond,
tmp8_low_MUX_uxn_opcodes_h_l1799_c7_ac21_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1799_c7_ac21_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1799_c7_ac21
result_is_opc_done_MUX_uxn_opcodes_h_l1799_c7_ac21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1799_c7_ac21_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1799_c7_ac21_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1799_c7_ac21_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1799_c7_ac21
result_u16_value_MUX_uxn_opcodes_h_l1799_c7_ac21 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1799_c7_ac21_cond,
result_u16_value_MUX_uxn_opcodes_h_l1799_c7_ac21_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1799_c7_ac21_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1799_c7_ac21
result_u8_value_MUX_uxn_opcodes_h_l1799_c7_ac21 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1799_c7_ac21_cond,
result_u8_value_MUX_uxn_opcodes_h_l1799_c7_ac21_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1799_c7_ac21_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1799_c7_ac21
result_sp_relative_shift_MUX_uxn_opcodes_h_l1799_c7_ac21 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1799_c7_ac21_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1799_c7_ac21_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1799_c7_ac21_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1799_c7_ac21
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1799_c7_ac21 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1799_c7_ac21_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1799_c7_ac21_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1799_c7_ac21_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1799_c7_ac21
result_is_stack_write_MUX_uxn_opcodes_h_l1799_c7_ac21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1799_c7_ac21_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1799_c7_ac21_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1799_c7_ac21_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1801_c3_4f58
CONST_SL_8_uxn_opcodes_h_l1801_c3_4f58 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1801_c3_4f58_x,
CONST_SL_8_uxn_opcodes_h_l1801_c3_4f58_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1803_c11_ab77
BIN_OP_EQ_uxn_opcodes_h_l1803_c11_ab77 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1803_c11_ab77_left,
BIN_OP_EQ_uxn_opcodes_h_l1803_c11_ab77_right,
BIN_OP_EQ_uxn_opcodes_h_l1803_c11_ab77_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1803_c7_a8e0
tmp8_high_MUX_uxn_opcodes_h_l1803_c7_a8e0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1803_c7_a8e0_cond,
tmp8_high_MUX_uxn_opcodes_h_l1803_c7_a8e0_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1803_c7_a8e0_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output);

-- t16_MUX_uxn_opcodes_h_l1803_c7_a8e0
t16_MUX_uxn_opcodes_h_l1803_c7_a8e0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1803_c7_a8e0_cond,
t16_MUX_uxn_opcodes_h_l1803_c7_a8e0_iftrue,
t16_MUX_uxn_opcodes_h_l1803_c7_a8e0_iffalse,
t16_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1803_c7_a8e0
tmp8_low_MUX_uxn_opcodes_h_l1803_c7_a8e0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1803_c7_a8e0_cond,
tmp8_low_MUX_uxn_opcodes_h_l1803_c7_a8e0_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1803_c7_a8e0_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_a8e0
result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_a8e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_a8e0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_a8e0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_a8e0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1803_c7_a8e0
result_u16_value_MUX_uxn_opcodes_h_l1803_c7_a8e0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1803_c7_a8e0_cond,
result_u16_value_MUX_uxn_opcodes_h_l1803_c7_a8e0_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1803_c7_a8e0_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1803_c7_a8e0
result_u8_value_MUX_uxn_opcodes_h_l1803_c7_a8e0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1803_c7_a8e0_cond,
result_u8_value_MUX_uxn_opcodes_h_l1803_c7_a8e0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1803_c7_a8e0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_a8e0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_a8e0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_a8e0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_a8e0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_a8e0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_a8e0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_a8e0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_a8e0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_a8e0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_a8e0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_a8e0
result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_a8e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_a8e0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_a8e0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_a8e0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1804_c3_1b47
BIN_OP_OR_uxn_opcodes_h_l1804_c3_1b47 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1804_c3_1b47_left,
BIN_OP_OR_uxn_opcodes_h_l1804_c3_1b47_right,
BIN_OP_OR_uxn_opcodes_h_l1804_c3_1b47_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1805_c30_7bf7
sp_relative_shift_uxn_opcodes_h_l1805_c30_7bf7 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1805_c30_7bf7_ins,
sp_relative_shift_uxn_opcodes_h_l1805_c30_7bf7_x,
sp_relative_shift_uxn_opcodes_h_l1805_c30_7bf7_y,
sp_relative_shift_uxn_opcodes_h_l1805_c30_7bf7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1808_c11_ed6d
BIN_OP_EQ_uxn_opcodes_h_l1808_c11_ed6d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1808_c11_ed6d_left,
BIN_OP_EQ_uxn_opcodes_h_l1808_c11_ed6d_right,
BIN_OP_EQ_uxn_opcodes_h_l1808_c11_ed6d_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1808_c7_f9b1
tmp8_high_MUX_uxn_opcodes_h_l1808_c7_f9b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1808_c7_f9b1_cond,
tmp8_high_MUX_uxn_opcodes_h_l1808_c7_f9b1_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1808_c7_f9b1_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1808_c7_f9b1
tmp8_low_MUX_uxn_opcodes_h_l1808_c7_f9b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1808_c7_f9b1_cond,
tmp8_low_MUX_uxn_opcodes_h_l1808_c7_f9b1_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1808_c7_f9b1_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1808_c7_f9b1
result_is_opc_done_MUX_uxn_opcodes_h_l1808_c7_f9b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1808_c7_f9b1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1808_c7_f9b1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1808_c7_f9b1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1808_c7_f9b1
result_u16_value_MUX_uxn_opcodes_h_l1808_c7_f9b1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1808_c7_f9b1_cond,
result_u16_value_MUX_uxn_opcodes_h_l1808_c7_f9b1_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1808_c7_f9b1_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1808_c7_f9b1
result_u8_value_MUX_uxn_opcodes_h_l1808_c7_f9b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1808_c7_f9b1_cond,
result_u8_value_MUX_uxn_opcodes_h_l1808_c7_f9b1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1808_c7_f9b1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1808_c7_f9b1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1808_c7_f9b1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1808_c7_f9b1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1808_c7_f9b1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1808_c7_f9b1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1808_c7_f9b1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1808_c7_f9b1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1808_c7_f9b1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1808_c7_f9b1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1808_c7_f9b1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1808_c7_f9b1
result_is_stack_write_MUX_uxn_opcodes_h_l1808_c7_f9b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1808_c7_f9b1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1808_c7_f9b1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1808_c7_f9b1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1810_c22_21d2
BIN_OP_PLUS_uxn_opcodes_h_l1810_c22_21d2 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1810_c22_21d2_left,
BIN_OP_PLUS_uxn_opcodes_h_l1810_c22_21d2_right,
BIN_OP_PLUS_uxn_opcodes_h_l1810_c22_21d2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1812_c11_6702
BIN_OP_EQ_uxn_opcodes_h_l1812_c11_6702 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1812_c11_6702_left,
BIN_OP_EQ_uxn_opcodes_h_l1812_c11_6702_right,
BIN_OP_EQ_uxn_opcodes_h_l1812_c11_6702_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1812_c7_ba7e
tmp8_high_MUX_uxn_opcodes_h_l1812_c7_ba7e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1812_c7_ba7e_cond,
tmp8_high_MUX_uxn_opcodes_h_l1812_c7_ba7e_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1812_c7_ba7e_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1812_c7_ba7e_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1812_c7_ba7e
tmp8_low_MUX_uxn_opcodes_h_l1812_c7_ba7e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1812_c7_ba7e_cond,
tmp8_low_MUX_uxn_opcodes_h_l1812_c7_ba7e_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1812_c7_ba7e_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1812_c7_ba7e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1812_c7_ba7e
result_u8_value_MUX_uxn_opcodes_h_l1812_c7_ba7e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1812_c7_ba7e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1812_c7_ba7e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1812_c7_ba7e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1812_c7_ba7e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ba7e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ba7e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ba7e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ba7e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ba7e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ba7e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_ba7e
result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_ba7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_ba7e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_ba7e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_ba7e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_ba7e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ba7e
result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ba7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ba7e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ba7e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ba7e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ba7e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1818_c11_f99e
BIN_OP_EQ_uxn_opcodes_h_l1818_c11_f99e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1818_c11_f99e_left,
BIN_OP_EQ_uxn_opcodes_h_l1818_c11_f99e_right,
BIN_OP_EQ_uxn_opcodes_h_l1818_c11_f99e_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1818_c7_7b6d
tmp8_low_MUX_uxn_opcodes_h_l1818_c7_7b6d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1818_c7_7b6d_cond,
tmp8_low_MUX_uxn_opcodes_h_l1818_c7_7b6d_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1818_c7_7b6d_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1818_c7_7b6d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1818_c7_7b6d
result_u8_value_MUX_uxn_opcodes_h_l1818_c7_7b6d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1818_c7_7b6d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1818_c7_7b6d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1818_c7_7b6d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1818_c7_7b6d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_7b6d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_7b6d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_7b6d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_7b6d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_7b6d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_7b6d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_7b6d
result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_7b6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_7b6d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_7b6d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_7b6d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_7b6d_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1783_c6_0a21_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output,
 t16_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1796_c11_ad06_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output,
 t16_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1799_c11_7ef2_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output,
 t16_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output,
 CONST_SL_8_uxn_opcodes_h_l1801_c3_4f58_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1803_c11_ab77_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output,
 t16_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1804_c3_1b47_return_output,
 sp_relative_shift_uxn_opcodes_h_l1805_c30_7bf7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1808_c11_ed6d_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1810_c22_21d2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1812_c11_6702_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1812_c7_ba7e_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1812_c7_ba7e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1812_c7_ba7e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ba7e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_ba7e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ba7e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1818_c11_f99e_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1818_c7_7b6d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1818_c7_7b6d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_7b6d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_7b6d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c6_0a21_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c6_0a21_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c6_0a21_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1783_c2_cc54_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1783_c2_cc54_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1783_c2_cc54_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c2_cc54_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1783_c2_cc54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1783_c2_cc54_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1783_c2_cc54_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1783_c2_cc54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1783_c2_cc54_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c2_cc54_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1788_c3_24b3 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c2_cc54_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1783_c2_cc54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1783_c2_cc54_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1783_c2_cc54_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1793_c3_152a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c2_cc54_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1783_c2_cc54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1783_c2_cc54_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_ad06_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_ad06_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_ad06_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1796_c7_fe78_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1796_c7_fe78_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1796_c7_fe78_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1796_c7_fe78_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1796_c7_fe78_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1796_c7_fe78_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_fe78_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_fe78_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_fe78_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_fe78_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_fe78_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_fe78_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1796_c7_fe78_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1796_c7_fe78_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1796_c7_fe78_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_fe78_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_fe78_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_fe78_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c7_fe78_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c7_fe78_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c7_fe78_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_fe78_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1797_c3_397d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_fe78_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_fe78_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1796_c7_fe78_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1796_c7_fe78_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1796_c7_fe78_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1799_c11_7ef2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1799_c11_7ef2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1799_c11_7ef2_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1799_c7_ac21_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1799_c7_ac21_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1799_c7_ac21_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1799_c7_ac21_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1799_c7_ac21_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1799_c7_ac21_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1799_c7_ac21_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1799_c7_ac21_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1799_c7_ac21_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1799_c7_ac21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1799_c7_ac21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1799_c7_ac21_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1799_c7_ac21_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1799_c7_ac21_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1799_c7_ac21_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1799_c7_ac21_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1799_c7_ac21_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1799_c7_ac21_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1799_c7_ac21_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1799_c7_ac21_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1799_c7_ac21_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1799_c7_ac21_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1799_c7_ac21_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1799_c7_ac21_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1799_c7_ac21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1799_c7_ac21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1799_c7_ac21_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1801_c3_4f58_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1801_c3_4f58_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_ab77_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_ab77_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_ab77_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1803_c7_a8e0_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1803_c7_a8e0_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1803_c7_a8e0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1803_c7_a8e0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1803_c7_a8e0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1803_c7_a8e0_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1803_c7_a8e0_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1803_c7_a8e0_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1803_c7_a8e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_a8e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_a8e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_a8e0_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1803_c7_a8e0_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1803_c7_a8e0_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1803_c7_a8e0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1803_c7_a8e0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1803_c7_a8e0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1803_c7_a8e0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_a8e0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_a8e0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_a8e0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_a8e0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_a8e0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_a8e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_a8e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_a8e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_a8e0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1804_c3_1b47_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1804_c3_1b47_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1804_c3_1b47_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1805_c30_7bf7_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1805_c30_7bf7_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1805_c30_7bf7_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1805_c30_7bf7_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1808_c11_ed6d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1808_c11_ed6d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1808_c11_ed6d_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1808_c7_f9b1_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1808_c7_f9b1_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1812_c7_ba7e_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1808_c7_f9b1_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1808_c7_f9b1_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1808_c7_f9b1_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1812_c7_ba7e_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1808_c7_f9b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1808_c7_f9b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1808_c7_f9b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ba7e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1808_c7_f9b1_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1808_c7_f9b1_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1810_c3_154a : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1808_c7_f9b1_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1808_c7_f9b1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1808_c7_f9b1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1808_c7_f9b1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c7_ba7e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1808_c7_f9b1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1808_c7_f9b1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1809_c3_3275 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1808_c7_f9b1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1808_c7_f9b1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1808_c7_f9b1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1808_c7_f9b1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ba7e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1808_c7_f9b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1808_c7_f9b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1808_c7_f9b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_ba7e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1808_c7_f9b1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1810_c22_21d2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1810_c22_21d2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1810_c22_21d2_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_6702_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_6702_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_6702_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1812_c7_ba7e_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1812_c7_ba7e_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1812_c7_ba7e_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1812_c7_ba7e_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1812_c7_ba7e_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1818_c7_7b6d_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1812_c7_ba7e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c7_ba7e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c7_ba7e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1818_c7_7b6d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c7_ba7e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ba7e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1815_c3_0532 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ba7e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_7b6d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ba7e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_ba7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_ba7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_ba7e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ba7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ba7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_7b6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ba7e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_f99e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_f99e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_f99e_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1818_c7_7b6d_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1818_c7_7b6d_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1818_c7_7b6d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1818_c7_7b6d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1818_c7_7b6d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1818_c7_7b6d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_7b6d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1820_c3_977a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_7b6d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_7b6d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_7b6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_7b6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_7b6d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1796_l1808_l1799_l1783_DUPLICATE_88d1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1818_l1808_l1803_l1799_l1796_l1783_DUPLICATE_a17b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1818_l1812_l1808_l1803_l1799_l1796_DUPLICATE_e414_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1796_l1808_l1799_DUPLICATE_0d32_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1812_l1808_l1803_l1799_l1796_DUPLICATE_802d_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1800_l1804_DUPLICATE_c0ac_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1803_l1818_l1808_l1799_DUPLICATE_d75d_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1a75_uxn_opcodes_h_l1778_l1825_DUPLICATE_9033_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_6702_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1808_c11_ed6d_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_ad06_right := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1805_c30_7bf7_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1820_c3_977a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_7b6d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1820_c3_977a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_f99e_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_7b6d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1799_c11_7ef2_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c6_0a21_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_ba7e_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1797_c3_397d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_fe78_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1797_c3_397d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1815_c3_0532 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ba7e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1815_c3_0532;
     VAR_sp_relative_shift_uxn_opcodes_h_l1805_c30_7bf7_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1788_c3_24b3 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1788_c3_24b3;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1810_c22_21d2_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_ab77_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1793_c3_152a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1793_c3_152a;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1809_c3_3275 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1808_c7_f9b1_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1809_c3_3275;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1805_c30_7bf7_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c6_0a21_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_ad06_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1799_c11_7ef2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_ab77_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1808_c11_ed6d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_6702_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_f99e_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c7_ba7e_iftrue := VAR_previous_ram_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1818_c7_7b6d_iftrue := VAR_previous_ram_read;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1812_c7_ba7e_iftrue := VAR_previous_ram_read;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1818_c7_7b6d_iftrue := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1804_c3_1b47_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1810_c22_21d2_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1796_c7_fe78_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1803_c7_a8e0_iffalse := t16;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1796_c7_fe78_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1799_c7_ac21_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1803_c7_a8e0_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1808_c7_f9b1_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1812_c7_ba7e_iffalse := tmp8_high;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_fe78_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1799_c7_ac21_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1803_c7_a8e0_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1808_c7_f9b1_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1812_c7_ba7e_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1818_c7_7b6d_iffalse := tmp8_low;
     -- BIN_OP_EQ[uxn_opcodes_h_l1799_c11_7ef2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1799_c11_7ef2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1799_c11_7ef2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1799_c11_7ef2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1799_c11_7ef2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1799_c11_7ef2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1799_c11_7ef2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1812_l1808_l1803_l1799_l1796_DUPLICATE_802d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1812_l1808_l1803_l1799_l1796_DUPLICATE_802d_return_output := result.is_stack_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1783_c2_cc54] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1783_c2_cc54_return_output := result.is_stack_index_flipped;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1800_l1804_DUPLICATE_c0ac LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1800_l1804_DUPLICATE_c0ac_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1783_c2_cc54] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1783_c2_cc54_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1803_c11_ab77] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1803_c11_ab77_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_ab77_left;
     BIN_OP_EQ_uxn_opcodes_h_l1803_c11_ab77_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_ab77_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_ab77_return_output := BIN_OP_EQ_uxn_opcodes_h_l1803_c11_ab77_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1818_l1808_l1803_l1799_l1796_l1783_DUPLICATE_a17b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1818_l1808_l1803_l1799_l1796_l1783_DUPLICATE_a17b_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1818_l1812_l1808_l1803_l1799_l1796_DUPLICATE_e414 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1818_l1812_l1808_l1803_l1799_l1796_DUPLICATE_e414_return_output := result.is_opc_done;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1796_l1808_l1799_DUPLICATE_0d32 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1796_l1808_l1799_DUPLICATE_0d32_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1796_l1808_l1799_l1783_DUPLICATE_88d1 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1796_l1808_l1799_l1783_DUPLICATE_88d1_return_output := result.u16_value;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1783_c2_cc54] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1783_c2_cc54_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1783_c6_0a21] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1783_c6_0a21_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c6_0a21_left;
     BIN_OP_EQ_uxn_opcodes_h_l1783_c6_0a21_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c6_0a21_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c6_0a21_return_output := BIN_OP_EQ_uxn_opcodes_h_l1783_c6_0a21_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1810_c22_21d2] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1810_c22_21d2_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1810_c22_21d2_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1810_c22_21d2_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1810_c22_21d2_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1810_c22_21d2_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1810_c22_21d2_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1783_c2_cc54] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1783_c2_cc54_return_output := result.is_vram_write;

     -- sp_relative_shift[uxn_opcodes_h_l1805_c30_7bf7] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1805_c30_7bf7_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1805_c30_7bf7_ins;
     sp_relative_shift_uxn_opcodes_h_l1805_c30_7bf7_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1805_c30_7bf7_x;
     sp_relative_shift_uxn_opcodes_h_l1805_c30_7bf7_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1805_c30_7bf7_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1805_c30_7bf7_return_output := sp_relative_shift_uxn_opcodes_h_l1805_c30_7bf7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1812_c11_6702] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1812_c11_6702_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_6702_left;
     BIN_OP_EQ_uxn_opcodes_h_l1812_c11_6702_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_6702_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_6702_return_output := BIN_OP_EQ_uxn_opcodes_h_l1812_c11_6702_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1808_c11_ed6d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1808_c11_ed6d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1808_c11_ed6d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1808_c11_ed6d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1808_c11_ed6d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1808_c11_ed6d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1808_c11_ed6d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1796_c11_ad06] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1796_c11_ad06_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_ad06_left;
     BIN_OP_EQ_uxn_opcodes_h_l1796_c11_ad06_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_ad06_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_ad06_return_output := BIN_OP_EQ_uxn_opcodes_h_l1796_c11_ad06_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1818_c11_f99e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1818_c11_f99e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_f99e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1818_c11_f99e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_f99e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_f99e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1818_c11_f99e_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1803_l1818_l1808_l1799_DUPLICATE_d75d LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1803_l1818_l1808_l1799_DUPLICATE_d75d_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c2_cc54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c6_0a21_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1783_c2_cc54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c6_0a21_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1783_c2_cc54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c6_0a21_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1783_c2_cc54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c6_0a21_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c2_cc54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c6_0a21_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1783_c2_cc54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c6_0a21_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c2_cc54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c6_0a21_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c2_cc54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c6_0a21_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1783_c2_cc54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c6_0a21_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1783_c2_cc54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c6_0a21_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1783_c2_cc54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c6_0a21_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1783_c2_cc54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c6_0a21_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1783_c2_cc54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c6_0a21_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_fe78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_ad06_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1796_c7_fe78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_ad06_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c7_fe78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_ad06_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_fe78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_ad06_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1796_c7_fe78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_ad06_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_fe78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_ad06_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1796_c7_fe78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_ad06_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1796_c7_fe78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_ad06_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_fe78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_ad06_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1799_c7_ac21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1799_c11_7ef2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1799_c7_ac21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1799_c11_7ef2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1799_c7_ac21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1799_c11_7ef2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1799_c7_ac21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1799_c11_7ef2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1799_c7_ac21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1799_c11_7ef2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1799_c7_ac21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1799_c11_7ef2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1799_c7_ac21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1799_c11_7ef2_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1799_c7_ac21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1799_c11_7ef2_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1799_c7_ac21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1799_c11_7ef2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_a8e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_ab77_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_a8e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_ab77_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_a8e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_ab77_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_a8e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_ab77_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1803_c7_a8e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_ab77_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1803_c7_a8e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_ab77_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1803_c7_a8e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_ab77_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1803_c7_a8e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_ab77_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1803_c7_a8e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_ab77_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1808_c7_f9b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1808_c11_ed6d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1808_c7_f9b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1808_c11_ed6d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1808_c7_f9b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1808_c11_ed6d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1808_c7_f9b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1808_c11_ed6d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1808_c7_f9b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1808_c11_ed6d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1808_c7_f9b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1808_c11_ed6d_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1808_c7_f9b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1808_c11_ed6d_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1808_c7_f9b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1808_c11_ed6d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ba7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_6702_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_ba7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_6702_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ba7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_6702_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c7_ba7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_6702_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1812_c7_ba7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_6702_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1812_c7_ba7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_6702_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_7b6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_f99e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_7b6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_f99e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1818_c7_7b6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_f99e_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1818_c7_7b6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_f99e_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1810_c3_154a := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1810_c22_21d2_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l1804_c3_1b47_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1800_l1804_DUPLICATE_c0ac_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1801_c3_4f58_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1800_l1804_DUPLICATE_c0ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c7_fe78_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1796_l1808_l1799_DUPLICATE_0d32_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1799_c7_ac21_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1796_l1808_l1799_DUPLICATE_0d32_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1808_c7_f9b1_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1796_l1808_l1799_DUPLICATE_0d32_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1796_l1808_l1799_l1783_DUPLICATE_88d1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1796_c7_fe78_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1796_l1808_l1799_l1783_DUPLICATE_88d1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1799_c7_ac21_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1796_l1808_l1799_l1783_DUPLICATE_88d1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1808_c7_f9b1_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1796_l1808_l1799_l1783_DUPLICATE_88d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_fe78_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1818_l1812_l1808_l1803_l1799_l1796_DUPLICATE_e414_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1799_c7_ac21_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1818_l1812_l1808_l1803_l1799_l1796_DUPLICATE_e414_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_a8e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1818_l1812_l1808_l1803_l1799_l1796_DUPLICATE_e414_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1808_c7_f9b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1818_l1812_l1808_l1803_l1799_l1796_DUPLICATE_e414_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ba7e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1818_l1812_l1808_l1803_l1799_l1796_DUPLICATE_e414_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_7b6d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1818_l1812_l1808_l1803_l1799_l1796_DUPLICATE_e414_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1796_c7_fe78_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1812_l1808_l1803_l1799_l1796_DUPLICATE_802d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1799_c7_ac21_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1812_l1808_l1803_l1799_l1796_DUPLICATE_802d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_a8e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1812_l1808_l1803_l1799_l1796_DUPLICATE_802d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1808_c7_f9b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1812_l1808_l1803_l1799_l1796_DUPLICATE_802d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_ba7e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1812_l1808_l1803_l1799_l1796_DUPLICATE_802d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1799_c7_ac21_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1803_l1818_l1808_l1799_DUPLICATE_d75d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_a8e0_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1803_l1818_l1808_l1799_DUPLICATE_d75d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1808_c7_f9b1_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1803_l1818_l1808_l1799_DUPLICATE_d75d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_7b6d_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1803_l1818_l1808_l1799_DUPLICATE_d75d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1818_l1808_l1803_l1799_l1796_l1783_DUPLICATE_a17b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_fe78_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1818_l1808_l1803_l1799_l1796_l1783_DUPLICATE_a17b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1799_c7_ac21_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1818_l1808_l1803_l1799_l1796_l1783_DUPLICATE_a17b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1803_c7_a8e0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1818_l1808_l1803_l1799_l1796_l1783_DUPLICATE_a17b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1808_c7_f9b1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1818_l1808_l1803_l1799_l1796_l1783_DUPLICATE_a17b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1818_c7_7b6d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1818_l1808_l1803_l1799_l1796_l1783_DUPLICATE_a17b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1783_c2_cc54_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1783_c2_cc54_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1783_c2_cc54_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1783_c2_cc54_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_a8e0_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1805_c30_7bf7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1808_c7_f9b1_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1810_c3_154a;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1818_c7_7b6d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_7b6d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_7b6d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_7b6d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_7b6d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_7b6d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_7b6d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_7b6d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_7b6d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1804_c3_1b47] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1804_c3_1b47_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1804_c3_1b47_left;
     BIN_OP_OR_uxn_opcodes_h_l1804_c3_1b47_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1804_c3_1b47_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1804_c3_1b47_return_output := BIN_OP_OR_uxn_opcodes_h_l1804_c3_1b47_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1783_c2_cc54] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1783_c2_cc54_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1783_c2_cc54_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1808_c7_f9b1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1808_c7_f9b1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1808_c7_f9b1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1808_c7_f9b1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1808_c7_f9b1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1808_c7_f9b1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1808_c7_f9b1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1783_c2_cc54] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1783_c2_cc54_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1783_c2_cc54_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1818_c7_7b6d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_7b6d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_7b6d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_7b6d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_7b6d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_7b6d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_7b6d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_7b6d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_7b6d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1818_c7_7b6d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1818_c7_7b6d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1818_c7_7b6d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1818_c7_7b6d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1818_c7_7b6d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1818_c7_7b6d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1818_c7_7b6d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1818_c7_7b6d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1818_c7_7b6d_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1801_c3_4f58] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1801_c3_4f58_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1801_c3_4f58_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1801_c3_4f58_return_output := CONST_SL_8_uxn_opcodes_h_l1801_c3_4f58_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1812_c7_ba7e] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1812_c7_ba7e_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1812_c7_ba7e_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1812_c7_ba7e_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1812_c7_ba7e_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1812_c7_ba7e_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1812_c7_ba7e_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1812_c7_ba7e_return_output := tmp8_high_MUX_uxn_opcodes_h_l1812_c7_ba7e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1812_c7_ba7e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_ba7e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_ba7e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_ba7e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_ba7e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_ba7e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_ba7e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_ba7e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_ba7e_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1818_c7_7b6d] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1818_c7_7b6d_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1818_c7_7b6d_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1818_c7_7b6d_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1818_c7_7b6d_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1818_c7_7b6d_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1818_c7_7b6d_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1818_c7_7b6d_return_output := tmp8_low_MUX_uxn_opcodes_h_l1818_c7_7b6d_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1783_c2_cc54] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1783_c2_cc54_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1783_c2_cc54_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1783_c2_cc54] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1783_c2_cc54_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1783_c2_cc54_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1808_c7_f9b1] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1808_c7_f9b1_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1808_c7_f9b1_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1808_c7_f9b1_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1808_c7_f9b1_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1808_c7_f9b1_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1808_c7_f9b1_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output := result_u16_value_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1803_c7_a8e0_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1804_c3_1b47_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1803_c7_a8e0_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1804_c3_1b47_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1799_c7_ac21_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1801_c3_4f58_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ba7e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_7b6d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1808_c7_f9b1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_ba7e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_a8e0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ba7e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_7b6d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1803_c7_a8e0_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c7_ba7e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1818_c7_7b6d_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1808_c7_f9b1_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1812_c7_ba7e_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1812_c7_ba7e_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1818_c7_7b6d_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1803_c7_a8e0] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1803_c7_a8e0_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1803_c7_a8e0_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1803_c7_a8e0_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1803_c7_a8e0_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1803_c7_a8e0_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1803_c7_a8e0_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output := result_u16_value_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1812_c7_ba7e] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1812_c7_ba7e_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1812_c7_ba7e_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1812_c7_ba7e_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1812_c7_ba7e_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1812_c7_ba7e_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1812_c7_ba7e_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1812_c7_ba7e_return_output := tmp8_low_MUX_uxn_opcodes_h_l1812_c7_ba7e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1803_c7_a8e0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_a8e0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_a8e0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_a8e0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_a8e0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_a8e0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_a8e0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1812_c7_ba7e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1812_c7_ba7e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c7_ba7e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1812_c7_ba7e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c7_ba7e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1812_c7_ba7e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c7_ba7e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c7_ba7e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1812_c7_ba7e_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1808_c7_f9b1] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1808_c7_f9b1_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1808_c7_f9b1_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1808_c7_f9b1_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1808_c7_f9b1_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1808_c7_f9b1_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1808_c7_f9b1_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output := tmp8_high_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output;

     -- t16_MUX[uxn_opcodes_h_l1803_c7_a8e0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1803_c7_a8e0_cond <= VAR_t16_MUX_uxn_opcodes_h_l1803_c7_a8e0_cond;
     t16_MUX_uxn_opcodes_h_l1803_c7_a8e0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1803_c7_a8e0_iftrue;
     t16_MUX_uxn_opcodes_h_l1803_c7_a8e0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1803_c7_a8e0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output := t16_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1812_c7_ba7e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ba7e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ba7e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ba7e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ba7e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ba7e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ba7e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ba7e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ba7e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1812_c7_ba7e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ba7e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ba7e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ba7e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ba7e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ba7e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ba7e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ba7e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ba7e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1808_c7_f9b1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1808_c7_f9b1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1808_c7_f9b1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1808_c7_f9b1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1808_c7_f9b1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1808_c7_f9b1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1808_c7_f9b1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1808_c7_f9b1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ba7e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_a8e0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1799_c7_ac21_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1808_c7_f9b1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ba7e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1799_c7_ac21_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1808_c7_f9b1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c7_ba7e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1799_c7_ac21_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1803_c7_a8e0_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1808_c7_f9b1_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1812_c7_ba7e_return_output;
     -- t16_MUX[uxn_opcodes_h_l1799_c7_ac21] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1799_c7_ac21_cond <= VAR_t16_MUX_uxn_opcodes_h_l1799_c7_ac21_cond;
     t16_MUX_uxn_opcodes_h_l1799_c7_ac21_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1799_c7_ac21_iftrue;
     t16_MUX_uxn_opcodes_h_l1799_c7_ac21_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1799_c7_ac21_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output := t16_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1803_c7_a8e0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_a8e0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_a8e0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_a8e0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_a8e0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_a8e0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_a8e0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1799_c7_ac21] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1799_c7_ac21_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1799_c7_ac21_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1799_c7_ac21_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1799_c7_ac21_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1799_c7_ac21_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1799_c7_ac21_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1799_c7_ac21] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1799_c7_ac21_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1799_c7_ac21_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1799_c7_ac21_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1799_c7_ac21_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1799_c7_ac21_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1799_c7_ac21_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output := result_u16_value_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1808_c7_f9b1] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1808_c7_f9b1_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1808_c7_f9b1_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1808_c7_f9b1_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1808_c7_f9b1_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1808_c7_f9b1_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1808_c7_f9b1_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output := tmp8_low_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1808_c7_f9b1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1808_c7_f9b1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1808_c7_f9b1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1808_c7_f9b1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1808_c7_f9b1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1808_c7_f9b1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1808_c7_f9b1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output := result_u8_value_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1808_c7_f9b1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1808_c7_f9b1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1808_c7_f9b1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1808_c7_f9b1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1808_c7_f9b1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1808_c7_f9b1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1808_c7_f9b1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1803_c7_a8e0] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1803_c7_a8e0_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1803_c7_a8e0_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1803_c7_a8e0_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1803_c7_a8e0_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1803_c7_a8e0_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1803_c7_a8e0_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output := tmp8_high_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1808_c7_f9b1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1808_c7_f9b1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1808_c7_f9b1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1808_c7_f9b1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1808_c7_f9b1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1808_c7_f9b1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1808_c7_f9b1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_a8e0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1799_c7_ac21_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c7_fe78_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_a8e0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1796_c7_fe78_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1803_c7_a8e0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1796_c7_fe78_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1799_c7_ac21_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1803_c7_a8e0_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1808_c7_f9b1_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1803_c7_a8e0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_a8e0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_a8e0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_a8e0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_a8e0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_a8e0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_a8e0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1803_c7_a8e0] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1803_c7_a8e0_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1803_c7_a8e0_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1803_c7_a8e0_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1803_c7_a8e0_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1803_c7_a8e0_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1803_c7_a8e0_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output := tmp8_low_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1803_c7_a8e0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1803_c7_a8e0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1803_c7_a8e0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1803_c7_a8e0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1803_c7_a8e0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1803_c7_a8e0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1803_c7_a8e0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output := result_u8_value_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1796_c7_fe78] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1796_c7_fe78_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1796_c7_fe78_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1796_c7_fe78_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1796_c7_fe78_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1796_c7_fe78_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1796_c7_fe78_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output := result_u16_value_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1799_c7_ac21] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1799_c7_ac21_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1799_c7_ac21_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1799_c7_ac21_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1799_c7_ac21_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1799_c7_ac21_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1799_c7_ac21_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1796_c7_fe78] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c7_fe78_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c7_fe78_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c7_fe78_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c7_fe78_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c7_fe78_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c7_fe78_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1803_c7_a8e0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_a8e0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_a8e0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_a8e0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_a8e0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_a8e0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_a8e0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1799_c7_ac21] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1799_c7_ac21_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1799_c7_ac21_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1799_c7_ac21_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1799_c7_ac21_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1799_c7_ac21_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1799_c7_ac21_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output := tmp8_high_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output;

     -- t16_MUX[uxn_opcodes_h_l1796_c7_fe78] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1796_c7_fe78_cond <= VAR_t16_MUX_uxn_opcodes_h_l1796_c7_fe78_cond;
     t16_MUX_uxn_opcodes_h_l1796_c7_fe78_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1796_c7_fe78_iftrue;
     t16_MUX_uxn_opcodes_h_l1796_c7_fe78_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1796_c7_fe78_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output := t16_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1799_c7_ac21_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1796_c7_fe78_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1799_c7_ac21_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1799_c7_ac21_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1796_c7_fe78_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1799_c7_ac21_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1803_c7_a8e0_return_output;
     -- tmp8_low_MUX[uxn_opcodes_h_l1799_c7_ac21] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1799_c7_ac21_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1799_c7_ac21_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1799_c7_ac21_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1799_c7_ac21_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1799_c7_ac21_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1799_c7_ac21_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output := tmp8_low_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1796_c7_fe78] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1796_c7_fe78_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1796_c7_fe78_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1796_c7_fe78_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1796_c7_fe78_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1796_c7_fe78_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1796_c7_fe78_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1799_c7_ac21] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1799_c7_ac21_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1799_c7_ac21_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1799_c7_ac21_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1799_c7_ac21_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1799_c7_ac21_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1799_c7_ac21_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output := result_u8_value_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1783_c2_cc54] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1783_c2_cc54_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1783_c2_cc54_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output := result_u16_value_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output;

     -- t16_MUX[uxn_opcodes_h_l1783_c2_cc54] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1783_c2_cc54_cond <= VAR_t16_MUX_uxn_opcodes_h_l1783_c2_cc54_cond;
     t16_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue;
     t16_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output := t16_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1799_c7_ac21] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1799_c7_ac21_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1799_c7_ac21_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1799_c7_ac21_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1799_c7_ac21_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1799_c7_ac21_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1799_c7_ac21_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1799_c7_ac21] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1799_c7_ac21_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1799_c7_ac21_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1799_c7_ac21_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1799_c7_ac21_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1799_c7_ac21_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1799_c7_ac21_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1796_c7_fe78] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1796_c7_fe78_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1796_c7_fe78_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1796_c7_fe78_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1796_c7_fe78_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1796_c7_fe78_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1796_c7_fe78_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output := tmp8_high_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1783_c2_cc54] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c2_cc54_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c2_cc54_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_fe78_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_fe78_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_fe78_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_fe78_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1799_c7_ac21_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1783_c2_cc54] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1783_c2_cc54_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c2_cc54_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1796_c7_fe78] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1796_c7_fe78_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_fe78_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1796_c7_fe78_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_fe78_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1796_c7_fe78_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_fe78_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output := result_u8_value_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1796_c7_fe78] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_fe78_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_fe78_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_fe78_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_fe78_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_fe78_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_fe78_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1783_c2_cc54] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1783_c2_cc54_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1783_c2_cc54_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output := tmp8_high_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1796_c7_fe78] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1796_c7_fe78_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_fe78_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1796_c7_fe78_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_fe78_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1796_c7_fe78_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_fe78_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output := tmp8_low_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1796_c7_fe78] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_fe78_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_fe78_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_fe78_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_fe78_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_fe78_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_fe78_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output;
     REG_VAR_tmp8_high := VAR_tmp8_high_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_fe78_return_output;
     -- tmp8_low_MUX[uxn_opcodes_h_l1783_c2_cc54] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1783_c2_cc54_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1783_c2_cc54_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output := tmp8_low_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1783_c2_cc54] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1783_c2_cc54_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c2_cc54_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1783_c2_cc54] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c2_cc54_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c2_cc54_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1783_c2_cc54] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1783_c2_cc54_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1783_c2_cc54_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1783_c2_cc54_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1783_c2_cc54_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output := result_u8_value_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output;

     -- Submodule level 8
     REG_VAR_tmp8_low := VAR_tmp8_low_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1a75_uxn_opcodes_h_l1778_l1825_DUPLICATE_9033 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1a75_uxn_opcodes_h_l1778_l1825_DUPLICATE_9033_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1a75(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1783_c2_cc54_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1a75_uxn_opcodes_h_l1778_l1825_DUPLICATE_9033_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1a75_uxn_opcodes_h_l1778_l1825_DUPLICATE_9033_return_output;
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
