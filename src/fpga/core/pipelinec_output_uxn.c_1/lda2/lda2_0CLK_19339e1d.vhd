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
-- BIN_OP_EQ[uxn_opcodes_h_l1777_c6_02ef]
signal BIN_OP_EQ_uxn_opcodes_h_l1777_c6_02ef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1777_c6_02ef_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1777_c6_02ef_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1777_c2_9135]
signal tmp8_low_MUX_uxn_opcodes_h_l1777_c2_9135_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1777_c2_9135_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1777_c2_9135]
signal tmp8_high_MUX_uxn_opcodes_h_l1777_c2_9135_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1777_c2_9135_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1777_c2_9135]
signal t16_MUX_uxn_opcodes_h_l1777_c2_9135_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1777_c2_9135_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1777_c2_9135]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9135_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9135_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1777_c2_9135]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9135_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9135_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1777_c2_9135]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9135_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9135_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1777_c2_9135]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1777_c2_9135_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1777_c2_9135_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1777_c2_9135]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9135_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9135_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1777_c2_9135]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1777_c2_9135_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1777_c2_9135_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1777_c2_9135]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1777_c2_9135_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1777_c2_9135_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1777_c2_9135]
signal result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9135_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9135_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1777_c2_9135]
signal result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9135_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9135_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1777_c2_9135]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1777_c2_9135_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1777_c2_9135_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1790_c11_83d9]
signal BIN_OP_EQ_uxn_opcodes_h_l1790_c11_83d9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1790_c11_83d9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1790_c11_83d9_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1790_c7_296f]
signal tmp8_low_MUX_uxn_opcodes_h_l1790_c7_296f_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1790_c7_296f_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1790_c7_296f_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1790_c7_296f_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1790_c7_296f]
signal tmp8_high_MUX_uxn_opcodes_h_l1790_c7_296f_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1790_c7_296f_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1790_c7_296f_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1790_c7_296f_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1790_c7_296f]
signal t16_MUX_uxn_opcodes_h_l1790_c7_296f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1790_c7_296f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1790_c7_296f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1790_c7_296f_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1790_c7_296f]
signal result_u16_value_MUX_uxn_opcodes_h_l1790_c7_296f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1790_c7_296f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1790_c7_296f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1790_c7_296f_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1790_c7_296f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_296f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_296f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_296f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_296f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1790_c7_296f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1790_c7_296f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1790_c7_296f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1790_c7_296f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1790_c7_296f_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1790_c7_296f]
signal result_u8_value_MUX_uxn_opcodes_h_l1790_c7_296f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1790_c7_296f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1790_c7_296f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1790_c7_296f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1790_c7_296f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_296f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_296f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_296f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_296f_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1790_c7_296f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_296f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_296f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_296f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_296f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1793_c11_cef6]
signal BIN_OP_EQ_uxn_opcodes_h_l1793_c11_cef6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1793_c11_cef6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1793_c11_cef6_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1793_c7_3d54]
signal tmp8_low_MUX_uxn_opcodes_h_l1793_c7_3d54_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1793_c7_3d54_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1793_c7_3d54_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1793_c7_3d54]
signal tmp8_high_MUX_uxn_opcodes_h_l1793_c7_3d54_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1793_c7_3d54_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1793_c7_3d54_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1793_c7_3d54]
signal t16_MUX_uxn_opcodes_h_l1793_c7_3d54_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1793_c7_3d54_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1793_c7_3d54_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1793_c7_3d54]
signal result_u16_value_MUX_uxn_opcodes_h_l1793_c7_3d54_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1793_c7_3d54_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1793_c7_3d54_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1793_c7_3d54]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_3d54_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_3d54_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_3d54_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1793_c7_3d54]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c7_3d54_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c7_3d54_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c7_3d54_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1793_c7_3d54]
signal result_u8_value_MUX_uxn_opcodes_h_l1793_c7_3d54_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1793_c7_3d54_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1793_c7_3d54_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1793_c7_3d54]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_3d54_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_3d54_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_3d54_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1793_c7_3d54]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_3d54_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_3d54_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_3d54_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1795_c3_8844]
signal CONST_SL_8_uxn_opcodes_h_l1795_c3_8844_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1795_c3_8844_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1797_c11_8609]
signal BIN_OP_EQ_uxn_opcodes_h_l1797_c11_8609_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1797_c11_8609_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1797_c11_8609_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1797_c7_80a4]
signal tmp8_low_MUX_uxn_opcodes_h_l1797_c7_80a4_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1797_c7_80a4_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1797_c7_80a4_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1797_c7_80a4]
signal tmp8_high_MUX_uxn_opcodes_h_l1797_c7_80a4_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1797_c7_80a4_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1797_c7_80a4_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1797_c7_80a4]
signal t16_MUX_uxn_opcodes_h_l1797_c7_80a4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1797_c7_80a4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1797_c7_80a4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1797_c7_80a4]
signal result_u16_value_MUX_uxn_opcodes_h_l1797_c7_80a4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1797_c7_80a4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1797_c7_80a4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1797_c7_80a4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_80a4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_80a4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_80a4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1797_c7_80a4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1797_c7_80a4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1797_c7_80a4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1797_c7_80a4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1797_c7_80a4]
signal result_u8_value_MUX_uxn_opcodes_h_l1797_c7_80a4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1797_c7_80a4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1797_c7_80a4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1797_c7_80a4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_80a4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_80a4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_80a4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1797_c7_80a4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_80a4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_80a4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_80a4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1798_c3_7164]
signal BIN_OP_OR_uxn_opcodes_h_l1798_c3_7164_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1798_c3_7164_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1798_c3_7164_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1799_c30_d936]
signal sp_relative_shift_uxn_opcodes_h_l1799_c30_d936_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1799_c30_d936_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1799_c30_d936_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1799_c30_d936_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1802_c11_3f08]
signal BIN_OP_EQ_uxn_opcodes_h_l1802_c11_3f08_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1802_c11_3f08_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1802_c11_3f08_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1802_c7_9583]
signal tmp8_low_MUX_uxn_opcodes_h_l1802_c7_9583_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1802_c7_9583_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1802_c7_9583_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1802_c7_9583_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1802_c7_9583]
signal tmp8_high_MUX_uxn_opcodes_h_l1802_c7_9583_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1802_c7_9583_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1802_c7_9583_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1802_c7_9583_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1802_c7_9583]
signal result_u16_value_MUX_uxn_opcodes_h_l1802_c7_9583_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1802_c7_9583_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1802_c7_9583_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1802_c7_9583_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1802_c7_9583]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_9583_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_9583_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_9583_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_9583_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1802_c7_9583]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_9583_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_9583_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_9583_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_9583_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1802_c7_9583]
signal result_u8_value_MUX_uxn_opcodes_h_l1802_c7_9583_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1802_c7_9583_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1802_c7_9583_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1802_c7_9583_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1802_c7_9583]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_9583_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_9583_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_9583_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_9583_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1802_c7_9583]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1802_c7_9583_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1802_c7_9583_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1802_c7_9583_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1802_c7_9583_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1804_c22_a786]
signal BIN_OP_PLUS_uxn_opcodes_h_l1804_c22_a786_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1804_c22_a786_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1804_c22_a786_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1806_c11_7438]
signal BIN_OP_EQ_uxn_opcodes_h_l1806_c11_7438_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1806_c11_7438_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1806_c11_7438_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1806_c7_fe61]
signal tmp8_low_MUX_uxn_opcodes_h_l1806_c7_fe61_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1806_c7_fe61_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1806_c7_fe61_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1806_c7_fe61_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1806_c7_fe61]
signal tmp8_high_MUX_uxn_opcodes_h_l1806_c7_fe61_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1806_c7_fe61_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1806_c7_fe61_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1806_c7_fe61_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1806_c7_fe61]
signal result_u8_value_MUX_uxn_opcodes_h_l1806_c7_fe61_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1806_c7_fe61_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1806_c7_fe61_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1806_c7_fe61_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1806_c7_fe61]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_fe61_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_fe61_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_fe61_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_fe61_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1806_c7_fe61]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_fe61_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_fe61_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_fe61_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_fe61_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1806_c7_fe61]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_fe61_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_fe61_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_fe61_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_fe61_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1812_c11_ad84]
signal BIN_OP_EQ_uxn_opcodes_h_l1812_c11_ad84_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1812_c11_ad84_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1812_c11_ad84_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1812_c7_ea7f]
signal tmp8_low_MUX_uxn_opcodes_h_l1812_c7_ea7f_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1812_c7_ea7f_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1812_c7_ea7f_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1812_c7_ea7f_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1812_c7_ea7f]
signal result_u8_value_MUX_uxn_opcodes_h_l1812_c7_ea7f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1812_c7_ea7f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1812_c7_ea7f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1812_c7_ea7f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1812_c7_ea7f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ea7f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ea7f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ea7f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ea7f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1812_c7_ea7f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ea7f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ea7f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ea7f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ea7f_return_output : unsigned(3 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_42c1( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
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
      base.is_ram_write := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.u16_value := ref_toks_8;
      base.u8_value := ref_toks_9;
      base.is_vram_write := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1777_c6_02ef
BIN_OP_EQ_uxn_opcodes_h_l1777_c6_02ef : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1777_c6_02ef_left,
BIN_OP_EQ_uxn_opcodes_h_l1777_c6_02ef_right,
BIN_OP_EQ_uxn_opcodes_h_l1777_c6_02ef_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1777_c2_9135
tmp8_low_MUX_uxn_opcodes_h_l1777_c2_9135 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1777_c2_9135_cond,
tmp8_low_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1777_c2_9135_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1777_c2_9135
tmp8_high_MUX_uxn_opcodes_h_l1777_c2_9135 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1777_c2_9135_cond,
tmp8_high_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1777_c2_9135_return_output);

-- t16_MUX_uxn_opcodes_h_l1777_c2_9135
t16_MUX_uxn_opcodes_h_l1777_c2_9135 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1777_c2_9135_cond,
t16_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue,
t16_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse,
t16_MUX_uxn_opcodes_h_l1777_c2_9135_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9135
result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9135 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9135_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9135_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9135
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9135 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9135_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9135_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9135
result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9135 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9135_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9135_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1777_c2_9135
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1777_c2_9135 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1777_c2_9135_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1777_c2_9135_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9135
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9135 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9135_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9135_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1777_c2_9135
result_is_stack_write_MUX_uxn_opcodes_h_l1777_c2_9135 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1777_c2_9135_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1777_c2_9135_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1777_c2_9135
result_is_pc_updated_MUX_uxn_opcodes_h_l1777_c2_9135 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1777_c2_9135_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1777_c2_9135_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9135
result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9135 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9135_cond,
result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9135_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9135
result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9135 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9135_cond,
result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9135_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1777_c2_9135
result_is_vram_write_MUX_uxn_opcodes_h_l1777_c2_9135 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1777_c2_9135_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1777_c2_9135_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1790_c11_83d9
BIN_OP_EQ_uxn_opcodes_h_l1790_c11_83d9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1790_c11_83d9_left,
BIN_OP_EQ_uxn_opcodes_h_l1790_c11_83d9_right,
BIN_OP_EQ_uxn_opcodes_h_l1790_c11_83d9_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1790_c7_296f
tmp8_low_MUX_uxn_opcodes_h_l1790_c7_296f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1790_c7_296f_cond,
tmp8_low_MUX_uxn_opcodes_h_l1790_c7_296f_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1790_c7_296f_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1790_c7_296f_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1790_c7_296f
tmp8_high_MUX_uxn_opcodes_h_l1790_c7_296f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1790_c7_296f_cond,
tmp8_high_MUX_uxn_opcodes_h_l1790_c7_296f_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1790_c7_296f_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1790_c7_296f_return_output);

-- t16_MUX_uxn_opcodes_h_l1790_c7_296f
t16_MUX_uxn_opcodes_h_l1790_c7_296f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1790_c7_296f_cond,
t16_MUX_uxn_opcodes_h_l1790_c7_296f_iftrue,
t16_MUX_uxn_opcodes_h_l1790_c7_296f_iffalse,
t16_MUX_uxn_opcodes_h_l1790_c7_296f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1790_c7_296f
result_u16_value_MUX_uxn_opcodes_h_l1790_c7_296f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1790_c7_296f_cond,
result_u16_value_MUX_uxn_opcodes_h_l1790_c7_296f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1790_c7_296f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1790_c7_296f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_296f
result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_296f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_296f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_296f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_296f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_296f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1790_c7_296f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1790_c7_296f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1790_c7_296f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1790_c7_296f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1790_c7_296f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1790_c7_296f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1790_c7_296f
result_u8_value_MUX_uxn_opcodes_h_l1790_c7_296f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1790_c7_296f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1790_c7_296f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1790_c7_296f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1790_c7_296f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_296f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_296f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_296f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_296f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_296f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_296f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_296f
result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_296f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_296f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_296f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_296f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_296f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1793_c11_cef6
BIN_OP_EQ_uxn_opcodes_h_l1793_c11_cef6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1793_c11_cef6_left,
BIN_OP_EQ_uxn_opcodes_h_l1793_c11_cef6_right,
BIN_OP_EQ_uxn_opcodes_h_l1793_c11_cef6_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1793_c7_3d54
tmp8_low_MUX_uxn_opcodes_h_l1793_c7_3d54 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1793_c7_3d54_cond,
tmp8_low_MUX_uxn_opcodes_h_l1793_c7_3d54_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1793_c7_3d54_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1793_c7_3d54
tmp8_high_MUX_uxn_opcodes_h_l1793_c7_3d54 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1793_c7_3d54_cond,
tmp8_high_MUX_uxn_opcodes_h_l1793_c7_3d54_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1793_c7_3d54_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output);

-- t16_MUX_uxn_opcodes_h_l1793_c7_3d54
t16_MUX_uxn_opcodes_h_l1793_c7_3d54 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1793_c7_3d54_cond,
t16_MUX_uxn_opcodes_h_l1793_c7_3d54_iftrue,
t16_MUX_uxn_opcodes_h_l1793_c7_3d54_iffalse,
t16_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1793_c7_3d54
result_u16_value_MUX_uxn_opcodes_h_l1793_c7_3d54 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1793_c7_3d54_cond,
result_u16_value_MUX_uxn_opcodes_h_l1793_c7_3d54_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1793_c7_3d54_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_3d54
result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_3d54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_3d54_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_3d54_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_3d54_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c7_3d54
result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c7_3d54 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c7_3d54_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c7_3d54_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c7_3d54_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1793_c7_3d54
result_u8_value_MUX_uxn_opcodes_h_l1793_c7_3d54 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1793_c7_3d54_cond,
result_u8_value_MUX_uxn_opcodes_h_l1793_c7_3d54_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1793_c7_3d54_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_3d54
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_3d54 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_3d54_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_3d54_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_3d54_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_3d54
result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_3d54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_3d54_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_3d54_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_3d54_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1795_c3_8844
CONST_SL_8_uxn_opcodes_h_l1795_c3_8844 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1795_c3_8844_x,
CONST_SL_8_uxn_opcodes_h_l1795_c3_8844_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1797_c11_8609
BIN_OP_EQ_uxn_opcodes_h_l1797_c11_8609 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1797_c11_8609_left,
BIN_OP_EQ_uxn_opcodes_h_l1797_c11_8609_right,
BIN_OP_EQ_uxn_opcodes_h_l1797_c11_8609_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1797_c7_80a4
tmp8_low_MUX_uxn_opcodes_h_l1797_c7_80a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1797_c7_80a4_cond,
tmp8_low_MUX_uxn_opcodes_h_l1797_c7_80a4_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1797_c7_80a4_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1797_c7_80a4
tmp8_high_MUX_uxn_opcodes_h_l1797_c7_80a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1797_c7_80a4_cond,
tmp8_high_MUX_uxn_opcodes_h_l1797_c7_80a4_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1797_c7_80a4_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output);

-- t16_MUX_uxn_opcodes_h_l1797_c7_80a4
t16_MUX_uxn_opcodes_h_l1797_c7_80a4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1797_c7_80a4_cond,
t16_MUX_uxn_opcodes_h_l1797_c7_80a4_iftrue,
t16_MUX_uxn_opcodes_h_l1797_c7_80a4_iffalse,
t16_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1797_c7_80a4
result_u16_value_MUX_uxn_opcodes_h_l1797_c7_80a4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1797_c7_80a4_cond,
result_u16_value_MUX_uxn_opcodes_h_l1797_c7_80a4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1797_c7_80a4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_80a4
result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_80a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_80a4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_80a4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_80a4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1797_c7_80a4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1797_c7_80a4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1797_c7_80a4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1797_c7_80a4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1797_c7_80a4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1797_c7_80a4
result_u8_value_MUX_uxn_opcodes_h_l1797_c7_80a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1797_c7_80a4_cond,
result_u8_value_MUX_uxn_opcodes_h_l1797_c7_80a4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1797_c7_80a4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_80a4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_80a4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_80a4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_80a4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_80a4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_80a4
result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_80a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_80a4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_80a4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_80a4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1798_c3_7164
BIN_OP_OR_uxn_opcodes_h_l1798_c3_7164 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1798_c3_7164_left,
BIN_OP_OR_uxn_opcodes_h_l1798_c3_7164_right,
BIN_OP_OR_uxn_opcodes_h_l1798_c3_7164_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1799_c30_d936
sp_relative_shift_uxn_opcodes_h_l1799_c30_d936 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1799_c30_d936_ins,
sp_relative_shift_uxn_opcodes_h_l1799_c30_d936_x,
sp_relative_shift_uxn_opcodes_h_l1799_c30_d936_y,
sp_relative_shift_uxn_opcodes_h_l1799_c30_d936_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1802_c11_3f08
BIN_OP_EQ_uxn_opcodes_h_l1802_c11_3f08 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1802_c11_3f08_left,
BIN_OP_EQ_uxn_opcodes_h_l1802_c11_3f08_right,
BIN_OP_EQ_uxn_opcodes_h_l1802_c11_3f08_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1802_c7_9583
tmp8_low_MUX_uxn_opcodes_h_l1802_c7_9583 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1802_c7_9583_cond,
tmp8_low_MUX_uxn_opcodes_h_l1802_c7_9583_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1802_c7_9583_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1802_c7_9583_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1802_c7_9583
tmp8_high_MUX_uxn_opcodes_h_l1802_c7_9583 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1802_c7_9583_cond,
tmp8_high_MUX_uxn_opcodes_h_l1802_c7_9583_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1802_c7_9583_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1802_c7_9583_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1802_c7_9583
result_u16_value_MUX_uxn_opcodes_h_l1802_c7_9583 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1802_c7_9583_cond,
result_u16_value_MUX_uxn_opcodes_h_l1802_c7_9583_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1802_c7_9583_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1802_c7_9583_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_9583
result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_9583 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_9583_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_9583_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_9583_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_9583_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_9583
result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_9583 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_9583_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_9583_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_9583_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_9583_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1802_c7_9583
result_u8_value_MUX_uxn_opcodes_h_l1802_c7_9583 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1802_c7_9583_cond,
result_u8_value_MUX_uxn_opcodes_h_l1802_c7_9583_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1802_c7_9583_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1802_c7_9583_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_9583
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_9583 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_9583_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_9583_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_9583_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_9583_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1802_c7_9583
result_is_stack_write_MUX_uxn_opcodes_h_l1802_c7_9583 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1802_c7_9583_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1802_c7_9583_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1802_c7_9583_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1802_c7_9583_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1804_c22_a786
BIN_OP_PLUS_uxn_opcodes_h_l1804_c22_a786 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1804_c22_a786_left,
BIN_OP_PLUS_uxn_opcodes_h_l1804_c22_a786_right,
BIN_OP_PLUS_uxn_opcodes_h_l1804_c22_a786_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1806_c11_7438
BIN_OP_EQ_uxn_opcodes_h_l1806_c11_7438 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1806_c11_7438_left,
BIN_OP_EQ_uxn_opcodes_h_l1806_c11_7438_right,
BIN_OP_EQ_uxn_opcodes_h_l1806_c11_7438_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1806_c7_fe61
tmp8_low_MUX_uxn_opcodes_h_l1806_c7_fe61 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1806_c7_fe61_cond,
tmp8_low_MUX_uxn_opcodes_h_l1806_c7_fe61_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1806_c7_fe61_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1806_c7_fe61_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1806_c7_fe61
tmp8_high_MUX_uxn_opcodes_h_l1806_c7_fe61 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1806_c7_fe61_cond,
tmp8_high_MUX_uxn_opcodes_h_l1806_c7_fe61_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1806_c7_fe61_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1806_c7_fe61_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1806_c7_fe61
result_u8_value_MUX_uxn_opcodes_h_l1806_c7_fe61 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1806_c7_fe61_cond,
result_u8_value_MUX_uxn_opcodes_h_l1806_c7_fe61_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1806_c7_fe61_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1806_c7_fe61_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_fe61
result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_fe61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_fe61_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_fe61_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_fe61_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_fe61_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_fe61
result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_fe61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_fe61_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_fe61_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_fe61_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_fe61_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_fe61
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_fe61 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_fe61_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_fe61_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_fe61_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_fe61_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1812_c11_ad84
BIN_OP_EQ_uxn_opcodes_h_l1812_c11_ad84 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1812_c11_ad84_left,
BIN_OP_EQ_uxn_opcodes_h_l1812_c11_ad84_right,
BIN_OP_EQ_uxn_opcodes_h_l1812_c11_ad84_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1812_c7_ea7f
tmp8_low_MUX_uxn_opcodes_h_l1812_c7_ea7f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1812_c7_ea7f_cond,
tmp8_low_MUX_uxn_opcodes_h_l1812_c7_ea7f_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1812_c7_ea7f_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1812_c7_ea7f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1812_c7_ea7f
result_u8_value_MUX_uxn_opcodes_h_l1812_c7_ea7f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1812_c7_ea7f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1812_c7_ea7f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1812_c7_ea7f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1812_c7_ea7f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ea7f
result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ea7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ea7f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ea7f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ea7f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ea7f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ea7f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ea7f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ea7f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ea7f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ea7f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ea7f_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1777_c6_02ef_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1777_c2_9135_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1777_c2_9135_return_output,
 t16_MUX_uxn_opcodes_h_l1777_c2_9135_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9135_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9135_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9135_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1777_c2_9135_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9135_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1777_c2_9135_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1777_c2_9135_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9135_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9135_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1777_c2_9135_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1790_c11_83d9_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1790_c7_296f_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1790_c7_296f_return_output,
 t16_MUX_uxn_opcodes_h_l1790_c7_296f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1790_c7_296f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_296f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1790_c7_296f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1790_c7_296f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_296f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_296f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1793_c11_cef6_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output,
 t16_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output,
 CONST_SL_8_uxn_opcodes_h_l1795_c3_8844_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1797_c11_8609_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output,
 t16_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1798_c3_7164_return_output,
 sp_relative_shift_uxn_opcodes_h_l1799_c30_d936_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1802_c11_3f08_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1802_c7_9583_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1802_c7_9583_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1802_c7_9583_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_9583_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_9583_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1802_c7_9583_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_9583_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1802_c7_9583_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1804_c22_a786_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1806_c11_7438_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1806_c7_fe61_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1806_c7_fe61_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1806_c7_fe61_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_fe61_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_fe61_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_fe61_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1812_c11_ad84_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1812_c7_ea7f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1812_c7_ea7f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ea7f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ea7f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_02ef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_02ef_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_02ef_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_296f_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c2_9135_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c2_9135_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_296f_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c2_9135_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c2_9135_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1790_c7_296f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1777_c2_9135_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1777_c2_9135_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1777_c2_9135_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9135_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9135_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_296f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9135_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9135_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1782_c3_19b4 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1790_c7_296f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9135_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9135_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1777_c2_9135_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1777_c2_9135_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1777_c2_9135_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1787_c3_e979 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_296f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9135_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9135_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_296f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c2_9135_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c2_9135_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1777_c2_9135_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1777_c2_9135_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1777_c2_9135_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1790_c7_296f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9135_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9135_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_296f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9135_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9135_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1777_c2_9135_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1777_c2_9135_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1777_c2_9135_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_83d9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_83d9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_83d9_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_296f_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_296f_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_296f_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_296f_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_296f_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_296f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1790_c7_296f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1790_c7_296f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1790_c7_296f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1790_c7_296f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1790_c7_296f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1790_c7_296f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_296f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_296f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_296f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1790_c7_296f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1790_c7_296f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1790_c7_296f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_296f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_296f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_296f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_296f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1791_c3_a59b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_296f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_296f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_296f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_296f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_296f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c11_cef6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c11_cef6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c11_cef6_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1793_c7_3d54_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1793_c7_3d54_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1793_c7_3d54_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1793_c7_3d54_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1793_c7_3d54_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1793_c7_3d54_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1793_c7_3d54_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1793_c7_3d54_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1793_c7_3d54_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1793_c7_3d54_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1793_c7_3d54_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1793_c7_3d54_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_3d54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_3d54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_3d54_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c7_3d54_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c7_3d54_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c7_3d54_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1793_c7_3d54_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1793_c7_3d54_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1793_c7_3d54_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_3d54_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_3d54_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_3d54_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_3d54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_3d54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_3d54_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1795_c3_8844_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1795_c3_8844_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_8609_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_8609_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_8609_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1797_c7_80a4_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1797_c7_80a4_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1802_c7_9583_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1797_c7_80a4_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1797_c7_80a4_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1797_c7_80a4_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1802_c7_9583_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1797_c7_80a4_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1797_c7_80a4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1797_c7_80a4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1797_c7_80a4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1797_c7_80a4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1797_c7_80a4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1802_c7_9583_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1797_c7_80a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_80a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_80a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_9583_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_80a4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1797_c7_80a4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1797_c7_80a4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_9583_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1797_c7_80a4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1797_c7_80a4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1797_c7_80a4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1802_c7_9583_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1797_c7_80a4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_80a4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_80a4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_9583_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_80a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_80a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_80a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1802_c7_9583_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_80a4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1798_c3_7164_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1798_c3_7164_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1798_c3_7164_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1799_c30_d936_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1799_c30_d936_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1799_c30_d936_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1799_c30_d936_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_3f08_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_3f08_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_3f08_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1802_c7_9583_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1802_c7_9583_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1806_c7_fe61_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1802_c7_9583_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1802_c7_9583_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1802_c7_9583_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1806_c7_fe61_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1802_c7_9583_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1802_c7_9583_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1804_c3_dd11 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1802_c7_9583_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1802_c7_9583_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_9583_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_9583_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_fe61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_9583_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_9583_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1803_c3_e16c : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_9583_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_9583_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1802_c7_9583_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1802_c7_9583_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1806_c7_fe61_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1802_c7_9583_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_9583_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_9583_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_fe61_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_9583_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1802_c7_9583_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1802_c7_9583_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_fe61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1802_c7_9583_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1804_c22_a786_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1804_c22_a786_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1804_c22_a786_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1806_c11_7438_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1806_c11_7438_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1806_c11_7438_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1806_c7_fe61_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1806_c7_fe61_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1812_c7_ea7f_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1806_c7_fe61_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1806_c7_fe61_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1806_c7_fe61_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1806_c7_fe61_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1806_c7_fe61_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1806_c7_fe61_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c7_ea7f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1806_c7_fe61_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_fe61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_fe61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ea7f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_fe61_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_fe61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_fe61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_fe61_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_fe61_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1809_c3_52e1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_fe61_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ea7f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_fe61_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_ad84_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_ad84_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_ad84_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1812_c7_ea7f_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1812_c7_ea7f_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1812_c7_ea7f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c7_ea7f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c7_ea7f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c7_ea7f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ea7f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ea7f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ea7f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ea7f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1814_c3_96b6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ea7f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ea7f_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1790_l1802_l1793_l1777_DUPLICATE_1502_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1790_l1777_l1812_l1802_l1797_l1793_DUPLICATE_9a5a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1790_l1812_l1806_l1802_l1797_l1793_DUPLICATE_8ca1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1790_l1802_l1793_DUPLICATE_3f60_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1790_l1806_l1802_l1797_l1793_DUPLICATE_c579_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1798_l1794_DUPLICATE_9ce6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1802_l1793_l1797_l1812_DUPLICATE_7ebe_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_42c1_uxn_opcodes_h_l1772_l1819_DUPLICATE_d119_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_02ef_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_fe61_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1799_c30_d936_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1782_c3_19b4 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1782_c3_19b4;
     VAR_sp_relative_shift_uxn_opcodes_h_l1799_c30_d936_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1803_c3_e16c := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_9583_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1803_c3_e16c;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_83d9_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1787_c3_e979 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1787_c3_e979;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1806_c11_7438_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_ad84_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_8609_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1814_c3_96b6 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ea7f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1814_c3_96b6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c11_cef6_right := to_unsigned(2, 2);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ea7f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_3f08_right := to_unsigned(4, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1809_c3_52e1 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_fe61_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1809_c3_52e1;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1791_c3_a59b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_296f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1791_c3_a59b;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1804_c22_a786_right := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1799_c30_d936_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_02ef_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_83d9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c11_cef6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_8609_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_3f08_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1806_c11_7438_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_ad84_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1806_c7_fe61_iftrue := VAR_previous_ram_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c7_ea7f_iftrue := VAR_previous_ram_read;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1806_c7_fe61_iftrue := VAR_previous_ram_read;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1812_c7_ea7f_iftrue := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1798_c3_7164_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1804_c22_a786_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1790_c7_296f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1797_c7_80a4_iffalse := t16;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_296f_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1793_c7_3d54_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1797_c7_80a4_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1802_c7_9583_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1806_c7_fe61_iffalse := tmp8_high;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_296f_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1793_c7_3d54_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1797_c7_80a4_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1802_c7_9583_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1806_c7_fe61_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1812_c7_ea7f_iffalse := tmp8_low;
     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1777_c2_9135] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1777_c2_9135_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1790_c11_83d9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1790_c11_83d9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_83d9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1790_c11_83d9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_83d9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_83d9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1790_c11_83d9_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1798_l1794_DUPLICATE_9ce6 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1798_l1794_DUPLICATE_9ce6_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- sp_relative_shift[uxn_opcodes_h_l1799_c30_d936] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1799_c30_d936_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1799_c30_d936_ins;
     sp_relative_shift_uxn_opcodes_h_l1799_c30_d936_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1799_c30_d936_x;
     sp_relative_shift_uxn_opcodes_h_l1799_c30_d936_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1799_c30_d936_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1799_c30_d936_return_output := sp_relative_shift_uxn_opcodes_h_l1799_c30_d936_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1793_c11_cef6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1793_c11_cef6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c11_cef6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1793_c11_cef6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c11_cef6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c11_cef6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1793_c11_cef6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1802_c11_3f08] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1802_c11_3f08_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_3f08_left;
     BIN_OP_EQ_uxn_opcodes_h_l1802_c11_3f08_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_3f08_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_3f08_return_output := BIN_OP_EQ_uxn_opcodes_h_l1802_c11_3f08_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1777_c6_02ef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1777_c6_02ef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_02ef_left;
     BIN_OP_EQ_uxn_opcodes_h_l1777_c6_02ef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_02ef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_02ef_return_output := BIN_OP_EQ_uxn_opcodes_h_l1777_c6_02ef_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1790_l1777_l1812_l1802_l1797_l1793_DUPLICATE_9a5a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1790_l1777_l1812_l1802_l1797_l1793_DUPLICATE_9a5a_return_output := result.u8_value;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1802_l1793_l1797_l1812_DUPLICATE_7ebe LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1802_l1793_l1797_l1812_DUPLICATE_7ebe_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1790_l1812_l1806_l1802_l1797_l1793_DUPLICATE_8ca1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1790_l1812_l1806_l1802_l1797_l1793_DUPLICATE_8ca1_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1806_c11_7438] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1806_c11_7438_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1806_c11_7438_left;
     BIN_OP_EQ_uxn_opcodes_h_l1806_c11_7438_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1806_c11_7438_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1806_c11_7438_return_output := BIN_OP_EQ_uxn_opcodes_h_l1806_c11_7438_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1797_c11_8609] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1797_c11_8609_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_8609_left;
     BIN_OP_EQ_uxn_opcodes_h_l1797_c11_8609_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_8609_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_8609_return_output := BIN_OP_EQ_uxn_opcodes_h_l1797_c11_8609_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1812_c11_ad84] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1812_c11_ad84_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_ad84_left;
     BIN_OP_EQ_uxn_opcodes_h_l1812_c11_ad84_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_ad84_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_ad84_return_output := BIN_OP_EQ_uxn_opcodes_h_l1812_c11_ad84_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1777_c2_9135] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1777_c2_9135_return_output := result.is_vram_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1777_c2_9135] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1777_c2_9135_return_output := result.is_pc_updated;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1790_l1802_l1793_DUPLICATE_3f60 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1790_l1802_l1793_DUPLICATE_3f60_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1790_l1802_l1793_l1777_DUPLICATE_1502 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1790_l1802_l1793_l1777_DUPLICATE_1502_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1790_l1806_l1802_l1797_l1793_DUPLICATE_c579 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1790_l1806_l1802_l1797_l1793_DUPLICATE_c579_return_output := result.is_stack_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1777_c2_9135] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1777_c2_9135_return_output := result.is_stack_index_flipped;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1804_c22_a786] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1804_c22_a786_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1804_c22_a786_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1804_c22_a786_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1804_c22_a786_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1804_c22_a786_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1804_c22_a786_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9135_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_02ef_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1777_c2_9135_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_02ef_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9135_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_02ef_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1777_c2_9135_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_02ef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c2_9135_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_02ef_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1777_c2_9135_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_02ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9135_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_02ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9135_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_02ef_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9135_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_02ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9135_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_02ef_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1777_c2_9135_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_02ef_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c2_9135_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_02ef_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c2_9135_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c6_02ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_296f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_83d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_296f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_83d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1790_c7_296f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_83d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_296f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_83d9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1790_c7_296f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_83d9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_296f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_83d9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1790_c7_296f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_83d9_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_296f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_83d9_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_296f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_83d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_3d54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c11_cef6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_3d54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c11_cef6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c7_3d54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c11_cef6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_3d54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c11_cef6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1793_c7_3d54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c11_cef6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1793_c7_3d54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c11_cef6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1793_c7_3d54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c11_cef6_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1793_c7_3d54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c11_cef6_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1793_c7_3d54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1793_c11_cef6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_80a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_8609_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_80a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_8609_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1797_c7_80a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_8609_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_80a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_8609_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1797_c7_80a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_8609_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1797_c7_80a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_8609_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1797_c7_80a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_8609_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1797_c7_80a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_8609_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1797_c7_80a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1797_c11_8609_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_9583_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_3f08_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1802_c7_9583_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_3f08_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_9583_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_3f08_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_9583_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_3f08_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1802_c7_9583_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_3f08_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1802_c7_9583_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_3f08_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1802_c7_9583_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_3f08_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1802_c7_9583_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_3f08_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_fe61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1806_c11_7438_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_fe61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1806_c11_7438_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_fe61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1806_c11_7438_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1806_c7_fe61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1806_c11_7438_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1806_c7_fe61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1806_c11_7438_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1806_c7_fe61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1806_c11_7438_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ea7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_ad84_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ea7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_ad84_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c7_ea7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_ad84_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1812_c7_ea7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_ad84_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1804_c3_dd11 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1804_c22_a786_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l1798_c3_7164_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1798_l1794_DUPLICATE_9ce6_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1795_c3_8844_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1798_l1794_DUPLICATE_9ce6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1790_c7_296f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1790_l1802_l1793_DUPLICATE_3f60_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c7_3d54_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1790_l1802_l1793_DUPLICATE_3f60_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_9583_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1790_l1802_l1793_DUPLICATE_3f60_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1790_l1802_l1793_l1777_DUPLICATE_1502_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1790_c7_296f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1790_l1802_l1793_l1777_DUPLICATE_1502_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1793_c7_3d54_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1790_l1802_l1793_l1777_DUPLICATE_1502_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1802_c7_9583_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1790_l1802_l1793_l1777_DUPLICATE_1502_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_296f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1790_l1812_l1806_l1802_l1797_l1793_DUPLICATE_8ca1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_3d54_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1790_l1812_l1806_l1802_l1797_l1793_DUPLICATE_8ca1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_80a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1790_l1812_l1806_l1802_l1797_l1793_DUPLICATE_8ca1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_9583_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1790_l1812_l1806_l1802_l1797_l1793_DUPLICATE_8ca1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_fe61_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1790_l1812_l1806_l1802_l1797_l1793_DUPLICATE_8ca1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ea7f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1790_l1812_l1806_l1802_l1797_l1793_DUPLICATE_8ca1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_296f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1790_l1806_l1802_l1797_l1793_DUPLICATE_c579_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_3d54_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1790_l1806_l1802_l1797_l1793_DUPLICATE_c579_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_80a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1790_l1806_l1802_l1797_l1793_DUPLICATE_c579_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1802_c7_9583_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1790_l1806_l1802_l1797_l1793_DUPLICATE_c579_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_fe61_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1790_l1806_l1802_l1797_l1793_DUPLICATE_c579_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_3d54_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1802_l1793_l1797_l1812_DUPLICATE_7ebe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_80a4_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1802_l1793_l1797_l1812_DUPLICATE_7ebe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_9583_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1802_l1793_l1797_l1812_DUPLICATE_7ebe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ea7f_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1802_l1793_l1797_l1812_DUPLICATE_7ebe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1790_l1777_l1812_l1802_l1797_l1793_DUPLICATE_9a5a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_296f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1790_l1777_l1812_l1802_l1797_l1793_DUPLICATE_9a5a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1793_c7_3d54_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1790_l1777_l1812_l1802_l1797_l1793_DUPLICATE_9a5a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1797_c7_80a4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1790_l1777_l1812_l1802_l1797_l1793_DUPLICATE_9a5a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1802_c7_9583_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1790_l1777_l1812_l1802_l1797_l1793_DUPLICATE_9a5a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c7_ea7f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1790_l1777_l1812_l1802_l1797_l1793_DUPLICATE_9a5a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1777_c2_9135_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1777_c2_9135_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1777_c2_9135_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1777_c2_9135_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1797_c7_80a4_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1799_c30_d936_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1802_c7_9583_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1804_c3_dd11;
     -- tmp8_low_MUX[uxn_opcodes_h_l1812_c7_ea7f] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1812_c7_ea7f_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1812_c7_ea7f_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1812_c7_ea7f_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1812_c7_ea7f_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1812_c7_ea7f_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1812_c7_ea7f_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1812_c7_ea7f_return_output := tmp8_low_MUX_uxn_opcodes_h_l1812_c7_ea7f_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1795_c3_8844] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1795_c3_8844_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1795_c3_8844_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1795_c3_8844_return_output := CONST_SL_8_uxn_opcodes_h_l1795_c3_8844_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1802_c7_9583] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1802_c7_9583_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1802_c7_9583_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1802_c7_9583_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1802_c7_9583_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1802_c7_9583_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1802_c7_9583_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1802_c7_9583_return_output := result_u16_value_MUX_uxn_opcodes_h_l1802_c7_9583_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1777_c2_9135] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1777_c2_9135_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1777_c2_9135_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1777_c2_9135_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1777_c2_9135_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1812_c7_ea7f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ea7f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ea7f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ea7f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ea7f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ea7f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ea7f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ea7f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ea7f_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1777_c2_9135] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9135_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9135_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9135_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9135_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1798_c3_7164] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1798_c3_7164_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1798_c3_7164_left;
     BIN_OP_OR_uxn_opcodes_h_l1798_c3_7164_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1798_c3_7164_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1798_c3_7164_return_output := BIN_OP_OR_uxn_opcodes_h_l1798_c3_7164_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1812_c7_ea7f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1812_c7_ea7f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c7_ea7f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1812_c7_ea7f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c7_ea7f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1812_c7_ea7f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c7_ea7f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c7_ea7f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1812_c7_ea7f_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1777_c2_9135] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1777_c2_9135_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1777_c2_9135_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1777_c2_9135_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1777_c2_9135_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1802_c7_9583] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_9583_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_9583_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_9583_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_9583_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_9583_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_9583_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_9583_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_9583_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1806_c7_fe61] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_fe61_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_fe61_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_fe61_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_fe61_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_fe61_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_fe61_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_fe61_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_fe61_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1812_c7_ea7f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ea7f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ea7f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ea7f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ea7f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ea7f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ea7f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ea7f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ea7f_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1777_c2_9135] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1777_c2_9135_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1777_c2_9135_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1777_c2_9135_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1777_c2_9135_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1806_c7_fe61] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1806_c7_fe61_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1806_c7_fe61_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1806_c7_fe61_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1806_c7_fe61_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1806_c7_fe61_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1806_c7_fe61_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1806_c7_fe61_return_output := tmp8_high_MUX_uxn_opcodes_h_l1806_c7_fe61_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1797_c7_80a4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1798_c3_7164_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1797_c7_80a4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1798_c3_7164_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1793_c7_3d54_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1795_c3_8844_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_fe61_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_ea7f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1802_c7_9583_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1806_c7_fe61_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1797_c7_80a4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_9583_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_fe61_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_ea7f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1797_c7_80a4_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1802_c7_9583_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1806_c7_fe61_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c7_ea7f_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1802_c7_9583_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1806_c7_fe61_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1806_c7_fe61_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1812_c7_ea7f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1806_c7_fe61] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_fe61_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_fe61_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_fe61_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_fe61_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_fe61_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_fe61_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_fe61_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_fe61_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1806_c7_fe61] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_fe61_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_fe61_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_fe61_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_fe61_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_fe61_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_fe61_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_fe61_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_fe61_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1802_c7_9583] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1802_c7_9583_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1802_c7_9583_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1802_c7_9583_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1802_c7_9583_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1802_c7_9583_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1802_c7_9583_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1802_c7_9583_return_output := tmp8_high_MUX_uxn_opcodes_h_l1802_c7_9583_return_output;

     -- t16_MUX[uxn_opcodes_h_l1797_c7_80a4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1797_c7_80a4_cond <= VAR_t16_MUX_uxn_opcodes_h_l1797_c7_80a4_cond;
     t16_MUX_uxn_opcodes_h_l1797_c7_80a4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1797_c7_80a4_iftrue;
     t16_MUX_uxn_opcodes_h_l1797_c7_80a4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1797_c7_80a4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output := t16_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1797_c7_80a4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1797_c7_80a4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1797_c7_80a4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1797_c7_80a4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1797_c7_80a4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1797_c7_80a4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1797_c7_80a4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1806_c7_fe61] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1806_c7_fe61_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1806_c7_fe61_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1806_c7_fe61_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1806_c7_fe61_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1806_c7_fe61_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1806_c7_fe61_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1806_c7_fe61_return_output := result_u8_value_MUX_uxn_opcodes_h_l1806_c7_fe61_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1797_c7_80a4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1797_c7_80a4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1797_c7_80a4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1797_c7_80a4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1797_c7_80a4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1797_c7_80a4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1797_c7_80a4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output := result_u16_value_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1806_c7_fe61] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1806_c7_fe61_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1806_c7_fe61_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1806_c7_fe61_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1806_c7_fe61_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1806_c7_fe61_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1806_c7_fe61_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1806_c7_fe61_return_output := tmp8_low_MUX_uxn_opcodes_h_l1806_c7_fe61_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1802_c7_9583] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1802_c7_9583_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1802_c7_9583_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1802_c7_9583_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1802_c7_9583_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1802_c7_9583_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1802_c7_9583_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1802_c7_9583_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1802_c7_9583_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_9583_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1806_c7_fe61_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_80a4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1802_c7_9583_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c7_3d54_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_9583_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1806_c7_fe61_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1793_c7_3d54_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1802_c7_9583_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1806_c7_fe61_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1793_c7_3d54_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1797_c7_80a4_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1802_c7_9583_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1802_c7_9583_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1806_c7_fe61_return_output;
     -- tmp8_low_MUX[uxn_opcodes_h_l1802_c7_9583] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1802_c7_9583_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1802_c7_9583_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1802_c7_9583_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1802_c7_9583_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1802_c7_9583_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1802_c7_9583_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1802_c7_9583_return_output := tmp8_low_MUX_uxn_opcodes_h_l1802_c7_9583_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1802_c7_9583] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1802_c7_9583_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1802_c7_9583_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1802_c7_9583_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1802_c7_9583_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1802_c7_9583_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1802_c7_9583_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1802_c7_9583_return_output := result_u8_value_MUX_uxn_opcodes_h_l1802_c7_9583_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1802_c7_9583] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_9583_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_9583_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_9583_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_9583_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_9583_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_9583_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_9583_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_9583_return_output;

     -- t16_MUX[uxn_opcodes_h_l1793_c7_3d54] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1793_c7_3d54_cond <= VAR_t16_MUX_uxn_opcodes_h_l1793_c7_3d54_cond;
     t16_MUX_uxn_opcodes_h_l1793_c7_3d54_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1793_c7_3d54_iftrue;
     t16_MUX_uxn_opcodes_h_l1793_c7_3d54_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1793_c7_3d54_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output := t16_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1797_c7_80a4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_80a4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_80a4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_80a4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_80a4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_80a4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_80a4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1793_c7_3d54] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1793_c7_3d54_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1793_c7_3d54_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1793_c7_3d54_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1793_c7_3d54_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1793_c7_3d54_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1793_c7_3d54_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output := result_u16_value_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1797_c7_80a4] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1797_c7_80a4_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1797_c7_80a4_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1797_c7_80a4_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1797_c7_80a4_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1797_c7_80a4_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1797_c7_80a4_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output := tmp8_high_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1802_c7_9583] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_9583_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_9583_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_9583_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_9583_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_9583_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_9583_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_9583_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_9583_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1793_c7_3d54] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c7_3d54_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c7_3d54_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c7_3d54_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c7_3d54_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c7_3d54_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c7_3d54_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_80a4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_9583_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_3d54_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1790_c7_296f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_80a4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_9583_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1790_c7_296f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1797_c7_80a4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1802_c7_9583_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1790_c7_296f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1793_c7_3d54_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1797_c7_80a4_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1802_c7_9583_return_output;
     -- tmp8_high_MUX[uxn_opcodes_h_l1793_c7_3d54] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1793_c7_3d54_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1793_c7_3d54_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1793_c7_3d54_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1793_c7_3d54_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1793_c7_3d54_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1793_c7_3d54_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output := tmp8_high_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1790_c7_296f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1790_c7_296f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1790_c7_296f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1790_c7_296f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1790_c7_296f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1790_c7_296f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1790_c7_296f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1790_c7_296f_return_output := result_u16_value_MUX_uxn_opcodes_h_l1790_c7_296f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1793_c7_3d54] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_3d54_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_3d54_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_3d54_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_3d54_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_3d54_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_3d54_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1790_c7_296f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1790_c7_296f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1790_c7_296f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1790_c7_296f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1790_c7_296f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1790_c7_296f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1790_c7_296f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1790_c7_296f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1790_c7_296f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1797_c7_80a4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_80a4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_80a4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_80a4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_80a4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_80a4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_80a4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1797_c7_80a4] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1797_c7_80a4_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1797_c7_80a4_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1797_c7_80a4_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1797_c7_80a4_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1797_c7_80a4_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1797_c7_80a4_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output := tmp8_low_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output;

     -- t16_MUX[uxn_opcodes_h_l1790_c7_296f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1790_c7_296f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1790_c7_296f_cond;
     t16_MUX_uxn_opcodes_h_l1790_c7_296f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1790_c7_296f_iftrue;
     t16_MUX_uxn_opcodes_h_l1790_c7_296f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1790_c7_296f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1790_c7_296f_return_output := t16_MUX_uxn_opcodes_h_l1790_c7_296f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1797_c7_80a4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1797_c7_80a4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1797_c7_80a4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1797_c7_80a4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1797_c7_80a4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1797_c7_80a4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1797_c7_80a4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output := result_u8_value_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1797_c7_80a4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_80a4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_80a4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_80a4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_80a4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_80a4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_80a4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_3d54_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_296f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1790_c7_296f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_3d54_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1790_c7_296f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1793_c7_3d54_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1790_c7_296f_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_296f_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1793_c7_3d54_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1797_c7_80a4_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1793_c7_3d54] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1793_c7_3d54_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1793_c7_3d54_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1793_c7_3d54_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1793_c7_3d54_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1793_c7_3d54_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1793_c7_3d54_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output := result_u8_value_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1777_c2_9135] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9135_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9135_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9135_return_output := result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9135_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1793_c7_3d54] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1793_c7_3d54_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1793_c7_3d54_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1793_c7_3d54_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1793_c7_3d54_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1793_c7_3d54_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1793_c7_3d54_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output := tmp8_low_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1790_c7_296f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_296f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_296f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_296f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_296f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_296f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_296f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_296f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_296f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1793_c7_3d54] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_3d54_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_3d54_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_3d54_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_3d54_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_3d54_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_3d54_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1777_c2_9135] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9135_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9135_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9135_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9135_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1790_c7_296f] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1790_c7_296f_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_296f_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1790_c7_296f_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_296f_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1790_c7_296f_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_296f_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_296f_return_output := tmp8_high_MUX_uxn_opcodes_h_l1790_c7_296f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1793_c7_3d54] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_3d54_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_3d54_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_3d54_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_3d54_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_3d54_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_3d54_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output;

     -- t16_MUX[uxn_opcodes_h_l1777_c2_9135] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1777_c2_9135_cond <= VAR_t16_MUX_uxn_opcodes_h_l1777_c2_9135_cond;
     t16_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue;
     t16_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1777_c2_9135_return_output := t16_MUX_uxn_opcodes_h_l1777_c2_9135_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_296f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_296f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_296f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_296f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1777_c2_9135_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_296f_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_296f_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1793_c7_3d54_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1790_c7_296f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1790_c7_296f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_296f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1790_c7_296f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_296f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1790_c7_296f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_296f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_296f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1790_c7_296f_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1790_c7_296f] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1790_c7_296f_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_296f_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1790_c7_296f_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_296f_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1790_c7_296f_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_296f_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_296f_return_output := tmp8_low_MUX_uxn_opcodes_h_l1790_c7_296f_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1777_c2_9135] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1777_c2_9135_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c2_9135_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c2_9135_return_output := tmp8_high_MUX_uxn_opcodes_h_l1777_c2_9135_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1777_c2_9135] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1777_c2_9135_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c2_9135_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c2_9135_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1777_c2_9135_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1790_c7_296f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_296f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_296f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_296f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_296f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_296f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_296f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_296f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_296f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1790_c7_296f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_296f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_296f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_296f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_296f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_296f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_296f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_296f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_296f_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_296f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_296f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_296f_return_output;
     REG_VAR_tmp8_high := VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c2_9135_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_296f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1777_c2_9135] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9135_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9135_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9135_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9135_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1777_c2_9135] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1777_c2_9135_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c2_9135_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c2_9135_return_output := tmp8_low_MUX_uxn_opcodes_h_l1777_c2_9135_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1777_c2_9135] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9135_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9135_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9135_return_output := result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9135_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1777_c2_9135] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9135_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9135_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9135_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9135_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9135_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9135_return_output;

     -- Submodule level 8
     REG_VAR_tmp8_low := VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c2_9135_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_42c1_uxn_opcodes_h_l1772_l1819_DUPLICATE_d119 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_42c1_uxn_opcodes_h_l1772_l1819_DUPLICATE_d119_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_42c1(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1777_c2_9135_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c2_9135_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c2_9135_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1777_c2_9135_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c2_9135_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c2_9135_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1777_c2_9135_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c2_9135_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c2_9135_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1777_c2_9135_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_42c1_uxn_opcodes_h_l1772_l1819_DUPLICATE_d119_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_42c1_uxn_opcodes_h_l1772_l1819_DUPLICATE_d119_return_output;
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
